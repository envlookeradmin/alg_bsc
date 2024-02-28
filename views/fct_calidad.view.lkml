view: calidad {
  derived_table: {
    sql:
      select
      FECHA,
      CI_FACTURA,
      --ID_CLIENTE,
      DOCUMENTO_ANTERIOR as FACTURA,
      CANTIDA_FACTURA,
      /*UNIDAD,
      TEXTO_BREVE_MATERIAL,
      GRUPO_ARTICULO,
      SECTOR,*/
      CENTRO as PLANTA,
      /*CANAL_DISTRIBUCION,
      DESTINATARIO_MERCANCIA,*/
      VALOR_NETO,
      /*MONEDA,
      TIPO_CAMBIO,
      MATERIAL,
      DIMENSIONES,
      NOMBRE_CLIENTE,
      DOCUMENTO_NUEVO,*/
      CODIGO_DEVOLUCION,
      'Sin info.' as ID_CASO,
      'Sin info.' as CATEGORIA_QUEJA,
      'Sin info.' as ESTATUS_QUEJA,
      0 as CANTIDAD_RECHAZO_NOTIFICADA,
      0 as CANTIDAD_ENTREGADA
      from `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_calidad_devoluciones`

      UNION ALL
      select
      CAST(FECHA AS DATE) as FECHA,
      'Sin info.' as CI_FACTURA,
      --'Sin info.' as ID_CLIENTE,
      case
      when length(FACTURA) = 8 then '00'||FACTURA
      when length(FACTURA) = 7 then '000'||FACTURA
      when length(FACTURA) = 6 then '0000'||FACTURA
      when length(FACTURA) = 4 then '000000'||FACTURA
      else FACTURA
      end as FACTURA,
      0 as CANTIDA_FACTURA,
      /*'Sin info.' as UNIDAD,
      TEXTO_BREVE_MATERIAL,
      GRUPO_ARTICULO,
      SECTOR,*/
      PLANTA,
      /*CANAL_DISTRIBUCION,
      DESTINATARIO_MERCANCIA*/
      0 as VALOR_NETO,
      /*MONEDA,
      TIPO_CAMBIO,
      MATERIAL,
      DIMENSIONES,
      NOMBRE_CLIENTE,
      DOCUMENTO_NUEVO,*/
      'Sin info.' as CODIGO_DEVOLUCION,
      ID_CASO,
      CATEGORIA,
      ESTATUS,
      0 as CANTIDAD_RECHAZO_NOTIFICADA,
      0 as CANTIDAD_ENTREGADA
      from `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_calidad_quejas`

      UNION ALL
      select
      FECHA_FIN_REAL as FECHA,
      'Sin info.' as CI_FACTURA,
      --'Sin info.' as ID_CLIENTE,
      'Sin info.' as FACTURA,
      0 as CANTIDA_FACTURA,
      /*'Sin info.' as UNIDAD,
      TEXTO_BREVE_MATERIAL,
      GRUPO_ARTICULO,
      SECTOR,*/
      PLANTA,
      /*CANAL_DISTRIBUCION,
      DESTINATARIO_MERCANCIA*/
      0 as VALOR_NETO,
      /*MONEDA,
      TIPO_CAMBIO,
      MATERIAL,
      DIMENSIONES,
      NOMBRE_CLIENTE,
      DOCUMENTO_NUEVO,*/
      'Sin info.' as CODIGO_DEVOLUCION,
      'Sin info.' as ID_CASO,
      'Sin info.' as CATEGORIA,
      'Sin info.' as ESTATUS,
      CANTIDAD_RECHAZO_NOTIFICADA,
      CANTIDAD_ENTREGADA
      from `@{GCP_PROJECT}.@{REPORTING_DATASET3}.vw_bsc_prod_cap_manufactura`

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
            THEN 'MF51'
            WHEN ${TABLE}.Planta in ('MF02','MF52')
            THEN 'MF52'
            WHEN ${TABLE}.Planta in ('MF03','MF53','MF06','MF56')
            THEN 'MF53'
            WHEN ${TABLE}.Planta in ('MF04','MF54')
            THEN 'MF54'
            WHEN ${TABLE}.Planta in ('MF05','MF55')
            THEN 'MF55'
            WHEN ${TABLE}.Planta in ('MF07','MF57')
            THEN 'MF57'
            WHEN ${TABLE}.Planta in ('MF10','MF60')
            THEN 'MF60'
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
    sql: case when ${TABLE}.CODIGO_DEVOLUCION in ('Z08','104') then 1 else 0 end;;
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
    sql:  CASE
              WHEN ${ci_factura} IN ('ZR2M') and ${codigo_devolucion} IN ('Z08','104')
              THEN ${valor_neto} else 0
          END ;;
  }

  measure: costo_facturacion {
    type: sum
    sql:  ${TABLE}.CANTIDA_FACTURA ;;
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

    value_format: "0.00\%"
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

    value_format: "0.00\%"
  }

  measure: count {
    type: count
  }


}
