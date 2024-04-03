
view: fact_desperdicio_costos {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_fact_desperdicio_costos`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: anio {
    type: string
    sql: ${TABLE}.ANIO ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.PERIODO ;;
  }

  dimension: plnata {
    type: string
    sql: ${TABLE}.PLNATA ;;
  }

  dimension: centro_beneficio {
    type: string
    sql: ${TABLE}.CENTRO_BENEFICIO ;;
  }

  dimension: fecha_documento {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  dimension: descripcion_material {
    type: string
    sql: ${TABLE}.DESCRIPCION_MATERIAL ;;
  }

  dimension: peso {
    type: number
    sql: ${TABLE}.PESO ;;
  }

  dimension: unidad_peso {
    type: string
    sql: ${TABLE}.UNIDAD_PESO ;;
  }

  dimension: importe {
    type: number
    sql: ${TABLE}.IMPORTE ;;
  }

  set: detail {
    fields: [
        anio,
  periodo,
  plnata,
  centro_beneficio,
  fecha_documento,
  material,
  cantidad,
  descripcion_material,
  peso,
  unidad_peso,
  importe
    ]
  }
}
