
view: dim_canal_distribucion {
  derived_table: {
    sql:

    SELECT '10' CANAL_DISTRIBUCION
    UNION ALL
    SELECT '20' CANAL_DISTRIBUCION
    UNION ALL
    SELECT '30' CANAL_DISTRIBUCION
    UNION ALL
    SELECT '40' CANAL_DISTRIBUCION

      ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  set: detail {
    fields: [
      canal_distribucion
    ]
  }
}
