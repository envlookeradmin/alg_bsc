
view: fct_desperdicio_prod {
  derived_table: {
    sql:


        SELECT dp.*
              ,M.TOTAL_KILOS_PRODUCCION FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_desperdicios` dp
        LEFT JOIN  `envases-analytics-qa.RPT_S4H_MX.vw_fact_prod_cap_manufactura` m on dp.planta = m.planta and dp.material = m.id_material and dp.fecha_documento = m.fecha_fin_real
        WHERE  DATE_TRUNC(CAST(fecha_documento AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH) AND DATE_TRUNC(CAST(fecha_documento AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
        ;;
  }


  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }



  dimension: planta {
    type: string
    sql: ${TABLE}.PLANATA ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  measure: Total_cantidad_produccion {
    label: "Total Kgs Produccion"
    type: sum
    sql: ${TABLE}.TOTAL_KILOS_PRODUCCION ;;
    value_format: "#,##0"

  }

  measure: Total_cantidad_desperdicio {
    label: "Total Kgs Desperdicio"
    type: sum
    sql: ${TABLE}.CANTIDAD ;;
    value_format: "#,##0"

  }

  measure: Por_cantidad_desperdicio {
    label: "% Kgs . Des."
    type: number
    sql:${Total_cantidad_desperdicio} / nullif(${Total_cantidad_produccion},0)*100;;

    html:
    {% if value <= 16 %}
   <p><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10> <span>{{ rendered_value }}</span></p>

    {% elsif  value > 16  %}
    <img src="https://findicons.com/files/icons/1036/function/48/circle_red.png"    height=10 width=10><span>{{ rendered_value }}</span></p>

    {% endif %} ;;

    value_format: "0.00\%"

  }



  dimension: importe {
    type: number
    sql: ${TABLE}.IMPORTE ;;
  }

  measure: Total_importe_produccion {
    label: "Total Importe"
    type: sum
    sql: ${TABLE}.IMPORTE ;;
    value_format: "#,##0"
  }






  dimension: fecha_documento {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }

  dimension: descripcion_material {
    type: string
    sql: ${TABLE}.DESCRIPCION_MATERIAL ;;
  }

  dimension: peso {
    type: number
    sql: ${TABLE}.PESO ;;
  }

  dimension: unida_peso {
    type: string
    sql: ${TABLE}.UNIDA_PESO ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  set: detail {
    fields: [
        planta,
  material,
  cantidad,
  importe,
  fecha_documento,
  descripcion_material,
  peso,
  unida_peso,
  grupo_material
    ]
  }
}
