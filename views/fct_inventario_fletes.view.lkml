view: inventario_fletes {
    derived_table: {
      sql:
      select
      Sociedad,
      Centro_Beneficio,
      Planta,
      Fecha,
      Valor_stock,
      Venta_terceros,
      Real_costo_fletes,
      GastoCuentas5,
      GastoFabricacion,
      Cierre_anio_anterior
      FROM `RPT_S4H_MX.vw_bsc_reporte_inventario_fletes`;;
    }

    #Filtro
    filter: date_filter {
      label: "Fecha"
      description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
      type: date
    }

    #Dimensiones
    dimension: Sociedad {
      type: string
      sql: ${TABLE}.Sociedad ;;
    }
    dimension: CentroBeneficio {
      label: "Centro de Beneficio"
      type: string
      sql: ${TABLE}.Centro_Beneficio ;;
    }

    dimension: Planta {
      type: string
      sql: ${TABLE}.Planta ;;
    }

    dimension: GpoPlantaFletes {
      type: string
      sql: CASE WHEN ${TABLE}.Planta in ('MF01','MF51')
                THEN 'MF01'
                WHEN ${TABLE}.Planta in ('MF02','MF52')
                THEN 'MF02'
                WHEN ${TABLE}.Planta in ('MF03','MF53','MF04','MF54','MF05','MF55','MF07','MF57')
                THEN 'MF03, MF04, MF05, MF07'
                WHEN ${TABLE}.Planta in ('MF10','MF60')
                THEN 'MF10'
                ELSE ${TABLE}.Planta
                END ;;
    }

    dimension: PlantaComercializadora {
      type: string
      sql: ${planta.planta_comercializadora} ;;

      link: {
       label: "Centro benefico"
       url: "https://envases.cloud.looker.com/dashboards/144?&Fecha={{ _filters['inventario_fletes.date_filter'] | url_encode }}&Planta={{ inventario_fletes.PlantaComercializadora._value | url_encode}}"
      }
    }

    dimension: Valor_Stock {
      type: number
      sql: (${TABLE}.Valor_stock + IFNULL(${TABLE}.Cierre_anio_anterior,0)) ;;
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

    dimension: datos_filtro {
      type: string
      sql: DATE_ADD(DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH), INTERVAL -1 YEAR);;
    }

  dimension: datos_filtro2 {
    type: string
    sql: LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
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
        AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL 0 YEAR)) ;;
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
      label: "Valor Stock [MXN]"
      type: sum
      sql: ${Valor_Stock};;

      drill_fields: [ CentroBeneficio,ValorStock]

      value_format: "$#,##0.00"
    }

    measure: ValorStockMesActual{
      group_label: "Inventarios"
      type: sum
      sql: ${Valor_Stock} ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "#,##0"
    }

    measure: ValorStockMesActualAnioAnt{
      group_label: "Inventarios"
      type: sum
      sql: ${Valor_Stock} ;;

      filters: {
        field: mes_actual_anio_ant
        value: "yes"
      }

      value_format: "#,##0"
    }


  measure: ValorStockMesActualAnioAnt2{
    group_label: "Inventarios"
    type: sum
    sql: ${Valor_Stock} ;;

     filters: {
      field: mes_actual_anio_ant
     value: "yes"
    }

    value_format: "#,##0"
  }


    measure: ValorStockMesAnterior{
      group_label: "Inventarios"
      type: sum
      sql: ${Valor_Stock} ;;

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

      html:
        {% if value < 0 %}
        <span style="color: green;">{{ rendered_value }}</span></p>
        {% elsif value >= 0 %}
        <span style="color: red;">{{ rendered_value }}</span></p>
        {% else %}
        {{rendered_value}}
        {% endif %} ;;

      drill_fields: [ CentroBeneficio,VariacionMesPrevio]

      value_format: "0.00\%"
    }

    measure: AcumuladoGasto{
      group_label: "Inventarios"
      type: sum
      sql: (${TABLE}.GastoCuentas5 + ${TABLE}.GastoFabricacion) ;;

      filters: {
        field: ultimos_12_meses
        value: "yes"
      }

      value_format: "#,##0"
    }

    dimension: tiempo12meses {
      hidden: yes
      type: yesno
      sql:DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= '2022-12-21' AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= '2023-12-21'
                  ;;
    }

    measure: DiasInventarioMes{
      group_label: "Inventarios"
      label: "Días de Inventario"
      type: number
      sql: ((${ValorStockMesActual} + ${ValorStockMesActualAnioAnt}) / 2 )
        / (NULLIF(${AcumuladoGasto},0) / 360);;

      drill_fields: [ CentroBeneficio,DiasInventarioMes]

      value_format: "0"
    }

    measure: DiasInventarioTrimestre{
      group_label: "Inventarios"
      type: number
      sql: ((${ValorStockMesActual} + ${ValorStockMesActualAnioAnt}) / 2 )
        / (NULLIF(${AcumuladoGasto},0) / 360);;

      drill_fields: [ CentroBeneficio,DiasInventarioTrimestre]

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

      drill_fields: [ CentroBeneficio,RealCostoFletes]

      value_format: "$#,##0.00"
    }

    measure: VentaTercerosFletes{
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
      sql: ((${RealCostoFletes})/NULLIF(${VentaTercerosFletes},0))*100  ;;

      drill_fields: [ CentroBeneficio,PorcRealFletesVentas]

      value_format: "0.00\%"
    }

    measure: count {
      type: count
    }


  }
