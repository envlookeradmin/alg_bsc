view: motivo_devolucion {
  sql_table_name: `envases-analytics-qa.RPT_S4H_MX.vw_bsc_motivo_devolucion` ;;

  dimension: codigo_devolucion {
    type: string
    sql: ${TABLE}.CODIGO_DEVOLUCION ;;
  }
  dimension: motivo_devolucion {
    label: "Motivo devolución"
    type: string
    sql: ${TABLE}.MOTIVO_DEVOLUCION ;;
  }

  measure: count {
    type: count
  }
}
