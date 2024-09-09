
view: fact_lento_movimiento {
  derived_table: {
    sql: WITH FECHAS AS (
  SELECT
    CENTRO, MATERIAL, ALMACEN, LOTE, ESPECIAL, SITIO, MONEDA, GRUPO_REAL, TIPO,
    NIVEL_1, NIVEL_2, NIVEL_3, NIVEL_4, MESES_ROTACION_REGULAR, MESES_ROTACION_REGULAR * 30 DIAS_ROTACION,
    --FECHAS
    FECHA_PRODUCCION,
    current_date() DIA_ACTUAL,
    LAST_DAY(CURRENT_DATE()) ACTUAL,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 1 MONTH)) MES_1,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 2 MONTH)) MES_2,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 3 MONTH)) MES_3,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 4 MONTH)) MES_4,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 5 MONTH)) MES_5,
    LAST_DAY(DATE_ADD(current_date(), INTERVAL 6 MONTH)) MES_6,
    --VALORES PARA METRICAS,
    STOCK, VALOR
  FROM
    envases-analytics-qa.RPT_S4H_MX.vw_fact_lento_movimiento lmov
),
PIVOTE AS (
  SELECT *, LAST_DAY(CURRENT_DATE(), YEAR) FECHA_FIN_ANIO,
  FROM FECHAS
  UNPIVOT(FECHA_REFERENCIA FOR MES IN (DIA_ACTUAL, ACTUAL, MES_1, MES_2, MES_3, MES_4, MES_5, MES_6))
)
SELECT
  *,
  DATE_DIFF(FECHA_REFERENCIA, FECHA_PRODUCCION, DAY) DIAS_DIFF,
  DATE_DIFF(FECHA_FIN_ANIO, FECHA_PRODUCCION, DAY) DIAS_DIFF_FIN,
  CASE
    WHEN DATE_DIFF(FECHA_REFERENCIA, FECHA_PRODUCCION, DAY) > PIVOTE.DIAS_ROTACION THEN 'LENTO MOVIMIENTO'
    ELSE 'ROTACION REGULAR'
  END CLASIFICACION,
  CASE
    WHEN
      DATE_DIFF(FECHA_REFERENCIA, FECHA_PRODUCCION, DAY) > PIVOTE.DIAS_ROTACION THEN 'LENTO MOVIMIENTO'
    WHEN
      DATE_DIFF(FECHA_FIN_ANIO, FECHA_PRODUCCION, DAY) > PIVOTE.DIAS_ROTACION THEN 'RIESGO LENTO MOVIMIENTO'
    ELSE 'ROTACION REGULAR'
  END CLASIFICACION_FILTRO
FROM PIVOTE ;;
  }


  dimension: CLASIFICACION {
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }





  parameter: rango_lento_movimiento {
    allowed_value: {
      label:"Mes Actual"
      value: "mes"
    }
    allowed_value: {
      label:"3 meses"
      value: "3meses"
    }
    allowed_value: {
      label: "6 meses"
      value: "6meses"
    }
  }

  dimension: 1_Meses {
    type: yesno
    sql: ${mes} ='ACTUAL' ;;
  }

  dimension: 3_Meses {
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_1' or  ${mes} = 'MES_2' or  ${mes} = 'MES_3' ;;
  }

  dimension: 6_Meses {
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_1'  or  ${mes} = 'MES_2' or  ${mes} = 'MES_3'  or  ${mes} = 'MES_4' or  ${mes} = 'MES_5' or  ${mes} = 'MES_6';;

  }


  dimension_group: fecha_produccion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_PRODUCCION ;;
  }


  dimension_group: fecha_referencia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_REFERENCIA ;;
  }


  measure: TotalStock {

    type: sum
    sql: ${TABLE}.Stock ;;



  }

  measure: Totalvalor {

    type: sum
    sql: ${TABLE}.valor ;;



  }

  measure: TotalStock_Actual {
    label: "Actual"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: 1_Meses
      value: "yes"
    }

  }


  measure: TotalStock_3_meses {
    label: "3_meses"
    type: sum
    #sql: SUM(${TABLE}.Stock) OVER (PARTITION BY ${grupo} ORDER BY ${mes}) ;;
    sql:  ${TABLE}.Stock ;;

    filters: {
      field: 3_Meses
      value: "yes"
    }

  }

  measure: TotalStock_6_meses {
    label: "6_meses"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: 6_Meses
      value: "yes"
    }

  }


  measure: Total_segmentado {
    label: "Mes"
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "mes"
            THEN ${TotalStock_Actual}
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${TotalStock_3_meses}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${TotalStock_6_meses}

      END ;;

    value_format: "*00#.00"
  }


  measure: Totalvalor_Actual {
    label: "Actual Valor"
    type: sum
    sql: ${TABLE}.valor ;;

    filters: {
      field: 1_Meses
      value: "yes"
    }

  }


  measure: Totalvalor_3_meses {
    label: "3_meses Valor"
    type: sum
    #sql: SUM(${TABLE}.Stock) OVER (PARTITION BY ${grupo} ORDER BY ${mes}) ;;
    sql:  ${TABLE}.valor ;;

    filters: {
      field: 3_Meses
      value: "yes"
    }

  }

  measure: Totalvalor_6_meses {
    label: "6_meses Valor"
    type: sum
    sql: ${TABLE}.valor ;;

    filters: {
      field: 6_Meses
      value: "yes"
    }

  }


  measure: Total_segmentado_valor {
    label: "Mes Valor"
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "mes"
            THEN ${Totalvalor_Actual}
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${Totalvalor_3_meses}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${Totalvalor_6_meses}

      END ;;

    value_format: "*00#.00"
  }



  dimension: CLASIFICACION_FILTRO {
    type: string
    sql: ${TABLE}.CLASIFICACION_FILTRO ;;
  }












  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: almacen {
    type: string
    sql: ${TABLE}.ALMACEN ;;
  }

  dimension: lote {
    type: string
    sql: ${TABLE}.LOTE ;;
  }

  dimension: especial {
    type: string
    sql: ${TABLE}.ESPECIAL ;;
  }

  dimension: nivel_2 {
    type: string
    sql: ${TABLE}.NIVEL_2 ;;
  }

  dimension: stock {
    type: number
    sql: ${TABLE}.STOCK ;;
  }

  dimension: nivel_3 {
    type: string
    sql: ${TABLE}.NIVEL_3 ;;
  }



  dimension: sitio {
    type: string
    sql: ${TABLE}.SITIO ;;
  }

  dimension: nivel_1 {
    type: string
    sql: ${TABLE}.NIVEL_1 ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.TIPO ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}.GRUPO_REAL ;;
  }

  dimension: subcontratacion {
    type: string
    sql: ${TABLE}.SUBCONTRATACION ;;
  }

  dimension: moneda {
    type: string
    sql: ${TABLE}.MONEDA ;;
  }

  dimension: valor {
    type: number
    sql: ${TABLE}.VALOR ;;
  }

  dimension: meses_rotacion_regular {
    type: number
    sql: ${TABLE}.MESES_ROTACION_REGULAR ;;
  }

  dimension: nivel_4 {
    type: string
    sql: ${TABLE}.NIVEL_4 ;;
  }



  dimension: mes {
    type: string
    sql: ${TABLE}.Mes ;;
  }

  set: detail {
    fields: [
        centro,
  material,
  almacen,
  lote,
  especial,
  nivel_2,
  stock,
  nivel_3,

  nivel_1,
  tipo,
  grupo,
  subcontratacion,
  moneda,
  valor,
  meses_rotacion_regular,
  nivel_4,

  mes
    ]
  }
}
