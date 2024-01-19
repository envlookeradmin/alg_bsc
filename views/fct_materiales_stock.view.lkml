
view: fct_materiales_stock {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_materiales_stock`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha_costo {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_costo ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: tipo_proveedor_cliente {
    type: string
    sql: ${TABLE}.TIPO_PROVEEDOR_CLIENTE ;;
  }

  dimension: id_provedor_cliente {
    type: string
    sql: ${TABLE}.ID_PROVEDOR_CLIENTE ;;
  }

  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;
  }

  dimension: stock_inspeccion_calidad {
    type: number
    sql: ${TABLE}.STOCK_INSPECCION_CALIDAD ;;
  }

  dimension: stock_bloqueado {
    type: number
    sql: ${TABLE}.STOCK_BLOQUEADO ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  dimension: tipo_stock {
    type: number
    sql: ${TABLE}.TIPO_STOCK ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: valor_actual_stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
  }

  dimension: valor_actual_inspeccion_calidad {
    type: number
    sql: ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD ;;
  }

  dimension: valor_actual_bloqueado {
    type: number
    sql: ${TABLE}.VALOR_ACTUAL_BLOQUEADO ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }


  dimension: tipo_clasificacion {
    type: string
    sql: case when ${tipo_stock}=1 then 'Cliente' else 'Proveedor' end ;;
  }

  dimension: Proveedor_nombre {
    type: string
    sql: UPPER(${proveedor.nombre}) ;;
  }


  dimension: Cliente_nombre {
    type: string
    sql: UPPER(${cliente.nombre}) ;;
  }


  dimension: Clasificacion_proveedor {
    label: "Proveedor"
    type: string
    sql: case when  ${tipo_proveedor_cliente}='Cliente' then ${Cliente_nombre}
                    ${tipo_proveedor_cliente}='Proveedor' then ${Proveedor_nombre}
                    else 'NA'  end ;;
  }





  measure: Cantidad_stock {
    label: "Cantidad"
    type: sum
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;
  }

  measure: valor_stock {
    label: "valor"
    type: sum
    sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
  }









  set: detail {
    fields: [
      fecha_costo,
      id_material,
      centro,
      tipo_proveedor_cliente,
      id_provedor_cliente,
      stock_libre_utilizacion,
      stock_inspeccion_calidad,
      stock_bloqueado,
      grupo_material,
      tipo_stock,
      fecha,
      valor_actual_stock_libre_utilizacion,
      valor_actual_inspeccion_calidad,
      valor_actual_bloqueado,
      row_num
    ]
  }
}
