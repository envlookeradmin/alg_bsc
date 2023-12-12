view: inventarios {
    derived_table: {
      sql:
      select
      ANIO_FISCAL,
      SOCIEDAD,
      CENTRO_BENEFICIO,
      PLANTA,
      FECHA,
      VALOR_STOCK,
      VENTA_TERCEROS
      from `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_inventario` ;;
    }

    #Filtro
    filter: date_filter {
      label: "Fecha"
      description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
      type: date
    }

    #Dimensiones
    dimension: AnioFiscal {
      type: string
      sql: ${TABLE}.Anio_Fiscal ;;
    }
    dimension: Sociedad {
      type: string
      sql: ${TABLE}.Sociedad ;;
    }
    dimension: CentroBeneficio {
      type: string
      sql: ${TABLE}.Centro_Beneficio ;;
    }
    dimension: Planta {
      type: string
      sql: ${TABLE}.Planta ;;
    }

    dimension: Fecha{
      type: date
      sql: ${TABLE}.Fecha ;;
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

    dimension: anio_anterior{
      hidden: yes
      type: yesno
      sql: ${fecha_filtro_date} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
        and  ${fecha_filtro_date} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
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

    #Metricas
    measure: ValorStock{
      label: "Valor Stock"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      value_format: "#,##0"
    }

    measure: VentaTerceros12meses{
      type: sum
      sql: ${TABLE}.Venta_terceros ;;

      filters: {
        field: ultimos_12_meses
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesActual{
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesActualAnioAnt{
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_actual_anio_ant
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesAnterior{
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_anterior
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: VariacionMesPrevio {
      label: "Variación % mes previo"
      type: number
      sql: ((${ValorStockMesActual}-${ValorStockMesAnterior})/NULLIF(${ValorStockMesAnterior},0))*100  ;;

      value_format: "0.00\%"
    }

    measure: DiasInventarioMes{
      type: number
      sql: ((${ValorStockMesActual} + ${ValorStockMesActualAnioAnt}) / 2 )
           / (NULLIF(${VentaTerceros12meses},0) / 360);;

      value_format: "0"
    }


    measure: count {
      type: count
    }


  }
