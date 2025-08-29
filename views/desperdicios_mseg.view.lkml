include: "dim_parametros.view"
view: desperdicios_mseg {
  derived_table: {
    sql:
      SELECT
        *
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.tbl_fact_desperdicios_movimientos`
      WHERE FECHA_DOCUMENTO BETWEEN
        DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), YEAR)
        AND DATE_SUB(CAST({% date_end date_filter %} AS DATE), INTERVAL 1 DAY)
    ;;
  }
  extends: [dim_parametros] #INCLUYE EL FILTRO DE FECHA
  dimension: fuente {
    type: string
    sql: ${TABLE}.FUENTE ;;
  }
  dimension: kilogramos {
    type: number
    sql: ${TABLE}.KILOGRAMOS ;;
  }
#METRICAS
  measure: total_importe_desperdicio {
    type: sum
    sql: ${importe} ;;
    value_format: "$#,##0"
    filters: [fuente: "MSEG"]
  }
  measure: kgs_desperdicio {
    type: sum
    sql: ${kilogramos} ;;
    value_format: "#,##0"
    filters: [fuente: "MSEG"]
  }
  measure: kgs_produccion {
    type: sum
    sql: ${kilogramos} ;;
    value_format: "#,##0"
    filters: [fuente: "MANUFACTURA"]
  }
  measure: kgs_desperdicio_pj {
    type: number
    sql: SAFE_DIVIDE(${kgs_desperdicio}, ${kgs_produccion}) ;;
    value_format: "0.00%"
    html:
      {% if value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF01 Cuautitlán, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF03 Mazatlan I, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF05 Mazatlan II, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.029 and desperdicios_mseg.nombre_planta._value=="MF07 Tijuana, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.04 and desperdicios_mseg.nombre_planta._value=="MF10 Monterrey , MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% else %}
        <span style="color: red;">{{ rendered_value }}</span></p>
      {% endif %} ;;
  }
  measure: total_importe_desperdicio_mes {
    type: sum
    sql: ${importe} ;;
    value_format: "$#,##0"
    filters: [fuente: "MSEG", es_mes_seleccionado: "yes"]
  }
  measure: kgs_desperdicio_mes {
    type: sum
    sql: ${kilogramos} ;;
    value_format: "#,##0"
    filters: [fuente: "MSEG", es_mes_seleccionado: "yes"]
  }
  measure: kgs_produccion_mes {
    type: sum
    sql: ${kilogramos} ;;
    value_format: "#,##0"
    filters: [fuente: "MANUFACTURA", es_mes_seleccionado: "yes"]
  }
  measure: kgs_desperdicio_pj_mes {
    type: number
    sql: SAFE_DIVIDE(${kgs_desperdicio_mes}, ${kgs_produccion_mes}) ;;
    value_format: "0.00%"
    html:
      {% if value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF01 Cuautitlán, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF03 Mazatlan I, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.06 and desperdicios_mseg.nombre_planta._value=="MF05 Mazatlan II, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.029 and desperdicios_mseg.nombre_planta._value=="MF07 Tijuana, MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value <= 0.04 and desperdicios_mseg.nombre_planta._value=="MF10 Monterrey , MX" %}
        <p> <span style="color: green;">{{ rendered_value }}</span></p>
      {% else %}
        <span style="color: red;">{{ rendered_value }}</span></p>
      {% endif %} ;;
  }
}
