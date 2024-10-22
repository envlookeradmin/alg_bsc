
view: fct_retorno_material_empaque {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.vw_retorno_material_empaque`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  parameter: Tipo {

    type: unquoted

    allowed_value: {
      label: "Stock"
      value: "Stock"
    }


    allowed_value: {
      label: "Valor"
      value: "Valor"
    }

  }

  filter: date_filter {
    label: "Año"
    type: date
  }





  #dimension: fecha {
  #  type: date
  #  datatype: date
  #  sql: ${TABLE}.FECHA ;;
  #}

  dimension_group: fecha {
    label: "Fecha"
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
    sql: CAST(${TABLE}.FECHA AS TIMESTAMP) ;;

  }

  dimension: tipo_planta {
    type: string
    sql: ${TABLE}.TIPO_PLANTA ;;
  }

  dimension: ID_CLIENTE {
    type: string
    sql: ${TABLE}.ID_CLIENTE ;;
  }




  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: lote {
    type: string
    sql: ${TABLE}.LOTE ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.TIPO ;;
  }

  dimension: codigo_cliente {
    type: string
    sql: ${TABLE}.CODIGO_CLIENTE ;;
  }

  dimension: libre_utilizacion {
    type: number
    sql: ${TABLE}.LIBRE_UTILIZACION ;;
  }

  dimension: inspeccion_validad {
    type: number
    sql: ${TABLE}.INSPECCION_VALIDAD ;;
  }

  dimension: valor_libre_utilizacion {
    type: number
    sql: ${TABLE}.VALOR_LIBRE_UTILIZACION ;;
  }

  dimension: valor_calidad {
    type: number
    sql: ${TABLE}.VALOR_CALIDAD ;;
  }

  measure: total_stock {
    type: sum
    sql: ${TABLE}.LIBRE_UTILIZACION ;;
    value_format: "#,##0.00"
  }

  measure: total_valor   {
    type:sum
    sql:${TABLE}.VALOR_LIBRE_UTILIZACION ;;
    value_format: "#,##0.00"

  }

  measure: total_stock_ly {
    type: sum
    sql: ${TABLE}.LIBRE_UTILIZACION ;;

    filters: {
      field: is_previous_year
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: total_valor_ly   {
    type:sum
    sql:${TABLE}.VALOR_LIBRE_UTILIZACION ;;

    filters: {
      field: is_previous_year
      value: "yes"
  }


    value_format: "#,##0.00"

  }


  dimension: grupo {
    type: string
    sql: ${TABLE}.GRUPO ;;
  }

  dimension: codigo_grupo_me {
    type: string
    sql: ${TABLE}.CODIGO_GRUPO_ME ;;
  }

  dimension: grupo_me_descripcion {
    type: string
    sql: ${TABLE}.GRUPO_ME_DESCRIPCION ;;
  }

  dimension: indicador_stock_especial {
    type: string
    sql: ${TABLE}.INDICADOR_STOCK_ESPECIAL ;;
  }

  dimension: is_previous_year {
    hidden: yes
    type: yesno
    sql:DATE_TRUNC(CAST(${fecha_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -3 AS STRING),"-01-01")  AS DATE)  AND DATE_TRUNC(CAST(${fecha_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)

        ;;
          ##  and  ${fecha_date} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
    }

  measure: indicador {
    label_from_parameter: Tipo
    type: number
    sql:
    {% if Tipo._parameter_value == 'Stock' %}
      ${total_stock}

      {% elsif Tipo._parameter_value == 'Valor' %}
      ${total_valor}
      {% endif %};;

    value_format: "#,##0.00"
  }

  measure: indicador_anual {
    label_from_parameter: Tipo
    type: number
    sql:
    {% if Tipo._parameter_value == 'Stock' %}
      ${total_stock_ly}

      {% elsif Tipo._parameter_value == 'Valor' %}
      ${total_valor_ly}
      {% endif %};;



    value_format: "#,##0.00"
  }






  set: detail {
    fields: [
        fecha_date,
  tipo_planta,
  planta,
  material,
  lote,
  tipo,
  codigo_cliente,
  libre_utilizacion,
  inspeccion_validad,
  valor_libre_utilizacion,
  valor_calidad,
  grupo,
  codigo_grupo_me,
  grupo_me_descripcion,
  indicador_stock_especial
    ]
  }
}
