view: fct_ordenes_compra_otif {
  sql_table_name: `envases-analytics-qa.RPT_S4H_MX.vw_bsc_po_otif` ;;

  filter: fecha {
    type: date
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
  dimension: uid_po {
    type: string
    sql: ${TABLE}.UID_PO ;;
  }
  dimension: uid_pr {
    type: string
    sql: ${TABLE}.UID_PR ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PlantaPO ;;
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

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GrupoMaterialPO ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MaterialPO ;;
  }


  measure: count {
    type: count
  }

  measure: total_ordenes {
    type: count_distinct
    sql: case when ${fecha_entrega_plan_raw} >= cast({%date_start fecha%} as date) and  ${fecha_entrega_plan_raw} < cast({%date_end fecha%} as date) then ${uid_po} end;;
  }

  measure: ordenes_en_tiempo {
    type: count_distinct
    sql: case when ${fecha_entrega_plan_raw} >= cast({%date_start fecha%} as date) and
    ${fecha_entrega_plan_raw} < cast({%date_end fecha%} as date) and
    ${fecha_entrada_raw} <= date_add(${fecha_entrega_plan_raw}, interval 1 day)
    then ${uid_po} end;;
  }

  measure: otif {
    sql: case when ${ordenes_en_tiempo} = 0 then 0 else ${ordenes_en_tiempo} / ${total_ordenes} end;;
    value_format: "0.00%"
    html:
    {% if value >= 0.92 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 0.90 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% else %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% endif %} ;;
  }
}
