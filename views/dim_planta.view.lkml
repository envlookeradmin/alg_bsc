view: planta{
  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_planta` ;;

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

  dimension: planta_completo {
    type: string
    sql: ${TABLE}.Planta_ID || ' ' || ${TABLE}.Nombre_Planta;;
  }

  measure: count {
    type: count
  }
}
