
view: fct_logistica_transporte {
  derived_table: {
    sql: WITH FLETES AS (
  SELECT
    CAST(ID_FLETE AS STRING) AS ID_FLETE,
    ARRAY_AGG(
      STRUCT (
        ORDEN_FLETE,
        CLASE_ORDEN_FLETE,
        FECHA_CREACION_FO,
        FECHA_CONTABILIZACION_DLF,
        DOCUMENTO_LIQUIDACION,
        IMPORTE_FO,
        MONEDA_FO,
        ORGANIZACION_COMPRA,
        CLIENTE_DESTINATARIO,
        NUMERO_TRANSPORTISTA,
        ID_TRANSPORTISTA,
        ESTADO_FACTURACION,
        ID_FLETE,
        LIFECYCLE,
        BUSINESSPARTNERROLE,
        NET_AMOUNT,
        TRANSPORTATIONORDERUUID
      )

    ) AS FLETES_DETAILS -- Nesting Fletes
  FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_logistica_fletes`
  WHERE LIFECYCLE IN ('04', '07')
    AND BUSINESSPARTNERROLE = 'U3'
    AND NET_AMOUNT > 0
    AND ORGANIZACION_COMPRA IN ('MX01', 'MX06')
  GROUP BY ID_FLETE
),
FACTURAS AS (
  SELECT
    CAST(ID_FLETE AS STRING) AS ID_FLETE,
    NUMERO_FACTURA,
    COUNT(NUMERO_FACTURA) OVER (PARTITION BY ID_FLETE) AS CONTEO,
    FECHA_FACTURACION,
    PLANTA,
    REGLA,
    VARIANTES,
    ID_CLIENTE_DESTINATARIO,
    CANAL_DISTRIBUCION,
    IMPORTE_NETO_FACTURACION,
    TOTAL_NETO_FACTURACION,
    TOTAL_PORCENTAJE
  FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_logistica_facturacion`
  --WHERE DATE_TRUNC(FECHA_FACTURACION, YEAR) = '2024-01-01'
)
SELECT
  FACTURAS.ID_FLETE,
  FACTURAS.NUMERO_FACTURA,
  FACTURAS.CONTEO,
  FECHA_FACTURACION,
  PLANTA CENTRO ,
  REGLA,
  VARIANTES,
  ID_CLIENTE_DESTINATARIO,
  CANAL_DISTRIBUCION,
  FACTURAS.IMPORTE_NETO_FACTURACION,
  FACTURAS.TOTAL_NETO_FACTURACION,
  FACTURAS.TOTAL_PORCENTAJE,
  IFNULL(FLETES.FLETES_DETAILS, []) AS FLETES_NESTED,
    FLETES.FLETES_DETAILS[0].ORDEN_FLETE,
  FLETES.FLETES_DETAILS[0].NUMERO_TRANSPORTISTA,
  FLETES.FLETES_DETAILS[0].CLIENTE_DESTINATARIO,
  FLETES.FLETES_DETAILS[0].IMPORTE_FO as IMPORTE_FO,
  FLETES.FLETES_DETAILS[0].FECHA_CONTABILIZACION_DLF as FECHA_CONTABILIZACION_DLF,
FROM FACTURAS
LEFT JOIN FLETES
  ON FACTURAS.ID_FLETE = FLETES.ID_FLETE
--where FACTURAS.ID_FLETE like "%81063846%"
ORDER BY ARRAY_LENGTH(FLETES.FLETES_DETAILS) DESC;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: numero_transportista {
    type: string
    sql: ${TABLE}.NUMERO_TRANSPORTISTA ;;
  }


  dimension: cliente_destinatario {
    type: string
    sql: ${TABLE}.CLIENTE_DESTINATARIO ;;
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

  dimension_group: fecha_facturacion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_FACTURACION ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }




  measure: Total_importe_neto_facturacion {
    label: "Importe de Facturación"
    type: sum
    sql: CAST(${TABLE}.IMPORTE_NETO_FACTURACION AS FLOAT64) ;;
    value_format: "$#,##0.00"
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

    value_format: "$#,##0.00"
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

    value_format: "$#,##0.00"
  }


  measure: Total_flete {
    label: "Importe Flete"
    type: number
    sql: ${Total_planta_Comercializadora}+${Total_planta_manufacturera} ;;

    value_format: "$#,##0.00"
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


  dimension: orden_flete {
    type: string
    sql: ${TABLE}.ORDEN_FLETE ;;
  }
















  dimension: id_flete {
    type: string
    sql: ${TABLE}.ID_FLETE ;;
  }

  dimension: numero_factura {
    type: string
    sql: ${TABLE}.NUMERO_FACTURA ;;
  }

  dimension: conteo {
    type: number
    sql: ${TABLE}.CONTEO ;;
  }

  dimension: fecha_facturacion {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_FACTURACION ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: regla {
    type: string
    sql: ${TABLE}.REGLA ;;
  }

  dimension: variantes {
    type: string
    sql: ${TABLE}.VARIANTES ;;
  }

  dimension: id_cliente_destinatario {
    type: string
    sql: ${TABLE}.ID_CLIENTE_DESTINATARIO ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  dimension: importe_neto_facturacion {
    type: number
    sql: ${TABLE}.IMPORTE_NETO_FACTURACION ;;
  }

  dimension: total_neto_facturacion {
    type: number
    sql: ${TABLE}.TOTAL_NETO_FACTURACION ;;
  }

  dimension: total_porcentaje {
    type: number
    sql: ${TABLE}.TOTAL_PORCENTAJE ;;
  }

  dimension: fletes_nested {
    type: string
    sql: ${TABLE}.FLETES_NESTED ;;
  }

  set: detail {
    fields: [
      id_flete,
      numero_factura,
      conteo,
      fecha_facturacion,
      planta,
      regla,
      variantes,
      id_cliente_destinatario,
      canal_distribucion,
      importe_neto_facturacion,
      total_neto_facturacion,
      total_porcentaje,
      fletes_nested
    ]
  }
}
