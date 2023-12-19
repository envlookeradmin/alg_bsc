
view: inventarios_ciclicos {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_inventarios_ciclicos`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: uid_documento {
    type: string
    sql: ${TABLE}.UID_DOCUMENTO ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: id_item {
    type: string
    sql: ${TABLE}.ID_ITEM ;;
  }

  dimension: estatus {
    type: string
    sql: ${TABLE}.ESTATUS ;;
  }

  dimension: fecha_documento {
    type: number
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }

  dimension: estatus_cantidad {
    type: string
    sql: ${TABLE}.ESTATUS_CANTIDAD ;;
  }

  dimension: cantidad_teorica {
    type: number
    sql: ${TABLE}.CANTIDAD_TEORICA ;;
  }

  dimension: cantidad_total {
    type: number
    sql: ${TABLE}.CANTIDAD_TOTAL ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: clasificacion {
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }

  set: detail {
    fields: [
        uid_documento,
  planta,
  id_item,
  estatus,
  fecha_documento,
  estatus_cantidad,
  cantidad_teorica,
  cantidad_total,
  material,
  clasificacion
    ]
  }
}
