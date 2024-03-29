view: inventario_fletes {
    derived_table: {
      sql:
      select
      Fecha,
      Sociedad,
      Planta,
      Centro_Beneficio,
      Valor_stock_acum,
      Valor_stock_c,
      Valor_stock,
      Valor_stock_aa,
      Venta_terceros,
      Real_costo_fletes,
      GastoCuentas5,
      GastoFabricacion,
      ReclasificacionIngresoCosto,
      GastoCuentas5_12,
      GastoFabricacion_12,
      ReclasificacionIngresoCosto_12
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET3}.tbl_fact_reporte_inventario_fletes`
      where Planta in ('MF01','MF51','MF08','MF58','MF09','MF59','MF02','MF52', 'MF03','MF53','MF04','MF54','MF05','MF55','MF06','MF56','MF07','MF57', 'MF10','MF60', 'GF01')
      ;;
    }

    #Filtro
    filter: date_filter {
      label: "Fecha"
      description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
      type: date
    }

    #Dimensiones

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
      sql: ${Fecha} ;;
    }

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
      label: "Id planta"
      type: string
      sql: ${TABLE}.Planta ;;
    }

    dimension: Centro {
      type: string
      sql: CASE WHEN ${TABLE}.Planta in ('MF01','MF51','MF08','MF58','MF09','MF59')
                THEN 'MF01'
                WHEN ${TABLE}.Planta in ('MF02','MF52')
                THEN 'MF02'
                WHEN ${TABLE}.Planta in ('MF03','MF53','MF04','MF54','MF05','MF55','MF06','MF56','MF07','MF57')
                THEN 'MF03 - MF04 - MF05 - MF07'
                WHEN ${TABLE}.Planta in ('MF10','MF60')
                THEN 'MF10'
                ELSE ${TABLE}.Planta
                END ;;

      #link: {
      #  label: "Planta"
      #  url: "https://envases.cloud.looker.com/dashboards/162?&Fecha={{ _filters['inventario_fletes.date_filter'] | url_encode }}&Centro={{ inventario_fletes.Centro._value | url_encode}}"
      #}

    }

    dimension: PlantaFletes {
      label: "Planta"
      type: string
      sql: ${planta.planta_comercializadora} ;;
    }

    dimension: orden_planta_comercializadora {
      type: number
      sql: CASE
            WHEN ${planta.planta_comercializadora} = 'ALG-Cuautitlán - México' THEN 1
            WHEN ${planta.planta_comercializadora} = 'ALG-CDI Guadalajara - Mexico' THEN 2
            WHEN ${planta.planta_comercializadora} = 'ALG-CDI Monterrey - Mexico' THEN 3
            WHEN ${planta.planta_comercializadora} = 'ALG-Partidor - Mexico' THEN 4
            WHEN ${planta.planta_comercializadora} = 'ALG-Mazatlan I - Mexico' THEN 5
            WHEN ${planta.planta_comercializadora} = 'ALG-Guaymas - Mexico' THEN 6
            WHEN ${planta.planta_comercializadora} = 'ALG-Mazatlan II - Mexico' THEN 7
            WHEN ${planta.planta_comercializadora} = 'ALG-CDI Constitucion - Mexico' THEN 8
            WHEN ${planta.planta_comercializadora} = 'ALG-Tijuana - Mexico' THEN 9
            WHEN ${planta.planta_comercializadora} = 'ALG-Monterrey  - Mexico' THEN 10
            WHEN ${planta.planta_comercializadora} = 'ALG-San Lucas - Guatemala' THEN 11
           END;;
    }

    dimension: PlantaComercializadora {
      type: string
      sql: ${planta.planta_comercializadora} ;;

      #link: {
       #label: "Centro benefico"
       #url: "https://envases.cloud.looker.com/dashboards/144?&Fecha={{ _filters['inventario_fletes.date_filter'] | url_encode }}&Planta={{ inventario_fletes.PlantaComercializadora._value | url_encode}}"
      #}

      order_by_field: orden_planta_comercializadora
    }

    dimension: orden_grupo_planta_inv {
      type: number
      sql: CASE
              WHEN ${TABLE}.Planta in ('MF01','MF51', 'MF08','MF58', 'MF09', 'MF59')
              THEN 1
              WHEN ${TABLE}.Planta in ('MF02','MF52')
              THEN 2
              WHEN ${TABLE}.Planta in ('MF03','MF53','MF04','MF54','MF05','MF55','MF06','MF56','MF07','MF57')
              THEN 3
              WHEN ${TABLE}.Planta in ('MF10','MF60')
              THEN 4
              ELSE 5
            END ;;
    }

    dimension: grupo_planta_inv {
      label: "Gpo."
      type: string
      sql: CASE
            WHEN ${TABLE}.Planta in ('MF01','MF51', 'MF08','MF58', 'MF09', 'MF59')
            THEN 'MF01'
            WHEN ${TABLE}.Planta in ('MF02','MF52')
            THEN 'MF02'
            WHEN ${TABLE}.Planta in ('MF03','MF53','MF04','MF54','MF05','MF55','MF06','MF56','MF07','MF57')
            THEN 'MF03'
            WHEN ${TABLE}.Planta in ('MF10','MF60')
            THEN 'MF10'
            ELSE ${TABLE}.Planta
          END ;;

      order_by_field: orden_grupo_planta_inv
    }



    dimension: vacio {
    type: string
    label: "_"
    sql: '_' ;;
    }

    dimension: Valor_Stock {
      type: number
      sql: ${TABLE}.Valor_stock  ;;
    }

    dimension: Valor_Stock_AA {
      type: number
      sql: ${TABLE}.Valor_stock_aa  ;;
    }

    dimension: Gasto_Acumulado {
      type: number
      sql:  ${TABLE}.GastoCuentas5_12 + ${TABLE}.GastoFabricacion_12 + ${TABLE}.ReclasificacionIngresoCosto_12 ;;
    }

    dimension: anio_actual{
      type: number
      sql: CASE
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

    #Metricas Mensuales Inventarios

    measure: ValorStock{
      group_label: "Inventarios"
      label: "Valor Stock [MXN]"
      type: sum
      sql: ${Valor_Stock}
      ;;

      drill_fields: [CentroBeneficio, ValorStock]

      value_format: "$#,##0.00"
    }

    measure: ValorStockMesActual{
      group_label: "Inventarios"
      type: sum
      sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${Valor_Stock}
           END ;;

      value_format: "#,##0"
    }

    measure: ValorStockMesActualAnioAnt{
      group_label: "Inventarios"
      type: sum
      sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${Valor_Stock_AA}
           END ;;

      value_format: "#,##0"
    }


    measure: ValorStockMesAnterior{
      group_label: "Inventarios"
      type: sum
      sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
           AND ${Fecha}  <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH))
           THEN ${Valor_Stock}
           END;;

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

    measure: gasto_acum{
      group_label: "Inventarios"
      type: sum
      sql: ${Gasto_Acumulado} ;;

      value_format: "#,##0"
    }

    measure: gasto_acum_mes_act{
      group_label: "Inventarios"
      type: sum
      sql: CASE
             WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
             AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
             THEN ${Gasto_Acumulado}
             END ;;

      value_format: "#,##0"
    }

    #Calculo dias inventario mes

    measure: DiasInventarioMes{
      group_label: "Inventarios"
      type: number
      sql: ((${ValorStockMesActual} + ${ValorStockMesActualAnioAnt}) / 2 )
        / (NULLIF(${gasto_acum_mes_act},0) / 360);;

      value_format: "0.00"
    }


    #Calculos dias inventario trimestre

    measure: valor_stock_trimestre {
      group_label: "Inventarios"
      type: sum
      sql: ${Valor_Stock} ;;
    }

    measure: valor_stock_aa_trimestre {
      group_label: "Inventarios"
      type: sum
      sql: ${Valor_Stock_AA} ;;
    }

    measure: gasto_acum_trimestre {
      group_label: "Inventarios"
      type: sum
      sql: ${Gasto_Acumulado} ;;
    }

    measure: DiasInventarioTrimestre{
      group_label: "Inventarios"
      type: number
      sql: /*CASE
           WHEN ${fecha.mes} in (3,6,9,12)
           THEN */
          ((${valor_stock_trimestre} + ${valor_stock_aa_trimestre}) / 2 ) / (NULLIF(${gasto_acum_trimestre},0) / 360)
          -- END
          ;;

      value_format: "0.00"
    }



    #Metricas Fletes Mesuales
    measure: RealCostoFletesMTD{
      group_label: "Fletes"
      label: "Real Costo de Fletes MTD [MXN]"
      type: sum
      sql: CASE
            WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
            AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
            THEN ${TABLE}.Real_costo_fletes
            ELSE 0
           END;;

      #drill_fields: [PlantaFletes, RealCostoFletesMTD]

      value_format: "$#,##0.00"
    }

    measure: VentaTercerosFletesMTD{
      group_label: "Fletes"
      type: sum
      sql: CASE
            WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
            AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
            THEN (${TABLE}.Venta_terceros * -1)
            ELSE 0
           END;;

      value_format: "#,##0"
    }

    measure: PorcRealFletesVentasMTD{
      group_label: "Fletes"
      label: "Real % Fletes / Ventas MTD"
      type: number
      sql: ((${RealCostoFletesMTD})/NULLIF(${VentaTercerosFletesMTD},0))*100  ;;

      #drill_fields: [PlantaFletes, PorcRealFletesVentasMTD]

      value_format: "0.00\%"
    }

    #Metricas Fletes Anuales
    measure: RealCostoFletesYTD{
      group_label: "Fletes"
      label: "Real Costo de Fletes YTD [MXN]"
      type: sum
      sql: CASE
            WHEN ${Fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
            AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
            THEN ${TABLE}.Real_costo_fletes
            ELSE 0
           END  ;;

      #drill_fields: [PlantaFletes, RealCostoFletesYTD]

      value_format: "$#,##0.00"
    }

    measure: VentaTercerosFletesYTD{
      group_label: "Fletes"
      type: sum
      sql: CASE
            WHEN ${Fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
            AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
            THEN (${TABLE}.Venta_terceros * -1)
            ELSE 0
           END;;

      value_format: "#,##0"
    }

    measure: PorcRealFletesVentasYTD{
      group_label: "Fletes"
      label: "Real % Fletes / Ventas YTD"
      type: number
      sql: ((${RealCostoFletesYTD})/NULLIF(${VentaTercerosFletesYTD},0))*100  ;;

      #drill_fields: [PlantaFletes, PorcRealFletesVentasYTD]

      value_format: "0.00\%"
    }


    measure: count {
      type: count
    }


  }
