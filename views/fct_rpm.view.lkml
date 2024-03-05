
view: fct_rpm {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.fact_utilidad_eficiencia_oee_rpm`
     WHERE  DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH) AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)


    ;;
  }


  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orden {
    type: string
    sql: ${TABLE}.ORDEN ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: registro_por_usuario {
    type: string
    sql: ${TABLE}.REGISTRO_POR_USUARIO ;;
  }

  dimension: contador {
    type: string
    sql: ${TABLE}.CONTADOR ;;
  }

  dimension: anulado {
    type: string
    sql: ${TABLE}.ANULADO ;;
  }

  dimension: operacion {
    type: string
    sql: ${TABLE}.OPERACION ;;
  }

  dimension: creado_por {
    type: string
    sql: ${TABLE}.CREADO_POR ;;
  }

  dimension: inicio_ejecucion {
    type: date
    datatype: date
    sql: ${TABLE}.INICIO_EJECUCION ;;
  }

  dimension: inicio_hora_real {
    type: string
    sql: ${TABLE}.INICIO_HORA_REAL ;;
  }

  dimension: fin_ejecucion {
    type: date
    datatype: date
    sql: ${TABLE}.FIN_EJECUCION ;;
  }

  dimension: fin_real {
    type: string
    sql: ${TABLE}.FIN_REAl ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABAJO ;;
  }

  dimension: id_linea_rp {
    type: number
    sql: ${TABLE}.ID_LINEA_RP ;;
  }

  dimension: nombre_linea {
    type: string
    sql: ${TABLE}.NOMBRE_LINEA ;;
  }

  dimension: notificaciones_posibles {
    type: number
    sql: ${TABLE}.NOTIFICACIONES_POSIBLES ;;
  }

  dimension: notificaciones_reales {
    type: number
    sql: ${TABLE}.NOTIFICACIONES_REALES ;;
  }

  dimension: notificaciones_no_enviadas {
    type: number
    sql: ${TABLE}.NOTIFICACIONES_NO_ENVIADAS ;;
  }

  dimension: porcentaje_efiiencia {
    type: number
    sql: ${TABLE}.PORCENTAJE_EFIIENCIA ;;
  }

  dimension: disponibilidad {
    type: number
    sql: ${TABLE}.DISPONIBILIDAD ;;
  }

  dimension: desempenio {
    type: number
    sql: ${TABLE}.DESEMPENIO ;;
  }

  dimension: calidad {
    type: number
    sql: ${TABLE}.CALIDAD ;;
  }

  dimension: oee {
    type: number
    sql: ${TABLE}.OEE ;;
  }






  measure: Total_notificaciones_posibles {
    type: sum
    sql: ${TABLE}.NOTIFICACIONES_POSIBLES ;;
  }

  measure: Total_notificaciones_reales {
    type: sum
    sql: ${TABLE}.NOTIFICACIONES_REALES ;;
  }

  measure: Total_notificaciones_no_enviadas {
    type: sum
    sql: ${TABLE}.NOTIFICACIONES_NO_ENVIADAS ;;
  }

  measure: Total_porcentaje_efiiencia {
    type: average
    sql: ${TABLE}.PORCENTAJE_EFIIENCIA *100 ;;
    value_format: "0.00\%"

    html:
    {% if value >= 92.0 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 90.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 91.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;
  }

  measure: Total_disponibilidad {
    type: sum
    sql: ${TABLE}.DISPONIBILIDAD ;;
  }

  measure: Total_desempenio {
    type: sum
    sql: ${TABLE}.DESEMPENIO ;;
  }

 measure: Total_calidad {
    type: sum
    sql: ${TABLE}.CALIDAD ;;
  }

  measure: Total_utilidad{
    type: number
    sql: (${Total_notificaciones_reales}-${Total_notificaciones_no_enviadas})/nullif(${Total_notificaciones_no_enviadas},0) ;;
    value_format: "0.00\%"
    html:
    {% if value >= 92.0 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 90.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 91.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

  }

  measure: Total_oee {
    type: sum
    sql: ${TABLE}.OEE ;;
  }

  set: detail {
    fields: [
        orden,
  planta,
  id_material,
  registro_por_usuario,
  contador,
  anulado,
  operacion,
  creado_por,
  inicio_ejecucion,
  inicio_hora_real,
  fin_ejecucion,
  fin_real,
  fecha,
  puesto_trabajo,
  id_linea_rp,
  nombre_linea,
  notificaciones_posibles,
  notificaciones_reales,
  notificaciones_no_enviadas,
  porcentaje_efiiencia,
  disponibilidad,
  desempenio,
  calidad,
  oee
    ]
  }
}
