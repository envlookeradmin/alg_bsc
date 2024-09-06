
view: fct_logistica_transporte {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_logistica_transporte`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: planta_manufacturera {
    type: string
    sql: case when ${TABLE}.CENTRO='MF51' THEN "MF01"
              when ${TABLE}.CENTRO='MF52' THEN "MF02"
              when ${TABLE}.CENTRO='MF53' THEN "MF03"
              when ${TABLE}.CENTRO='MF54' THEN "MF04"
              when ${TABLE}.CENTRO='MF55' THEN "MF05"
              when ${TABLE}.CENTRO='MF56' THEN "MF06"
              when ${TABLE}.CENTRO='MF57' THEN "MF07"
              when ${TABLE}.CENTRO='MF58' THEN "MF08"
              when ${TABLE}.CENTRO='MF59' THEN "MF09"
              when ${TABLE}.CENTRO='MF60' THEN "MF10" else ${TABLE}.CENTRO  end  ;;
  }



  dimension: planta_Comercializadora {
    type: string
    sql: case when ${planta_manufacturera}="MF01" THEN 'MF51'
              when ${planta_manufacturera}="MF02" THEN 'MF52'
              when ${planta_manufacturera}="MF03" THEN 'MF53'
              when ${planta_manufacturera}="MF04" THEN 'MF54'
              when ${planta_manufacturera}="MF05" THEN 'MF55'
              when ${planta_manufacturera}="MF06" THEN 'MF56'
              when ${planta_manufacturera}="MF07" THEN 'MF57'
              when ${planta_manufacturera}="MF08" THEN 'MF58'
              when ${planta_manufacturera}="MF09" THEN 'MF59'
              when ${planta_manufacturera}="MF10" THEN 'MF60' else ${planta_manufacturera} end  ;;
  }


  dimension_group: fecha_contabilizacion_dlf {
   type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_CONTABILIZACION_DLF ;;
  }

  measure: Total_importe_neto_facturacion {
    label: "Importe de Facturación"
    type: sum
    sql: CAST(${TABLE}.IMPORTE_NETO_FACTURACION AS FLOAT64) ;;
    value_format: "#,##0.00"
  }

  measure: Total_planta_manufacturera {
    label: "Importe Fletes Manufacturera"
    type: sum
    sql: case when ${centro}="MF01" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF02" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF03" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF04" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF05" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF06" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF07" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF08" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF09" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF10" THEN ${TABLE}.IMPORTE_FO else 0 end  ;;
  }

  measure: Total_planta_Comercializadora {
    label: "Importe Fletes Comercializadora"
    type: sum
    sql: case when ${centro}="MF51" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF52" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF53" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF54" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF55" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF56" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF57" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF58" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF59" THEN ${TABLE}.IMPORTE_FO
              when ${centro}="MF60" THEN ${TABLE}.IMPORTE_FO else 0 end  ;;
  }


  measure: Total_flete {
    label: "Importe Flete"
    type: number
    sql: ${Total_planta_Comercializadora}+${Total_planta_manufacturera} ;;
  }

  measure: por_comercializadora {
    label: "% Comercializadora"
    type: number
    sql: ${Total_planta_Comercializadora}/nullif(${Total_flete},0) *100 ;;

    value_format: "0.00\%"

    html:

    {% if value >= 0 and value <= 4.5 %}
    <p><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10>{{ rendered_value }}</p>
    {% elsif value >= 4.6 and value <= 6 %}
    <p><img  src="https://icones.pro/wp-content/uploads/2021/05/symbole-d-avertissement-jaune.png" height=10 width=10>{{ rendered_value }}</p>
    {% else %}
    <p><img  src="https://findicons.com/files/icons/766/base_software/128/circle_red.png" height=10 width=10>{{ rendered_value }}</p>
    {% endif %} ;;
  }

  measure: por_Total {
    label: "% Total"
    type: number
   sql: ${Total_flete}/nullif(${Total_importe_neto_facturacion},0) *100 ;;

    value_format: "0.00\%"
    html:
    {% if value >= 0 and value <= 4.5 %}
    <p><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10>{{ rendered_value }}</p>
    {% elsif value >= 4.6 and value <= 6 %}
    <p><img  src="https://icones.pro/wp-content/uploads/2021/05/symbole-d-avertissement-jaune.png" height=10 width=10>{{ rendered_value }}</p>
    {% else %}
    <p><img  src="https://findicons.com/files/icons/766/base_software/128/circle_red.png" height=10 width=10>{{ rendered_value }}</p>
    {% endif %} ;;
  }

  measure: Cantidad_Ordenes_Flete{
    label: "Cantidad de Ordenes de Flete"
    type: count_distinct
    sql: ${orden_flete} ;;
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
