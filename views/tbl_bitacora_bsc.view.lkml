view: bitacora{
  sql_table_name: `envases-analytics-qa.RPT_S4H_MX.tbl_bitacora_bsc` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date_time ;;
  }
  measure: ultima_actualizacion {
    type: date_time
    sql: MAX(${date_raw}) ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: stored_procedure {
    type: string
    sql: ${TABLE}.stored_procedure ;;
  }
  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }
  measure: count {
    type: count
  }
}
