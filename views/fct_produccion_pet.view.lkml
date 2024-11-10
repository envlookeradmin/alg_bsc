
view: fct_produccion_pet {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_PET.fact_produccion_pet` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_planta {
    type: string
    sql: ${TABLE}.ID_PLANTA ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: id_diario {
    type: string
    sql: ${TABLE}.ID_DIARIO ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABAJO ;;
  }

  dimension: maquina {
    type: string
    sql: ${TABLE}.MAQUINA ;;
  }

  dimension: proceso {
    type: string
    sql: ${TABLE}.PROCESO ;;
  }

  dimension: modelo {
    type: string
    sql: ${TABLE}.MODELO ;;
  }

  dimension: engraving {
    type: string
    sql: ${TABLE}.ENGRAVING ;;
  }

  dimension: gramaje {
    type: string
    sql: ${TABLE}.GRAMAJE ;;
  }

  dimension: tipo_cuello {
    type: string
    sql: ${TABLE}.TIPO_CUELLO ;;
  }

  dimension: cavidad_std {
    type: number
    sql: ${TABLE}.CAVIDAD_STD ;;
  }

  dimension: ciclo_std {
    type: number
    sql: ${TABLE}.CICLO_STD ;;
  }

  dimension: ciclo_real {
    type: number
    sql: ${TABLE}.CICLO_REAL ;;
  }

  dimension: objid {
    type: string
    sql: ${TABLE}.objid ;;
  }

  dimension: cantidad_buena_notificada {
    type: number
    sql: ${TABLE}.CANTIDAD_BUENA_NOTIFICADA ;;
  }

  dimension: cantidad_rechazo_notificada {
    type: number
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
  }

  dimension: sin_demanda {
    type: number
    sql: ${TABLE}.SIN_DEMANDA ;;
  }

  dimension: cambio_molde {
    type: number
    sql: ${TABLE}.CAMBIO_MOLDE ;;
  }

  dimension: cambio_color {
    type: number
    sql: ${TABLE}.CAMBIO_COLOR ;;
  }

  dimension: cambio_resina {
    type: number
    sql: ${TABLE}.CAMBIO_RESINA ;;
  }

  dimension: preventivo {
    type: number
    sql: ${TABLE}.PREVENTIVO ;;
  }

  dimension: otros {
    type: number
    sql: ${TABLE}.OTROS ;;
  }

  dimension: falta_resina_mp {
    type: number
    sql: ${TABLE}.FALTA_RESINA_MP ;;
  }

  dimension: fallas_ee {
    type: number
    sql: ${TABLE}.FALLAS_EE ;;
  }

  dimension: cavidad_real {
    type: number
    sql: ${TABLE}.CAVIDAD_REAL ;;
  }

  dimension: horas_planeadas {
    type: number
    sql: ${TABLE}.HORAS_PLANEADAS ;;
  }

  dimension: diaria {
    type: number
    sql: ${TABLE}.DIARIA ;;
  }

  dimension: calidad {
    type: number
    sql: ${TABLE}.CALIDAD ;;
  }

  dimension: cavidades_canceladas {
    type: number
    sql: ${TABLE}.CAVIDADES_CANCELADAS ;;
  }

  dimension: afec_efic_cav {
    type: number
    sql: ${TABLE}.AFEC_EFIC_CAV ;;
  }

  dimension: afec_efic_ciclos {
    type: number
    sql: ${TABLE}.AFEC_EFIC_CICLOS ;;
  }

  dimension: tiempo_paros_planeados {
    type: number
    sql: ${TABLE}.TIEMPO_PAROS_PLANEADOS ;;
  }

  dimension: cantidad_confirmada {
    type: number
    sql: ${TABLE}.CANTIDAD_CONFIRMADA ;;
  }

  dimension: delta {
    type: number
    sql: ${TABLE}.DELTA ;;
  }

  dimension: disponibilidad {
    type: number
    sql: ${TABLE}.DISPONIBILIDAD ;;
  }

  dimension: eficiencia {
    type: number
    sql: ${TABLE}.EFICIENCIA ;;
  }

  dimension: oee {
    type: number
    sql: ${TABLE}.OEE ;;
  }

  dimension: hora_calendario {
    type: number
    sql: ${TABLE}.HORA_CALENDARIO ;;
  }

  dimension: tiempo_no_planeado {
    type: number
    sql: ${TABLE}.TIEMPO_NO_PLANEADO ;;
  }

  dimension: aprovech_equipo {
    type: number
    sql: ${TABLE}.APROVECH_EQUIPO ;;
  }

  dimension: tiempo_improductivo_hrs {
    type: number
    sql: ${TABLE}.TIEMPO_IMPRODUCTIVO_HRS ;;
  }

  dimension: hora {
    type: number
    sql: ${TABLE}.HORA ;;
  }

  dimension: utilizacion_demanda {
    type: number
    sql: ${TABLE}.UTILIZACION_DEMANDA ;;
  }



  measure: Total_salida_real {
    type: sum
    sql: ${TABLE}.CICLO_REAL ;;
    value_format: "#,##0"
  }




  set: detail {
    fields: [
        id_planta,
  fecha,
  id_diario,
  material,
  puesto_trabajo,
  maquina,
  proceso,
  modelo,
  engraving,
  gramaje,
  tipo_cuello,
  cavidad_std,
  ciclo_std,
  ciclo_real,
  objid,
  cantidad_buena_notificada,
  cantidad_rechazo_notificada,
  sin_demanda,
  cambio_molde,
  cambio_color,
  cambio_resina,
  preventivo,
  otros,
  falta_resina_mp,
  fallas_ee,
  cavidad_real,
  horas_planeadas,
  diaria,
  calidad,
  cavidades_canceladas,
  afec_efic_cav,
  afec_efic_ciclos,
  tiempo_paros_planeados,
  cantidad_confirmada,
  delta,
  disponibilidad,
  eficiencia,
  oee,
  hora_calendario,
  tiempo_no_planeado,
  aprovech_equipo,
  tiempo_improductivo_hrs,
  hora,
  utilizacion_demanda
    ]
  }
}
