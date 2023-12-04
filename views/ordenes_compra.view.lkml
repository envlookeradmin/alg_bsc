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
        case when PR.erdat > PO.aedat then 0 else DATE_DIFF(PO.aedat,PR.erdat,DAY) end DiasAtencion,
        DP.eindt FechaEntregaPlan,
        RP.cpudt FechaEntregaReal
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
  dimension: Grupo_Compras {
    type: string
    sql: ${TABLE}.GrupoCompras ;;
  }

  measure: registros {
    type: count_distinct
    sql: ${TABLE}.PO ;;
  }

}
