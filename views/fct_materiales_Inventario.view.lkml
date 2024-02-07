view: materiales_inventario {
  derived_table: {
    sql:
        SELECT
        ms.fecha_costo,
        ms.ID_MATERIAL,
        ms.CENTRO,
        ms.TIPO_PROVEEDOR_CLIENTE,
        --ms.ID_PROVEDOR_CLIENTE,
        ms.STOCK_LIBRE_UTILIZACION,
        ms.STOCK_INSPECCION_CALIDAD,
        ms.STOCK_BLOQUEADO,
        ms.GRUPO_MATERIAL,
        ms.TIPO_STOCK,
        ms.FECHA,
        ms.FECHA as FECHA_ANT,
        --ms.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION,
        ms.VALOR_ACTUAL_INSPECCION_CALIDAD,
        ms.VALOR_ACTUAL_BLOQUEADO,
        ar.tipo AS TIPO_NC
        FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.vw_bsc_materiales_stock` ms
        left join `@{GCP_PROJECT}.@{REPORTING_DATASET4}.cat_grupo_articulos` as ar
          ON GRUPO_MATERIAL = grupo
          WHERE
           GRUPO_MATERIAL in ('BAS1010','DPL1012','LID1015','OPP1018','BFT1012','DPL1014','LID1017','PAI1017','BLI1018',
                      'DPL1015','LID1022','PLA1005','BPP1018','DPL1016','LID1023','PLA1008','BTM1016','DPL1017',
                      'LID1060','PLA1010','BTP1014','DPL1021','LID5800','PLA1012','CAN1005','DPL1060','LPL1005',
                      'PLA1014','CAN1010','DRM1022','LPL1008','PLA1015','CAN1012','DRM1023','LPL1010','PLA1016',
                      'CAN1014','DRM1026','LPL1012','PLA1017','CAN1015','END1014','LPL1014','PLA1019','CAN1016',
                      'END1017','LPL1015','PLA1021','CAN1019','EOE1005','LPL1016','PLA1023','CAN1024','EOE1010',
                      'LPL1017','PLA1060','CAN1060','EOE1019','LPL1019','PLA4000','DOM1016','JRY1025','LPL1021',
                      'TTP1014','DPL1005','LAM1030','LPL1030','TWO1021','DPL1008','LID1010','LPL1060','DPL1010',
                      'LID1012','OLI1018')
                      AND
                      CENTRO in ('MF01','MF02','MF03','MF04','MF05','MF06','MF07','MF08','MF09','MF10','GF01' ) AND
                      TIPO_PROVEEDOR_CLIENTE = 'Planta'

        and FECHA between  DATE_TRUNC(DATE_ADD( CAST({% date_start date_filter %} AS DATE), INTERVAL -2 month) , month)
        and LAST_DAY(DATE (CAST({% date_start date_filter %} AS DATE)))
        ;;
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

  dimension: tipo_nc {
    type: string
    sql: ${TABLE}.TIPO_NC ;;
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
    sql: ${TABLE}.FECHA_ANT >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND ${TABLE}.FECHA_ANT <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }

  dimension: 2_meses{
    type: number
    sql:
      CASE
          WHEN ${TABLE}.FECHA >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -3 MONTH)
          AND ${TABLE}.FECHA <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH)) THEN 1
          ELSE 0
          END;;
  }

  dimension: desc_mes_actual {
    type: string
    sql: CASE
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 1
         THEN 'Enero'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 2
         THEN 'Febrero'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 3
         THEN 'Marzo'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 4
         THEN 'Abril'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 5
         THEN 'Mayo'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 6
         THEN 'Junio'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 7
         THEN 'Julio'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 8
         THEN 'Agosto'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 9
         THEN 'Septiembre'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 10
         THEN 'Octubre'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 11
         THEN 'Noviembre'
         WHEN EXTRACT(MONTH FROM CAST({% date_start date_filter %} AS DATE) ) = 12
         THEN 'Diciembre'
         END
        ;;
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
    #url: "https://envases.cloud.looker.com/dashboards/132?&Fecha={{ _filters['materiales_inventario.date_filter'] | url_encode }}&Planta={{ materiales_inventario.planta._value | url_encode}}"
    #}
  }

    dimension: lote {
      type: string
      sql: ${TABLE}.LOTE ;;
    }

    #dimension: valor_actual_stock_libre_utilizacion {
      #type: number
      #sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
    #}

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

    #metricas expresadas en dinero
    measure: Total_pt {
      group_label: "Pesos"
      label: "PT"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "PT"]

      html:
      <p> {{ rendered_value }} </p>
      ;;

      drill_fields: [desc_grupo_material,Total_pt]
      value_format: "$#,##0.00"
    }

    measure: Total_pt_mes_act {
      group_label: "Pesos Semaforo"
      label: "PT mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
      ;;
      filters: [materiales_inventario.tipo_nc: "PT"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_pt_mes_ant {
      group_label: "Pesos Semaforo"
      label: "PT mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
          ;;
      filters: [materiales_inventario.tipo_nc: "PT"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_pt {
      group_label: "Pesos Semaforo"
      label: "PT"
      type: number
      sql: ${Total_pt_mes_act}
        ;;

      html:
      {% if materiales_inventario.Total_pt_mes_act._value == 0 %}
      <p> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_pt_mes_act._value == materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_pt_mes_act._value > materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_pt_mes_act._value < materiales_inventario.Total_pt_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
      {% else %}
      <p> {{ rendered_value }} </p>
      {% endif %} ;;

      value_format: "$#,##0.00"

      drill_fields: [desc_grupo_material,Total_pt_mes_ant,Total_pt_mes_act ]

    }


    measure: Total_Componentes {
      group_label: "Pesos"
      label: "Componentes"
      type: sum
      sql:( ${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "Componentes"]

      html:
      <p> {{ rendered_value }} </p>
      ;;

      drill_fields: [desc_grupo_material,Total_Componentes]
      value_format: "$#,##0.00"
    }

    measure: Total_comp_mes_act {
      group_label: "Pesos Semaforo"
      label: "Componentes mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Componentes"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_comp_mes_ant {
      group_label: "Pesos Semaforo"
      label: "Componentes mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Componentes"]

      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_componente {
      group_label: "Pesos Semaforo"
      label: "Componentes "
      type: number
      sql: ${Total_comp_mes_act}
          ;;

      html:
      {% if materiales_inventario.Total_comp_mes_act._value == 0 %}
      <p> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_comp_mes_act._value == materiales_inventario.Total_comp_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_comp_mes_act._value > materiales_inventario.Total_comp_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
      {% elsif materiales_inventario.Total_comp_mes_act._value < materiales_inventario.Total_comp_mes_ant._value %}
      <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
      {% else %}
      <p> {{ rendered_value }} </p>
      {% endif %} ;;

      value_format: "$#,##0.00"

      drill_fields: [desc_grupo_material,Total_comp_mes_ant,Total_comp_mes_act ]

      }

    measure: Total_Hoja {
      group_label: "Pesos"
      label: "Hoja"
      type: sum
      sql:(${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "Hoja"]

      html:
      <p> {{ rendered_value }} </p>
      ;;

      drill_fields: [desc_grupo_material,Total_Hoja]
      value_format: "$#,##0.00"
    }

    measure: Total_hoja_mes_act {
      group_label: "Pesos Semaforo"
      label: "Hoja mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Hoja"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_hoja_mes_ant {
      group_label: "Pesos Semaforo"
      label: "Hoja mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.VALOR_ACTUAL_INSPECCION_CALIDAD + ${TABLE}.VALOR_ACTUAL_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Hoja"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_hoja {
      group_label: "Pesos Semaforo"
      label: "Hoja"
      type: number
      sql: ${Total_hoja_mes_act}
            ;;

        html:
        {% if materiales_inventario.Total_hoja_mes_act._value == 0 %}
        <p> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_hoja_mes_act._value == materiales_inventario.Total_hoja_mes_ant._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_hoja_mes_act._value > materiales_inventario.Total_hoja_mes_ant._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_hoja_mes_act._value < materiales_inventario.Total_hoja_mes_ant._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
        {% else %}
        <p> {{ rendered_value }} </p>
        {% endif %} ;;

      value_format: "$#,##0.00"

      drill_fields: [desc_grupo_material,Total_hoja_mes_ant,Total_hoja_mes_act ]

        }

    #metricas expresadas en piezas

    measure: Total_pt_pzas {
      group_label: "Piezas"
      label: "PT"
      type: sum
      sql:(${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "PT"]

      html:
        <p> {{ rendered_value }} </p>
        ;;

      drill_fields: [desc_grupo_material,Total_pt_pzas]
      value_format: "#,##0"
    }

    measure: Total_pt_mes_act_pzas {
      group_label: "Piezas Semaforo"
      label: "PT mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "PT"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_pt_mes_ant_pzas {
      group_label: "Piezas Semaforo"
      label: "PT mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "PT"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_pt_pzas {
      group_label: "Piezas Semaforo"
      label: "PT"
      type: number
      sql: ${Total_pt_mes_act_pzas}
        ;;

      html:
        {% if materiales_inventario.Total_pt_mes_act_pzas._value == 0 %}
        <p> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_pt_mes_act_pzas._value == materiales_inventario.Total_pt_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_pt_mes_act_pzas._value > materiales_inventario.Total_pt_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_pt_mes_act_pzas._value < materiales_inventario.Total_pt_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
        {% else %}
        <p> {{ rendered_value }} </p>
        {% endif %} ;;

      value_format: "#,##0"

      drill_fields: [desc_grupo_material,Total_pt_mes_ant_pzas,Total_pt_mes_act_pzas ]

    }


    measure: Total_Componentes_pzas {
      group_label: "Piezas"
      label: "Componentes"
      type: sum
      sql:( ${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "Componentes"]

      html:
        <p> {{ rendered_value }} </p>
        ;;

      drill_fields: [desc_grupo_material,Total_Componentes_pzas]
      value_format: "#,##0"
    }

    measure: Total_comp_mes_act_pzas {
      group_label: "Piezas Semaforo"
      label: "Componentes mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Componentes"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_comp_mes_ant_pzas {
      group_label: "Piezas Semaforo"
      label: "Componentes mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Componentes"]

      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_componente_pzas {
      group_label: "Piezas Semaforo"
      label: "Componentes"
      type: number
      sql: ${Total_comp_mes_act_pzas}
        ;;

      html:
        {% if materiales_inventario.Total_comp_mes_act_pzas._value == 0 %}
        <p> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_comp_mes_act_pzas._value == materiales_inventario.Total_comp_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_comp_mes_act_pzas._value > materiales_inventario.Total_comp_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
        {% elsif materiales_inventario.Total_comp_mes_act_pzas._value < materiales_inventario.Total_comp_mes_ant_pzas._value %}
        <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
        {% else %}
        <p> {{ rendered_value }} </p>
        {% endif %} ;;

      value_format: "#,##0"

      drill_fields: [desc_grupo_material,Total_comp_mes_ant_pzas,Total_comp_mes_act_pzas ]

    }

    measure: Total_Hoja_pzas {
      group_label: "Piezas"
      label: "Hoja"
      type: sum
      sql:(${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO);;
      filters: [materiales_inventario.tipo_nc: "Hoja"]

      html:
        <p> {{ rendered_value }} </p>
        ;;

      drill_fields: [desc_grupo_material,Total_Hoja_pzas]
      value_format: "#,##0"
    }

    measure: Total_hoja_mes_act_pzas {
      group_label: "Piezas Semaforo"
      label: "Hoja mes actual"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Hoja"]
      filters: {
        field: mes_actual
        value: "yes"
      }

    }

    measure: Total_hoja_mes_ant_pzas {
      group_label: "Piezas Semaforo"
      label: "Hoja mes anterior"
      hidden: yes
      type: sum
      sql: (${TABLE}.STOCK_INSPECCION_CALIDAD + ${TABLE}.STOCK_BLOQUEADO)
        ;;
      filters: [materiales_inventario.tipo_nc: "Hoja"]
      filters: {
        field: mes_anterior
        value: "yes"
      }
    }

    measure: Variacion_hoja_pzas {
      group_label: "Piezas Semaforo"
      label: "Hoja"
      type: number
      sql: ${Total_hoja_mes_act_pzas}
        ;;

      html:
          {% if materiales_inventario.Total_hoja_mes_act_pzas._value == 0 %}
          <p> {{ rendered_value }} </p>
          {% elsif materiales_inventario.Total_hoja_mes_act_pzas._value == materiales_inventario.Total_hoja_mes_ant_pzas._value %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
          {% elsif materiales_inventario.Total_hoja_mes_act_pzas._value > materiales_inventario.Total_hoja_mes_ant_pzas._value %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
          {% elsif materiales_inventario.Total_hoja_mes_act_pzas._value < materiales_inventario.Total_hoja_mes_ant_pzas._value %}
          <p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
          {% else %}
          <p> {{ rendered_value }} </p>
          {% endif %} ;;

      value_format: "#,##0"

      drill_fields: [desc_grupo_material,Total_hoja_mes_ant_pzas,Total_hoja_mes_act_pzas ]

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
        valor_actual_inspeccion_calidad,
        valor_actual_bloqueado
      ]
    }
}
