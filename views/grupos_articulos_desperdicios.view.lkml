
view: grupos_articulos_desperdicios {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.cat_grupos_articulos_desperdicios` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: grupo_articulo {
    type: string
    sql: ${TABLE}.GRUPO_ARTICULO ;;
  }

  dimension: denominacion {
    type: string
    sql: ${TABLE}.DENOMINACION ;;
  }

  set: detail {
    fields: [
      centro,
      grupo_articulo,
      denominacion
    ]
  }
}
