
view: inventarios_ciclicos {
  derived_table: {
    sql: select
        FECHA_DOCUMENTO,
        PLANTA,
        CLASIFICACION,
        EXTRACT(WEEK FROM FECHA_DOCUMENTO) as NUM_SEMANA_TRANS,
        EXTRACT(WEEK FROM CAST(CONCAT(CAST(EXTRACT(YEAR FROM FECHA_DOCUMENTO) AS STRING),"-12-31") AS DATE) ) as NUM_SEMANA_ANIO,
        SUM(CONTEOS) AS CONTEOS,
        SUM(CONTEO_MATERIAL) AS CONTEO_MATERIAL,

        ( ( ( SUM(CONTEO_MATERIAL) * SUM(CONTEOS) ) /
        EXTRACT(WEEK FROM CAST(CONCAT(CAST(EXTRACT(YEAR FROM FECHA_DOCUMENTO) AS STRING),"-12-31") AS DATE) ) ) ) *
        EXTRACT(WEEK FROM FECHA_DOCUMENTO)  AS CONTEO_MATERIAL_META,

        SUM(CANTIDAD_TEORICA) AS CANTIDAD_TEORICA,
        SUM(CANTIDAD_CONTADA) AS CANTIDAD_CONTADA
        from (
        SELECT
        a.UID_DOCUMENTO,
        a.PLANTA,
        a.ID_ITEM,
        a.ESTATUS,

        MAX(a.FECHA_DOCUMENTO) OVER (PARTITION BY EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) ) AS FECHA_DOCUMENTO,

        a.ESTATUS_CANTIDAD,
        a.CANTIDAD_TEORICA,
        a.CANTIDAD_CONTADA,
        a.MATERIAL,
        b.CLASIFICACION,

        CASE
        WHEN ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO), b.CLASIFICACION, a.PLANTA ) = 1
        THEN b.CONTEOS
        END AS CONTEOS,

        CASE
        WHEN ROW_NUMBER() OVER (PARTITION BY a.MATERIAL,a.PLANTA, EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.FECHA_DOCUMENTO) ) = 1
        THEN COUNT(distinct a.MATERIAL) OVER (PARTITION BY a.MATERIAL,a.PLANTA, EXTRACT(YEAR FROM a.FECHA_DOCUMENTO), EXTRACT(WEEK FROM a.
        FECHA_DOCUMENTO) )
        END as CONTEO_MATERIAL

        FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_inventarios_ciclicos` a
        left join `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_ic_metas` b
        on TRIM(a.PLANTA) = TRIM(b.PLANTA) and CAST(EXTRACT(YEAR FROM a.FECHA_DOCUMENTO) AS STRING) = b.ANIO_EJERCICIO
        and TRIM(a.MATERIAL) = TRIM(b.MATERIAL)

        )
        where FECHA_DOCUMENTO >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
        and FECHA_DOCUMENTO <= CAST({% date_start date_filter %} AS DATE)

        GROUP BY 1,2,3,4,5
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

  #dimension: uid_documento {
   # type: string
    #sql: ${TABLE}.UID_DOCUMENTO ;;
  #}

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  #dimension: id_item {
   # type: string
   #sql: ${TABLE}.ID_ITEM ;;
  #}

  #dimension: estatus {
   # type: string
   #  sql: ${TABLE}.ESTATUS ;;
  #}

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

  #dimension: estatus_cantidad {
   # type: string
    #sql: ${TABLE}.ESTATUS_CANTIDAD ;;
  #}

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

  #dimension: material {
  #  type: string
  #  sql: ${TABLE}.MATERIAL ;;
  #}

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

  dimension: conteo_material_meta {
    type: number
    sql: ${TABLE}.CONTEO_MATERIAL_META ;;
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

  measure: conteo_material_real_ytd {
    label: "Conteo Real YTD"
    type: sum
    sql: ${conteo_material};;

    value_format: "0"
  }

  measure: conteo_material_meta_ytd {
    label: "Conteo Meta YTD"
    type: sum
    sql: ${conteo_material_meta} ;;

    value_format: "0"
  }

  measure: porc_real_meta {
    label: "% Real / Meta"
    type: number
    sql: (${conteo_material_real_ytd} / NULLIF(${conteo_material_meta_ytd},0) ) * 100 ;;

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
        planta,
        fecha_documento,
        cantidad_teorica,
        clasificacion
    ]
  }
}
