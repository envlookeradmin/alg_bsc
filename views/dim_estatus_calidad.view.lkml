view: estatus_calidad{

  derived_table: {
    sql: SELECT
        ID,
        ESTADO,
        ORDEN
        from `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_Estatus`
        group by 1,2,3
        ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.ID;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }
  dimension: orden {
    type: string
    sql: ${TABLE}.ORDEN ;;
  }

  measure: count {
    type: count
  }
}
