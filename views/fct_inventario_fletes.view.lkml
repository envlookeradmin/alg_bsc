view: inventario_fletes {
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
      from `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_inventario` ;;
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


    dimension: mes_actual{
      hidden: yes
      type: yesno
      sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
        AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
    }

    dimension: mes_anterior{
      hidden: yes
      type: yesno
      sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
        AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
    }

    #Metricas
    measure: RealCostoFletes{
      label: "Real Costo de Fletes [MXN]"
      type: sum
      sql: ${TABLE}.Valor_stock ;;

      value_format: "#,##0"
    }

    measure: VentaTerceros{
      type: sum
      sql: ${TABLE}.Venta_terceros ;;

      value_format: "#,##0"
    }

    measure: VariacionMesPrevio {
      label: "Real % Fletes / Ventas"
      type: number
      sql: ((${RealCostoFletes})/NULLIF(${VentaTerceros},0))*100  ;;

      value_format: "0.00\%"
    }

    measure: count {
      type: count
    }


  }
