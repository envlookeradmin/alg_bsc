
view: inventarios_ciclicos {
  derived_table: {
    sql: SELECT
          a.UID_DOCUMENTO,
          a.PLANTA,
          a.ID_ITEM,
          a.ESTATUS,
          a.FECHA_DOCUMENTO,
          a.ESTATUS_CANTIDAD,
          a.CANTIDAD_TEORICA,
          a.CANTIDAD_CONTADA,
          a.MATERIAL,
          b.CLASIFICACION,
          b.CONTEOS,
          c.WEEK,
          SUBSTRING(a.FECHA_DOCUMENTO,1 ,4) AS ANIO,
          COUNT(distinct a.MATERIAL) OVER (PARTITION BY a.MATERIAL,a.PLANTA, SUBSTRING(a.FECHA_DOCUMENTO,1 ,4), c.WEEK ) as CONTEO_MATERIAL
          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_inventarios_ciclicos` a
          left join `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_ic_metas` b
          on TRIM(a.PLANTA) = TRIM(b.PLANTA) and SUBSTRING(a.FECHA_DOCUMENTO,1 ,4) = b.ANIO_EJERCICIO and TRIM(a.MATERIAL) = TRIM(b.MATERIAL)
          left join `@{GCP_PROJECT}.@{REPORTING_DATASET2}.CALENDAR` c
          on a.FECHA_DOCUMENTO = c.CALDAY  ;;
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
    type: string
    sql: ${TABLE}.FECHA_DOCUMENTO;;
  }

  dimension: fecha {
    type: date
    sql: ${fecha.fecha} ;;
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

  measure: Conteo_material_real {
    label: "Conteo Real MTD"
    type: sum
    sql: CASE WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= CAST({% date_start date_filter %} AS DATE) THEN ${TABLE}.CONTEO_MATERIAL END;;

    value_format: "0"
  }

  measure: Conteo_material_meta {
    label: "Conteo Meta MTD"
    type: sum
    sql: CASE WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= CAST({% date_start date_filter %} AS DATE) THEN ${TABLE}.CONTEO_MATERIAL * 2 END;;

    value_format: "0"
  }

  measure: Porc_real_meta {
    label: "% Real / Meta"
    type: number
    sql: (${Conteo_material_real} / ${Conteo_material_meta}) * 100 ;;

    value_format: "0.00\%"
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
