
view: fct_manufactura {
  derived_table: {
   #sql: select * from envases-analytics-qa.RPT_S4H_MX.vw_bsc_prod_cap_manufactura WHERE CAST(FECHA_FIN_REAL AS date) between DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH) and  DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)    ;;

  #   sql:select m.*,b.cantidad Cantidad_ventas,b.MONTO Monto_ventas from `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_fact_prod_cap_manufactura` m
  #      left join (select PLANTA,FECHA,ID_GRUPO_MATERIAL,SUM(CANTIDAD) CANTIDAD,SUM(MONTO) MONTO  from `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_presupuesto_ventas` GROUP BY PLANTA,FECHA,ID_GRUPO_MATERIAL) b on
  #    --  m.PLANTA=b.PLANTA
  #     CONCAT('MF', cast(SUBSTR(m.PLANTA,3,3) as int)+50)=b.PLANTA
  #  AND m.FECHA_FIN_REAL=b.FECHA
  #  AND m.ID_GRUPO_MATERIAL=b.ID_GRUPO_MATERIAL
  #
  # WHERE CAST(FECHA_FIN_REAL AS date) between DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH) and  DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)    ;;

sql:
 select m.*,v.monto Monto_ventas from (
select*
     ,row_number() over(PARTITION BY planta,ID_GRUPO_MATERIAL,FECHA_FIN_REAL order by FECHA_FIN_REAL) row
     ,case when PLANTA='MF01' then 'MF51'
           when PLANTA='MF02' then 'MF52'
           when PLANTA='MF03' then 'MF53'
           when PLANTA='MF04' then 'MF54'
           when PLANTA='MF05' then 'MF55'
           when PLANTA='MF07' then 'MF57' end PLANTA_VENTA

      from envases-analytics-eon-poc.RPT_S4H_MX.vw_fact_prod_cap_manufactura m
 WHERE CAST(FECHA_FIN_REAL AS date)   between CAST({% date_start date_filter_FECHA_FIN_REAL %}   AS DATE)  and  CAST({% date_end date_filter_FECHA_FIN_REAL %} AS DATE)
   and CAST(FECHA_LIBERACION AS date) between CAST({% date_start date_filter_FECHA_LIBERACION %} AS DATE)  and  CAST({% date_end date_filter_FECHA_LIBERACION %} AS DATE)
  and
    (PUESTO_TRABAJO IS NOT NULL
    OR PUESTO_TRABAJO != '' )
  AND CANTIDAD_BASE IS NOT NULL
) m

left join (SELECT PLANTA
                 ,FECHA
                 ,ID_GRUPO_MATERIAL
                 ,AVG(MONTO) MONTO  from envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_presupuesto_ventas
GROUP BY PLANTA,FECHA,ID_GRUPO_MATERIAL) v on v.planta=m.PLANTA_VENTA and v.FECHA=m.FECHA_FIN_REAL and v.ID_GRUPO_MATERIAL=m.ID_GRUPO_MATERIAL and m.row=1 ;;







  }


  filter: date_filter_FECHA_FIN_REAL {
    label: "FECHA_FIN_REAL"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  filter: date_filter_FECHA_LIBERACION {
    label: "FECHA_LIBERACION"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension_group: created {
    label: "Fecha"
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
    sql: CAST(${TABLE}.FECHA_FIN_REAL AS TIMESTAMP) ;;

  }

  dimension_group: FECHA_FIN_REAL {
    label: "FECHA FIN REAL"
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
    sql: CAST(${TABLE}.FECHA_FIN_REAL AS TIMESTAMP) ;;

  }

  dimension_group: FECHA_LIBERACION {
    label: "FECHA LIBERACION"
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
    sql: CAST(${TABLE}.FECHA_LIBERACION AS TIMESTAMP) ;;

  }






  dimension: is_current_period_MONTH{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${created_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH) AND DATE_TRUNC(CAST(${created_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: planta_venta {
    type: string
    sql: ${TABLE}.PLANTA_VENTA ;;
  }



  dimension: Puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABAJO ;;
  }




  dimension: fecha_fin_real {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_FIN_REAL ;;
  }

  dimension: liberacion_real {
    type: date
    datatype: date
    sql: ${TABLE}.LIBERACION_REAL ;;
  }

  dimension: orden {
    type: string
    sql: ${TABLE}.ORDEN ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }

  dimension: Linea_producto {
    type: string
    sql: UPPER(${grupo_materiales.descripcion}) ;;
  }

  dimension: unidad_peso {
    type: string
    sql: ${TABLE}.UNIDAD_PESO ;;
  }


  dimension: cantidad_rechazo_notificada {
    type: number
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
  }

  dimension: cantidad_buena_confirmada {
    type: number
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
  }

  dimension: cantidad_entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }


  dimension: porcentaje_producto_no_conforme {
    type: number
    sql: ${TABLE}.PORCENTAJE_PRODUCTO_NO_CONFORME ;;
  }

  dimension: cantidad_base {
    type: number
    sql: ${TABLE}.CANTIDAD_BASE ;;
  }

  measure: Total_cantidad_base {
    label: "CAPACIDAD"
    type: average
    sql: ${TABLE}.CANTIDAD_BASE ;;
    value_format: "#,##0.00"


  }


  measure: Total_cantidad_rechazo_notificada {
    type: sum
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
    value_format: "#,##0.00"

  }

  measure: Total_cantidad_buena_confirmada {

    type: sum
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
    value_format: "#,##0.00"

  }

  measure: Total_cantidad_entregada {
    label: "PRODUCCIÓN"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
    value_format: "#,##0.00"
  }

  measure: Total_Monto_ventas {

    type: average
    sql: ${TABLE}.Monto_ventas ;;
    value_format: "#,##0.00"
  }


  measure: Total_Cantidad_ventas {

    type: sum
    sql: ${TABLE}.Cantidad_ventas ;;
    value_format: "#,##0.00"
  }


  measure: Total_NIVEL_PRONOSTICADO {
    label: "% NIVEL DE OCUPACIÓN PRONOSTICADO"
    type: number
    sql:   ( ${Total_cantidad_base} /NULLIF(${Total_cantidad_entregada},0)) ;;

    html:
    {% if value <= 84.9 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 100.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 85 and value <= 89.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

    value_format: "0.00\%"
  }


  measure: Total_NIVEL_REAL {
    label: "% NIVEL DE OCUPACIÓN REAL"
    type: number
    sql:   ( ${Total_cantidad_buena_confirmada} /NULLIF(${Total_cantidad_base},0)) ;;





    # <p><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10>{{ rendered_value }}</p>

    #  <p><img  src="https://findicons.com/files/icons/766/base_software/128/circle_red.png" height=10 width=10>{{ rendered_value }}</p>
    # {% elsif  value >= 90.0 and value <= 100.0 %}




    html:
    {% if value <= 84.9 %}
   <p> <span style="color: green;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10></p>

      {% elsif  value >= 90.0  %}
      <span style="color: red;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_red.png"    height=10 width=10></p>
      {% elsif  value >= 85 and value <= 89.9 %}
      <span style="color: #FFA800;">{{ rendered_value }}</span><img src="https://www.emojiall.com/images/240/apple/1f7e1.png"    height=10 width=10></p>
      {% else %}
      {{rendered_value}}
      {% endif %} ;;

    value_format: "0.00\%"
  }





  measure: Total_porcentaje_producto_no_conforme {
    type: sum
    sql: ${TABLE}.PORCENTAJE_PRODUCTO_NO_CONFORME ;;

  }








  set: detail {
    fields: [
      planta,
      fecha_fin_real,
      liberacion_real,
      orden,
      id_material,
      id_grupo_material,
      cantidad_rechazo_notificada,
      cantidad_buena_confirmada,
      cantidad_entregada,
      unidad_peso,
      porcentaje_producto_no_conforme,
      cantidad_base
    ]
  }
}
