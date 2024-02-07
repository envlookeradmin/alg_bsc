view: fct_seguridad_anual {
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
      1 valor FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_reporte_seguridad` where  TITULO like '%ADP%'

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
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_reporte_seguridad` s
      CROSS JOIN  (select DATE from `@{GCP_PROJECT}.@{REPORTING_DATASET}.CALENDAR`) c
      GROUP BY  s.CENTRO, c.date) A
      WHERE DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year) AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)



      ;;
  }


  filter: date_filter {
    label: "Período"
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
    sql: CAST(${TABLE}.FECHA AS TIMESTAMP) ;;

  }




  dimension: is_current_period_trimestre{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${created_date} AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH) AND DATE_TRUNC(CAST(${created_date} AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

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

  dimension: fecha {
    type: date
    sql:${TABLE}.FECHA  ;;
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
