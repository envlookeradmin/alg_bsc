view: fct_ordenes_pedidos_anual {
  derived_table: {
    sql:  SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_ordenes_pedidos`

             WHERE  CAST(fecha_entrega_planeada AS date) >= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), YEAR) else CAST({% date_start date_filter %} AS DATE) end )
                and CAST(fecha_entrega_planeada AS date) <= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then LAST_DAY(CAST({% date_start date_filter %} AS DATE)) else CAST({% date_end date_filter %} AS DATE) end )


      --where
      --   CAST(fecha_entrega_planeada AS date) between CAST({% date_start date_filter %} AS DATE)
      --      and DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY)

      --  WHERE DATE_TRUNC(CAST(fecha_entrega_planeada AS DATE),DAY) >=DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), year)
      --  AND DATE_TRUNC(CAST(fecha_entrega_planeada AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)

      -- AND DATE_TRUNC(CAST(FECHA_ENTREGA_REAL AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
      -- AND DATE_TRUNC(CAST(FECHA_ENTREGA_REAL AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)





      ;;
  }



  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }




  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: documento_venta {
    type: string
    sql: ${TABLE}.DOCUMENTO_VENTA ;;
  }

  dimension: solicitante {
    type: string
    sql: ${TABLE}.SOLICITANTE ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.ORGANIZACION_VENTAS ;;
  }

  dimension: fecha_entrega_planeada {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_ENTREGA_PLANEADA ;;
  }

  dimension: fecha_entrega_real {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_ENTREGA_REAL ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: peso_neto {
    type: number
    sql: ${TABLE}.PESO_NETO ;;
  }

  dimension: unidad_peso_material {
    type: string
    sql: ${TABLE}.UNIDAD_PESO_MATERIAL ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }



  dimension: cantidad_pendiente {
    type: number
    sql: ${TABLE}.CANTIDAD_PENDIENTE ;;
  }

  dimension: fill_rate {
    type: number
    sql: ${TABLE}.FILL_RATE ;;
  }

  dimension: flag_otif {
    type: number
    sql: ${TABLE}.FLAG_OTIF ;;
  }


  measure: Total_flag_otif {
    type: count
    # sql: ${TABLE}.FLAG_OTIF ;;
  }

  measure: Total_flag_otif_entregadas {
    type: count
    # sql: ${TABLE}.FLAG_OTIF ;;
    filters: [flag_otif: "1"]
  }


  dimension: cantidad_pedida {
    type: number
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }

  dimension: cantidad_entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }



  dimension: estatus_entrega {

    type: string
    sql: ${TABLE}.ESTATUS_ENTREGA ;;
  }

  measure: Total_cantidad_entregada {
    label: "Cantidad Entregada"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }


  measure: Total_cantidad_pedida {
    label: "Cantidad Pedida"
    type: sum
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }



  measure: prom_cantidad_entregada {
    label: "Cantidad Entregada"
    type: average
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }


  measure: prom_cantidad_pedida {
    label: "Cantidad Pedida"
    type: average
    sql: ${TABLE}.CANTIDAD_PEDIDA ;;
  }






  measure: Total_cantidad_pendiente {
    type: sum
    sql: ${TABLE}.CANTIDAD_PENDIENTE ;;
  }





  measure: OTIF {
    label: "OTIF"
    type: number
    sql:(${Total_flag_otif_entregadas} /nullif( ${Total_flag_otif},0)) *100  ;;
    value_format: "0.0\%"
    drill_fields: [grupo_materiales.descripcion,documento_venta,OTIF]


    html:
    {% if value >= 95 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 95.0  %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% endif %} ;;
  }

  measure: Total_fill_rate {
    label: "FILL RATE"
    type: average
    sql: ${TABLE}.FILL_RATE * 100 ;;
    value_format: "0.0\%"
    drill_fields: [grupo_materiales.descripcion,documento_venta,Total_fill_rate]

#grupo_materiales.descripcion,fecha_entrega_planeada,Total_cantidad_pedida,Total_cantidad_entregada

    html:
    {% if value >= 95 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 95.0  %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% endif %} ;;
  }

  measure: Total_FLAG_OTIF {
    label: "Total OTIF"
    type: sum
    sql: ${TABLE}.FLAG_OTIF ;;
    value_format: "0.0\%"
    drill_fields: [grupo_materiales.descripcion,documento_venta,Total_cantidad_pedida,Total_cantidad_entregada]



    html:
    {% if value >= 95 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value < 95.0  %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% endif %} ;;


  }



#  OTIF : Es el porcentaje de líneas de pedido entregadas en tiempo (Fecha Entrega Real vs Fecha Comprometida)
# y con el total de piezas pedidas (Cantidad Pedida vs Cantidad Entregada a Ventas).








  set: detail {
    fields: [
      documento_venta,
      solicitante,
      canal_distribucion,
      organizacion_ventas,
      fecha_entrega_planeada,
      fecha_entrega_real,
      planta,
      id_material,
      peso_neto,
      unidad_peso_material,
      id_grupo_material,
      cantidad_pedida,
      cantidad_entregada,
      cantidad_pendiente,
      fill_rate,
      estatus_entrega
    ]
  }
}
