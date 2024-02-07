view: fecha_solicitud {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET2}.CALENDAR` ;;

  dimension: fecha {
    type: date
    sql: ${TABLE}.DATE ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE ;;
  }
  dimension: dia {
    type: number
    sql: ${TABLE}.DAY ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.MONTH ;;
  }
  dimension: trimestre {
    type: number
    sql: ${TABLE}.QUARTER ;;
  }
  dimension: anio {
    type: number
    sql: ${TABLE}.YEAR ;;
    label: "Año"
  }
  measure: count {
    type: count
  }
}
