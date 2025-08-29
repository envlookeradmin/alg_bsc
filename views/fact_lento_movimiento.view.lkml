
view: fact_lento_movimiento {
  derived_table: {
    sql: WITH FECHAS AS (
        SELECT
          CENTRO, MATERIAL, ALMACEN, LOTE, ESPECIAL, SITIO, MONEDA, GRUPO_REAL, TIPO, GRUPO,
          NIVEL_1, NIVEL_2, NIVEL_3, NIVEL_4, MESES_ROTACION_REGULAR, MESES_ROTACION_REGULAR * 30 DIAS_ROTACION,
          --FECHAS
          FECHA_PRODUCCION,
           current_date() DIA_ACTUAL,
          LAST_DAY(CURRENT_DATE()) ACTUAL,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -1 MONTH)) MES_A1,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -2 MONTH)) MES_A2,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -3 MONTH)) MES_A3,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -4 MONTH)) MES_A4,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -5 MONTH)) MES_A5,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL -6 MONTH)) MES_A6,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 1 MONTH)) MES_1,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 2 MONTH)) MES_2,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 3 MONTH)) MES_3,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 4 MONTH)) MES_4,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 5 MONTH)) MES_5,
          LAST_DAY(DATE_ADD(current_date(), INTERVAL 6 MONTH)) MES_6,
          --VALORES PARA METRICAS,
          STOCK, VALOR
        FROM
          `envases-analytics-qa.RPT_S4H_MX.tbl_fact_lento_movimiento` lmov
      ),
       PIVOTE AS (
        SELECT *, LAST_DAY(CURRENT_DATE(), YEAR) FECHA_FIN_ANIO,
        FROM FECHAS
        UNPIVOT(FECHA_REFERENCIA FOR MES IN (DIA_ACTUAL, ACTUAL,MES_A1,MES_A2,MES_A3,MES_A4,MES_A5,MES_A6, MES_1, MES_2, MES_3, MES_4, MES_5, MES_6))
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
  #DIMENSIONES DE CLASIFICACION
  dimension: clasificacion { #SE OCUPA PARA LAS GRAFICAS A 3 Y SEIS MESES
    description: "Clasificación de tipo Movimiento (Rotación Regular / Lento Movimiento"
    label: "Clasificación"
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }
  dimension: clasificacion_filtro {#CONTIENE LA CLASIFICACION DE RIESGO DE LENTO MOVIMIENTO
    description: "Filtro que contiene los materiales en Riesgo de Lento Movimiento"
    label: "Clasificación Filtro"
    type: string
    sql: ${TABLE}.CLASIFICACION_FILTRO ;;
  }

  #DIMENSIONES DE FECHAS
  dimension_group: fecha_produccion {
    type: time
    description: "Fecha de Producción de Material"
    label: "Fecha Producción"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_PRODUCCION ;;
  }
  dimension_group: fecha_referencia {
    description: "Fecha de Referencia para los comparativos: Día Actual, Cierres de Mes, Cierre de Año"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_REFERENCIA ;;
  }

  #PARAMETRO PARA PROYECCION A 1, 3 Y 6 MESES
  parameter: rango_lento_movimiento {
    description: "Parámetro que define a cuantos meses se hará la proyección"
    label: "Meses proyección"
    allowed_value: {
      label:"3 meses"
      value: "3meses"
    }
    allowed_value: {
      label: "6 meses"
      value: "6meses"
    }

    allowed_value: {
      label:"3 meses Atras"
      value: "3mesesA"
    }
    allowed_value: {
      label: "6 meses Atras"
      value: "6mesesA"
    }
  }

  #DIMENSIONES TIPO YESNO PARA EL PARÁMETRO
  dimension: 3_Meses {
    hidden: yes
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_1' or  ${mes} = 'MES_2' or  ${mes} = 'MES_3' ;;
  }
  dimension: 6_Meses {
    hidden: yes
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_1'  or  ${mes} = 'MES_2' or  ${mes} = 'MES_3'  or  ${mes} = 'MES_4' or  ${mes} = 'MES_5' or  ${mes} = 'MES_6';;
  }



  dimension: 3_Meses_Anterior {
    hidden: yes
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_A1' or  ${mes} = 'MES_A2' or  ${mes} = 'MES_A3' ;;
  }
  dimension: 6_Meses_Anterior {
    hidden: yes
    type: yesno
    sql: ${mes} ='ACTUAL' or ${mes} = 'MES_A1'  or  ${mes} = 'MES_A2' or  ${mes} = 'MES_A3'  or  ${mes} = 'MES_A4' or  ${mes} = 'MES_A5' or  ${mes} = 'MES_A6';;
  }

  #DIMENSIONES
  dimension: centro {
    label: "Centro"
    type: string
    sql: ${TABLE}.CENTRO ;;
  }
  dimension: sitio {
    label: "Sitio"
    type: string
    sql: ${TABLE}.SITIO ;;
  }
  dimension: material {
    label: "Material"
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }
  dimension: almacen {
    label: "Almacén"
    type: string
    sql: ${TABLE}.ALMACEN ;;
  }
  dimension: lote {
    label: "Lote"
    type: string
    sql: ${TABLE}.LOTE ;;
  }
  dimension: especial {
    label: "Especial"
    type: string
    sql: ${TABLE}.ESPECIAL ;;
  }
  dimension: subcontratacion {
    label: "Subcontratacion"
    type: string
    sql: ${TABLE}.SUBCONTRATACION ;;
  }
  dimension: grupo {
    description: "Agrupación personalizada para Lento movimiento, incluye drill a Códigos de Grupo de Artículo SAP"
    label: "Grupo"
    drill_fields: [descripcion_gm] #Se obtiene la descripción del Grupo de la Dimensión Grupo de Materiales
    type: string
    sql: ${TABLE}.GRUPO_REAL ;;
  }
  dimension: grupo_sap {
    description: "Código de grupo de materiales usado en SAP"
    label: "Grupo Artículos"
    type: string
    sql: ${TABLE}.GRUPO ;;
  }
  dimension: descripcion_gm {
    description: "Descripción del Grupo de Artículos de SAP"
    label: "Descripción Grupo Artículos"
    drill_fields: [material]
    type: string
    sql: ${grupo_materiales.descripcion} ;;

  }
  dimension: tipo {
    label: "Tipo"
    type: string
    sql: ${TABLE}.TIPO ;;
  }

  dimension: nivel_1 {
    label: "Nivel 1"
    type: string
    sql: ${TABLE}.NIVEL_1 ;;
  }
  dimension: nivel_2 {
    label: "Nivel 2"
    type: string
    sql: ${TABLE}.NIVEL_2 ;;
  }
  dimension: nivel_3 {
    label: "Nivel 3"
    type: string
    sql: ${TABLE}.NIVEL_3 ;;
  }
  dimension: nivel_4 {
    label: "Nivel 4"
    type: string
    sql: ${TABLE}.NIVEL_4 ;;
  }
  dimension: moneda {
    label: "Moneda"
    type: string
    sql: ${TABLE}.MONEDA ;;
  }
  dimension: meses_rotacion_regular {
    label: "Meses Rotación"
    type: number
    sql: ${TABLE}.MESES_ROTACION_REGULAR ;;
  }
  dimension: mes {
    description: "Parámetro de Mes para proyección"
    hidden: yes
    label: "Mes Proyección"
    type: string
    sql: ${TABLE}.Mes ;;
  }
  #DIMENSIONES NUMÉRICAS PARA LAS MÉTRICAS
  dimension: stock {
    hidden: yes
    type: number
    sql: ${TABLE}.STOCK ;;
  }
  dimension: valor {
    hidden: yes
    type: number
    sql: ${TABLE}.VALOR ;;
  }

  #MÉTRICAS DE STOCK
  measure: total_stock {
    label: "Suma Stock"
    type: sum
    sql: ${stock} ;;
    value_format: "#,##0.00"
  }
  measure: total_stock_3 {
    hidden: yes
    label: "Stock a 3 meses"
    type: sum
    sql:  ${stock} ;;
    filters: {
      field: 3_Meses
      value: "yes"
    }
    value_format: "#,##0.00"
  }
  measure: total_stock_6 {
    hidden: yes
    label: "Stock a 6 meses"
    type: sum
    sql: ${stock} ;;
    filters: {
      field: 6_Meses
      value: "yes"
    }
    value_format: "#,##0.00"
  }


  measure: total_stock_3_Anterior {
    hidden: yes
    label: "Stock a 3 meses Anterior"
    type: sum
    sql:  ${stock} ;;
    filters: {
      field: 3_Meses_Anterior
      value: "yes"
    }
    value_format: "#,##0.00"
  }
  measure: total_stock_6_Anterior {
    hidden: yes
    label: "Stock a 6 meses Anterior"
    type: sum
    sql: ${stock} ;;
    filters: {
      field: 6_Meses_Anterior
      value: "yes"
    }
    value_format: "#,##0.00"
  }





  measure: total_stock_proyeccion {
    label: "Proyección Stock"
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${total_stock_3}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${total_stock_6}
          WHEN {% parameter rango_lento_movimiento %} = "3mesesA"
            THEN ${total_stock_3_Anterior}
          WHEN {% parameter rango_lento_movimiento %} = "6mesesA"
            THEN ${total_stock_6_Anterior}
      END ;;
    value_format: "#,##0.00"
  }
  #METRICAS DE VALOR
  measure: total_valor {
    label: "Suma Valor"
    type: sum
    sql: ${valor} ;;
    value_format: "#,##0.00"
  }
  measure: total_valor_3 {
    hidden: yes
    label: "Valor a 3 meses"
    type: sum
    sql:  ${valor} ;;
    filters: {
      field: 3_Meses
      value: "yes"
    }
    value_format: "#,##0.00"
  }
  measure: total_valor_6 {
    hidden: yes
    label: "Valor a 6 meses"
    type: sum
    sql: ${valor} ;;
    filters: {
      field: 6_Meses
      value: "yes"
    }
    value_format: "#,##0.00"
  }

  measure: total_valor_3_Anterior {
    hidden: yes
    label: "Valor a 3 meses Anterior"
    type: sum
    sql:  ${valor} ;;
    filters: {
      field: 3_Meses_Anterior
      value: "yes"
    }
    value_format: "#,##0.00"
  }
  measure: total_valor_6_Anterior {
    hidden: yes
    label: "Valor a 6 meses Anterior"
    type: sum
    sql: ${valor} ;;
    filters: {
      field: 6_Meses_Anterior
      value: "yes"
    }
    value_format: "#,##0.00"
  }




  measure: total_valor_proyeccion {
    label: "Proyección Valor"
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${total_valor_3}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${total_valor_6}
          WHEN {% parameter rango_lento_movimiento %} = "3mesesA"
            THEN ${total_valor_3_Anterior}
          WHEN {% parameter rango_lento_movimiento %} = "6mesesA"
            THEN ${total_valor_6_Anterior}
      END ;;
    value_format: "#,##0.00"
  }

  #MÉTRICAS PARA INCREMENTO
  measure: inc_valor_1 {
    description: "Valor al cierre de mes actual"
    hidden: yes
    type: sum
    sql: ${valor} ;;
    filters: [
      mes: "ACTUAL"
    ]
  }
  measure: inc_valor_3 {
    description: "Valor al cierre de mes 3"
    hidden: yes
    type: sum
    sql: ${valor} ;;
    filters: [
      mes: "MES_3"
    ]
  }
  measure: inc_valor_6 {
    description: "Valor al cierre de mes 6"
    hidden: yes
    type: sum
    sql: ${valor} ;;
    filters: [
      mes: "MES_6"
    ]
  }

  measure: inc_valor_3_anterior {
    description: "Valor al cierre de mes 3 Anterior"
    hidden: yes
    type: sum
    sql: ${valor} ;;
    filters: [
      mes: "MES_A3"
    ]
  }
  measure: inc_valor_6_anterior {
    description: "Valor al cierre de mes 6 Anterior"
    hidden: yes
    type: sum
    sql: ${valor} ;;
    filters: [
      mes: "MES_A6"
    ]
  }





  measure: incremento {
    description: "Compara el último mes seleccionado con el mes actual"
    label: "Incremento"
    type: number
    sql:
      (CASE
        WHEN {% parameter rango_lento_movimiento %} = "3meses" THEN ${inc_valor_3}
        WHEN {% parameter rango_lento_movimiento %} = "6meses" THEN ${inc_valor_6}
        WHEN {% parameter rango_lento_movimiento %} = "3mesesA" THEN ${inc_valor_3_anterior}
        WHEN {% parameter rango_lento_movimiento %} = "6mesesA" THEN ${inc_valor_6_anterior}
      END) - ${inc_valor_1};;
    value_format: "#,##0.00"
  }
}
