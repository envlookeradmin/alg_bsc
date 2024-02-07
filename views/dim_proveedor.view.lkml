view: proveedor {
  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_proveedor` ;;

  dimension: es_recoleccion {
    type: number
    sql: ${TABLE}.Es_Recoleccion ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: proveedor_id {
    type: string
    sql: ${TABLE}.Proveedor_ID ;;
  }
  measure: count {
    type: count
  }
}
