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
        PR.frgkz Release, PR.statu Status, PR.loekz Borrado,
        PR.ernam,
        GC.Tiempo_Maximo,
        PO.lifnr Proveedor,
        case when PR.erdat > PO.aedat then 0 else DATE_DIFF(PO.aedat,PR.erdat,DAY) end DiasAtencion,
        DP.eindt FechaEntregaPlan,
        RP.cpudt FechaEntregaReal,
        CASE WHEN RP.cpudt <= DATE_ADD (DP.eindt, INTERVAL 1 DAY) THEN PO.ebeln
        END AS OrdenCompleta,
        CASE
        WHEN PO.aedat <= DATE_ADD (PR.badat, INTERVAL GC.Tiempo_Maximo DAY) THEN PR.banfn
        END AS OrdenEnTiempo
      FROM `envases-analytics-eon-poc.RAW_S4H_MX_QA.eban` PR join
      `envases-analytics-eon-poc.RAW_S4H_MX_QA.cat_grupos_compras` GC on PR.ekgrp = GC.Codigo LEFT JOIN
      `envases-analytics-eon-poc.RAW_S4H_MX_QA.ekko` PO ON PR.ebeln = PO.ebeln left join
      `envases-analytics-eon-poc.RAW_S4H_MX_QA.ekpo` POP ON PR.ebeln = POP.ebeln AND PR.ebelp = POP.ebelp left join
      (select ebeln, ebelp, max(eindt) eindt from `envases-analytics-eon-poc.RAW_S4H_MX_QA.eket` group by ebeln, ebelp) DP ON PR.ebeln = DP.ebeln AND PR.ebelp = DP.ebelp left join
      (select ebeln, ebelp, max(cpudt) cpudt from `envases-analytics-eon-poc.RAW_S4H_MX_QA.ekbe` group by ebeln, ebelp) RP ON PR.ebeln = RP.ebeln AND PR.ebelp = RP.ebelp
      where
        PR.werks like 'MF%' and PR.frgkz = 'L' and PR.statu = 'B' and PR.loekz = '' and PR.ebeln IS NOT NULL;;
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
  dimension: Proveedor {
    type: string
    sql: ${TABLE}.Proveedor ;;
  }

  measure: Orden_Completa {
    label: "Orden completa"
    type: count_distinct
    sql: ${TABLE}.OrdenCompleta ;;
  }

  measure: Orden_Mes {
    label: "Total ordenes"
    type: count_distinct
    sql: ${TABLE}.PO ;;
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

    value_format: "0.00\%"
  }

  measure: Prom_Dias_Atencion{
    label: "Promedio Días de Atención"
    type: average
    sql: ${TABLE}.DiasAtencion ;;

    value_format: "0"
  }

  measure: Orden_En_Tiempo {
    label: "Orden en tiempo"
    type: count_distinct
    sql: ${TABLE}.OrdenEnTiempo ;;
  }

  measure: Solicitudes_Mes{
    label: "Toral solicitudes"
    type: count_distinct
    sql: ${TABLE}.PR ;;
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

    value_format: "0.00\%"
  }

  measure: registros {
    type: count_distinct
    sql: ${TABLE}.PO ;;
  }


}
