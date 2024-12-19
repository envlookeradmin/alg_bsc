
view: fct_gastos_adicionales {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_fact_gastos_adicionales`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gasto_adiciona_flete_nacional_exportacion {
    type: number
    sql: ${TABLE}.GASTO_ADICIONA_FLETE_NACIONAL_EXPORTACION ;;
  }

  dimension: moneda_gasto_adicional {
    type: string
    sql: ${TABLE}.MONEDA_GASTO_ADICIONAL ;;
  }

  dimension: denominacion_gasto_adicional {
    type: string
    sql: ${TABLE}.DENOMINACION_GASTO_ADICIONAL ;;
  }

dimension: VARIANTES {
  type: string
  sql: ${TABLE}.VARIANTES ;;
}

  measure: total_Gasto {
    type: sum
    sql: ${gasto_adiciona_flete_nacional_exportacion} ;;


  }

  dimension: centro {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  measure: Total_planta_manufacturera {
    label: "Importe Fletes Manufacturera"
    type: sum
    sql: case when ${centro}="MF01" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF02" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF03" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF04" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF05" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF06" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF07" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF08" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF09" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF10" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion else 0 end  ;;
  }

  measure: Total_planta_Comercializadora {
    label: "Importe Fletes Comercializadora"
    type: sum
    sql: case when ${centro}="MF51" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF52" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF53" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF54" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF55" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF56" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF57" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF58" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF59" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion
              when ${centro}="MF60" THEN ${TABLE}.gasto_adiciona_flete_nacional_exportacion else 0 end  ;;
  }



  set: detail {
    fields: [
        gasto_adiciona_flete_nacional_exportacion,
  moneda_gasto_adicional,
  denominacion_gasto_adicional
    ]
  }
}
