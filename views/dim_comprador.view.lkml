view: comprador {
  sql_table_name: `envases-analytics-qa.RPT_S4H_MX.vw_bsc_comprador` ;;

  dimension: comprador {
    type: string
    sql: ${TABLE}.Comprador ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension: gerencia {
    type: string
    sql: ${TABLE}.Gerencia ;;
  }
  dimension: gerente {
    type: string
    sql: ${TABLE}.Gerente ;;
  }
  dimension: grupo_compras {
    type: string
    sql: ${TABLE}.Grupo_Compras ;;
  }
  dimension: objetivo_productividad_95 {
    type: number
    sql: ${TABLE}.Objetivo_Productividad_95 ;;
  }
  dimension: tiempo_maximo {
    type: number
    sql: ${TABLE}.Tiempo_Maximo ;;
  }
  measure: count {
    type: count
  }
}
