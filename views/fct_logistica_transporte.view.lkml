
view: fct_logistica_transporte {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_fact_logistica_transporte`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: numero_factura {
    type: string
    sql: ${TABLE}.NUMERO_FACTURA ;;
  }

  dimension: importe_neto_facturacion {
    type: number
    sql: ${TABLE}.IMPORTE_NETO_FACTURACION   ;;
  }

  measure: Total_importe_neto_facturacion {
    type: sum
    sql: CAST(${TABLE}.IMPORTE_NETO_FACTURACION AS FLOAT64) ;;
  }

  dimension: variantes {
    type: string
    sql: ${TABLE}.VARIANTES ;;
  }

  dimension: transportationorderuuid {
    type: string
    sql: ${TABLE}.TRANSPORTATIONORDERUUID ;;
  }

  dimension: orden_flete {
    type: string
    sql: ${TABLE}.ORDEN_FLETE ;;
  }

  dimension: clase_orden_flete {
    type: string
    sql: ${TABLE}.CLASE_ORDEN_FLETE ;;
  }

  dimension: fecha_creacion_fo {
    type: number
    sql: ${TABLE}.FECHA_CREACION_FO ;;
  }

  dimension: entrega {
    type: string
    sql: ${TABLE}.ENTREGA ;;
  }

  dimension: fecha_contabilizacion_dlf {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_CONTABILIZACION_DLF ;;
  }

  dimension: documento_liquidacion {
    type: string
    sql: ${TABLE}.DOCUMENTO_LIQUIDACION ;;
  }

  dimension: importe_fo {
    type: number
    sql: ${TABLE}.IMPORTE_FO ;;
  }

  measure: Total_importe_fo {
    type: sum
    sql: ${TABLE}.IMPORTE_FO ;;
  }

  dimension: moneda_fo {
    type: string
    sql: ${TABLE}.MONEDA_FO ;;
  }

  dimension: organizacion_compra {
    type: string
    sql: ${TABLE}.ORGANIZACION_COMPRA ;;
  }

  dimension: cliente_destinatario {
    type: string
    sql: ${TABLE}.CLIENTE_DESTINATARIO ;;
  }

  dimension: numero_transportista {
    type: string
    sql: ${TABLE}.NUMERO_TRANSPORTISTA ;;
  }

  dimension: id_transoportista {
    type: string
    sql: ${TABLE}.ID_TRANSOPORTISTA ;;
  }

  dimension: id_cliente_destinatario {
    type: string
    sql: ${TABLE}.ID_CLIENTE_DESTINATARIO ;;
  }

  dimension: estado_facturacion {
    type: string
    sql: ${TABLE}.ESTADO_FACTURACION ;;
  }

  set: detail {
    fields: [
        centro,
  numero_factura,
  importe_neto_facturacion,
  variantes,
  transportationorderuuid,
  orden_flete,
  clase_orden_flete,
  fecha_creacion_fo,
  entrega,
  fecha_contabilizacion_dlf,
  documento_liquidacion,
  importe_fo,
  moneda_fo,
  organizacion_compra,
  cliente_destinatario,
  numero_transportista,
  id_transoportista,
  id_cliente_destinatario,
  estado_facturacion
    ]
  }
}
