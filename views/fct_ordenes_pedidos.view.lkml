view: ordenes_pedidos {
  derived_table: {
    sql:
      SELECT
      DOCUMENTO_VENTA,
      SOLICITANTE,
      CANAL_DISTRIBUCION,
      ORGANIZACION_VENTAS,
      FECHA_ENTREGA_PLANEADA,
      FECHA_ENTREGA_REAL,
      PLANTA,
      ID_MATERIAL,
      PESO_NETO,
      UNIDAD_PESO_MATERIAL,
      ID_GRUPO_MATERIAL,
      CANTIDAD_PEDIDA,
      CANTIDAD_ENTREGADA,
      CANTIDAD_PENDIENTE,
      FILL_RATE,
      ESTATUS_ENTREGA
      FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_ordenes_pedidos`;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  #Dimensiones
  dimension: DocumentoVenta {
    type: string
    sql: ${TABLE}.DOCUMENTO_VENTA;;
  }
  dimension: Solicitante {
    type: string
    sql: ${TABLE}.SOLICITANTE ;;
  }
  dimension: CanalDistribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }
  dimension: OrganizacionVentas {
    type: string
    sql: ${TABLE}.ORGANIZACION_VENTAS ;;
  }
  dimension: FechaEntregaPlaneada {
    type: date
    sql: ${TABLE}.FECHA_ENTREGA_PLANEADA ;;
  }
  dimension: FechaEntregaReal {
    type: date
    sql: ${TABLE}.FECHA_ENTREGA_REAL ;;
  }
  dimension: Planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }
  dimension: IdMaterial {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }
  dimension: UnidadPesoMaterial {
    type: string
    sql: ${TABLE}.UNIDAD_PESO_MATERIAL ;;
  }
  dimension: IdGrupoMaterial {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }
  dimension: EstatusEntrega {
    type: string
    sql: ${TABLE}.ESTATUS_ENTREGA ;;
  }


  dimension: Peso_Neto {
    type: number
    sql: ${TABLE}.PESO_NETO ;;
  }
  dimension: Cantidad_Pedida {
    type: number
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }
  dimension: Cantidad_Entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }
  dimension: Cantidad_Pendiente {
    type: number
    sql: ${TABLE}.CANTIDAD_PENDIENTE ;;
  }
  dimension: Fill_Rate {
    type: number
    sql: ${TABLE}.FILL_RATE ;;
  }

  dimension: Fecha{
    type: date
    sql: ${TABLE}.FECHA_ENTREGA_REAL ;;
  }

  dimension_group: fecha_filtro {
    label: "Date"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${Fecha}  AS TIMESTAMP) ;;
  }

  dimension: anio_actual{
    #hidden: yes
    #type: yesno
    type: number
    sql:

      /*DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
           AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)*/

      CASE
      WHEN DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE) THEN 1
      ELSE 0
      END
      ;;
  }
  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }
  dimension: mes_actual_anio_ant{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH), INTERVAL -1 YEAR)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 YEAR)) ;;
  }
  dimension: mes_anterior{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }
  dimension: ultimos_12_meses{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -12 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(CAST({% date_start date_filter %} AS DATE));;
  }
  dimension: ultimos_3_meses{
    type: number
    sql:
        CASE
            WHEN DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
            AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL 0 DAY) THEN 1
            ELSE 0
            END;;
  }


  measure: PesoNeto{
    type: sum
    sql: ${Peso_Neto};;

    #drill_fields: [ CentroBeneficio,ValorStock]

    value_format: "#,##0"
  }
  measure: CantidadPedida{
    type: sum
    sql: ${Cantidad_Pedida};;

    #drill_fields: [ CentroBeneficio,ValorStock]

    value_format: "#,##0"
  }
  measure: CantidadEntregada{
    type: sum
    sql: ${Cantidad_Entregada};;

    #drill_fields: [ CentroBeneficio,ValorStock]

    value_format: "#,##0"
  }
  measure: CantidadPendiente{
    type: sum
    sql: ${Cantidad_Pendiente};;

    #drill_fields: [ CentroBeneficio,ValorStock]

    value_format: "#,##0"
  }
  measure: FillRate{
    type: sum
    sql: ${Fill_Rate};;

    #drill_fields: [ CentroBeneficio,ValorStock]

    value_format: "#,##0"
  }

  measure: count {
    type: count
  }


}
