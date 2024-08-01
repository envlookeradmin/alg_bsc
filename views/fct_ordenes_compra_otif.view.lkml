view: fct_ordenes_compra_otif {

  #sql_table_name: `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_po_otif` ;;


  derived_table: {
    sql:

    SELECT
        a.PLANTA PlantaPO,
        concat(NUMERO_ORDEN, REGEXP_REPLACE(POSICION, '^0+','')) as ID,
        NUMERO_ORDEN,
        POSICION,
        a.GRUPO_MATERIAL,
        a.MATERIAL MaterialPO,
        a.FECHA_ENTRADA FechaEntrada,
        a.FECHA_ENTREGA_PLAN FechaEntregaPlan,
        CASE
        WHEN
        FECHA_ENTRADA <= DATE_ADD(FECHA_ENTREGA_PLAN, INTERVAL 1 DAY) THEN 1
        ELSE 0
        END FLAG_OTIF,
        b.Gerencia,
        a.CREADO_POR CreadoPorPO ,
        a.GRUPO_COMPRAS GrupoComprasPO,
        a.PROVEEDOR,
        a.FECHA_CREACION,
        a.FECHA_MODIFICACION fm,
        a.UID UID_PO,
        a.TIPO_IMPUTACION

      FROM
      `envases-analytics-qa.RPT_S4H_MX.tbl_fact_ordenes_compra` as a
      left join `envases-analytics-qa.RPT_S4H_MX.vw_bsc_comprador` as b
      ON  a.GRUPO_COMPRAS = b.Grupo_Compras
      WHERE
      CAST(FECHA_ENTREGA_PLAN AS date) between CAST({% date_start fecha %} AS DATE)  and   DATE_ADD(CAST({% date_end fecha %} AS DATE), INTERVAL -1 DAY)
      AND PROVEEDOR not in (SELECT Numero_SAP FROM `envases-analytics-qa.RPT_S4H_MX.cat_proveedores_recoleccion` )



      /*
      select
      solicitudes.UID,
      ordenes.UID UID_PO,
      ordenes.POSICION,
      solicitudes.FECHA_MODIFICACION,
      ordenes.FECHA_ENTREGA_PLAN FechaEntregaPlan ,
      ordenes.FECHA_ENTRADA FechaEntrada,
      ordenes.PLANTA PlantaPO ,
      ordenes.GRUPO_COMPRAS GrupoComprasPO,
      ordenes.CREADO_POR CreadoPorPO ,
      ordenes.PROVEEDOR,
      ordenes.FECHA_CREACION,
      ordenes.FECHA_MODIFICACION fm,
      prv.Es_Recoleccion,
      ordenes.TIPO_IMPUTACION,
      ordenes.GRUPO_MATERIAL,
      ordenes.MATERIAL MaterialPO
      from `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_solicitudes_compra` solicitudes full outer join
      `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_ordenes_compra` ordenes on solicitudes.ORDEN_COMPRA_UID = ordenes.UID left join
      `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_proveedor` prv on ordenes.PROVEEDOR = prv.Proveedor_ID
      where ordenes.UID is not null and CAST(ordenes.FECHA_ENTRADA AS date) between CAST({% date_start fecha %} AS DATE)  and  CAST({% date_end fecha %} AS DATE)
      and prv.Es_Recoleccion=0*/

      --WHERE
      --((solicitudes.FECHA_MODIFICACION >= '2004-02-01') OR
      --(ordenes.FECHA_ENTREGA_PLAN >= '2024-02-01'))
      ;;

  }



  filter: fecha {
    type: date
  }



  dimension: planta_po {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.PlantaPO ;;
  }

  dimension: id {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: numero_orden {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.NUMERO_ORDEN ;;
  }

  dimension: posicion {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.POSICION ;;
  }

  dimension: grupo_material {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  dimension: material_po {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.MaterialPO ;;
  }

  dimension: fecha_entrada {
    group_label: "produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FechaEntrada ;;
  }

  dimension: fecha_entrega_plan {
    group_label: "produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FechaEntregaPlan ;;
  }



  dimension: gerencia {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.Gerencia ;;
  }

  dimension: creado_por_po {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.CreadoPorPO ;;
  }

  dimension: grupo_compras_po {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.GrupoComprasPO ;;
  }

  dimension: proveedor {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.PROVEEDOR ;;
  }

  dimension: fecha_creacion {
    group_label: "produccion"
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_CREACION ;;
  }


  dimension: uid_po {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.UID_PO ;;
  }

  dimension: tipo_imputacion {
    group_label: "produccion"
    type: string
    sql: ${TABLE}.TIPO_IMPUTACION ;;
  }





  dimension_group: fecha_entrada {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaEntrada ;;
  }
  dimension_group: fecha_entrega_plan {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaEntregaPlan ;;
  }
  dimension_group: fecha_modificacion_pr {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaModificacionPR ;;
  }


  dimension_group: fecha_modificacion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_MODIFICACION ;;
  }



  dimension: uid_pr {
    type: string
    sql: ${TABLE}.UID_PR ;;
  }

  #dimension: planta {
  #  type: string
  #  sql: ${TABLE}.PlantaPO ;;
  #}

  dimension: planta {
    hidden: yes
    type: string
    sql: case when ${TABLE}.PlantaPO in ('MF01','MF51') then 'MF01'
              when ${TABLE}.PlantaPO in ('MF02','MF52') then 'MF02'
              when ${TABLE}.PlantaPO in ('MF03','MF53') then 'MF03'
              when ${TABLE}.PlantaPO in ('MF04','MF54') then 'MF04'
              when ${TABLE}.PlantaPO in ('MF05','MF55') then 'MF05'
              when ${TABLE}.PlantaPO in ('MF06','MF56') then 'MF06'
              when ${TABLE}.PlantaPO in ('MF07','MF57') then 'MF07'
              when ${TABLE}.PlantaPO in ('MF08','MF58') then 'MF08'
              when ${TABLE}.PlantaPO in ('MF09','MF59') then 'MF09'
              when ${TABLE}.PlantaPO in ('MF10','MF60') then 'MF10' else ${TABLE}.PlantaPO  end ;;
  }

  dimension: grupo_compras {
    type: string
    sql: ${TABLE}.GrupoComprasPO ;;
  }

  dimension: comprador {
    type: string
    sql: ${TABLE}.CreadoPorPO ;;
  }

  dimension: es_reco {
    type: number
    sql: ${TABLE}.Es_Recoleccion ;;
  }



  dimension: material {
    type: string
    sql: ${TABLE}.MaterialPO ;;
  }



  dimension: material_ot {
    type: string
    sql: case when ${fecha_entrega_plan_raw} >= cast({%date_start fecha%} as date) and
          ${fecha_entrega_plan_raw} < cast({%date_end fecha%} as date) and
          ${fecha_entrada_raw} <= date_add(${fecha_entrega_plan_raw}, interval 1 day)
          then ${uid_po} end ;;
  }


  measure: count {
    type: count
  }

  measure: total_ordenes {
    type: count_distinct
    # sql: case when ${fecha_entrega_plan_raw} >= cast({%date_start fecha%} as date) and  ${fecha_entrega_plan_raw} < cast({%date_end fecha%} as date) then ${uid_po} end;;

    # sql: case when ${fecha_modificacion_raw} >= cast({%date_start fecha%} as date) and  ${fecha_modificacion_raw} < cast({%date_end fecha%} as date) then ${uid_po} end;;
    sql:  ${uid_po};;
  }

  measure: ordenes_en_tiempo {
    type: count_distinct
    sql: case when ${fecha_entrega_plan_raw} >= cast({%date_start fecha%} as date) and
          ${fecha_entrega_plan_raw} < cast({%date_end fecha%} as date) and
          ${fecha_entrada_raw} <= date_add(${fecha_entrega_plan_raw}, interval 1 day)
          then ${uid_po} end;;
  }


  measure: FLAG_OTIF {
    type: sum
    sql: ${TABLE}.FLAG_OTIF ;;
  }







  measure: otif {
    sql: case when ${FLAG_OTIF} = 0 then 0 else ${FLAG_OTIF} / nullif(${total_ordenes},0)  *100  end;;
    value_format: "0.0\%"


    html:
    {% if value >= 85 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value <= 69 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 70 and value <= 84 %}
    <span style="color: #ffd100;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;
  }

}
