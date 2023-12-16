view: inventario_fletes {
    derived_table: {
      sql:
      select
      Anio_Fiscal,
      Sociedad,
      Centro_Beneficio,
      Planta,
      Fecha,
      Valor_stock,
      Venta_terceros,
      Real_costo_fletes
      from `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_reporte_inventario_fletes`;;
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

    dimension: anio_actual{
      type: number
      sql: CASE
              WHEN DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
                AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE) THEN 1
                ELSE 0
                END;;
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

    #Metricas Inventarios

    measure: ValorStock{
      group_label: "Inventarios"
      label: "Valor Stock"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      value_format: "$#,##0.00"
    }

    measure: VentaTerceros12meses{
      group_label: "Inventarios"
      type: sum
      sql: ${TABLE}.Venta_terceros ;;

      filters: {
        field: ultimos_12_meses
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesActual{
      group_label: "Inventarios"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesActualAnioAnt{
      group_label: "Inventarios"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_actual_anio_ant
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesAnterior{
      group_label: "Inventarios"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      filters: {
        field: mes_anterior
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: VariacionMesPrevio {
      group_label: "Inventarios"
      label: "Variación % mes previo"
      type: number
      sql: ((${ValorStockMesActual}-${ValorStockMesAnterior})/NULLIF(${ValorStockMesAnterior},0))*100  ;;

      value_format: "0.00\%"
    }

    measure: DiasInventarioMes{
      group_label: "Inventarios"
      label: "Días de Inventario"
      type: number
      sql: ((${ValorStockMesActual} + ${ValorStockMesActualAnioAnt}) / 2 )
        / (NULLIF(${VentaTerceros12meses},0) / 360);;

      value_format: "0"
    }

    #Metricas Fletes

    measure: RealCostoFletes{
      group_label: "Fletes"
      label: "Real Costo de Fletes [MXN]"
      type: sum
      sql: ${TABLE}.Real_costo_fletes ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "$#,##0.00"
    }

    measure: VentaTerceros{
      group_label: "Fletes"
      type: sum
      sql: ${TABLE}.Venta_terceros ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: PorcRealFletesVentas {
      group_label: "Fletes"
      label: "Real % Fletes / Ventas"
      type: number
      sql: ((${RealCostoFletes})/NULLIF(${VentaTerceros},0))*100  ;;

      value_format: "0.00\%"
    }

    measure: count {
      type: count
    }


  }
