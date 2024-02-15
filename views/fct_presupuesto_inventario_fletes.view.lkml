view: presupuesto_inventario_fletes {
  derived_table: {
    sql:
      select
      inv_fle.Fecha,
      inv_fle.Planta,
      inv_fle.Valor_stock,
      inv_fle.Valor_stock_aa,
      inv_fle.Venta_terceros,
      inv_fle.Real_costo_fletes,
      inv_fle.GastoCuentas5,
      inv_fle.GastoFabricacion,
      inv_fle.ReclasificacionIngresoCosto,
      inv_fle.GastoCuentas5_12,
      inv_fle.GastoFabricacion_12,
      inv_fle.ReclasificacionIngresoCosto_12,
      pre_inv_fle.Pre_Valor_Stock,
      pre_inv_fle.Pre_Fletes,
      pre_inv_fle.Pre_GastoCuentas5,
      pre_inv_fle.Pre_GastoFabricacion,
      pre_inv_fle.Pre_ReclasificacionIngresoCosto,
      pre_inv_fle.Pre_Venta_terceros
      from
      (
      select
      Fecha,
      Planta,
      SUM(Valor_stock) AS Valor_stock,
      SUM(Valor_stock_aa) AS Valor_stock_aa,
      SUM(Venta_terceros) AS Venta_terceros,
      SUM(Real_costo_fletes) AS Real_costo_fletes,
      SUM(GastoCuentas5) AS GastoCuentas5,
      SUM(GastoFabricacion) AS GastoFabricacion,
      SUM(ReclasificacionIngresoCosto) AS ReclasificacionIngresoCosto,
      SUM(GastoCuentas5_12) AS GastoCuentas5_12,
      SUM(GastoFabricacion_12) AS GastoFabricacion_12,
      SUM(ReclasificacionIngresoCosto_12) AS ReclasificacionIngresoCosto_12
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_reporte_inventario_fletes`
      where Planta in ('MF01','MF51','MF08','MF58','MF09','MF59','MF02','MF52', 'MF03','MF53','MF04','MF54','MF05','MF55','MF06','MF56','MF07','MF57', 'MF10','MF60', 'GF01')
      GROUP BY 1,2
      ) inv_fle left join
      (
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
      THEN VALOR ELSE 0 END ) AS Pre_Valor_Stock,

      SUM( CASE WHEN CUENTA IN (
      "5000000044",
      "5000000045",
      "5000000047" )
      THEN VALOR ELSE 0 END ) AS Pre_Fletes,

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
      THEN VALOR ELSE 0 END ) AS Pre_GastoCuentas5,

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

      THEN VALOR ELSE 0 END ) AS Pre_GastoFabricacion,

      SUM( CASE WHEN SAFE_CAST(CAST(CUENTA AS INT64) AS STRING) LIKE "4201%" OR SAFE_CAST(CAST(CUENTA AS INT64) AS STRING) LIKE "4301%"
      THEN VALOR ELSE 0 END ) +

      SUM( CASE WHEN CAST(CUENTA AS INT64) IN (4101010004,4101010001)
      THEN VALOR ELSE 0 END ) AS Pre_ReclasificacionIngresoCosto,

      SUM( CASE WHEN (CUENTA  LIKE "410101%" OR CUENTA LIKE "410102%") AND (CUENTA NOT IN ("4101010004","4101010001"))
      THEN VALOR ELSE 0 END ) AS Pre_Venta_terceros

      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET5}.tbl_mx_presupuesto_nivel_cuenta`
      GROUP BY 1,2
      ) pre_inv_fle on inv_fle.fecha = pre_inv_fle.fecha and inv_fle.planta = pre_inv_fle.planta
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

  dimension: valor_stock {
    type: number
    sql: ${TABLE}.Valor_stock  ;;
  }

  dimension: valor_stock_aa {
    type: number
    sql: ${TABLE}.Valor_stock_aa  ;;
  }

  dimension: pre_valor_stock {
    type: number
    sql: ${TABLE}.Pre_Valor_Stock  ;;
  }

  dimension: gasto_acumulado {
    type: number
    sql:  ${TABLE}.GastoCuentas5 + ${TABLE}.GastoFabricacion + ${TABLE}.ReclasificacionIngresoCosto ;;
  }

  dimension: gasto_acumulado_12 {
    type: number
    sql:  ${TABLE}.GastoCuentas5_12 + ${TABLE}.GastoFabricacion_12 + ${TABLE}.ReclasificacionIngresoCosto_12 ;;
  }

  dimension: pre_gasto_acumulado {
    type: number
    sql:  ${TABLE}.Pre_GastoCuentas5 + ${TABLE}.Pre_GastoFabricacion + ${TABLE}.Pre_ReclasificacionIngresoCosto ;;
  }

  #Metricas Mensuales Reales Inventarios

  measure: valor_stock_mes_act{
    group_label: "Real Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
           THEN ${valor_stock}
           END ;;

    value_format: "#,##0"
  }

  measure: valor_stock_mes_act_aa{
    group_label: "Real Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
           THEN ${valor_stock_aa}
           END ;;

    value_format: "#,##0"
  }

  measure: gasto_acum_mes_act{
    group_label: "Real Inventarios"
    type: sum
    sql: CASE
             WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
             AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
             THEN ${gasto_acumulado_12}
             END ;;

    value_format: "#,##0"
  }

  measure: dias_inventario_mes{
    group_label: "Real Inventarios"
    label: "Dias de Inventario"
    type: number
    sql: ((${valor_stock_mes_act} + ${valor_stock_mes_act_aa}) / 2 )
      / (NULLIF(${gasto_acum_mes_act},0) / 360);;

    value_format: "0.00"
  }


  #Metricas Mensuales Presupuesto Inventarios

  measure: pre_valor_stock_ma{
    group_label: "Presupuesto Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
           THEN ${pre_valor_stock}
         END ;;

    value_format: "#,##0"
  }

  measure: valor_stock_ma_aa{
    group_label: "Presupuesto Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
           THEN ${valor_stock_aa}
         END ;;

    value_format: "#,##0"
  }

  measure: gasto_acum_11_meses{
    group_label: "Presupuesto Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -12 MONTH)
           AND ${Fecha} <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH))
           THEN ${gasto_acumulado}
         END ;;

    value_format: "#,##0"
  }

  measure: pre_gasto_acum_ma{
    group_label: "Presupuesto Inventarios"
    type: sum
    sql: CASE
           WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
           THEN ${pre_gasto_acumulado}
         END ;;

    value_format: "#,##0"
  }

  measure: pre_dias_inventario_mes{
    group_label: "Presupuesto Inventarios"
    label: "Presupuesto Dias de Inventario"
    type: number
    sql: ((${valor_stock_ma_aa} + ${pre_valor_stock_ma}) / 2 )
      / (NULLIF(${gasto_acum_11_meses} + ${pre_gasto_acum_ma},0) / 360);;

    value_format: "0.00"
  }


  #Metricas Presupuesto Fletes Mesuales
  measure: pre_costo_fletes_MTD{
    group_label: "Presupuesto Fletes"
    label: "Presupuesto Costo de Fletes MTD [MXN]"
    type: sum
    sql: CASE
            WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
            AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
            THEN ${TABLE}.Pre_Fletes
            ELSE 0
           END;;

    value_format: "$#,##0.00"
  }

  measure: pre_venta_terceros_fletes_MTD{
    group_label: "Presupuesto Fletes"
    type: sum
    sql: CASE
            WHEN ${Fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
            AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
            THEN (${TABLE}.Pre_Venta_terceros * -1)
            ELSE 0
           END;;

    value_format: "#,##0"
  }

  measure: pre_porc_fletes_ventas_MTD{
    group_label: "Presupuesto Fletes"
    label: "Presupuesto % Fletes / Ventas MTD"
    type: number
    sql: ((${pre_costo_fletes_MTD})/NULLIF(${pre_venta_terceros_fletes_MTD},0))*100  ;;

    value_format: "0.00\%"
  }

  #Metricas Presupuesto Fletes Anuales
  measure: pre_costo_fletes_YTD{
    group_label: "Presupuesto Fletes"
    label: "Presupuesto Costo de Fletes YTD [MXN]"
    type: sum
    sql: CASE
            WHEN ${Fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
            AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
            THEN ${TABLE}.Pre_Fletes
            ELSE 0
           END  ;;

    value_format: "$#,##0.00"
  }

  measure: pre_venta_terceros_fletes_YTD{
    group_label: "Presupuesto Fletes"
    type: sum
    sql: CASE
            WHEN ${Fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
            AND ${Fecha} <= LAST_DAY(CAST({% date_start date_filter %} AS DATE) )
            THEN (${TABLE}.Pre_Venta_terceros * -1)
            ELSE 0
           END;;

    value_format: "#,##0"
  }

  measure: pre_porc_fletes_ventas_YTD{
    group_label: "Presupuesto Fletes"
    label: "Presupuesto % Fletes / Ventas YTD"
    type: number
    sql: ((${pre_costo_fletes_YTD})/NULLIF(${pre_venta_terceros_fletes_YTD},0))*100  ;;

    value_format: "0.00\%"
  }


  measure: count {
    type: count
  }


}
