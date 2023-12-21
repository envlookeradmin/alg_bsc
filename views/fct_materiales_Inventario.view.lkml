view: materiales_inventario {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_materiales_stock` where  PARSE_DATE('%Y/%m/%d',fecha) between  DATE_TRUNC(DATE_ADD( CAST({% date_start date_filter %} AS DATE), INTERVAL -2 month) , month)    and  LAST_DAY(DATE (CAST({% date_start date_filter %} AS DATE)))   ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }



  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;
  }

  dimension: stock_inspeccion_calidad {
    type: number
    sql: ${TABLE}.STOCK_INSPECCION_CALIDAD ;;
  }

  dimension: stock_bloqueado {
    type: number
    sql: ${TABLE}.STOCK_BLOQUEADO ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  dimension: fecha {
    type: date
    sql:  PARSE_DATE('%Y/%m/%d', ${TABLE}.FECHA)   ;;
  }




    dimension: lote {
      type: string
      sql: ${TABLE}.LOTE ;;
    }

    dimension: valor_actual_stock_libre_utilizacion {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
    }

    dimension: valor_actual_inspeccion_calidad {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD ;;
    }

    dimension: valor_actual_bloqueado {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_BLOQUEADO ;;
    }

  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }


    measure: Total_pt {
      label: "PT"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION + ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO) /1000000 ;;
      filters: [grupo_materiales.tipo_nc: "PT"]
      value_format: "$#,##0.00"
    }

    measure: Total_Componentes {
      label: "Componentes"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION + ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO) /1000000 ;;
      filters: [grupo_materiales.tipo_nc: "Componentes"]
      value_format: "$#,##0.00"
    }

    measure: Total_Hoja {
      label: "Hoja"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION + ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO) /1000000 ;;
      filters: [grupo_materiales.tipo_nc: "Hoja"]
      value_format: "$#,##0.00"
    }

    set: detail {
      fields: [
        id_material,
        centro,
        stock_libre_utilizacion,
        stock_inspeccion_calidad,
        stock_bloqueado,
        grupo_material,
        fecha,
        lote,
        valor_actual_stock_libre_utilizacion,
        valor_actual_inspeccion_calidad,
        valor_actual_bloqueado
      ]
    }
  }
