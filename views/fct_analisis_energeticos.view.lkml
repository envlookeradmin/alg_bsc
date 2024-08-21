
view: fct_analisis_energeticos {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.tbl_analisis_energeticos`;;
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
    sql: ${TABLE}.fechaarchivo ;;
  }
  dimension: mes_anio_fechaarchivo {
    type: string
    sql: CONCAT(EXTRACT(YEAR FROM ${TABLE}.fechaarchivo), '-', LPAD(EXTRACT(MONTH FROM ${TABLE}.fechaarchivo), 2, '0')) ;;
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
    type: string
    sql: ${TABLE}.porcentaje ;;
  }

  dimension: tiposervicio {
    type: string
    sql: ${TABLE}.tiposervicio ;;
  }

  dimension_group: recordstamp {
    type: time
    sql: ${TABLE}.recordstamp ;;
  }

  measure: factor_potencia {
    type: max
    sql: ${factordepotencia} / 100 ;;
    html:
    {% if value <= 0.9 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;
    value_format: "0.00%"
  }

  measure: kw_consumidos {
    type: max
    sql: ${consumokwh} ;;
    filters: [tiposervicio: "LUZ"]
    value_format: "0.00"
  }

  measure: kg_kw {
    sql: round(${kw_consumidos} / 100000,2) ;;
  }

  measure: gas_m3 {
    type: max
    sql: ${metroscubicos} ;;
    filters: [tiposervicio: "GAS"]
  }

  set: detail {
    fields: [
        id,
  institucion,
  fechaarchivo,
  nombre_mes,
  fechafactura,
  facturadopara,
  importe,
  factordepotencia,
  consumokwh,
  metroscubicos,
  porcentaje,
  tiposervicio,
  recordstamp_time
    ]
  }
}
