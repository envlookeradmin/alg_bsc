
view: fct_desperdicio_prod {
  derived_table: {
    sql:
    --nullif(o.peso_neto,0)

               SELECT dp.*
                    ,m.TOTAL_KILOS_PRODUCCION
                    ,nullif(o.peso_neto,0) PESO_NETO   FROM `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_desperdicios` dp
              LEFT JOIN  (select planta,fecha_fin_real,REGEXP_REPLACE( ID_MATERIAL, '^0+','') ID_MATERIAL,sum(TOTAL_KILOS_PRODUCCION) TOTAL_KILOS_PRODUCCION  from `envases-analytics-eon-poc.RPT_S4H_MX.vw_fact_prod_cap_manufactura` m
                    group by planta,fecha_fin_real,ID_MATERIAL ) m on
                      dp.planta = m.planta
                  and dp.material = m.id_material
                  and dp.fecha_documento = m.fecha_fin_real

      LEFT JOIN  (select planta,REGEXP_REPLACE( id_material, '^0+','') id_material,fecha_entrega_real,sum(PESO_NETO) PESO_NETO from `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_ordenes_pedidos`
      where  canal_distribucion in ("30","40") group by planta,REGEXP_REPLACE( id_material, '^0+',''),fecha_entrega_real) o on
      dp.planta = o.planta
      and dp.material =  o.id_material
      and dp.fecha_documento = o.fecha_entrega_real



      WHERE  CAST(fecha_documento AS date) >= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH) else CAST({% date_start date_filter %} AS DATE) end )
      and CAST(fecha_documento AS date) <= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then LAST_DAY(CAST({% date_start date_filter %} AS DATE)) else CAST({% date_end date_filter %} AS DATE) end )


      --  where CAST(fecha_documento AS date) between CAST({% date_start date_filter %} AS DATE)  and  CAST({% date_end date_filter %} AS DATE)


      --    WHERE  DATE_TRUNC(CAST(fecha_documento AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH) AND DATE_TRUNC(CAST(fecha_documento AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      ;;
  }


  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }


  dimension: fecha_documento {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }

  dimension_group: fecha_filtro {
    label: "Date"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${TABLE}.FECHA_DOCUMENTO  AS TIMESTAMP) ;;
  }



  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }

  dimension: trimestre{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -4 MONTH) AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }


  dimension: anual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year)  AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }

  measure: Total_importe_produccion_mes {
    label: "Total Importe Mes"
    type: sum
    sql: ${TABLE}.IMPORTE ;;
    value_format: "$#,##0"

    filters: {
      field: mes_actual
      value: "yes"
    }
  }

  measure: Total_importe_produccion_trimestral {
    label: "Total Importe Trimestral"
    type: sum
    sql: ${TABLE}.IMPORTE ;;
    value_format: "$#,##0"

    filters: {
      field: trimestre
      value: "yes"
    }
  }

  measure: Total_importe_produccion_Anual {
    label: "Total Importe Anual"
    type: sum
    sql: ${TABLE}.IMPORTE ;;
    value_format: "$#,##0"

    filters: {
      field: anual
      value: "yes"
    }
  }

  measure: Total_cantidad_produccion_mes {
    label: "Total Kgs Produccion Mes"
    type: sum
    sql: ${TABLE}.TOTAL_KILOS_PRODUCCION   ;;
    value_format: "#,##0"

    filters: {
      field: mes_actual
      value: "yes"
    }

  }

  measure: Total_cantidad_produccion_trimestral {
    label: "Total Kgs Produccion Trimestral"
    type: sum
    sql: ${TABLE}.TOTAL_KILOS_PRODUCCION   ;;
    value_format: "#,##0"

    filters: {
      field: trimestre
      value: "yes"
    }

  }

  measure: Total_cantidad_produccion_anual {
    label: "Total Kgs Produccion Anual"
    type: sum
    sql: ${TABLE}.TOTAL_KILOS_PRODUCCION   ;;
    value_format: "#,##0"

    filters: {
      field: anual
      value: "yes"
    }

  }

  measure: Total_cantidad_desperdicio_mes {
    label: "Total Kgs Desperdicio mes"
    type: sum
    sql: ${TABLE}.CANTIDAD ;;
    value_format: "#,##0"

    filters: {
      field: mes_actual
      value: "yes"
    }

  }

  measure: Total_cantidad_desperdicio_trimestral {
    label: "Total Kgs Desperdicio Trimestral"
    type: sum
    sql: ${TABLE}.CANTIDAD ;;
    value_format: "#,##0"

    filters: {
      field: trimestre
      value: "yes"
    }

  }

  measure: Total_cantidad_desperdicio_anual {
    label: "Total Kgs Desperdicio Anual"
    type: sum
    sql: ${TABLE}.CANTIDAD ;;
    value_format: "#,##0"

    filters: {
      field: anual
      value: "yes"
    }

  }






  measure: count {
    type: count
    drill_fields: [detail*]
  }



  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: fuente {
    type: string
    sql: ${TABLE}.FUENTE ;;
  }

  measure: Total_cantidad {
    label: "cati"
    type: sum
    sql: ${TABLE}.CANTIDAD ;;
    value_format: "#,##0"

  }



  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: Documento {
    type: string
    sql: ${TABLE}.Documento ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  measure: Total_cantidad_produccion {
    label: "Total Kgs Produccion"
    type: sum
    sql: ${TABLE}.TOTAL_KILOS_PRODUCCION   ;;
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
    {% if value <= 6 and  planta.planta_completo._value=="MF01 Cuautitlán, MX" %}
    <p> <span style="color: green;">{{ rendered_value }}</span></p>

      {% elsif value <= 6 and planta.planta_completo._value=="MF03 Mazatlan I, MX" %}
      <p> <span style="color: green;">{{ rendered_value }}</span></p>

      {% elsif value <= 6 and planta.planta_completo._value=="MF05 Mazatlan II, MX" %}
      <p> <span style="color: green;">{{ rendered_value }}</span></p>

      {% elsif value <= 2.9 and planta.planta_completo._value=="MF07 Tijuana, MX" %}
      <p> <span style="color: green;">{{ rendered_value }}</span></p>

      {% elsif value <= 4 and planta.planta_completo._value=="MF10 Monterrey , MX" %}
      <p> <span style="color: green;">{{ rendered_value }}</span></p>


      {% else %}
      <span style="color: red;">{{ rendered_value }}</span></p>
      {% endif %} ;;

    #html:
    #{% if value <= 16 %}
    #<p><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10> <span>{{ rendered_value }}</span></p>
    #  {% elsif  value > 16  %}
    #  <img src="https://findicons.com/files/icons/1036/function/48/circle_red.png"    height=10 width=10><span>{{ rendered_value }}</span></p>
    #  {% endif %} ;;

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
    value_format: "$#,##0"
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
