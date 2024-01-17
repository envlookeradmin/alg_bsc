
view: cliente {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_cliente` LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cliente {
    type: string
    sql: ${TABLE}.ID_CLIENTE ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE ;;
  }

  dimension: pais_origen {
    type: string
    sql: ${TABLE}.PAIS_ORIGEN ;;
  }

  set: detail {
    fields: [
        id_cliente,
  nombre,
  pais_origen
    ]
  }
}
