view: fecha {
  sql_table_name: `envases-analytics-eon-poc.ENVASES_REPORTING.CALENDAR` ;;

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

  dimension: nombre_mes {
    type: string
    sql: CASE
         WHEN ${TABLE}.MONTH = 1 THEN 'ENERO'
         WHEN ${TABLE}.MONTH = 2 THEN 'FEBRERO'
         WHEN ${TABLE}.MONTH = 3 THEN 'MARZO'
         WHEN ${TABLE}.MONTH = 4 THEN 'ABRIL'
         WHEN ${TABLE}.MONTH = 5 THEN 'MAYO'
         WHEN ${TABLE}.MONTH = 6 THEN 'JUNIO'
         WHEN ${TABLE}.MONTH = 7 THEN 'JULIO'
         WHEN ${TABLE}.MONTH = 8 THEN 'AGOSTO'
         WHEN ${TABLE}.MONTH = 9 THEN 'SEPTIEMBRE'
         WHEN ${TABLE}.MONTH = 10 THEN 'OCTUBRE'
         WHEN ${TABLE}.MONTH = 11 THEN 'NOVIEMBRE'
         WHEN ${TABLE}.MONTH = 12 THEN 'DICIEMBRE'
         END;;

    order_by_field: mes
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
