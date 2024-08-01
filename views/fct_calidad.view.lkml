view: calidad {
  derived_table: {
    sql:
      WITH datos_devoluciones AS (
  SELECT
    date_trunc(FECHA,month) FECHA
   , Centro
   ,'Sin info.' as ID_CASO
   ,'Sin info.' as ESTATUS_QUEJA
   ,CODIGO_DEVOLUCION
   ,0 as CANTIDAD_ENTREGADA
   ,0 as CANTIDAD_RECHAZO_NOTIFICADA
   ,SUM(VALOR_NETO) AS VALOR_NETO
  FROM
    `envases-analytics-qa.RPT_S4H_MX.tbl_fact_calidad_devoluciones`
  WHERE
   -- EXTRACT(YEAR FROM FECHA) = 2024
  --  AND EXTRACT(MONTH FROM FECHA) = 3
    --AND
    CODIGO_DEVOLUCION IN ('Z08', '104')
  GROUP BY
    Centro,FECHA,CODIGO_DEVOLUCION
),

      datos_ventas AS (
      SELECT
      date_trunc(FECHA,month) FECHA,
      Planta,
      SUM(Monto) AS Monto_Conversion_MXN
      FROM
     `envases-analytics-qa.RPT_ALG.Fact_Ventas`
      WHERE
      ID_Fuente = 'S4H_MEX'
      AND Tipo_Transaccion = 'Venta' and Canal_Distribucion IN ('10','20')  AND Planta != ''
      --  AND EXTRACT(YEAR FROM FECHA) = 2024
      --  AND EXTRACT(MONTH FROM FECHA) = 3
      GROUP BY
      Planta
      ,FECHA
      ), quejas as (

      select CAST(FECHA AS DATE) as FECHA
      ,PLANTA
      ,ID_CASO
      ,ESTATUS
      ,'Sin info.' as CODIGO_DEVOLUCION
      ,0 as CANTIDAD_ENTREGADA
      ,0 as CANTIDAD_RECHAZO_NOTIFICADA
      ,0 Monto_Conversion_MXN
      ,0 as VALOR_NETO from `envases-analytics-qa.RPT_S4H_MX.vw_bsc_calidad_quejas`
      -- WHERE EXTRACT(YEAR FROM FECHA) = 2024  AND EXTRACT(MONTH FROM FECHA) = 3

      ),manufactura AS (

      select CAST(FECHA_FIN_REAL AS DATE) as FECHA
      ,PLANTA
      ,'Sin info.' as ID_CASO
      ,'Sin info.' as ESTATUS
      ,'Sin info.' as CODIGO_DEVOLUCION
      ,CANTIDAD_ENTREGADA
      ,CANTIDAD_RECHAZO_NOTIFICADA
      ,0 Monto_Conversion_MXN
      ,0 as VALOR_NETO from `envases-analytics-qa.RPT_S4H_MX.vw_fact_prod_cap_manufactura`
      -- WHERE EXTRACT(YEAR FROM FECHA_FIN_REAL) = 2024  AND EXTRACT(MONTH FROM FECHA_FIN_REAL) = 3
      )

      SELECT
      d.Fecha
      ,d.Planta
      ,dd.ID_CASO
      ,dd.ESTATUS_QUEJA
      ,dd.CODIGO_DEVOLUCION
      ,dd.CANTIDAD_ENTREGADA
      ,dd.CANTIDAD_RECHAZO_NOTIFICADA
      ,d.Monto_Conversion_MXN
      ,dd.VALOR_NETO
      -- COALESCE((dd.VALOR_NETO / NULLIF(d.Monto_Conversion_MXN, 0)) * 100, 0) AS Port_Devoluciones
      FROM
      datos_ventas d
      LEFT JOIN
      datos_devoluciones dd ON d.Planta = dd.Centro AND d.fecha=dd.fecha

      union all
      select * from quejas
      union all
      select * from manufactura

      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  #Dimensiones devolución

  dimension: fecha {
    type: date
    sql: ${TABLE}.FECHA;;
  }

  dimension: planta {
    label: "id_planta"
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: planta_completo {
    label: "Planta"
    type: string
    sql: ${planta.planta_comercializadora};;
  }

  dimension: orden_grupo_planta {
    type: number
    sql: CASE
            WHEN ${TABLE}.Planta in ('MF01','MF51','MF08','MF58','MF09','MF59')
            THEN 1
            WHEN ${TABLE}.Planta in ('MF02','MF52')
            THEN 2
            WHEN ${TABLE}.Planta in ('MF03','MF53','MF06','MF56')
            THEN 3
            WHEN ${TABLE}.Planta in ('MF04','MF54')
            THEN 4
            WHEN ${TABLE}.Planta in ('MF05','MF55')
            THEN 5
            WHEN ${TABLE}.Planta in ('MF07','MF57')
            THEN 6
            WHEN ${TABLE}.Planta in ('MF10','MF60')
            THEN 7
            ELSE 8
          END ;;
  }

  dimension: grupo_planta {
    label: "Gpo."
    type: string
    sql: CASE
            WHEN ${TABLE}.Planta in ('MF01','MF51','MF08','MF58','MF09','MF59')
            --THEN 'MF51'
              THEN 'MF01 Cuautitlán, MX'
            WHEN ${TABLE}.Planta in ('MF02','MF52')
            --THEN 'MF52'
            THEN 'MF02 Partidor, MX'
            WHEN ${TABLE}.Planta in ('MF03','MF53','MF06','MF56')
            THEN 'MF03 Mazatlan I, MX'
           -- THEN 'MF53'
            WHEN ${TABLE}.Planta in ('MF04','MF54')
            --THEN 'MF54'
            THEN 'MF03 Mazatlan I, MX'
            WHEN ${TABLE}.Planta in ('MF05','MF55')
            --THEN 'MF55'
            THEN 'MF03 Mazatlan I, MX'
            WHEN ${TABLE}.Planta in ('MF07','MF57')
            THEN 'MF03 Mazatlan I, MX'
            --THEN 'MF57'
            WHEN ${TABLE}.Planta in ('MF10','MF60')
             THEN 'MF10 Monterrey , MX'
            --THEN 'MF60'
            WHEN ${TABLE}.Planta in ('GF01')
            THEN 'GF01 San Lucas, GT'
            ELSE ${TABLE}.Planta
          END ;;

    order_by_field: orden_grupo_planta
  }




  dimension: codigo_devolucion {
    type: string
    sql: ${TABLE}.CODIGO_DEVOLUCION;;
  }

  dimension: valor_neto {
    type: number
    sql: ${TABLE}.VALOR_NETO ;;
  }

  dimension: ci_factura {
    type: string
    sql: ${TABLE}.CI_FACTURA;;
  }

  dimension: flag_codigo_devolucion {
    type: string
    sql: case when ${TABLE}.CODIGO_DEVOLUCION in ('104','Z08') then 1 else 0 end;;
  }

  #Dimensiones quejas

  dimension: id_caso {
    type: string
    sql: ${TABLE}.ID_CASO ;;
  }

  dimension: estatus_queja {
    label: "Estatus queja"
    type: string
    sql: ${TABLE}.ESTATUS_QUEJA ;;
  }

  dimension_group: fecha_filtro {
    label: "Date"
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
    sql: CAST(${TABLE}.FECHA AS DATE);;
  }

  dimension: anio_actual{
    type: number
    sql: CASE
            WHEN ${TABLE}.FECHA >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
            AND ${TABLE}.FECHA <= CAST({% date_start date_filter %} AS DATE) THEN 1
            ELSE 0
           END;;
  }


  dimension: ultimos_3_meses{
    type: number
    sql:
        CASE
            WHEN ${TABLE}.FECHA >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
            AND ${TABLE}.FECHA <= DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL 0 DAY) THEN 1
            ELSE 0
            END;;
  }

  #Metricas
  measure: quejas {
    label: "Quejas"
    type: count_distinct
    sql: CASE
           WHEN ${id_caso} != 'Sin info.'
           THEN ${id_caso}
         END ;;

    drill_fields: [estatus_queja, quejas]

    value_format: "0"
  }

  measure: costo_devolucion {
    type: sum
    sql: ${valor_neto}

                 /*  CASE
                   WHEN ${ci_factura} IN ('ZR2M') and ${codigo_devolucion} IN ('104','Z08')
                    WHEN ${ci_factura} IN ('ZF2M') and ${codigo_devolucion} IN ('104','Z08')
                    THEN ${valor_neto} else 0
                END */
                ;;
    value_format: "#,##0"
  }

  measure: costo_facturacion {
    type: sum
    sql:  ${TABLE}.Monto_Conversion_MXN;;
    value_format: "#,##0.00"
    #sql:  ${TABLE}.CANTIDA_FACTURA
  }

  measure: devoluciones {
    label: "Devoluciones"
    type: number
    sql: ( case
           when ${costo_facturacion} != 0
           then ${costo_devolucion} / ${costo_facturacion}
           else 0
           end )*100;;

    drill_fields: [motivo_devolucion.motivo_devolucion, estatus_queja, devoluciones]

    value_format: "0.0\%"
  }

  measure: cantidad_rechazo_notificada {
    type: sum
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
  }

  measure: cantidad_entregada {
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }

  measure: porc_pnc {
    label: "PNC"
    type: number
    sql: ( case
          when ${cantidad_entregada} != 0
          then ${cantidad_rechazo_notificada} / ${cantidad_entregada}
          else 0
          end )*100;;

    #drill_fields: [planta, porc_pnc]

    #value_format: "0.00\%"
    value_format: "0.0\%"
  }

  measure: count {
    type: count
  }


}
