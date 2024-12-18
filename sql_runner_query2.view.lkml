
view: sql_runner_query2 {
  derived_table: {
    sql: WITH FLETES AS (
        SELECT
          CAST(ID_FLETE AS STRING) AS ID_FLETE,
          ARRAY_AGG(DISTINCT ORDEN_FLETE) AS FLETES_DETAILS -- Nesting Fletes
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
        PLANTA,
        REGLA,
        VARIANTES,
        ID_CLIENTE_DESTINATARIO,
        CANAL_DISTRIBUCION,
        FACTURAS.IMPORTE_NETO_FACTURACION,
        FACTURAS.TOTAL_NETO_FACTURACION,
        FACTURAS.TOTAL_PORCENTAJE,
        IFNULL(FLETES.FLETES_DETAILS, []) AS FLETES_NESTED -- Nested array of fletes
      FROM FACTURAS
      LEFT JOIN FLETES
        ON FACTURAS.ID_FLETE = FLETES.ID_FLETE
      -- where FACTURAS.ID_FLETE like "%81063846%"
      ORDER BY ARRAY_LENGTH(FLETES.FLETES_DETAILS) DESC limit 1000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
