view: planta{
  sql_table_name: `envases-analytics-qa.RPT_S4H_MX.vw_bsc_planta` ;;

  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }
  dimension: nombre_planta {
    type: string
    sql: ${TABLE}.Nombre_Planta ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }
  dimension: planta_id {
    type: string
    sql: ${TABLE}.Planta_ID ;;
  }

  dimension: planta_completo {
    type: string
    sql: ${TABLE}.Planta_ID || ' ' || ${TABLE}.Nombre_Planta;;
    drill_fields: [grupo_materiales.descripcion,fct_ordenes_pedidos.Total_fill_rate,fct_ordenes_pedidos.Total_flag_otif,fct_ordenes_pedidos.Total_flag_otif_entregadas]
  }

  dimension: planta_comercializadora {
    label: "Planta"
    type: string
    sql:  ${TABLE}.Planta_Comercializadora ;;

  }

  measure: count {
    type: count
  }
}
