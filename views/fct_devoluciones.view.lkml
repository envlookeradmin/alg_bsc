view: fct_devoluciones {

  derived_table: {
    sql: SELECT
          DATE_TRUNC(vtas.Fecha, MONTH) AS Fecha,
          INITCAP( bigfunctions.us.translated_month_name(vtas.Fecha, 'es') ) AS Nombre_mes,
          CONCAT(EXTRACT(YEAR FROM vtas.Fecha), ' - Q', CAST(FORMAT_DATE('%Q', vtas.Fecha ) AS STRING) ) AS Trimestre,
          vtas.Organizacion_Ventas,
          CONCAT(case when ID_Planta='MF51' then 'MF01'
                      when ID_Planta='MF52' then 'MF02'
                      when ID_Planta='MF53' then 'MF03'
                      when ID_Planta='MF54' then 'MF04'
                      when ID_Planta='MF55' then 'MF05'
                      when ID_Planta='MF57' then 'MF07'
                      when ID_Planta='MF10' then 'MF10'
                      when ID_Planta='GF01' then 'GF01' else ID_Planta end ,' ', REPLACE( REPLACE( REPLACE(Nombre_Planta,'ALG-COM-',''),', México',''), ',México','' ) ) AS Planta,
          vtas.Categoria,
          vtas.Material,
          mat.Descripcion AS Descripcion_Material,
          mat.Grupo_Mat,
          vtas.Cliente,
          cte.Nombre AS Nombre_Cliente,
          SUM(CASE WHEN vtas.Tipo_Documento IN (SELECT
                                                VALOR
                                                FROM RPT_ALG.REGLAS_ALG
                                                WHERE FUENTE = "S4H_MEX"
                                                AND REGLA="Devoluciones"
                                                AND CAMPO="TipoDocumento"
                                                AND SE_EXCLUYE IS NULL) THEN vtas.Cantidad ELSE 0 END) AS Cantidad_devolucion,
          SUM(CASE WHEN vtas.Tipo_Documento IN (SELECT
                                                VALOR
                                                FROM RPT_ALG.REGLAS_ALG
                                                WHERE FUENTE = "S4H_MEX"
                                                AND REGLA="Devoluciones"
                                                AND CAMPO="TipoDocumento"
                                                AND SE_EXCLUYE IS NULL) THEN vtas.Monto ELSE 0 END) AS Monto_devolucion,
          SUM(vtas.Cantidad) AS Cantidad_venta,
          SUM(vtas.Monto) AS Monto_venta,
          COUNT(DISTINCT CASE WHEN vtas.Tipo_Documento IN (SELECT
                                                  VALOR
                                                  FROM RPT_ALG.REGLAS_ALG
                                                  WHERE FUENTE = "S4H_MEX"
                                                  AND REGLA="Devoluciones"
                                                  AND CAMPO="TipoDocumento"
                                                  AND SE_EXCLUYE IS NULL) THEN vtas.Documento ELSE NULL END ) AS Evento
                FROM
                  `RPT_ALG.Fact_Ventas` vtas
                LEFT JOIN
                  `RPT_ALG.Dim_Material` mat ON
                  vtas.ID_Fuente = mat.ID_Fuente
                  AND vtas.Material = mat.Material
                LEFT JOIN
                  `RPT_ALG.Dim_Planta` plnt ON
                  vtas.ID_Fuente = plnt.ID_Fuente
                  AND vtas.Planta = plnt.ID_Planta
                LEFT JOIN
                  `RPT_ALG.Dim_Cliente` cte ON
                    vtas.ID_Fuente = cte.ID_Fuente
                    AND vtas.Cliente = cte.Codigo_Cliente
                    AND vtas.Organizacion_Ventas = cte.Organizacion_Ventas
                    AND vtas.Canal_Distribucion = cte.Canal_Distribucion
                    AND vtas.Division = cte.Division
          WHERE
            vtas.Organizacion_Ventas in ('MXFC','MXF1','GTF1')
            AND vtas.Tipo_Transaccion='Venta'
            group by 1,2,3,4,5,6,7,8,9,10,11 ;;
  }

  parameter: medidas_dinamicas {
    description: "Parámetro que define unidad a medir"
    label: "Concepto"
    allowed_value: {
      label:"Evento"
      value: "Evento"
    }
    allowed_value: {
      label: "Sanitario"
      value: "Sanitario"
    }

    allowed_value: {
      label: "Lineas Generales"
      value: "Linea"
    }
  }

  parameter: tipo_periodo {
    description: "Parámetro que define mes o trimestre"
    label: "Tipo periodo"

    allowed_value: {
      label:"Mes"
      value: "Mes"
    }
    allowed_value: {
      label: "Trimestre"
      value: "Trimestre"
    }

  }

  dimension_group: fecha {
    label: "Fecha"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: ${TABLE}.Fecha ;;
  }

  dimension: mes {
    type: string

    sql: ${TABLE}.Nombre_mes ;;

    #order_by_field: fecha_ingreso_month
  }

  dimension: trimestre {
    type: string

    sql: ${TABLE}.Trimestre ;;

    #order_by_field: fecha_ingreso_quarter
  }

  dimension: periodo {
    label: "Periodo"
    type: string

    sql: CASE
          WHEN {% parameter Tipo_periodo  %} = "Mes"
          THEN ${mes}
          WHEN {% parameter Tipo_periodo  %} = "Trimestre"
          THEN ${trimestre}
          END ;;

    value_format: "0 \" String\""

  }

  dimension: planta {
    label: "Planta"
    type: string

    sql: ${TABLE}.Planta ;;

  }

  dimension: categoria {
    label: "Categoria"
    type: string

    sql: ${TABLE}.Categoria ;;

  }

  dimension: cliente {
    label: "Cliente"
    type: string

    sql: ${TABLE}.Cliente ;;

  }

  measure: total_eventos {
    label: "Eventos"
    type: sum
    sql: ${TABLE}.Evento;;

  }

  measure: total_facturacion {
    label: "Facturación"
    type: sum
    sql: CASE
    WHEN {% parameter Tipo  %} = "Piezas"
    THEN ${TABLE}.Cantidad_venta
    WHEN {% parameter Tipo  %} = "Dinero"
    THEN ${TABLE}.Monto_venta END ;;

    value_format:"$#.00;($#.00)"
  }

  measure: total_devolucion {
    label: "Devolución"
    type: sum
    sql: CASE
    WHEN {% parameter Tipo  %} = "Piezas"
    THEN ${TABLE}.Cantidad_devolucion
    WHEN {% parameter Tipo  %} = "Dinero"
    THEN   ${TABLE}.Monto_devolucion END ;;

    value_format:"$#.00;($#.00)"

  }

  measure: porc_devolucion {
    label: "Porcentaje"
    type:  number
    sql: ( case
           when ${total_facturacion} != 0 and ${total_devolucion} != 0
           then ${total_devolucion} / ${total_facturacion}
           else 0
           end ) * 100 ;;

    value_format: "0.00\%"
  }

}
