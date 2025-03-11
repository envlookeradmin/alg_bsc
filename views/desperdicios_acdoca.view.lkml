include: "dim_parametros.view"
view: desperdicios_acdoca {
  derived_table: {
    sql:
      SELECT
        *
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.tbl_fact_desperdicios_cuentas_contables`
      WHERE FECHA_DOCUMENTO BETWEEN
        DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), YEAR)
        AND DATE_SUB(CAST({% date_end date_filter %} AS DATE), INTERVAL 1 DAY)
    ;;
  }
  extends: [dim_parametros] #INCLUYE EL FILTRO DE FECHA
  measure: total_importe {
    type: sum
    sql: ${importe} ;;
    value_format: "$#,##0"
  }
  measure: total_importe_mes {
    type: sum
    sql: ${importe} ;;
    value_format: "$#,##0"
    filters: [es_mes_seleccionado: "yes"]
  }
}
