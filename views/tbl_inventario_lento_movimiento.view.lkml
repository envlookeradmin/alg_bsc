view: tbl_inventario_lento_movimiento {
  sql_table_name: `envases-analytics-qa.DATASET_RAW.tbl_inventario_lento_movimiento` ;;


  parameter: rango_lento_movimiento {
    allowed_value: {
      label:"3 meses"
      value: "3meses"
    }
    allowed_value: {
      label: "6 meses"
      value: "6meses"
    }
  }


  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }


  dimension: ultimos_3_meses{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
     AND DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }


  dimension: ultimos_6_meses{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -6 MONTH)
      AND DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }


  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }


  dimension: mes_inicial{
    hidden: yes
    type: yesno
    sql:

      CASE
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN

             DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
         AND DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) <= LAST_DAY( DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH))

          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN
             DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -6 MONTH)
         AND DATE_TRUNC(CAST(${fecha_produccion_date} AS DATE),DAY) <= LAST_DAY( DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -6 MONTH))

          END  ;;
  }

  dimension: FF {
    type: date
    sql:LAST_DAY( DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH))  ;;
  }



  measure: TotalStock_actual {
    label: "Actual"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: mes_actual
      value: "yes"
    }

  }


  measure: TotalStock_inicial {
    label: "inicial"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: mes_inicial
      value: "yes"
    }

  }


  measure: incremento {
    label: "Incremento"
    type: number
    sql: ${TotalStock_actual}-${TotalStock_inicial} ;;
  }

  measure: porincremento {
    label: "% Incremento"
    type: number
    sql: ${incremento}/nullif(${TotalStock_inicial},0) ;;

    value_format: "0.00\%"
  }




  measure: TotalStock_3_meses {
    label: "3_meses"
    type: sum
   sql: ${TABLE}.Stock ;;

    filters: {
      field: ultimos_3_meses
      value: "yes"
    }

  }

  measure: TotalStock_6_meses {
    label: "6_meses"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field:  ultimos_6_meses
      value: "yes"
    }

  }



  measure: Total_segmentado {
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${TotalStock_3_meses}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${TotalStock_6_meses}

          END ;;
  }














  dimension: centro {
    type: string
    sql: ${TABLE}.Centro ;;
  }
  dimension: especial {
    type: string
    sql: ${TABLE}.Especial ;;
  }
  dimension_group: fecha_produccion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_Produccion ;;
  }
  dimension: grupo {
    type: string
    sql: ${TABLE}.Grupo ;;
    drill_fields: [grupo_articulo, centro,TotalStock,totalValor]
  }
  dimension: grupo_articulo {
    type: string
    sql: ${TABLE}.Grupo_Articulo ;;
    drill_fields: [material,TotalStock,totalValor]
  }
  dimension: lento_movimiento {
    type: string
    sql: ${TABLE}.Lento_Movimiento ;;
  }
  dimension: lote {
    type: string
    sql: ${TABLE}.Lote ;;
  }
  dimension: material {
    type: string
    sql: ${TABLE}.Material ;;
  }
  dimension: moneda {
    type: string
    sql: ${TABLE}.Moneda ;;
  }
  dimension: nivel1 {
    type: string
    sql: ${TABLE}.Nivel1 ;;
  }
  dimension: nivel2 {
    type: string
    sql: ${TABLE}.Nivel2 ;;
  }
  dimension: nivel3 {
    type: string
    sql: ${TABLE}.Nivel3 ;;
  }
  dimension: nivel4 {
    type: string
    sql: ${TABLE}.Nivel4 ;;
  }
  dimension: sitio {
    type: string
    sql: ${TABLE}.Sitio ;;
  }
  dimension: stock {
    hidden: yes
    type: number
    sql: ${TABLE}.Stock ;;
  }
  dimension: subcontratacion {
    type: string
    sql: ${TABLE}.Subcontratacion ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: valor {
    hidden: yes
    type: number
    sql: ${TABLE}.Valor ;;
  }
  measure: count {
    type: count
  }
  measure: TotalStock {
    label: "Stock"
    type: sum
    sql: ${stock};;
  }
  measure: totalValor {
    label: "Valor"
    type: sum
    sql: ${valor} ;;
  }
}
