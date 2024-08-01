
view: inventarios_ciclicos {
  derived_table: {
    sql:
      with CONTEO_REAL AS(
      WITH
      MaterialInfo AS (
        SELECT
          MATERIAL,
          FECHA_DOCUMENTO,
          PLANTA,
          CLASIFICACION,
          EXTRACT(YEAR FROM FECHA_DOCUMENTO) AS anio,
          CASE
            WHEN clasificacion = 'A' THEN 120
            WHEN clasificacion = 'B' THEN 180
            WHEN clasificacion = 'C' THEN 365
          ELSE
          NULL
        END
          AS interval_days,
          DATE_DIFF(FECHA_DOCUMENTO, MIN(FECHA_DOCUMENTO) OVER (PARTITION BY PLANTA, MATERIAL, CLASIFICACION,EXTRACT(YEAR FROM FECHA_DOCUMENTO) ORDER BY FECHA_DOCUMENTO  ), DAY) AS DIAS_TRANSCURRIDOS
        FROM
          `envases-analytics-qa.RPT_S4H_MX.tbl_fact_inventarios_ciclicos`
        WHERE
           FECHA_DOCUMENTO BETWEEN    DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year) AND CAST({% date_start date_filter %} AS DATE)
      ),

      CONTEOS AS(
      SELECT
      PLANTA,
      MATERIAL,
      CLASIFICACION,
      anio,
      CASE
      WHEN DIAS_TRANSCURRIDOS = 0 THEN 'uno'
      WHEN CLASIFICACION = 'A' AND   DIAS_TRANSCURRIDOS  > 120 AND  DIAS_TRANSCURRIDOS <= 240 THEN 'dos'
      WHEN CLASIFICACION = 'A' AND   DIAS_TRANSCURRIDOS  > 240 AND  DIAS_TRANSCURRIDOS <= 365 THEN 'tres'
      WHEN CLASIFICACION = 'B' AND  DIAS_TRANSCURRIDOS > 180 AND DIAS_TRANSCURRIDOS <= 365 THEN 'dos'
      ELSE null
      END AS bandera
      FROM MaterialInfo
      group by 1,2,3,4,5
      )

      SELECT
      PLANTA,
      CLASIFICACION,
      anio,
      count(*) AS cantidad
      FROM
      CONTEOS
      WHERE bandera is not null
      group by 1,2,3

      ),
      METAR AS (
      SELECT
      PLANTA,
      CLASIFICACION,
      count(DISTINCT MATERIAL) AS META
      FROM
      `envases-analytics-qa.RPT_S4H_MX.vw_bsc_ic_metas` as a
      WHERE
      CLASIFICACION is not null
      GROUP BY 1,2
      ORDER BY 1
      ),
      META_FORMULA AS(
      SELECT
      CASE
      WHEN CLASIFICACION  = 'A' THEN ((META*3)/EXTRACT(WEEK FROM LAST_DAY(CAST({% date_start date_filter %} AS DATE), YEAR) ))*EXTRACT(WEEK(MONDAY)  FROM  CAST({% date_start date_filter %} AS DATE))
      WHEN CLASIFICACION  = 'B' THEN ((META*2)/EXTRACT(WEEK FROM LAST_DAY(CAST({% date_start date_filter %} AS DATE), YEAR) ))*EXTRACT(WEEK(MONDAY)  FROM  CAST({% date_start date_filter %} AS DATE))
      WHEN CLASIFICACION  = 'C' THEN ((META*1)/EXTRACT(WEEK FROM LAST_DAY(CAST({% date_start date_filter %} AS DATE), YEAR) ))*EXTRACT(WEEK(MONDAY)  FROM  CAST({% date_start date_filter %} AS DATE))
      END AS META,
      CLASIFICACION,
      PLANTA
      FROM METAR

      )

      SELECT
      a.CLASIFICACION,
      a.PLANTA,
      cantidad  AS total,
      META AS META_MTD ,
      (cantidad/META)*100 AS PORCENTAJE
      FROM CONTEO_REAL AS a
      LEFT JOIN META_FORMULA AS b
      ON a.CLASIFICACION = b.CLASIFICACION
      AND a.PLANTA = b.PLANTA

      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }


  dimension: clasificacion {
    type: string
    sql: ${TABLE}.CLASIFICACION ;;
  }


  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: cantidad_teorica {
    type: number
    sql: ${TABLE}.CANTIDAD_TEORICA;;
  }

  dimension: cantidad_contada {
    type: number
    sql: ${TABLE}.CANTIDAD_CONTADA;;
  }



  measure: Total_cantidad_contada {
    type: sum
    sql: ${TABLE}.CANTIDAD_CONTADA;;
    value_format: "#,##0"
  }


  measure: Total_cantidad_teorica {
    type: sum
    sql: ${TABLE}.CANTIDAD_TEORICA;;
    value_format: "#,##0"
  }





  measure: conteo_material_real_ytd {
    label: "Conteo Real YTD"
    type: sum
    sql: ${TABLE}.total ;;
    value_format: "0"
  }

  measure: conteo_material_meta_ytd {
    label: "Conteo Meta YTD"
    type: sum
    sql: ${TABLE}.META_MTD ;;
    value_format: "0"
  }


  measure: porc_real_meta {
    label: "% Real / Meta"
    type: number
    sql: (${conteo_material_real_ytd} / NULLIF(${conteo_material_meta_ytd},0) ) * 100 ;;

    value_format: "0\%"
  }


  measure: diferencia {
    label: "Diferencia"
    type: number
    sql: ${Total_cantidad_teorica}- ${Total_cantidad_contada} ;;
    value_format: "$#,##0"
  }

  measure: exactitud {
    label: "Exactitud"
    type: number
    sql: ${diferencia}  / ${Total_cantidad_teorica};;
    #  sql:(${cantidad_contada} - ${conteo_material_real_ytd} ) / ${cantidad_teorica};;
    value_format: "0"
  }











}
