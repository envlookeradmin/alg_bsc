view: fct_ordenes_pedidos {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_bsc_ordenes_pedidos`;;
  }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: documento_venta {
    type: string
    sql: ${TABLE}.DOCUMENTO_VENTA ;;
  }

  dimension: solicitante {
    type: string
    sql: ${TABLE}.SOLICITANTE ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.ORGANIZACION_VENTAS ;;
  }

  dimension: fecha_entrega_planeada {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_ENTREGA_PLANEADA ;;
  }

  dimension: fecha_entrega_real {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_ENTREGA_REAL ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: peso_neto {
    type: number
    sql: ${TABLE}.PESO_NETO ;;
  }

  dimension: unidad_peso_material {
    type: string
    sql: ${TABLE}.UNIDAD_PESO_MATERIAL ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }



  dimension: cantidad_pendiente {
    type: number
    sql: ${TABLE}.CANTIDAD_PENDIENTE ;;
  }

  dimension: fill_rate {
    type: number
    sql: ${TABLE}.FILL_RATE ;;
  }

  dimension: flag_otif {
    type: number
    sql: ${TABLE}.FLAG_OTIF ;;
  }


  measure: Total_flag_otif {
    type: count_distinct
    sql: ${TABLE}.FLAG_OTIF ;;
  }

  measure: Total_flag_otif_entregadas {
    type: count_distinct
    sql: ${TABLE}.FLAG_OTIF ;;
    filters: [flag_otif: "1"]
  }


  dimension: cantidad_pedida {
    type: number
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }

  dimension: cantidad_entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }



  dimension: estatus_entrega {

    type: string
    sql: ${TABLE}.ESTATUS_ENTREGA ;;
  }

  measure: Total_cantidad_entregada {
    label: "Cantidad Entregada"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }


  measure: Total_cantidad_pedida {
    label: "Cantidad Pedida"
    type: sum
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }

  measure: Total_cantidad_pendiente {
    type: sum
    sql: ${TABLE}.CANTIDAD_PENDIENTE ;;
  }





  measure: OTIF {
    label: "OTIF"
    type: number
    sql:(${Total_flag_otif_entregadas} /nullif( ${Total_flag_otif},0)) *100  ;;
    value_format: "0.00\%"
    drill_fields: [grupo_materiales.descripcion,OTIF]
  }

  measure: Total_fill_rate {
    label: "FILL RATE"
    type: sum
   sql: ${TABLE}.FILL_RATE ;;
    value_format: "0.00\%"
    drill_fields: [grupo_materiales.descripcion,Total_cantidad_pedida,Total_cantidad_entregada]
  }



#  OTIF : Es el porcentaje de líneas de pedido entregadas en tiempo (Fecha Entrega Real vs Fecha Comprometida)
 # y con el total de piezas pedidas (Cantidad Pedida vs Cantidad Entregada a Ventas).








  set: detail {
    fields: [
        documento_venta,
  solicitante,
  canal_distribucion,
  organizacion_ventas,
  fecha_entrega_planeada,
  fecha_entrega_real,
  planta,
  id_material,
  peso_neto,
  unidad_peso_material,
  id_grupo_material,
  cantidad_pedida,
  cantidad_entregada,
  cantidad_pendiente,
  fill_rate,
  estatus_entrega
    ]
  }

}
