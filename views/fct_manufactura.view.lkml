
view: fct_manufactura {
  derived_table: {
    sql: select * from envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_prod_cap_manufactura  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }


  dimension: Puesto_trabajo {
    type: string
    sql: ${TABLE}.PUESTO_TRABADO ;;
  }




  dimension: fecha_fin_real {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_FIN_REAL ;;
  }

  dimension: liberacion_real {
    type: date
    datatype: date
    sql: ${TABLE}.LIBERACION_REAL ;;
  }

  dimension: orden {
    type: string
    sql: ${TABLE}.ORDEN ;;
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: id_grupo_material {
    type: string
    sql: ${TABLE}.ID_GRUPO_MATERIAL ;;
  }

  dimension: Linea_producto {
    type: string
    sql: UPPER(${grupo_materiales.descripcion}) ;;
  }

  dimension: unidad_peso {
    type: string
    sql: ${TABLE}.UNIDAD_PESO ;;
  }


  dimension: cantidad_rechazo_notificada {
    type: number
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
  }

  dimension: cantidad_buena_confirmada {
    type: number
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
  }

  dimension: cantidad_entregada {
    type: number
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
  }


  dimension: porcentaje_producto_no_conforme {
    type: number
    sql: ${TABLE}.PORCENTAJE_PRODUCTO_NO_CONFORME ;;
  }

  dimension: cantidad_base {
    type: number
    sql: ${TABLE}.CANTIDAD_BASE ;;
  }

  measure: Total_cantidad_base {
    type: sum
    sql: ${TABLE}.CANTIDAD_BASE ;;
  }


  measure: Total_cantidad_rechazo_notificada {
    type: sum
    sql: ${TABLE}.CANTIDAD_RECHAZO_NOTIFICADA ;;
    value_format: "#,##0.00"
  }

  measure: Total_cantidad_buena_confirmada {
    label: "PRODUCCIÓN"
    type: sum
    sql: ${TABLE}.CANTIDAD_BUENA_CONFIRMADA ;;
    value_format: "#,##0.00"
  }

  measure: Total_cantidad_entregada {
    label: "CAPACIDAD"
    type: sum
    sql: ${TABLE}.CANTIDAD_ENTREGADA ;;
    value_format: "#,##0.00"
  }

  measure: Total_NIVEL_PRONOSTICADO {
    label: "% NIVEL DE OCUPACIÓN PRONOSTICADO"
    type: number
    sql:   ( ${Total_cantidad_buena_confirmada} /NULLIF(${Total_cantidad_entregada},0)) ;;

    html:
    {% if value <= 84.9 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 100.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 85 and value <= 89.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

    value_format: "0.00\%"
  }


  measure: Total_NIVEL_REAL {
    label: "% NIVEL DE OCUPACIÓN REAL"
    type: number
    sql:   ( ${Total_cantidad_buena_confirmada} /NULLIF(${Total_cantidad_base},0)) ;;

    html:
    {% if value <= 84.9 %}
    <span style="color: green;">{{ rendered_value }}</span></p>
    {% elsif  value >= 90.0 and value <= 100.0 %}
    <span style="color: red;">{{ rendered_value }}</span></p>
    {% elsif  value >= 85 and value <= 89.9 %}
    <span style="color: #FFA800;">{{ rendered_value }}</span></p>
    {% else %}
    {{rendered_value}}
    {% endif %} ;;

      value_format: "0.00\%"
  }





  measure: Total_porcentaje_producto_no_conforme {
    type: sum
    sql: ${TABLE}.PORCENTAJE_PRODUCTO_NO_CONFORME ;;

  }








  set: detail {
    fields: [
        planta,
  fecha_fin_real,
  liberacion_real,
  orden,
  id_material,
  id_grupo_material,
  cantidad_rechazo_notificada,
  cantidad_buena_confirmada,
  cantidad_entregada,
  unidad_peso,
  porcentaje_producto_no_conforme,
  cantidad_base
    ]
  }
}
