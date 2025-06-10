view: fact_rpm_cierre_automatico {
  derived_table: {
      sql:
        SELECT
        PLANTA,
        ORDEN AS TOTAL_ORDENES,
        ordenes_cerr.CANTIDAD_BUENA_CONFIRMADA,
        ordenes_cerr.CANTIDA_RECHAZO_NOTIFICADA,
        ordenes_cerr.CANTIDAD_EM,
        PORCENTAJE_CANTIDA_FALTANTE,
        ESTATUS

         FROM  `envases-analytics-qa.RPT_S4H_MX.tbl_fact_rpm_cierre_automatico` as ordenes_cerr

       ;;
  }

  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }
   measure: total_ordenes {
    type: count_distinct
    sql: ${TABLE}.TOTAL_ORDENES ;;
  }
  measure: ordenes_cerradas {
    type: count_distinct
    sql:CASE WHEN ${TABLE}.ESTATUS ='CERRADA' THEN  ${TABLE}.TOTAL_ORDENES end ;;
  }
  measure: Porcentaje_cierre {
    type: number
    sql: (${ordenes_cerradas} / ${total_ordenes}) ;;
    drill_fields: [detail*]
    value_format: "0.00%"
  }
  dimension:status {
    type: string
    sql: ${TABLE}.ESTATUS;;
  }

  dimension:centro {
    type: string
    sql: ${TABLE}.PLANTA ;;
    drill_fields: [detail*]
    link: {
      label: "Explore Top 20 Results"
      url: "{{ link }}&limit=20&f[status]=ABIERTA"
    }
  }
  dimension:orden {
    type: string
    sql: ${TABLE}.TOTAL_ORDENES ;;

  }

  set: detail {
    fields: [
      fact_rpm.PUESTO_TRABAJO,
    ]
  }
  measure: cantidad_buena {
    type: sum
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
  }
  measure: cantidad_rechazada {
    type: count_distinct
    sql: ${TABLE}.CANTIDA_RECHAZO_NOTIFICADA ;;
  }
  measure: cantidad_em {
    type: sum
    sql: ${TABLE}.CANTIDAD_EM ;;
  }
  measure: Porcentaje_cantidad_faltante {
    type: sum
    sql: ${TABLE}.PORCENTAJE_CANTIDA_FALTANTE ;;
  }
}
