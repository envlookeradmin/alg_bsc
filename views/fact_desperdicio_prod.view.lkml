
view: fact_desperdicio_prod {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_fact_desperdicio_prod`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  dimension: importe {
    type: number
    sql: ${TABLE}.IMPORTE ;;
  }

  dimension: fecha_documento {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }

  dimension: descripcion_material {
    type: string
    sql: ${TABLE}.DESCRIPCION_MATERIAL ;;
  }

  dimension: peso {
    type: number
    sql: ${TABLE}.PESO ;;
  }

  dimension: unida_peso {
    type: string
    sql: ${TABLE}.UNIDA_PESO ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  set: detail {
    fields: [
        planta,
  material,
  cantidad,
  importe,
  fecha_documento,
  descripcion_material,
  peso,
  unida_peso,
  grupo_material
    ]
  }
}
