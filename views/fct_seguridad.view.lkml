
view: fct_seguridad {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_reporte_seguridad`;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}.ID_EVENTO ;;
  }

  measure: coutn_id_evento {
    type: count_distinct
    sql: ${TABLE}.ID_EVENTO ;;
  }

  dimension: titulo {
    type: string
    sql: ${TABLE}.TITULO ;;
  }

  dimension: circustancias_incendio {
    type: string
    sql: ${TABLE}.CIRCUSTANCIAS_INCENDIO ;;
  }

  dimension: descripcion_equipo {
    type: string
    sql: ${TABLE}.DESCRIPCION_EQUIPO ;;
  }

  dimension: fecha {
    type: date
    sql:${TABLE}.FECHA  ;;
  }

  dimension: clasificacion_incidente {
    type: string
    sql: ${TABLE}.CLASIFICACION_INCIDENTE ;;
  }

  dimension: clasificacion_herida {
    type: string
    sql: ${TABLE}.CLASIFICACION_HERIDA ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.TIPO_EVENTO ;;
  }

  set: detail {
    fields: [
        id_evento,
  titulo,
  circustancias_incendio,
  descripcion_equipo,
  fecha,
  clasificacion_incidente,
  clasificacion_herida,
  estado,
  centro,
  tipo_evento
    ]
  }
}
