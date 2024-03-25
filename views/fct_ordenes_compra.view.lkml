view: ordenes_compra {
  derived_table: {
    sql:
      SELECT
        UID_PR,
        PR,
        PosicionPR,
        FechaCreacionPR,
        FechaModificacionPR,
        FechaLiberacionPR,
        UID_PO,
        PO,
        PosicionPO,
        FechaCreacionPO,
        FechaModificacionPOP,
        GrupoCompras, Planta,
        Release, Status, Borrado,
        ernam,
        Tiempo_Maximo,
        Proveedor,
        DiasAtencion,
        FechaEntregaPlan,
        FechaEntregaReal
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_ordenes_compra`;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  #Dimensiones
  dimension: Solicitud_Compra {
    type: string
    sql: ${TABLE}.PR ;;
  }
  dimension: Orden_Compra {
    type: string
    sql: ${TABLE}.PO ;;
  }
  dimension: Fecha_Modificacion_Solicitud{
    type: date
    sql: ${TABLE}.FechaModificacionPR ;;
  }
  dimension: Fecha_Creacion_PO{
    type: date
    sql: ${TABLE}.FechaCreacionPO ;;
  }
  dimension: Grupo_Compras {
    hidden: yes
    type: string
    sql: ${TABLE}.GrupoCompras ;;
  }
  dimension: Planta {
    hidden: yes
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: PlantaCompletoOTIF {
    type: string
    sql: ${planta.planta_completo} ;;

    #link: {
    #  label: "Gerencia"
    #  url: "https://envases.cloud.looker.com/dashboards/132?&Fecha={{ _filters['ordenes_compra.date_filter'] | url_encode }}&Planta={{ ordenes_compra.Planta._value | url_encode}}"
    #}
  }

  dimension: PlantaCompletoProd {
    type: string
    sql: ${planta.planta_completo} ;;

    #link: {
    #  label: "Gerencia"
    #  url: "https://envases.cloud.looker.com/dashboards/133?&Fecha={{ _filters['ordenes_compra.date_filter'] | url_encode }}&Planta={{ ordenes_compra.Planta._value | url_encode}}"
    #}
  }


  dimension: Proveedor {
    type: string
    sql: ${TABLE}.Proveedor ;;
  }

  dimension: Estatus_Orden {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension_group: fecha_orden {
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
    sql: CAST(${TABLE}.FechaCreacionPO AS TIMESTAMP) ;;
  }

  dimension_group: fecha_solicitud {
    label: "FechaSolicitud"
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
    sql: CAST(${TABLE}.FechaModificacionPR AS TIMESTAMP) ;;
  }

  dimension_group: fecha_entrega_plan {
    label: "Fecha Plan"
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
    sql: CAST(${TABLE}.FechaEntregaPlan AS TIMESTAMP) ;;
  }

  dimension: valores_anuales_orden{
    type: number
    sql: CASE
    WHEN DATE_TRUNC(CAST(${fecha_orden_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND DATE_TRUNC(CAST(${fecha_orden_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE) THEN 1
      ELSE 0
      END;;
  }

  dimension: mes_actual_solicitud{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_solicitud_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_solicitud_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
  }

  dimension: dias_atencion {
    type: number
    sql: ${TABLE}.DiasAtencion ;;
  }

  #Metricas
  #measure: Orden_Completa {
  #  label: "Orden completa"
  #  type: count_distinct
  #  sql: CASE
  #      WHEN ${TABLE}.FechaEntregaReal <= DATE_ADD (${TABLE}.FechaEntregaPlan, INTERVAL 1 DAY) THEN ${TABLE}.UID_PR
  #      END ;;
  #}


  #measure: Orden_Mes {
  #  label: "Total ordenes"
  #  type: count_distinct
  #  sql: ${TABLE}.UID_PO ;;
  #}

  #measure: OTIF {
  #  label: "OTIF"
  #  type: number
  #  sql: (${Orden_Completa}/NULLIF(${Orden_Mes},0))*100  ;;

  #  html:
  #  {% if value >= 92.0 %}
  #  <span style="color: green;">{{ rendered_value }}</span></p>
  #  {% elsif  value < 90.0 %}
  #  <span style="color: red;">{{ rendered_value }}</span></p>
  #  {% elsif  value >= 90.0 and value <= 91.9 %}
  #  <span style="color: #FFA800;">{{ rendered_value }}</span></p>
  #  {% else %}
  #  {{rendered_value}}
  #  {% endif %} ;;

  #  drill_fields: [comprador.gerencia,OTIF]

  #  value_format: "0.00\%"
  #}

  measure: Prom_Dias_Atencion{
    label: "Promedio Días de Atención"
    type: average
    sql: ${TABLE}.DiasAtencion ;;

    filters: {
      field: mes_actual_solicitud
      value: "yes"
    }

    #drill_fields: [comprador.gerencia,Prom_Dias_Atencion]

    value_format: "0"
  }

  measure: Orden_En_Tiempo {
    label: "Orden en tiempo"
    type: count_distinct
    sql: CASE
        WHEN ${TABLE}.DiasAtencion <= ${TABLE}.Tiempo_Maximo THEN ${TABLE}.UID_PR
        END ;;

    filters: {
      field: mes_actual_solicitud
      value: "yes"
    }
  }

  measure: Orden_En_Tiempo_Obj {
    label: "Orden en tiempo obj"
    type: count_distinct
    sql: CASE
        WHEN ${TABLE}.DiasAtencion <= (${TABLE}.Tiempo_Maximo / 2) THEN ${TABLE}.UID_PR
        END ;;

    #filters: {
    #  field: mes_actual_solicitud
    #  value: "yes"
    #}
  }

  measure: Solicitudes_Mes{
    label: "Total solicitudes"
    type: count_distinct
    sql: ${TABLE}.UID_PR ;;

      filters: {
        field: mes_actual_solicitud
        value: "yes"
      }
  }

  measure: Porc_Productividad_Alcanzada {
    label: "% Productividad Alcanzada Solps"
    sql: (${Orden_En_Tiempo}/NULLIF(${Solicitudes_Mes},0))*100  ;;

    html:
    {% if value >= 92.0 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 90.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 91.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

    #drill_fields: [comprador.gerencia,Porc_Productividad_Alcanzada]

    value_format: "0.00\%"
  }

  measure: registros {
    type: count_distinct
    sql: ${TABLE}.PO ;;
  }

  measure: count {
    type: count
  }


}
