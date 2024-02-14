
view: inventarios_ciclicos {
  derived_table: {
    sql: SELECT
          a.UID_DOCUMENTO,
          a.PLANTA,
          a.ID_ITEM,
          a.ESTATUS,
          a.FECHA_DOCUMENTO,

          CASE
          WHEN ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) order by a.FECHA_DOCUMENTO ) =1
          THEN EXTRACT(WEEK FROM a.FECHA_DOCUMENTO)
          END AS NUM_SEMANA_TRANS,

          CASE
          WHEN ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) order by a.FECHA_DOCUMENTO ) = 1
          THEN MAX(EXTRACT(WEEK FROM a.FECHA_DOCUMENTO)) OVER (PARTITION BY EXTRACT(YEAR FROM a.FECHA_DOCUMENTO) )
          END AS NUM_SEMANA_ANIO,

          a.ESTATUS_CANTIDAD,
          a.CANTIDAD_TEORICA,
          a.CANTIDAD_CONTADA,
          a.MATERIAL,
          b.CLASIFICACION,
          b.CONTEOS,

          CASE
          WHEN ROW_NUMBER() OVER (PARTITION BY a.MATERIAL,a.PLANTA, EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) ) = 1
          THEN COUNT(distinct a.MATERIAL) OVER (PARTITION BY a.MATERIAL,a.PLANTA, EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) )
          END as CONTEO_MATERIAL

          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_inventarios_ciclicos` a
          left join `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_ic_metas` b
          on TRIM(a.PLANTA) = TRIM(b.PLANTA) and CAST(EXTRACT(YEAR FROM a.FECHA_DOCUMENTO) AS STRING) = b.ANIO_EJERCICIO
          and TRIM(a.MATERIAL) = TRIM(b.MATERIAL)
           ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension: uid_documento {
    type: string
    sql: ${TABLE}.UID_DOCUMENTO ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: id_item {
    type: string
    sql: ${TABLE}.ID_ITEM ;;
  }

  dimension: estatus {
    type: string
    sql: ${TABLE}.ESTATUS ;;
  }

  dimension: fecha_documento {
    type: date
    sql: ${TABLE}.FECHA_DOCUMENTO;;
  }

  dimension: num_semana_trans {
    type: number
    sql: ${TABLE}.NUM_SEMANA_TRANS;;
  }

  dimension: num_semana_anio {
    type: number
    sql: ${TABLE}.NUM_SEMANA_ANIO;;
  }

  dimension: fecha {
    type: date
    sql: ${fecha.fecha} ;;
  }

  dimension: semana {
    type: string
    sql: ${TABLE}.WEEK ;;
  }

  dimension: estatus_cantidad {
    type: string
    sql: ${TABLE}.ESTATUS_CANTIDAD ;;
  }

  dimension: cantidad_teorica {
    type: number
    sql: ${TABLE}.CANTIDAD_TEORICA ;;
  }

  dimension: cantidad_contada {
    type: number
    sql: ${TABLE}.CANTIDAD_CONTADA ;;
  }

  #dimension: cantidad_total {
    #type: number
    #sql: ${TABLE}.CANTIDAD_TOTAL ;;
  #}

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: clasificacion {
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }

  dimension: conteos {
    type: number
    sql: ${TABLE}.CONTEOS ;;
  }

  dimension: conteo_material {
    type: number
    sql: ${TABLE}.CONTEO_MATERIAL ;;
  }

  #medidas
  measure: Total_cantidad_teorica {
    type: sum
    sql: ${TABLE}.CANTIDAD_TEORICA ;;
  }

  #measure: Total_cantidad_total {
    #type: sum
    #sql: ${TABLE}.CANTIDAD_TOTAL ;;
  #}

  measure: conteo_material_real {
    label: "Conteo Real MTD"
    type: count_distinct
    sql: CASE
           WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${material}
         END;;

    value_format: "0"
  }

  measure: conteo_material_meta {
    label: "Conteo Meta MTD"
    type: sum
    sql: CASE
          WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
          AND ${fecha} <= CAST({% date_start date_filter %} AS DATE)
          THEN ( ( ${conteo_material} * ${conteos} ) / ${num_semana_anio} ) * ${num_semana_trans}
         END;;

    value_format: "0"
  }

  measure: porc_real_meta {
    label: "% Real / Meta"
    type: number
    sql: (${conteo_material_real} / NULLIF(${conteo_material_meta},0) ) * 100 ;;

    value_format: "0.00\%"
  }

  measure: exactitud {
    label: "Exactitud"
    type: sum
    sql:  ( ${cantidad_contada} - ${cantidad_teorica} ) / ${cantidad_teorica} ;;

    value_format: "0"
  }

  measure: diferencia {
    label: "Diferencia"
    type: sum
    sql: ${cantidad_contada} - ${cantidad_teorica}  ;;
    value_format: "$#,##0.00"
  }

  set: detail {
    fields: [
        uid_documento,
        planta,
        id_item,
        estatus,
        fecha_documento,
        estatus_cantidad,
        cantidad_teorica,
        material,
        clasificacion
    ]
  }
}
