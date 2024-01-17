
view: fct_presupuesto_ventas {
  derived_table: {
    sql: select * from envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_presupuesto_ventas ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: id_cliente {
    type: string
    sql: ${TABLE}.ID_CLIENTE ;;
  }

  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.NOMBRE_CLIENTE ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  measure: total_cantidad {
    type: sum
     sql: ${TABLE}.CANTIDAD ;;
  }

  measure: total_monto {
    type: sum
    sql: ${TABLE}.MONTO ;;
  }


  dimension: monto {
    type: number
    sql: ${TABLE}.MONTO ;;
  }

  set: detail {
    fields: [
        planta,
  fecha,
  id_cliente,
  nombre_cliente,
  id_grupo_material,
  cantidad,
  monto
    ]
  }
}
