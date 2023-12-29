view: calidad {
  derived_table: {
    sql:
      select
      ID_CASO,
      FECHA,
      PLANTA,
      FACTURA,
      CATEGORIA,
      ESTATUS,
      FECHA_FACTURA,
      CI_FACTURA,
      ID_CLIENTE,
      CANTIDAD_FACTURA,
      UNIDAD,
      TEXTO_MATERIA,
      GRUPO_ARTICULO,
      SECTOR,
      CENTRO,
      CANAL_DISTRIBUCION,
      DESTINATARIO_MERCANCIA,
      VALOR_NETO,
      MONEDA,
      TIPO_CAMBIO,
      MATERIAL,
      DIMENSIONES,
      NOMBRE_CLIENTE
      from `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_calidad_quejas`
      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  #Dimensiones
  dimension: IdCaso {
    type: string
    sql: ${TABLE}.ID_CASO ;;
  }
  dimension: Fecha {
    type: string
    sql: CAST(${TABLE}.FECHA AS DATE);;
  }
  dimension: Planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: PlantaCompleto {
    type: string
    sql: ${planta.planta_completo} ;;
  }

  dimension: ValorNeto {
    type: number
    sql: ${TABLE}.VALOR_NETO ;;
  }

  dimension: CIFactura {
    type: string
    sql: ${TABLE}.CI_FACTURA;;
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
    sql: ${TABLE}.FECHA ;;
  }


  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }

  dimension: mes_anterior{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }

  #Metricas
  measure: Quejas {
    type: count_distinct
    sql: ${IdCaso} ;;

    #drill_fields: [actividad.descripcion ,Quejas]

    value_format: "0"
  }

  measure: Devoluciones {
    type: number
    sql: (1 / SUM(CASE WHEN ${CIFactura} IN ('ZR2M') THEN ${ValorNeto} END ) )*100;;

    #drill_fields: [actividad.descripcion ,Quejas]

    value_format: "0.00\%"
  }

  measure: count {
    type: count
  }


}
