view: actividad {

    sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_actividad` ;;

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
