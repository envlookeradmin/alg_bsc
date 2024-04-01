
view: sql_runner_query {
  derived_table: {
    sql: select * from `envases-analytics-qa.RPT_S4H_MX.vw_fact_utilidad_eficiencia_oee_rpm`  limit 100 ;;
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
