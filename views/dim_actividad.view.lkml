view: actividad {

    sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_actividad` ;;

    dimension: actividad_id {
      type: string
      sql: ${TABLE}.Z_ACT_TYPE  ;;
    }
    dimension: descripcion {
      type: string
      sql: ${TABLE}.Z_DESC ;;
    }

    measure: count {
      type: count
    }

}
