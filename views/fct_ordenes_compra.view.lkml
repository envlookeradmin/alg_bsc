view: ordenes_compra {
  derived_table: {
    sql:
      SELECT
        CONCAT(PR.banfn,PR.bnfpo) UID_PR,
        PR.banfn PR,
        PR.bnfpo PosicionPR,
        PR.badat FechaCreacionPR,
        PR.erdat FechaModificacionPR,
        PR.frgdt FechaLiberacionPR,
        CONCAT(PR.ebeln, PR.ebelp) UID_PO,
        PO.ebeln PO,
        PR.ebelp PosicionPO,
        PO.aedat FechaCreacionPO,
        POP.aedat FechaModificacionPOP,
        PR.ekgrp GrupoCompras, PR.werks Planta,
        PR.frgkz Release, PO.statu Status, PR.loekz Borrado,
        PR.ernam,
        GC.Tiempo_Maximo,
        PO.lifnr Proveedor,
        case when PR.erdat > PO.aedat then 0 else DATE_DIFF(PO.aedat,PR.erdat,DAY) end DiasAtencion,
        DP.eindt FechaEntregaPlan,
        RP.cpudt FechaEntregaReal
      FROM `envases-analytics-eon-poc.RAW_S4H_MX.eban` PR join
      `envases-analytics-eon-poc.RAW_S4H_MX.cat_grupos_compras` GC on PR.ekgrp = GC.Codigo LEFT JOIN
      `envases-analytics-eon-poc.RAW_S4H_MX.ekko` PO ON PR.ebeln = PO.ebeln left join
      `envases-analytics-eon-poc.RAW_S4H_MX.ekpo` POP ON PR.ebeln = POP.ebeln AND PR.ebelp = POP.ebelp left join
      (select ebeln, ebelp, max(eindt) eindt from `envases-analytics-eon-poc.RAW_S4H_MX.eket` group by ebeln, ebelp) DP ON PR.ebeln = DP.ebeln AND PR.ebelp = DP.ebelp left join
      (select ebeln, ebelp, max(cpudt) cpudt from `envases-analytics-eon-poc.RAW_S4H_MX.ekbe` group by ebeln, ebelp) RP ON PR.ebeln = RP.ebeln AND PR.ebelp = RP.ebelp
      where
        PR.werks like 'MF%' and PR.frgkz = 'L' and PR.statu = 'B' and PR.loekz = '' and PR.ebeln IS NOT NULL;;
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
    type: string
    sql: ${TABLE}.GrupoCompras ;;
  }
  dimension: Planta {
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: PlantaCompletoOTIF {
    type: string
    sql: ${planta.planta_completo} ;;

    link: {
      label: "Gerencia"
      url: "https://envases.cloud.looker.com/dashboards/132?&Fecha={{ _filters['ordenes_compra.date_filter'] | url_encode }}&Planta={{ ordenes_compra.Planta._value | url_encode}}"
    }
  }

  dimension: PlantaCompletoProd {
    type: string
    sql: ${planta.planta_completo} ;;

    link: {
      label: "Gerencia"
      url: "https://envases.cloud.looker.com/dashboards/133?&Fecha={{ _filters['ordenes_compra.date_filter'] | url_encode }}&Planta={{ ordenes_compra.Planta._value | url_encode}}"
    }
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
    sql: CAST(${TABLE}.FechaModificacionPR AS TIMESTAMP) ;;
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

  #Metricas
  measure: Orden_Completa {
    label: "Orden completa"
    type: count_distinct
    sql: CASE
        WHEN ${TABLE}.FechaEntregaReal <= DATE_ADD (${TABLE}.FechaEntregaPlan, INTERVAL 1 DAY) THEN ${TABLE}.UID_PR
        END ;;
  }

  measure: Orden_Mes {
    label: "Total ordenes"
    type: count_distinct
    sql: ${TABLE}.UID_PR ;;
  }

  measure: OTIF {
    label: "OTIF"
    type: number
    sql: (${Orden_Completa}/NULLIF(${Orden_Mes},0))*100  ;;

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

    drill_fields: [comprador.gerencia,OTIF]

    value_format: "0.00\%"
  }

  measure: Prom_Dias_Atencion{
    label: "Promedio Días de Atención"
    type: average
    sql: ${TABLE}.DiasAtencion ;;

    filters: {
      field: mes_actual_solicitud
      value: "yes"
    }

    drill_fields: [comprador.gerencia,Prom_Dias_Atencion]

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

  measure: Solicitudes_Mes{
    label: "Toral solicitudes"
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

    drill_fields: [comprador.gerencia,Porc_Productividad_Alcanzada]

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
