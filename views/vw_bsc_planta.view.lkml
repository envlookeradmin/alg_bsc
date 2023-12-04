view: vw_bsc_planta {
  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_planta` ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }
  dimension: nombre_planta {
    type: string
    sql: ${TABLE}.Nombre_Planta ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }
  dimension: planta_id {
    type: string
    sql: ${TABLE}.Planta_ID ;;
  }
  measure: count {
    type: count
  }
}
