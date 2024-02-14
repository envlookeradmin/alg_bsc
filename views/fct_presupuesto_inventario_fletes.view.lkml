view: presupuesto_inventario_fletes {
  derived_table: {
    sql:
      select
      FECHA,
      PLANTA,
      SUM(CASE
      WHEN CUENTA IN (
        "1106000000",
        "1106000001",
        "1106000003",
        "1106000004",
        "1106000005",
        "1106000006",
        "1106000013",
        "1106000014",
        "1106010000",
        "1106010001",
        "1106010002",
        "1106010004",
        "1106020003",
        "1106020004"
        )
      THEN VALOR ELSE 0 END ) AS Valor_Stock,

      SUM( CASE WHEN CUENTA IN (
        "5000000044",
        "5000000045",
        "5000000047" )
      THEN VALOR ELSE 0 END ) AS Fletes,

      SUM( CASE WHEN CAST(CUENTA AS INT64) IN (
      5000000000,
      5000000002,
      5000000005,
      5000000006,
      5000000008,
      5000000009,
      5000000010,
      5000000011,
      5000000013,
      5000000014,
      5000000016,
      5000000017,
      5000000018,
      5000000021,
      5000000023,
      5000000025,
      5000000028,
      5000000030,
      5000000031,
      5000000032,
      5000000034,
      5000000038,
      5000000039,
      5000000043,
      5000000044,
      5000000045,
      5000000047,
      5000000048,
      5000000051
      )
      THEN VALOR ELSE 0 END ) AS GastoCuentas5,

      SUM( CASE WHEN CAST(CUENTA AS INT64) IN (
      6000010000,
      6000010003,
      6000010004,
      6000010005,
      6000010007,
      6000010011,
      6000010023,
      6000010024,
      6000010025,
      6000010026,
      6000010027,
      6000010029,
      6000010032,
      6000010040,
      6000010041,
      6000010044,
      6000010046,
      6000010048,
      6000010049,
      6000010050,
      6000010051,
      6000010057,
      6000010064,
      6000010065,
      6000010066,
      6000010074,
      6000020004,
      6000020011,
      6000020012,
      6000020014,
      6000020015,
      6000020018,
      6000020019,
      6000020020,
      6000020021,
      6000030000,
      6000030005,
      6000030006,
      6000030007,
      6000030008,
      6000030009,
      6000030010,
      6000030011,
      6000030013,
      6000030014,
      6000031001,
      6000031002,
      6000031003,
      6000031004,
      6000040000,
      6000040001,
      6000040002,
      6000040003,
      6000040004,
      6000060000,
      6000060001,
      6000060003,
      6000060004,
      6000060005,
      6000060006,
      6000060007,
      6000060008,
      6000060009,
      6000060010,
      6000080000,
      6000080002,
      6000090000,
      6000090002,
      6000090003,
      6000090004,
      6000090006,
      6000090007,
      6000090009,
      6000090010,
      6000110001,
      6000110002,
      6000110005,
      6000110010,
      6000120001,
      6000120006,
      6000120008,
      6000130000,
      6000130001,
      6000130002,
      6000130004,
      6000130006,
      6000130007,
      6000140000,
      6000140002,
      6000140003,
      6000140004,
      6000140005,
      6000140006,
      6000140008,
      6000140010,
      6000140011,
      6000140012,
      6000150000,
      6000150002,
      6000150003,
      6000150012,
      6000170000,
      6000170003,
      6000170010,
      6000170011,
      6000170012,
      6000170013,
      6000170014,
      6000170017,
      6000170018,
      6000180005
      )

      THEN VALOR ELSE 0 END ) AS GastoFabricacion,

    SUM( CASE WHEN SAFE_CAST(CAST(CUENTA AS INT64) AS STRING) LIKE "4201%" OR SAFE_CAST(CAST(CUENTA AS INT64) AS STRING) LIKE "4301%"
          THEN VALOR ELSE 0 END ) +

    SUM( CASE WHEN CAST(CUENTA AS INT64) IN (4101010004,4101010001)
          THEN VALOR ELSE 0 END ) AS ReclasificacionIngresoCosto,

    SUM( CASE WHEN (CUENTA  LIKE "410101%" OR CUENTA LIKE "410102%") AND (CUENTA NOT IN ("4101010004","4101010001"))
          THEN VALOR ELSE 0 END ) AS CuentaTerceros

    FROM `@GCP_PROJECT.@REPORTING_DATASET5.tbl_mx_presupuesto_nivel_cuenta`
    GROUP BY 1,2
      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    type: date
  }

  #Dimensiones

  dimension: Fecha{
    type: date
    sql: ${TABLE}.FECHA ;;
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

  dimension: Planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
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

    link: {
      label: "Planta"
      url: "https://envases.cloud.looker.com/dashboards/162?&Fecha={{ _filters['inventario_fletes.date_filter'] | url_encode }}&Centro={{ inventario_fletes.Centro._value | url_encode}}"
    }

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

  dimension: Gasto_Acumulado {
    type: number
    sql:  ${TABLE}.GastoCuentas5 + ${TABLE}.GastoFabricacion + ReclasificacionIngresoCosto ;;
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

  #Metricas Mensuales Inventarios

  measure: ValorStockMesActual{
    group_label: "Inventarios Presupuesto"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${Valor_Stock}
           END ;;

    value_format: "#,##0"
  }

  measure: ValorStockMesActualAnioAnt{
    group_label: "Inventarios Presupuesto"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH), INTERVAL -1 YEAR)
           AND ${Fecha} <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL 0 YEAR))
           THEN ${Valor_Stock}
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
    sql: ${Valor_Stock} ;;
  }

  measure: gasto_acum_trimestre {
    group_label: "Inventarios"
    type: sum
    sql: ${Gasto_Acumulado} ;;
  }

  measure: DiasInventarioTrimestre{
    group_label: "Inventarios"
    type: number
    sql: ((${valor_stock_trimestre} + ${valor_stock_aa_trimestre}) / 2 ) / (NULLIF(${gasto_acum_trimestre},0) / 360)
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

    value_format: "0.00\%"
  }


  measure: count {
    type: count
  }


}
