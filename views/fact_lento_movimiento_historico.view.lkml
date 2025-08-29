
view: fact_lento_movimiento_historico {
  derived_table: {
    sql: SELECT
          *,
          CURRENT_DATETIME("America/Mexico_City") AS FECHA_ACTUALIZACION,
          Mes AS FECHA_REFERENCIA,
          Meses_Rotacion_Regular * 30 AS Dias_Rotacion,
          DATE_DIFF(Mes, Fecha_Produccion, DAY) DIAS_DIFF,
          DATE_DIFF(LAST_DAY(Mes, YEAR), Fecha_Produccion, DAY) DIAS_DIFF_FIN,
          CASE
            WHEN DATE_DIFF(Mes, Fecha_Produccion, DAY) > Meses_Rotacion_Regular * 30 THEN 'LENTO MOVIMIENTO'
            ELSE 'ROTACION REGULAR'
          END CLASIFICACION,
          CASE
            WHEN
              DATE_DIFF(Mes, Fecha_Produccion, DAY) > Meses_Rotacion_Regular * 30 THEN 'LENTO MOVIMIENTO'
            WHEN
              DATE_DIFF(LAST_DAY(Mes, YEAR), Fecha_Produccion, DAY) > Meses_Rotacion_Regular * 30 THEN 'RIESGO LENTO MOVIMIENTO'
            ELSE 'ROTACION REGULAR'
          END CLASIFICACION_FILTRO
        FROM `RPT_S4H_MX.vw_fact_lento_mov_hist` hist ;;
  }

  # Dimensiones
  dimension: clasificacion {
    label: "Clasificación Tipo Movimiento"
    description: "Clasificación del tipo de movimiento"
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }

  dimension: clasificacion_filtro {
    label: "Clasificación Riesgo"
    description: "Clasificación que contiene los materiales en riesgo de lento movimiento"
    type: string
    sql: ${TABLE}.CLASIFICACION_FILTRO ;;
  }

  dimension_group: fecha_produccion {
    label: "Fecha Producción"
    description: "Fecha de producción de material"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_PRODUCCION ;;
  }

  dimension_group: fecha_referencia {
    label: "Fecha"
    description: "Fecha del mes en el que se encuentran los datos"
    type: time
    timeframes: [raw, date, month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_REFERENCIA ;;
  }

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

  dimension: fecha_actualizacion {
    label: "Fecha Actualizacion"
    type: date_time
    sql: ${TABLE}.FECHA_ACTUALIZACION ;;
  }

  dimension: grupo {
    description: "Agrupación personalizada para Lento movimiento, incluye drill a Códigos de Grupo de Artículo SAP"
    label: "Grupo"
    drill_fields: [descripcion_gm]
    type: string
    sql: ${TABLE}.GRUPO_REAL ;;
  }

  dimension: grupo_sap {
    description: "Código de grupo de materiales usado en SAP"
    label: "Grupo Artículos"
    type: string
    sql: ${TABLE}.GRUPO ;;
  }

  # - ?
  dimension: descripcion_gm {
    label: "Descripción Grupo Artículos"
    description: "Descripción del Grupo de Artículos de SAP"
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

  # Parametros y Filtros
  parameter: rango_historico {
    type: unquoted
    description: "Parámetro que define la cantidad de histórico a presentar"
    label: "Historico"
    allowed_value: {
      label:"3 meses"
      value: "2"
    }
    allowed_value: {
      label: "6 meses"
      value: "5"
    }
    allowed_value: {
      label: "12 meses"
      value: "11"
    }
  }

  filter: sel_periodo {
    label: "Periodo"
    type: date
  }

  # Valida si es el mes actual
  dimension: en_mes_actual {
    hidden: yes
    type: yesno
    sql: CASE
      WHEN ${fecha_referencia_date}
        BETWEEN DATE({% date_start fact_lento_movimiento_historico.sel_periodo %})
        AND (LAST_DAY(DATE({% date_start fact_lento_movimiento_historico.sel_periodo %})))
      THEN TRUE
      ELSE FALSE
    END;;
  }

  # Valida si esta en el rango de meses (dependiendo del valor seleccionado en el parametro).
  dimension: en_rango_historico {
    hidden: yes
    type: yesno
    sql: CASE
      WHEN ${fecha_referencia_date}
        BETWEEN (DATE({% date_start fact_lento_movimiento_historico.sel_periodo %}) - INTERVAL {% parameter rango_historico %} MONTH)
        AND (LAST_DAY(DATE({% date_start fact_lento_movimiento_historico.sel_periodo %})))
      THEN TRUE
      ELSE FALSE
    END;;
  }

  # Valida si es el mes actual o el mes anterior.
  dimension: en_mes_actual_mes_anterior {
    hidden: yes
    type: yesno
    sql: CASE
      WHEN ${fecha_referencia_date}
        BETWEEN (DATE({% date_start fact_lento_movimiento_historico.sel_periodo %}) - INTERVAL 1 MONTH)
        AND (LAST_DAY(DATE({% date_start fact_lento_movimiento_historico.sel_periodo %})))
      THEN TRUE
      ELSE FALSE
    END;;
  }

  # Medidas
  # -- Stock
  measure: total_stock {
    label: "Stock Total"
    description: "Suma del stock"
    type: sum
    sql: ${stock} ;;
    value_format: "#,##0.00"
  }

  # -- Valor
  measure: total_valor {
    label: "Valor Total"
    description: "Suma del valor"
    type: sum
    sql: ${valor} ;;
    value_format: "#,##0.00"
  }
}
