
view: fct_seguridad {
  derived_table: {


    sql:

     SELECT * FROM (SELECT  ID_EVENTO,
      TITULO,
      CIRCUSTANCIAS_INCENDIO,
      DESCRIPCION_EQUIPO,
      CAST(FECHA AS DATE) FECHA,
      CLASIFICACION_INCIDENTE,
      CLASIFICACION_HERIDA,
      ESTADO,
      CENTRO,
      TIPO_EVENTO ,
      1 valor FROM `envases-analytics-qa.RPT_S4H_MX.vw_bsc_reporte_seguridad` where  TITULO like '%ADP%'

      union all

      SELECT '' ID_EVENTO,
      '' TITULO,
      ''  CIRCUSTANCIAS_INCENDIO,
      '' DESCRIPCION_EQUIPO,
      c.date FECHA,
      '' CLASIFICACION_INCIDENTE,
      '' CLASIFICACION_HERIDA,
      '' ESTADO,
      CENTRO,
      '' TIPO_EVENTO,
      0 valor
      FROM `envases-analytics-qa.RPT_S4H_MX.vw_bsc_reporte_seguridad` s
      CROSS JOIN  (select DATE from `envases-analytics-qa.ENVASES_REPORTING.CALENDAR`) c
      GROUP BY  s.CENTRO, c.date) A
      WHERE  DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH) AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)


      ;;
  }


  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }


  dimension: fecha_ultimo {
    type: string
    sql:  CONCAT(CASE when EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 1 THEN  'Enero '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 2 THEN  'Febrero '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 3 THEN  'Marzo '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 4 THEN  'Abril '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 5 THEN  'Mayo '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 6 THEN  'Junio '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 7 THEN  'Julio '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 8 THEN  'Agosto '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 9 THEN  'Septiembre '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 10 THEN 'Octubre '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 11 THEN 'Noviembre '
                      WHEN EXTRACT(Month FROM CAST({% date_start date_filter %} AS DATE))  = 12 THEN 'Diciembre '
                      end,CAST(EXTRACT(year FROM  CAST({% date_start date_filter %} AS DATE)) as STRING))  ;;
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
    sql: CAST(${TABLE}.FECHA AS TIMESTAMP) ;;


  }


  dimension: fecha {
    type: date
    sql: ${TABLE}.FECHA  ;;


  }


  dimension: is_current_period_trimestre{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -4 MONTH) AND DATE_TRUNC(CAST(${fecha} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }


  dimension: is_current_period_anual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${created_date} AS DATE),DAY) >= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year)  AND DATE_TRUNC(CAST(${created_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}.ID_EVENTO ;;
  }

  measure: coutn_id_evento {
    type: count_distinct
    sql: ${TABLE}.ID_EVENTO ;;
  }

  measure: count_trimestre {
    type: count_distinct
    sql: ${TABLE}.ID_EVENTO ;;

  }


  measure: Total_ADP {
    label: "ADP"
    type: sum
    sql:${TABLE}.valor ;;
    drill_fields: [id_evento,titulo]
  }




  dimension: titulo {
    type: string
    sql: ${TABLE}.TITULO ;;
  }

  dimension: circustancias_incendio {
    type: string
    sql: ${TABLE}.CIRCUSTANCIAS_INCENDIO ;;
  }

  dimension: descripcion_equipo {
    type: string
    sql: ${TABLE}.DESCRIPCION_EQUIPO ;;
  }



  dimension: clasificacion_incidente {
    type: string
    sql: ${TABLE}.CLASIFICACION_INCIDENTE ;;
  }

  dimension: clasificacion_herida {
    type: string
    sql: ${TABLE}.CLASIFICACION_HERIDA ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.TIPO_EVENTO ;;
  }

  set: detail {
    fields: [
      id_evento,
      titulo,
      circustancias_incendio,
      descripcion_equipo,
      fecha,
      clasificacion_incidente,
      clasificacion_herida,
      estado,
      centro,
      tipo_evento
    ]
  }
}
