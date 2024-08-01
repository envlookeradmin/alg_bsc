view: ordenes_compra {
  derived_table: {
    sql:

    select * from (
    select
      solicitudes.UID UID_PR,
      solicitudes.NUMERO_SOLICITUD,
      solicitudes.POSICION,
      solicitudes.FECHA_CREACION,
      solicitudes.FECHA_MODIFICACION FechaModificacionPR,
      solicitudes.FECHA_LIBERACION,
      solicitudes.ORDEN_COMPRA_UID,
      ordenes.NUMERO_ORDEN,
      ordenes.POSICION as POSICION_ORDEN,
      ordenes.FECHA_CREACION as FECHA_CREACION_ORDEN,
      ordenes.FECHA_MODIFICACION as FECHA_MODIFICACION_ORDEN,
      solicitudes.GRUPO_COMPRAS GrupoCompras,
      solicitudes.PLANTA,
      solicitudes.INDICADOR_LIBERACION,
      ordenes.ESTATUS,
      solicitudes.INDICADOR_BORRADO,
      solicitudes.CREADO_POR,
      solicitudes.TIEMPO_MAXIMO,
      ordenes.PROVEEDOR,
      CASE WHEN solicitudes.FECHA_MODIFICACION > ordenes.FECHA_CREACION THEN 0 ELSE

      -- DATE_DIFF(ordenes.FECHA_CREACION, solicitudes.FECHA_MODIFICACION, DAY)
      (SELECT COUNT(*) AS dias_habiles FROM UNNEST(GENERATE_DATE_ARRAY(solicitudes.FECHA_MODIFICACION,ordenes.FECHA_CREACION, INTERVAL 1 DAY)) AS fecha
      WHERE EXTRACT(DAYOFWEEK FROM fecha) BETWEEN 2 AND 6)

      END DiasAtencion,
      ordenes.FECHA_ENTREGA_PLAN FechaEntregaPlan,
      ordenes.FECHA_ENTRADA,
      cs.mes_vigencia Mes_solicitud,
      co.mes_vigencia Mes_orden,
      cs.rango_final_pedidos Fecha,
      co.rango_final_pedidos Fecha_orden,

      b.Gerencia,
      b.Gerente,
      b.Comprador,


      from
      `envases-analytics-qa.RPT_S4H_MX.tbl_fact_solicitudes_compra` solicitudes
      left join `envases-analytics-qa.RPT_S4H_MX.tbl_fact_ordenes_compra` ordenes on solicitudes.ORDEN_COMPRA_UID = ordenes.UID
      left join `envases-analytics-qa.RPT_S4H_MX.cat_cortes_compras_fechas` cs on solicitudes.FECHA_MODIFICACION>=cs.rango_inicial and solicitudes.FECHA_MODIFICACION<=cs.rango_final_solpeds
      left join `envases-analytics-qa.RPT_S4H_MX.cat_cortes_compras_fechas` co on  ordenes.FECHA_CREACION>=co.rango_inicial and  ordenes.FECHA_CREACION<=co.rango_final_pedidos
      left join `envases-analytics-qa.RPT_S4H_MX.vw_bsc_comprador` as b ON  solicitudes.GRUPO_COMPRAS = b.Grupo_Compras


      where {% condition Fecha_s_date %} CAST(cs.rango_final_pedidos AS TIMESTAMP) {% endcondition %}
      -- WHERE  CAST(solicitudes.FECHA_MODIFICACION AS date) >= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH) else CAST({% date_start date_filter %} AS DATE) end )
      --  and CAST(solicitudes.FECHA_MODIFICACION AS date) <= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then LAST_DAY(CAST({% date_start date_filter %} AS DATE)) else CAST({% date_end date_filter %} AS DATE) end )

      ) a



      where {% condition Fecha_s_date %} CAST(Fecha_orden AS TIMESTAMP) {% endcondition %}



      --WHERE  CAST(FECHA_CREACION_ORDEN AS date) >= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH) else CAST({% date_start date_filter2 %} AS DATE) end )
      --       and CAST(FECHA_CREACION_ORDEN AS date) <= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then LAST_DAY(CAST({% date_start date_filter %} AS DATE)) else CAST({% date_end date_filter2%} AS DATE) end )

      /*
      SELECT
      UID UID_PR,
      --    PR,
      POSICION PosicionPR,
      FECHA_CREACION FechaCreacionPR,
      FECHA_MODIFICACION FechaModificacionPR,
      FECHA_LIBERACION FechaLiberacionPR,
      -- UID_PO,
      -- PO,
      --  PosicionPO,
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

      FROM `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_ordenes_compra `
      */;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha Solicitud"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  filter: date_filter2 {
    label: "Fecha Orden2"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }




  dimension_group: Fecha_s {

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
    sql: CAST(${TABLE}.fecha AS TIMESTAMP) ;;
  }



  dimension: fecha_creacion_orden {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_CREACION_ORDEN ;;
  }

  dimension: uid_pr {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.UID_PR ;;
  }

  dimension: numero_solicitud {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.NUMERO_SOLICITUD ;;
  }

  dimension: posicion {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.POSICION ;;
  }

  dimension: numero_orden {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.NUMERO_ORDEN ;;
  }

  dimension: posicion_orden {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.POSICION_ORDEN ;;
  }

  dimension: fecha_modificacion_pr {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FechaModificacionPR ;;
  }

  dimension: fecha_creacion {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_CREACION ;;
  }

  dimension: dias_atencion {
    group_label: "Produccion"
    type: number
    sql: ${TABLE}.DiasAtencion ;;
  }

  dimension: tiempo_maximo {
    group_label: "Produccion"
    type: number
    sql: ${TABLE}.TIEMPO_MAXIMO ;;
  }

  dimension: fecha_liberacion {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_LIBERACION ;;
  }

  dimension: orden_compra_uid {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.ORDEN_COMPRA_UID ;;
  }

  dimension: fecha_modificacion_orden {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_MODIFICACION_ORDEN ;;
  }

  dimension: grupo_compras {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.GrupoCompras ;;
  }

  dimension: planta {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: indicador_liberacion {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.INDICADOR_LIBERACION ;;
  }

  dimension: estatus {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.ESTATUS ;;
  }

  dimension: indicador_borrado {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.INDICADOR_BORRADO ;;
  }

  dimension: creado_por {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.CREADO_POR ;;
  }

  dimension: proveedor {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.PROVEEDOR ;;
  }

  dimension: gerencia {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.Gerencia ;;
  }

  dimension: gerente {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.Gerente ;;
  }

  dimension: comprador {
    group_label: "Produccion"
    type: string
    sql: ${TABLE}.Comprador ;;
  }

  dimension: fecha_entrega_plan {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FechaEntregaPlan ;;
  }

  dimension: fecha_entrada {
    group_label: "Produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_ENTRADA ;;
  }










  dimension: Mes_solicitud {
    type: string
    sql: ${TABLE}.Mes_solicitud ;;
  }

  dimension: Mes_Orden {
    type: string
    sql: ${TABLE}.Mes_orden ;;
  }


  #Dimensiones
  dimension: Solicitud_Compra {
    type: string
    sql: ${TABLE}.PR ;;
  }
  dimension: Orden_Compra {
    type: string
    sql: ${TABLE}.ORDEN_COMPRA_UID ;;
  }








  dimension: Fecha_Modificacion_Solicitud{
    type: date
    sql: ${TABLE}.FechaModificacionPR ;;
  }


  dimension_group: Fecha_Modificacion_Solicitud2 {
    label: "Fecha_Modificacion_Solicitud2"
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


  dimension_group: FECHA_MODIFICACION_ORDEN {
    label: "FECHA_MODIFICACION_ORDEN"
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
    sql: CAST(${TABLE}.FECHA_MODIFICACION_ORDEN AS TIMESTAMP) ;;
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
    sql: case when ${TABLE}.Planta in ('MF01','MF51') then 'MF01'
              when ${TABLE}.Planta in ('MF02','MF52') then 'MF02'
              when ${TABLE}.Planta in ('MF03','MF53') then 'MF03'
              when ${TABLE}.Planta in ('MF04','MF54') then 'MF04'
              when ${TABLE}.Planta in ('MF05','MF55') then 'MF05'
              when ${TABLE}.Planta in ('MF06','MF56') then 'MF06'
              when ${TABLE}.Planta in ('MF07','MF57') then 'MF07'
              when ${TABLE}.Planta in ('MF08','MF58') then 'MF08'
              when ${TABLE}.Planta in ('MF09','MF59') then 'MF09'
              when ${TABLE}.Planta in ('MF10','MF60') then 'MF10' else ${TABLE}.Planta  end ;;
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
    sql:  DATE_TRUNC(CAST(${fecha_entrega_plan_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_entrega_plan_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)

      -- DATE_TRUNC(CAST(${fecha_solicitud_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      --  AND DATE_TRUNC(CAST(${fecha_solicitud_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)


      ;;
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

    #filters: {
    #  field: mes_actual_solicitud
    #  value: "yes"
    #}

    #drill_fields: [comprador.gerencia,Prom_Dias_Atencion]

    value_format: "0"
  }










  measure: Orden_En_Tiempo {
    label: "Orden en tiempo"
    type: count_distinct
    sql: CASE
        WHEN ${TABLE}.DiasAtencion <= ${TABLE}.Tiempo_Maximo THEN ${TABLE}.UID_PR
        END ;;

    #filters: {
    #  field: mes_actual_solicitud
    #  value: "yes"
    #}
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

    #filters: {
    #  field: mes_actual_solicitud
    #  value: "yes"
    #}
  }




  measure: Porc_Productividad_Alcanzada {
    label: "% Productividad Alcanzada Solps"
    sql: (${Orden_En_Tiempo}/NULLIF(${Solicitudes_Mes},0))*100  ;;

    html:
    {% if value > 94.0 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value <= 84.00 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 85.00 and value <= 94.00 %}
    <span style="color: #ffd100;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

    #drill_fields: [comprador.gerencia,Porc_Productividad_Alcanzada]

    value_format: "0.0\%"
  }



  measure: pri {
    type: average
    sql: 0 ;;
  }


  measure: prf {
    type: average
    sql: 84 ;;
  }


  measure: pai {
    type: average
    sql: 84.00 ;;
  }


  measure: paf {
    type: average
    sql: 94 ;;
  }


  measure: pvi {
    type: average
    sql: 94.00 ;;
  }


  measure: pvf {
    type: average
    sql: 100 ;;
  }


  measure: Porc_Productividad_Alcanzada_prueba2{
    label: "% Productividad Alcanzada Solps prueba2"
    sql: (${Orden_En_Tiempo}/NULLIF(${Solicitudes_Mes},0))*100  ;;

    html:



           {% if value > pvi._value and value <= pvf._value  %}
          <span style="color: green;">{{ rendered_value }}</span></p>

      {% elsif  value > pai._value and value <= paf._value %}
      <span style="color: #ffd100;">{{ rendered_value }}</span></p>

      {% elsif  value > pri._value and value <= prf._value %}
      <span style="color: #900C3F;">{{ rendered_value }}</span></p>

      {% else %}
      {{rendered_value}}
      {% endif %}



      ;;

    #drill_fields: [comprador.gerencia,Porc_Productividad_Alcanzada]

    value_format: "0.0\%"
  }




  measure: Porc_Productividad_Alcanzada_prueba{
    label: "% Productividad Alcanzada Solps prueba"
    sql: (${Orden_En_Tiempo}/NULLIF(${Solicitudes_Mes},0))*100  ;;

    html:

    {% if  fecha_solicitud_year._value== 2024 %}

                {% if value > 94.0 %}
                <span style="color: green;">{{ rendered_value }}</span></p>
                {% elsif  value <= 84.00 %}
                <span style="color: red;">{{ rendered_value }}</span></p>
                {% elsif  value >= 85.00 and value <= 94.00 %}
                <span style="color: #ffd100;">{{ rendered_value }}</span></p>
                {% else %}
                {{rendered_value}}
                {% endif %}

      {% else %}

      {% if value >= 95.0 %}
      <span style="color: red;">{{ rendered_value }}</span></p>
      {% elsif  value <= 84.00 %}
      <span style="color: #ffd100;">{{ rendered_value }}</span></p>
      {% elsif  value >= 85.00 and value <= 94.00 %}
      <span style="color: green;">{{ rendered_value }}</span></p>
      {% else %}
      {{rendered_value}}
      {% endif %}

      {% endif %}

      ;;

    #drill_fields: [comprador.gerencia,Porc_Productividad_Alcanzada]

    value_format: "0.0\%"
  }


  measure: registros {
    type: count_distinct
    sql: ${TABLE}.PO ;;
  }

  measure: count {
    type: count
  }


}
