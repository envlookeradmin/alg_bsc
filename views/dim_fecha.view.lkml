view: fecha {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET2}.CALENDAR`
  ;;


  filter: selector_fecha {type: date}


  dimension: es_mes_seleccionado {
    type: yesno
    sql: {% condition es_mes_seleccionado %} ${date_raw} {% endcondition %} ;;
  }



  dimension: fecha {
    type: date
    sql: ${TABLE}.DATE ;;
  }


  dimension: CALDAY {
    type: string
    sql: ${TABLE}.CALDAY ;;
  }

  dimension: week_RPM {
    type: string
    sql: ${TABLE}.WEEK_RPM ;;
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
    order_by_field: date_month
  }

  dimension: trimestre {
    type: number
    sql: ${TABLE}.QUARTER ;;
  }


  dimension: trimestre_Letra {
    type: string
    sql: concat("Q", ${TABLE}.QUARTER) ;;
  }



  dimension: anio {
    type: string
    sql: CAST(${TABLE}.YEAR AS STRING) ;;
    label: "Año"
  }

  measure: count {
    type: count
  }
}
