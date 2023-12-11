view: material {

  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_material` ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  dimension: unidad_base_medida {
    type: string
    sql: ${TABLE}.UNIDAD_BASE_MEDIDA ;;
  }

  dimension: dimensiones {
    type: number
    sql: ${TABLE}.DIMENSIONES ;;
  }

  dimension: jerarquia_producto {
    type: string
    sql: ${TABLE}.JERARQUIA_PRODUCTO ;;
  }

  set: detail {
    fields: [
      id_material,
      grupo_material,
      unidad_base_medida,
      dimensiones,
      jerarquia_producto
    ]
  }
}
