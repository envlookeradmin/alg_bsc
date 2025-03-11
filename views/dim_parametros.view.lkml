view: dim_parametros {
#PARAMETRO DE SELECCIÓN PARA FECHA
  filter: date_filter {
    label: "Periodo"
    description: "Parámetro tipo fecha para guardar el valor(es) seleccionado por el usuario y aplicarlos en la lógica del cálculo de cada métrica"
    type: date
  }

#FILTROS Y DIMENSIONES PARA FILTRO DE FECHA
  dimension: fecha_inicio_mes {
    hidden: yes
    type: date
    sql: DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH);;
  }
  dimension: fecha_inicio_trimestre {
    hidden: yes
    type: date
    sql: DATE_SUB(DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH), INTERVAL 2 MONTH);;
  }
  dimension: fecha_inicio_anio {
    hidden: yes
    type: date
    sql: DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), YEAR);;
  }
  dimension: fecha_fin {
    hidden: yes
    type: date
    sql: DATE_SUB(CAST({% date_end date_filter %} AS DATE), INTERVAL 1 DAY);;
  }
#DIMENSIONES
  #Dimensiones para definir períodos
  dimension_group: fecha_documento {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_DOCUMENTO ;;
  }
  dimension: es_mes_seleccionado {
    type: yesno
    hidden: yes
    description: "Determina los registros que pertenecen al mes actual"
    sql: ${fecha_documento_raw} BETWEEN ${fecha_inicio_mes} AND ${fecha_fin};;
  }
  dimension: es_trim_seleccionado {
    type: yesno
    hidden: yes
    description: "Determina los registros que pertenecen al mes actual"
    sql: ${fecha_documento_raw} BETWEEN ${fecha_inicio_trimestre} AND ${fecha_fin};;
  }
  dimension: es_anio_seleccionado {
    type: yesno
    hidden: yes
    description: "Determina los registros que pertenecen al año actual"
    sql: ${fecha_documento_raw} BETWEEN ${fecha_inicio_anio} AND ${fecha_fin};;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.PLANTA ;;
  }
  dimension: nombre_planta {
    type: string
    sql: ${TABLE}.NOMBRE_PLANTA ;;
  }
  dimension: centro_beneficio {
    type: string
    sql: ${TABLE}.CENTRO_BENEFICIO ;;
  }
  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }
  dimension: descripcion_material {
    type: string
    sql: ${TABLE}.DESCRIPCION_MATERIAL ;;
  }
  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIAL ;;
  }
  dimension: descripcion_grupo_material {
    type: string
    sql: ${TABLE}.DESCRIPCION_GRUPO_MATERIAL ;;
  }
  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }
  dimension: importe {
    type: number
    sql: ${TABLE}.IMPORTE ;;
  }
}
