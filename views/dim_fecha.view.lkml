view: fecha {
  #sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET2}.CALENDAR`
  derived_table: {
    sql: SELECT
    *
    FROM `@{GCP_PROJECT}.@{REPORTING_DATASET2}.CALENDAR`
    ;;
  }



  filter: selector_fecha {type: date}


  dimension: es_mes_seleccionado {
    type: yesno
    sql: {% condition es_mes_seleccionado %} ${date_raw} {% endcondition %} ;;
  }

  filter: anio_filter {
    label: "Año"
    type: string
    suggest_dimension: anio
  }

  filter: semana_filter {
    label: "Semana"
    type: string
    suggest_dimension: week_RPM
  }

  dimension: d_fecha_fin {
    type: date
    sql:  (SELECT MAX(DATE) FROM fecha WHERE {% condition anio_filter %} ${anio} {% endcondition %}
          AND {% condition semana_filter %} ${week_RPM} {% endcondition %} ) ;;
  }

  dimension: d_fecha_ini {
    type: date
    sql:   DATETIME_SUB(${d_fecha_fin}, INTERVAL 7 week) ;;
  }

  dimension: filtro_3_meses {
    type: number
    sql: CASE WHEN ${fecha} >= ${d_fecha_ini} AND ${fecha} <= ${d_fecha_fin} THEN 1 ELSE 0 END ;;
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
    description: "Semana con base a las reglas de negocio de RPM, de Lunes a Domingo"
    sql: CAST(${TABLE}.WEEK_RPM AS STRING);;
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
