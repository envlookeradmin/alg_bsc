
view: fct_manufactura {
  derived_table: {
    sql:

    WITH
      produccion AS (
        SELECT
          DISTINCT
          PLANTA
          ,date_trunc(FECHA_FIN_REAL,month) FECHA_FIN_REAL
          ,ID_GRUPO_MATERIAL
          ,PUESTO_TRABAJO PUESTO_TRABAJO_PRODUCCION
          ,avg(CANTIDAD_BASE) CANTIDAD_BASE
          ,sum(CANTIDAD_ENTREGADA) CANTIDAD_ENTREGADA
          ,sum(CANTIDAD_BUENA_CONFIRMADA) CANTIDAD_BUENA_CONFIRMADA,
          FROM RPT_S4H_MX.vw_fact_prod_cap_manufactura
          /*WHERE CAST(FECHA_FIN_REAL AS date)
          between
          DATE_ADD( DATE_ADD(LAST_DAY(CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH )

          and   CASE
          WHEN {% date_start date_filter_FECHA_LIBERACION %} IS NOT NULL
          THEN DATE_ADD( CAST( {% date_end date_filter_FECHA_FIN_REAL %} AS DATE) , INTERVAL -1 DAY )
          ELSE DATE_ADD( LAST_DAY( CAST( {% date_start date_filter_FECHA_FIN_REAL %} AS DATE) ) , INTERVAL 1 DAY)
          END*/

        WHERE
          CAST(FECHA_FIN_REAL AS date) BETWEEN CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE) AND
          DATE_ADD(CAST({% date_end date_filter_FECHA_FIN_REAL %} AS DATE), INTERVAL -1 DAY)
        GROUP BY
          PLANTA
          ,date_trunc(FECHA_FIN_REAL,month)
          ,ID_GRUPO_MATERIAL
          ,PUESTO_TRABAJO_PRODUCCION
      ),
      OEE AS (
        SELECT
          PLANTA
          ,date_trunc(FECHA,month) FECHA
          ,GRUPO_MATERIAL ID_GRUPO_MATERIAL
          ,PUESTO_TRABAJO
          ,SUM(qt_total_time) as qt_total_time
          ,SUM(qt_down_time) as qt_down_time
          ,SUM(qt_yield) as qt_yield
          ,SUM(qt_scrap) as qt_scrap
          ,SUM(qt_target) as qt_target
        FROM RPT_S4H_MX.vw_fact_utilidad_eficiencia_oee_rpm r
        LEFT JOIN RPT_S4H_MX.vw_bsc_material m on m.id_material=r.id_material
        WHERE
          CAST(FECHA AS date) BETWEEN CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE) AND
          DATE_ADD(CAST({% date_end date_filter_FECHA_FIN_REAL %} AS DATE), INTERVAL -1 DAY)
        GROUP BY PLANTA,date_trunc(FECHA,month),GRUPO_MATERIAL ,PUESTO_TRABAJO
      ),
      budget as (
        SELECT
          PLANTA
          ,date_trunc(CAST(FECHA AS date),month) FECHA
          ,ID_GRUPO_MATERIAL
          ,SUM(CANTIDAD) MONTO
        FROM RPT_S4H_MX.tbl_bsc_presupuesto_ventas
        WHERE
          CAST(FECHA AS date) BETWEEN CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE) AND
          DATE_ADD(CAST({% date_end date_filter_FECHA_FIN_REAL %} AS DATE), INTERVAL -1 DAY)
        GROUP BY PLANTA,date_trunc(CAST(FECHA AS date),month),ID_GRUPO_MATERIAL
      )

      select produccion.*
      ,qt_total_time
      ,qt_down_time
      ,qt_yield
      ,qt_scrap
      ,qt_target
      ,budget.MONTO Monto_ventas
      FROM produccion
      LEFT JOIN budget
      ON
        budget.planta=produccion.PLANTA
        and budget.fecha  =date_trunc(produccion.FECHA_FIN_REAL,month)
        and budget.ID_GRUPO_MATERIAL=produccion.ID_GRUPO_MATERIAL
      left join OEE o
      on o.planta=produccion.PLANTA
      and date_trunc(cast(o.FECHA as DATE),month)  =date_trunc(produccion.FECHA_FIN_REAL,month)
      and o.ID_GRUPO_MATERIAL=produccion.ID_GRUPO_MATERIAL
      and o.PUESTO_TRABAJO=produccion.PUESTO_TRABAJO_PRODUCCION;;


  }

  filter: date_filter_FECHA_FIN_REAL {
    label: "FECHA_FIN_REAL"
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


  dimension: is_current_period_MONTH{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${created_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH) AND DATE_TRUNC(CAST(${created_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }


  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: fecha_fin_real {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_FIN_REAL ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }

  dimension: Puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABAJO_PRODUCCION ;;
  }


  dimension: cantidad_base {
    type: number
    sql: ${TABLE}.CANTIDAD_BASE  ;;
  }

  dimension: cantidad_entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }

  dimension: cantidad_buena_confirmada {
    type: number
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
  }

  dimension: Linea_producto {
    type: string
    sql: UPPER(${grupo_materiales.descripcion}) ;;
  }


  measure: Total_Monto_ventas {
    type: sum
    sql: CASE
          WHEN ${Puesto_trabajo}  IS  NULL THEN ${TABLE}.Monto_ventas
         ELSE NULL
        END;;
    value_format: "#,##0"
  }


  dimension: mostrar_fila {
    type: yesno
    sql:
    CASE
      WHEN ${Puesto_trabajo} IS NOT NULL THEN TRUE
      WHEN ${TABLE}.Monto_ventas IS NOT NULL THEN TRUE
      ELSE FALSE
    END ;;
  }

  dimension: dias_seleccionados  {
    type: number
    sql:  DATE_DIFF(CAST({% date_end date_filter_FECHA_FIN_REAL %} AS DATE), CAST({% date_start date_filter_FECHA_FIN_REAL %} AS DATE), DAY) ;;
  }

  measure: Total_cantidad_base {
    label: "CAPACIDAD"
    type: sum
    sql: ${TABLE}.CANTIDAD_BASE * 22.5 *  ${dias_seleccionados};;
    value_format: "#,##0"
  }

  measure: Total_cantidad_entregada {
    label: "PRODUCCIÓN"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
    value_format: "#,##0"
  }

  measure: Total_cantidad_buena_confirmada {
    type: sum
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
    value_format: "#,##0"

  }

  measure: Total_NIVEL_REAL {
    label: "% NIVEL DE OCUPACIÓN REAL"
    type: number
    sql:   ( ${Total_cantidad_buena_confirmada} /NULLIF(${Total_cantidad_base},0)) *100;;

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

  measure: Total_OEE {
    type: number
    label: "OEE"
    value_format: "#,##0"
    sql: ROUND(
          ((SUM(${TABLE}.qt_total_time) - SUM(${TABLE}.qt_down_time))/NULLIF(SUM(${TABLE}.qt_total_time),0)) *
          (SUM(${TABLE}.qt_yield)/NULLIF(SUM(${TABLE}.qt_target),0)) *
          (SUM(${TABLE}.qt_yield)/NULLIF(SUM(${TABLE}.qt_yield) + SUM(${TABLE}.qt_scrap),0))
          * 100, 2);;
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


}
