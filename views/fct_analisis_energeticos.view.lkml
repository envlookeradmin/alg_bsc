
view: fct_analisis_energeticos {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.tbl_analisis_energeticos` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: institucion {
    type: string
    sql: ${TABLE}.institucion ;;
  }

  dimension: fechaarchivo {
    type: date
    datatype: date
    sql: ${TABLE}.fechaarchivo ;;
  }

  dimension_group: fecha_filtro {
    label: "Date"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${TABLE}.fechaarchivo  AS TIMESTAMP) ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }

  dimension: mes_anterior{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }

  dimension: nombre_mes {
    type: string
    sql: ${TABLE}.nombre_mes ;;
    order_by_field: fechaarchivo
  }

  dimension: fechafactura {
    type: string
    sql: ${TABLE}.fechafactura ;;
  }

  dimension: fecha_inicio {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_inicio ;;
  }

  dimension: fecha_fin {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_fin ;;
  }

  dimension: facturadopara {
    type: string
    sql: ${TABLE}.facturadopara ;;
  }

  dimension: importe {
    type: number
    sql: ${TABLE}.importe ;;
  }

  dimension: factordepotencia {
    type: number
    sql: ${TABLE}.factordepotencia ;;
  }

  dimension: consumokwh {
    type: number
    sql: ${TABLE}.consumokwh ;;
  }

  dimension: metroscubicos {
    type: number
    sql: ${TABLE}.metroscubicos ;;
  }

  dimension: porcentaje {
    type: number
    sql: CAST(CASE WHEN ${TABLE}.porcentaje = '' THEN '100' ELSE ${TABLE}.porcentaje END AS NUMERIC) ;;
  }

  dimension: tiposervicio {
    type: string
    sql: ${TABLE}.tiposervicio ;;
  }

  dimension_group: recordstamp {
    type: time
    sql: ${TABLE}.recordstamp ;;
  }

  dimension: total_kilos_produccion {
    type: number
    sql: ${TABLE}.total_kilos_produccion ;;
  }

  measure: factor_potencia_mes_anterior {
    type: max
    sql: ${factordepotencia} / 100 ;;
    html:
    {% if value <= 0.9 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;
    value_format: "0.00%"
    filters: {
      field: mes_anterior
      value: "yes"
    }
  }

  measure: kw_consumidos_mes_actual {
    type: sum
    sql: ${consumokwh};;
    filters: [tiposervicio: "LUZ"]
    value_format: "0.00"
    filters: {
      field: mes_actual
      value: "yes"
    }
  }

  measure: kw_consumidos_mes_anterior {
    type: sum
    sql: ${consumokwh};;
    filters: [tiposervicio: "LUZ"]
    value_format: "0.00"
    filters: {
      field: mes_anterior
      value: "yes"
    }
  }

  measure: total_kilos_produccion_mes_actual {
    type: sum
    sql: ${total_kilos_produccion} ;;
    filters: [tiposervicio: "LUZ"]
    value_format: "0.00"
    filters: {
      field: mes_actual
      value: "yes"
    }
  }

  measure: total_kilos_produccion_mes_anterior {
    type: sum
    sql: ${total_kilos_produccion} ;;
    filters: [tiposervicio: "LUZ"]
    value_format: "0.00"
    filters: {
      field: mes_anterior
      value: "yes"
    }
  }


  measure: kg_kw_mes_actual {
    type: number
    sql:
    ${total_kilos_produccion_mes_actual}/ nullif(${kw_consumidos_mes_actual},0)
    ;;
  }

  measure: kg_kw_mes_anterior {
    type: number
    sql:
     ${total_kilos_produccion_mes_anterior} / nullif(${kw_consumidos_mes_anterior},0)
     ;;
  }

  measure: gas_m3_actual {
    type: sum
    sql: CASE WHEN ${metroscubicos} = 0 THEN NULL ELSE ${metroscubicos} END  ;;
    filters: [tiposervicio: "GAS"]
    filters: {
      field: mes_actual
      value: "yes"
    }
     }

    measure: gas_m3_anterior {
      type: sum
      sql: CASE WHEN ${metroscubicos} = 0 THEN NULL ELSE ${metroscubicos} END ;;
      filters: [tiposervicio: "GAS"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
  }

  set: detail {
    fields: [
        id,
  institucion,
  fechaarchivo,
  nombre_mes,
  fechafactura,
  fecha_inicio,
  fecha_fin,
  facturadopara,
  importe,
  factordepotencia,
  consumokwh,
  metroscubicos,
  porcentaje,
  tiposervicio,
  recordstamp_time,
  total_kilos_produccion
    ]
  }
}
