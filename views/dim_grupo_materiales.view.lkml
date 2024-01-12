view: grupo_materiales {

  sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_grupo_materiales` ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_grupo {
    type: string
    sql: ${TABLE}.ID_GRUPO ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.DESCRIPCION ;;
  }



  dimension: tipo_nc {
    type: string
    sql: ${TABLE}.TIPO_NC ;;
  }

  set: detail {
    fields: [
      id_grupo,
      descripcion,
      tipo_nc
    ]
  }
}
