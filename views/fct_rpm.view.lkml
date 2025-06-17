view: fct_rpm {
  derived_table: {
    sql:
    SELECT
    *
    FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_utilidad_eficiencia_oee_rpm`

          --dejo funcionar
          --`envases-analytics-qa.RPT_S4H_MX.fact_utilidad_eficiencia_oee_rpm`


    /*WHERE  DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=
      DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
      AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <=
      DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)*/
      ;;
  }

  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }

  dimension: filtro_periodo {
    type: yesno
    sql:${fecha} BETWEEN DATETIME_SUB(CAST({% date_start date_filter %} AS DATE), INTERVAL 7 WEEK) AND CAST({% date_start date_filter %} AS DATE);;
  }

  dimension: filtro_3_meses {
    type: number
    sql: CASE WHEN ${fecha} >= ${fecha.d_fecha_ini} AND ${fecha} <= ${fecha.d_fecha_fin}
    AND ${fin_ejecucion} BETWEEN ${fecha.d_fecha_ini} AND DATE_SUB(${fecha.d_fecha_fin}, INTERVAL 2 day)  THEN 1 ELSE 0 END ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_ordenes {
    type: number
    sql: ${fact_rpm_cierre_automatico.total_ordenes} ;;
  }
  measure: ordenes_cerradas {
    type: number
    sql:${fact_rpm_cierre_automatico.ordenes_cerradas} ;;
  }
  measure: Porcentaje_cierre {
    type: number
    sql: (${fact_rpm_cierre_automatico.ordenes_cerradas} / ${fact_rpm_cierre_automatico.total_ordenes}) ;;
    drill_fields: [planta,puesto_trabajo,total_ordenes, ordenes_cerradas, Porcentaje_cierre]

    value_format: "0.00%"
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

  dimension: anio {
    type: string
    description: "Año"
    sql: CAST(${TABLE}.YEAR AS STRING);;
  }

  dimension: semana_rpm {
    type: string
    description: "Semana con base a las reglas de negocio de RPM, de Lunes a Domingo"
    sql: CAST(${TABLE}.WEEK_RPM AS STRING);;
  }

  dimension: mes {
    type: string
    description: "Mes"
    label: "Mes"
    sql: ${TABLE}.MONTH_NAME_SP ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABAJO ;;
    drill_fields: [departamento,total_ordenes, ordenes_cerradas, Porcentaje_cierre]
  }

  dimension: id_linea_rp {
    type: number
    sql: ${TABLE}.ID_LINEA_RP ;;
  }

  dimension: nombre_linea {
    type: string
    sql: ${TABLE}.NOMBRE_LINEA ;;
  }

  dimension: departamento {
    type: string
    sql: ${TABLE}.DEPARTAMENTO ;;
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

  dimension: Nombre {
    type: string
    sql: ${planta.nombre_planta} ;;
  }




  measure: Total_notificaciones_anuladas {
    label: "Notificaciones Anuladas"
    type: sum
    sql: case when  ${TABLE}.ANULADO='X' AND ${TABLE}.CREADO_POR = 'rpm_admin'  then 1 else 0 end ;;

  }



  measure: Total_notificaciones_posibles {
    label: "Notificaciones Posibles"
    type: sum
    sql: ${TABLE}.NOTIFICACIONES_POSIBLES ;;
  }

  measure: Total_notificaciones_reales {
    label: "Notificaciones Reales"
    type: sum
    sql: ${TABLE}.NOTIFICACIONES_REALES ;;
  }

  measure: Total_notificaciones_no_enviadas {

    type: sum
    sql: ${TABLE}.NOTIFICACIONES_NO_ENVIADAS ;;
  }


  measure: Total_notificaciones_utiles {
    label: "Notificaciones Útiles "
    type: number
    sql: ${Total_notificaciones_reales}-${Total_notificaciones_anuladas} ;;

  }



  measure: Total_porcentaje_efiiencia {
    label: "% Eficiencia"
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

    drill_fields: [planta,Nombre,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia2,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_notificaciones_utiles,Total_utilidad2]
  }

  measure: Total_utilidad{
    label: "% Utilidad"
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
    drill_fields: [planta,Nombre,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia2,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_notificaciones_utiles,Total_utilidad2]

  }


  measure: Total_porcentaje_efiiencia2 {
    label: "% Eficiencia"
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

    drill_fields: [planta,nombre_linea,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia3,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_utilidad3]
  }

  measure: Total_utilidad2{
    label: "% Utilidad"
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
    drill_fields: [planta,nombre_linea,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia3,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_utilidad3]

  }






  measure: Total_porcentaje_efiiencia3 {
    label: "% Eficiencia"
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

      drill_fields: [planta,nombre_linea,fecha,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia3,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_utilidad3]
    }

  measure: Total_utilidad3{
    label: "% Utilidad"
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
    drill_fields: [planta,nombre_linea,fecha,Total_notificaciones_posibles,Total_notificaciones_reales,Total_porcentaje_efiiencia3,Total_notificaciones_anuladas,Total_notificaciones_utiles,Total_utilidad3]

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
