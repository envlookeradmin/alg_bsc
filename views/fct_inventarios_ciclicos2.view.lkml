
view: fct_inventarios_ciclicos2 {
  derived_table: {
    sql: SELECT
         PLANTA
        ,SUM(CANTIDAD_TEORICA)- SUM(CANTIDAD_CONTADA) Diferencia
        ,(SUM(CANTIDAD_TEORICA)- SUM(CANTIDAD_CONTADA))/SUM(CANTIDAD_TEORICA) As exactitud
        FROM
         `envases-analytics-qa.RPT_S4H_MX.tbl_fact_inventarios_ciclicos` as a
        LEFT JOIN `envases-analytics-qa.RPT_S4H_MX.cat_grupos_materiales_inventario_ciclico` c
        ON c.id_material=a.MATERIAL AND c.centro=a.PLANTA
       WHERE  FECHA_DOCUMENTO BETWEEN    DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year) AND CAST({% date_start date_filter %} AS DATE)
       AND id_material is not  null group by 1

      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }


  measure: diferencia {
    label: "Diferencia"
    type: sum
    sql: ${TABLE}.Diferencia;;
    value_format: "$#,##0"
  }


  measure: exactitud {
    label: "Exactitud"
    type: sum
    sql: ${TABLE}.exactitud;;
    #  sql:(${cantidad_contada} - ${conteo_material_real_ytd} ) / ${cantidad_teorica};;
    value_format: "0"
  }






}
