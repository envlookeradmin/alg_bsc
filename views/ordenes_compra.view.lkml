view: ordenes_compra {
  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_ordenes_compra` ;;

  dimension: comprador_po {
    type: string
    sql: ${TABLE}.Comprador_PO ;;
  }
  dimension: comprador_pr {
    type: string
    sql: ${TABLE}.Comprador_PR ;;
  }
  dimension_group: fecha_creacion_po {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_creacion_PO ;;
  }
  dimension_group: fecha_creacion_pr {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_creacion_PR ;;
  }
  dimension_group: fecha_entrega_plan {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_entrega_plan ;;
  }
  dimension_group: fecha_entrega_real {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_entrega_real ;;
  }
  dimension_group: fecha_liberacion_pr {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_liberacion_PR ;;
  }
  dimension_group: fecha_modificacion_pr {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_modificacion_PR ;;
  }
  dimension: grupo_compras {
    type: string
    sql: ${TABLE}.Grupo_compras ;;
  }
  dimension: orden_compra {
    type: string
    sql: ${TABLE}.Orden_compra ;;
  }
  dimension: organizacion_compras {
    type: string
    sql: ${TABLE}.Organizacion_compras ;;
  }
  dimension: planta {
    type: string
    sql: ${TABLE}.Planta ;;
  }
  dimension: posicion_po {
    type: string
    sql: ${TABLE}.Posicion_PO ;;
  }
  dimension: solicitud_pedido_compra {
    type: string
    sql: ${TABLE}.Solicitud_pedido_compra ;;
  }
  measure: count {
    type: count
  }
}
