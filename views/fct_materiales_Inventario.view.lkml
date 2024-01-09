view: materiales_inventario {
  derived_table: {
    sql:
        SELECT
        *
        FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_materiales_stock`
        where  fecha between  DATE_TRUNC(DATE_ADD( CAST({% date_start date_filter %} AS DATE), INTERVAL -2 month) , month)
        and  LAST_DAY(DATE (CAST({% date_start date_filter %} AS DATE)))   ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_material {
    type: string
    sql: ${TABLE}.ID_MATERIAL ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }



  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;
  }

  dimension: stock_inspeccion_calidad {
    type: number
    sql: ${TABLE}.STOCK_INSPECCION_CALIDAD ;;
  }

  dimension: stock_bloqueado {
    type: number
    sql: ${TABLE}.STOCK_BLOQUEADO ;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }

  dimension: fecha {
    type: date
    #sql:  PARSE_DATE('%Y/%m/%d', ${TABLE}.FECHA)   ;;
    sql:  ${TABLE}.FECHA  ;;
  }

  dimension: fecha_agrupador {
    type: date
    sql:  ${TABLE}.FECHA  ;;
  }

  dimension_group: dim_fecha_agrupador {
    label: "Dim fecha agrupador"
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
    sql: CAST(${fecha_agrupador}  AS TIMESTAMP) ;;
  }

  dimension: mes_actual{
    #type:  string
    hidden: yes
    type: yesno
    sql: ${TABLE}.FECHA >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${TABLE}.FECHA <= CAST({% date_start date_filter %} AS DATE)  ;;
  }

  dimension: mes_anterior{
    hidden: yes
    type: yesno
    sql: ${TABLE}.FECHA >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND ${TABLE}.FECHA <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }

  dimension: desc_grupo_material {
    label: "Grupo material"
    type: string
    sql: ${grupo_materiales.descripcion} ;;
  }

  dimension: planta {
    label: "Planta"
    sql: ${planta.planta_comercializadora} ;;

    #link: {
    # label: "Grupo Material"
    #url: "https://envases.cloud.looker.com/dashboards/132?&Fecha={{ _filters['materiales_inventario.date_filter'] | url_encode }}&Planta={{ materiales_inventario.Planta._value | url_encode}}"
    #}
  }

    dimension: lote {
      type: string
      sql: ${TABLE}.LOTE ;;
    }

    dimension: valor_actual_stock_libre_utilizacion {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
    }

    dimension: valor_actual_inspeccion_calidad {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD ;;
    }

    dimension: valor_actual_bloqueado {
      type: number
      sql: ${TABLE}.VALOR_ACTUAL_BLOQUEADO ;;
    }

  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }


    measure: Total_pt {
      label: "PT"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [grupo_materiales.tipo_nc: "PT"]

      drill_fields: [desc_grupo_material,Total_pt]
      value_format: "$#,##0.00"
    }

    measure: Total_pt_mes_act {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
      ;;
      filters: [grupo_materiales.tipo_nc: "PT"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_pt_mes_ant {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
          ;;
      filters: [grupo_materiales.tipo_nc: "PT"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_pt {
      label: "Variación PT"
      type: number
      sql: ${Total_pt_mes_ant}
        ;;

      html:
      {% if materiales_inventario.Total_pt_mes_act._value == materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_pt_mes_act._value > materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_pt_mes_act._value < materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
      {% else %}
      <p> {{ rendered_value }} </p>
      {% endif %} ;;
      value_format: "$#,##0.00"

    }


    measure: Total_Componentes {
      label: "Componentes"
      type: sum
      sql:( ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [grupo_materiales.tipo_nc: "Componentes"]

      drill_fields: [desc_grupo_material,Total_Componentes]
      value_format: "$#,##0.00"
    }

    measure: Total_comp_mes_act {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [grupo_materiales.tipo_nc: "Componentes"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_comp_mes_ant {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [grupo_materiales.tipo_nc: "Componentes"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_componente {
      label: "Variación Componente"
      type: number
      sql: CASE WHEN ${Total_comp_mes_act} = ${Total_comp_mes_ant} THEN 1 --AMARILLO
                WHEN ${Total_comp_mes_act} > ${Total_comp_mes_ant} THEN 2 --ROJO
                WHEN ${Total_comp_mes_act} < ${Total_comp_mes_ant} THEN 3 --VERDE
                END
          ;;

        html:
        {% if value == 1 %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8>{{ materiales_inventario.Total_comp_mes_act._value }}</p>
        {% elsif value == 2 %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8>{{ materiales_inventario.Total_comp_mes_act._value }}</p>
        {% elsif value == 3 %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8>{{ materiales_inventario.Total_comp_mes_act._value }}</p>
        {% else %}
        <p>{{ materiales_inventario.Total_comp_mes_act._value }}</p>
        {% endif %} ;;

      value_format: "$#,##0.00"

      }

    measure: Total_Hoja {
      label: "Hoja"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [grupo_materiales.tipo_nc: "Hoja"]

      drill_fields: [desc_grupo_material,Total_Hoja]
      value_format: "$#,##0.00"
    }

    measure: Total_hoja_mes_act {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [grupo_materiales.tipo_nc: "Hoja"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_hoja_mes_ant {
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [grupo_materiales.tipo_nc: "Hoja"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_hoja {
      label: "Variación Hoja"
      type: number
      sql: CASE WHEN ${Total_hoja_mes_act} = ${Total_hoja_mes_ant} THEN 1 --AMARILLO
                WHEN ${Total_hoja_mes_act} > ${Total_hoja_mes_ant} THEN 2 --ROJO
                WHEN ${Total_hoja_mes_act} < ${Total_hoja_mes_ant} THEN 3 --VERDE
                END
            ;;

        html:
          {% if value == 1 %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8>{{ materiales_inventario.Total_hoja_mes_act._value }} </p>
          {% elsif value == 2 %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8>{{ materiales_inventario.Total_hoja_mes_act._value }} </p>
          {% elsif value == 3 %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8>{{ materiales_inventario.Total_hoja_mes_act._value }} </p>
          {% else %}
          <p>{{ materiales_inventario.Total_hoja_mes_act._value }}</p>
          {% endif %} ;;

        }

    set: detail {
      fields: [
        id_material,
        centro,
        stock_libre_utilizacion,
        stock_inspeccion_calidad,
        stock_bloqueado,
        grupo_material,
        fecha,
        lote,
        valor_actual_stock_libre_utilizacion,
        valor_actual_inspeccion_calidad,
        valor_actual_bloqueado
      ]
    }
  }
