view: fecha {
  sql_table_name: `envases-analytics-eon-poc.ENVASES_REPORTING.CALENDAR` ;;

  filter: selector_fecha {type: date}

  dimension: es_mes_seleccionado {
    type: yesno
    sql: {% condition es_mes_seleccionado %} ${date_raw} {% endcondition %} ;;
  }



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
    sql:  ${TABLE}.MONTH_NAME_SP;;
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
