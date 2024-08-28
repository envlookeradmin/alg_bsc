view: tbl_inventario_lento_movimiento {
  sql_table_name: `envases-analytics-qa.DATASET_RAW.tbl_inventario_lento_movimiento` ;;


  parameter: rango_lento_movimiento {
    allowed_value: {
      label:"3 meses"
      value: "3 meses"
    }
    allowed_value: {
      label: "6 meses"
      value: "6meses"
    }
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
