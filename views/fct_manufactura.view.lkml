
view: fct_manufactura {
  derived_table: {


    sql:

    WITH produccion AS (
    SELECT DISTINCT
                     PLANTA
                    ,date_trunc(FECHA_FIN_REAL,month) FECHA_FIN_REAL
                    ,ID_GRUPO_MATERIAL
                    ,PUESTO_TRABAJO PUESTO_TRABAJO_PRODUCCION

      ,avg(CANTIDAD_BASE) CANTIDAD_BASE
      ,sum(CANTIDAD_ENTREGADA) CANTIDAD_ENTREGADA
      ,sum(CANTIDAD_BUENA_CONFIRMADA) CANTIDAD_BUENA_CONFIRMADA,
      FROM RPT_S4H_MX.vw_fact_prod_cap_manufactura
      --where FECHA_LIBERACION between '2024-12-01' and '2024-12-31'
      --   and FECHA_FIN_REAL between '2024-12-01' and '2024-12-31'

      WHERE CAST(FECHA_FIN_REAL AS date)
      between
      DATE_ADD( DATE_ADD(LAST_DAY(CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH )

      and   CASE
      WHEN {% date_start date_filter_FECHA_LIBERACION %} IS NOT NULL
      THEN DATE_ADD( CAST( {% date_end date_filter_FECHA_FIN_REAL %} AS DATE) , INTERVAL -1 DAY )
      ELSE DATE_ADD( LAST_DAY( CAST( {% date_start date_filter_FECHA_FIN_REAL %} AS DATE) ) , INTERVAL 1 DAY)
      END

      and CAST(FECHA_LIBERACION AS date)
      between
      CASE
      WHEN {% date_start date_filter_FECHA_LIBERACION %} IS NOT NULL
      THEN CAST( {% date_start date_filter_FECHA_LIBERACION %} AS DATE)
      ELSE DATE_ADD( DATE_ADD(LAST_DAY(CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH )
      END

      and  CASE
      WHEN {% date_start date_filter_FECHA_LIBERACION %} IS NOT NULL
      THEN DATE_ADD( CAST( {% date_end date_filter_FECHA_LIBERACION %} AS DATE) , INTERVAL -1 DAY)
      ELSE LAST_DAY( CAST( {% date_start date_filter_FECHA_FIN_REAL %} AS DATE) )
      END





      group by PLANTA
      ,date_trunc(FECHA_FIN_REAL,month)
      ,ID_GRUPO_MATERIAL
      ,PUESTO_TRABAJO_PRODUCCION

      ), OEE AS (

      select PLANTA
      ,date_trunc(FECHA,month) FECHA
      ,GRUPO_MATERIAL ID_GRUPO_MATERIAL
      ,PUESTO_TRABAJO

      , ROUND((
      ((SUM(qt_total_time)-SUM(qt_down_time))/NULLIF(SUM(qt_total_time),0))*
      (SUM(qt_yield)/NULLIF(sum(qt_target),0))*
      (SUM(qt_yield)/NULLIF(SUM(qt_yield+qt_scrap),0))
      )*100,2) AS OEE
# este es un comentario

      from RPT_S4H_MX.vw_fact_utilidad_eficiencia_oee_rpm r
      LEFT JOIN RPT_S4H_MX.vw_bsc_material m on m.id_material=r.id_material
      GROUP BY PLANTA,date_trunc(FECHA,month),GRUPO_MATERIAL ,PUESTO_TRABAJO
      ), ptto as (

      SELECT          PLANTA
      ,date_trunc(CAST(FECHA AS date),month) FECHA
      ,ID_GRUPO_MATERIAL
      ,SUM(CANTIDAD) MONTO
      from RPT_S4H_MX.vw_bsc_presupuesto_ventas
      GROUP BY PLANTA,date_trunc(CAST(FECHA AS date),month),ID_GRUPO_MATERIAL
      )

      select p.*
      ,o.OEE
      ,0 Monto_ventas from produccion p
      --LEFT JOIN ptto on ptto.planta=p.PLANTA
      --              and ptto.fecha  =date_trunc(p.FECHA_FIN_REAL,month)
      --              and ptto.ID_GRUPO_MATERIAL=p.ID_GRUPO_MATERIAL
      --              and ptto.PUESTO_TRABAJO=p.PUESTO_TRABAJO_PRODUCCION
      left join OEE o
      on o.planta=p.PLANTA
      and date_trunc(cast(o.FECHA as DATE),month)  =date_trunc(p.FECHA_FIN_REAL,month)
      and o.ID_GRUPO_MATERIAL=p.ID_GRUPO_MATERIAL
      and o.PUESTO_TRABAJO=p.PUESTO_TRABAJO_PRODUCCION


      ;;





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


  dimension: proceso {
    type: string
    sql: ${TABLE}.PROCESO ;;
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
    sql: ${TABLE}.PUESTO_TRABAJO_PRODUCCION ;;
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
    type: sum
    sql: ${TABLE}.CANTIDAD_BASE ;;
    value_format: "#,##0"


  }


  measure: Total_cantidad_base2 {
    label: "CAPACIDAD2"
    type: sum
    sql: SUM(AVG(${TABLE}.CANTIDAD_BASE));;
    value_format: "#,##0"


  }


  measure: Total_cantidad_rechazo_notificada {
    type: sum
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
    value_format: "#,##0"

  }

  measure: Total_cantidad_buena_confirmada {

    type: sum
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
    value_format: "#,##0"

  }

  measure: Total_cantidad_entregada {
    label: "PRODUCCIÓN"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
    value_format: "#,##0"
  }

  measure: Total_Monto_ventas {

    type: sum
    sql: ${TABLE}.Monto_ventas ;;
    value_format: "#,##0"
  }


  measure: Total_Cantidad_ventas {

    type: sum
    sql: ${TABLE}.Cantidad_ventas ;;
    value_format: "#,##0"
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

    value_format: "0\%"
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
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 100.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 85 and value <= 89.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

    #html:
    #{% if value <= 84.9 %}
    #<p> <span style="color: green;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10></p>

    #{% elsif  value >= 90.0  %}
    #<span style="color: red;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_red.png"    height=10 width=10></p>
    #{% elsif  value >= 85 and value <= 89.9 %}
    #<span style="color: #FFA800;">{{ rendered_value }}</span><img src="https://www.emojiall.com/images/240/apple/1f7e1.png"    height=10 width=10></p>
    #{% else %}
    #{{rendered_value}}
    #{% endif %} ;;

    value_format: "0\%"
  }





  measure: Total_porcentaje_producto_no_conforme {
    type: sum
    sql: ${TABLE}.PORCENTAJE_PRODUCTO_NO_CONFORME ;;

  }



  dimension: OEE {
    type: string
    sql: ${TABLE}.OEE ;;
  }

  dimension: Total_OEE {
    label: "OEE"
    type: string
    sql: ${TABLE}.OEE ;;
    value_format: "#,##0"


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
