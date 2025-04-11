view: fct_devoluciones {

  derived_table: {
    sql: SELECT
        DATE_TRUNC(vtas.Fecha, MONTH) AS Fecha,
        INITCAP( bigfunctions.us.translated_month_name(vtas.Fecha, 'es') ) AS Nombre_mes,
        CONCAT(EXTRACT(YEAR FROM vtas.Fecha), ' - Q', CAST(FORMAT_DATE('%Q', vtas.Fecha ) AS STRING) ) AS Trimestre,
        vtas.Organizacion_Ventas,
        vtas.Planta,
        vtas.Categoria,
        vtas.Material,
        vtas.Cliente,
        SUM(CASE WHEN vtas.Tipo_Documento IN ('ZG2M', 'ZR2M','ZG2G','ZR2G') THEN vtas.Cantidad*-1 ELSE 0 END) AS Cantidad_devolucion,
        SUM(CASE WHEN vtas.Tipo_Documento IN ('ZG2M', 'ZR2M','ZG2G','ZR2G') THEN vtas.Monto_Conversion_MXN*-1 ELSE 0 END) AS Monto_devolucion,
        COUNT(DISTINCT CASE WHEN vtas.Tipo_Documento IN ('ZG2M', 'ZR2M','ZG2G','ZR2G') THEN vtas.Documento END ) AS Evento,
        SUM(CASE WHEN vtas.Cantidad < 0 THEN 0 ELSE vtas.Cantidad END) AS Cantidad_venta,
        SUM(CASE WHEN vtas.Monto_Conversion_MXN < 0 THEN 0 ELSE vtas.Monto_Conversion_MXN END) AS Monto_venta
        FROM `@{GCP_PROJECT}.@{REPORTING_DATASET6}.Fact_Ventas` vtas
        WHERE
          vtas.Organizacion_Ventas in ('MXFC','GTF1')
          AND vtas.Tipo_Transaccion = 'Venta'
          AND Fecha >= CAST({% date_start fecha_seleccion %} AS DATE)
          AND Fecha <= CAST({% date_end fecha_seleccion %} AS DATE)
          group by 1,2,3,4,5,6,7,8;;
  }

#############Parametros

  parameter: tipo {
    description: "Parámetro que define unidad a medir"
    label: "Tipo"
    allowed_value: {
      label:"Piezas"
      value: "Piezas"
    }
    allowed_value: {
      label: "Dinero"
      value: "Dinero"
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

  #############Parametros

  filter: fecha_seleccion {
    type: date
  }

  #############Dimensiones

  dimension: fecha {
    type: date
    sql:  ${TABLE}.Fecha;;
  }

  dimension: mes {
    type: string
    sql: ${fecha.nombre_mes} ;;
  }

  dimension: trimestre {
    type: string
    sql: ${fecha.trimestre_Letra} ;;
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

  dimension: id_planta {
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: planta {
    label: "Planta"
    type: string
    sql: ${planta.planta_completo} ;;
  }

  dimension: organizacion_ventas {
    description: "Clave de la organización de ventas"
    label: "Organizacion ventas"
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: categoria {
    description: "Clasificación de las categorias para las ventas de ALG, reporte 074 BIS"
    label: "Categoria"
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: cliente {
    description: "Codigo del cliente"
    type: string
    sql: ${TABLE}.Cliente ;;
  }

  dimension: nombre_cliente {
    label: "Nombre Cliente"
    type: string
    sql: ${cliente.nombre} ;;
  }

  dimension: material {
    description: "Codigo del material"
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: descripcion_material {
    description: "Descripción del material"
    type: string
    sql: ${material.descripcion_material} ;;
  }

  dimension: grupo_material {
    description: "Codigo grupo material"
    type: string
    sql: ${material.grupo_material} ;;
  }

#############Metricas
  measure: total_eventos {
    description: "Conteo de las facturas distintas de devoluciones"
    label: "Eventos"
    type: sum
    sql: ${TABLE}.Evento ;;
  }

  measure: monto_facturacion {
    description: "Es el monto de venta antes de devoluciones"
    type: sum
    sql: ${TABLE}.Monto_venta/1000 ;;
    value_format:"$#,##0.00"
  }

  measure: monto_devolucion {
    description: "Es el monto de los tipos de documento 'ZG2M', 'ZR2M','ZG2G','ZR2G'"
    type: sum
    sql: ${TABLE}.Monto_devolucion/1000 ;;
    value_format:"$#,##0.00"
  }

  measure: cantidad_facturacion {
    description: "Son las cantidades antes de devoluciones"
    type: sum
    sql: ${TABLE}.Cantidad_venta/1000 ;;
    value_format:"#,##0.00"
  }

  measure: cantidad_devolucion {
    description: "Son las cantidades de los tipos de documento 'ZG2M', 'ZR2M','ZG2G','ZR2G'"
    type: sum
    sql: ${TABLE}.Cantidad_devolucion/1000 ;;
    value_format:"#,##0.00"
  }

  measure: total_facturacion {
    group_label: "Totales"
    label: "Facturación"
    type: number
    sql: CASE
    WHEN {% parameter tipo  %} = "Piezas"
    THEN ${cantidad_facturacion}
    WHEN {% parameter tipo  %} = "Dinero"
    THEN ${monto_facturacion}
    END ;;
    drill_fields: [categoria, total_facturacion ]
    value_format:"#,##0.00"
    #html:
    #{% if tipo._parameter_value == "Dinero" %} <p> {{ monto_facturacion._rendered_value }}</p>
    #{% elsif tipo._parameter_value == "Piezas" %} <p> {{ cantidad_facturacion._rendered_value }}</p>
    #{% endif %} ;;
  }

  measure: total_devolucion {
    group_label: "Totales"
    label: "Devolución"
    type: number
    sql: CASE
    WHEN {% parameter tipo  %} = "Piezas"
    THEN ${cantidad_devolucion}
    WHEN {% parameter tipo  %} = "Dinero"
    THEN ${monto_devolucion}
    END ;;
    drill_fields: [categoria, cliente, nombre_cliente, total_devolucion ]
    value_format:"#,##0.00"
  }

  measure: porc_devolucion {
    group_label: "Totales"
    label: "Porcentaje"
    type:  number
    sql: ( case
           when ${monto_facturacion} != 0 and ${monto_devolucion} != 0
           then ${monto_devolucion} / ${monto_facturacion}
           else 0
           end ) * 100 ;;
    value_format: "0.00\%"
  }

  measure: total_facturacion_meta {
    group_label: "Totales"
    type: sum
    sql: ${TABLE}.Monto_venta * 1.2 ;;
    value_format:"$#,##0.00"
  }

  measure: total_devolucion_meta {
    group_label: "Totales"
    type: sum
    sql: ${TABLE}.Monto_devolucion ;;
    value_format:"$#,##0.00"
  }

  measure: porc_devolucion_meta {
    group_label: "Totales"
    label: "Porcentaje meta"
    type:  number
    sql: ( case
           when ${total_facturacion_meta} != 0 and ${total_devolucion_meta} != 0
           then ( ${total_devolucion_meta} * 0.7 ) / ( ${total_facturacion_meta} * 0.8)
           else 0
           end ) * 100 ;;
    value_format: "0.00\%"
  }

}
