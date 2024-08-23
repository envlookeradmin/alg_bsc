
view: fct_gastos_adicionales {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_fact_gastos_adicionales` LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gasto_adiciona_flete_nacional_exportacion {
    type: number
    sql: ${TABLE}.GASTO_ADICIONA_FLETE_NACIONAL_EXPORTACION ;;
  }

  dimension: moneda_gasto_adicional {
    type: string
    sql: ${TABLE}.MONEDA_GASTO_ADICIONAL ;;
  }

  dimension: denominacion_gasto_adicional {
    type: string
    sql: ${TABLE}.DENOMINACION_GASTO_ADICIONAL ;;
  }

  set: detail {
    fields: [
        gasto_adiciona_flete_nacional_exportacion,
  moneda_gasto_adicional,
  denominacion_gasto_adicional
    ]
  }
}
