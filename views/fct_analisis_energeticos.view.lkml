
view: fct_analisis_energeticos {
  derived_table: { #Cambiar la tabla derivada por la vista normal
    sql: SELECT * FROM `envases-analytics-qa.RPT_S4H_MX.tbl_analisis_energeticos` ;;
  }

#FECHAS
#Filtro que se usa para definir las dimensiones de mes actual y mes anterior
  filter: filtro_fecha {
    label: "Fecha"
    description: "Selecciona la fecha del recibo/servicio"
    type: date
  }

  dimension_group: fecha_documento {
    label: "Fecha Documento"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${TABLE}.fechaarchivo AS TIMESTAMP);;
  }

#Dimensiones tipo yesno para filtrar las métricas de mes actual y mes anterior
  dimension: mes_actual{
    description: "Filtra los registros que pertenecen al mes seleccionado"
    type: yesno
    hidden: yes
    sql:
    CAST(${fecha_documento_date} AS DATE) > CAST({% date_start filtro_fecha %} AS DATE) AND
    CAST(${fecha_documento_date} AS DATE) <= CAST({% date_end filtro_fecha %} AS DATE);;
  }
  dimension: mes_anterior{
    description: "Filtra los registros que pertenecen al mes anterior al mes seleccionado"
    type: yesno
    hidden: yes
    sql:
      CAST(${fecha_documento_date} AS DATE) > DATE_SUB(CAST({% date_start filtro_fecha %} AS DATE), INTERVAL 1 MONTH) AND
      CAST(${fecha_documento_date} AS DATE) <= DATE_SUB(CAST({% date_end filtro_fecha %} AS DATE), INTERVAL 1 MONTH);;
  }

#Fechas adicionales en la tabla
  dimension: fechafactura {
    description: "Campo original de la tabla que incluye intervalo de fechas de servicio"
    label: "Fecha Facturación"
    type: string
    hidden: yes
    sql: ${TABLE}.fechafactura ;;
  }

  dimension: fecha_inicio {
    description: "Fecha inicial del servicio facturado"
    label: "Inicio"
    group_label: "Fechas Facturación"
    type: date
    datatype: date
    sql: ${TABLE}.fecha_inicio ;;
  }

  dimension: fecha_fin {
    description: "Fecha final del servicio facturado"
    label: "Fin"
    group_label: "Fechas Facturación"
    type: date
    datatype: date
    sql: ${TABLE}.fecha_fin ;;
  }

#DIMENSIONES
  dimension: id {
    description: "Número identificador único para el registro"
    label: "ID"
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: institucion {
    description: "Empresa emisora del recibo/documento"
    label: "Institución"
    type: string
    sql: ${TABLE}.institucion ;;
  }
  dimension: facturadopara {
    description: "Planta a la que corresponde el recibo"
    label: "Facturado para:"
    type: string
    sql: ${TABLE}.facturadopara ;;
  }
  dimension: tiposervicio {
    description: "Tipo de servicio: LUZ / GAS"
    label: "Tipo Servicio"
    type: string
    sql: ${TABLE}.tiposervicio ;;
  }

#DIMENSIONES OCULTAS PARA LAS MÉTRICAS
  dimension: importe {
    description: "Monto de la factura"
    hidden: yes
    type: number
    sql: ${TABLE}.importe ;;
  }
  dimension: factordepotencia {
    description: "Factor de Potencia"
    hidden: yes
    type: number
    sql: ${TABLE}.factordepotencia ;;
  }
  dimension: consumokwh {
    description: "Consumo en KWs"
    hidden: yes
    type: number
    sql: ${TABLE}.consumokwh ;;
  }
  dimension: metroscubicos {
    description: "Metros cúbicos"
    hidden: yes
    type: number
    sql: ${TABLE}.metroscubicos ;;
  }
  dimension: porcentaje {
    description: "Porcentaje para ajustar los montos en las plantas que comparten División"
    hidden: yes
    type: number
    sql: CAST(CASE WHEN ${TABLE}.porcentaje = '' THEN '100' ELSE ${TABLE}.porcentaje END AS NUMERIC) ;;
  }
  dimension: total_kilos_produccion {
    description: "Total Kilos de Producción"
    hidden: yes
    type: number
    sql: ${TABLE}.total_kilos_produccion ;;
  }

#MÉTRICAS
#Métricas de LUZ
  measure: luz_importe_actual {
    description: "Importe del mes seleccionado"
    label: "Importe"
    group_label: "Luz"
    type: sum
    sql: ${importe} ;;
    filters: [tiposervicio: "LUZ",mes_actual: "yes"]
    value_format: "$#,##0.00"
  }
  measure: luz_importe_anterior {
    description: "Importe del mes anterior al seleccionado"
    label: "Importe Mes Anterior"
    group_label: "Luz"
    type: sum
    sql: ${importe} ;;
    filters: [tiposervicio: "LUZ",mes_anterior: "yes"]
    value_format: "$#,##0.00"
  }
  measure: kw_consumidos_actual {
    description: "KWs consumidos del mes seleccionado"
    label: "KWs Consumidos"
    group_label: "Luz"
    type: sum
    sql: ${consumokwh} * ( ${porcentaje} / 100 ) ;;
    filters: [tiposervicio: "LUZ", mes_actual: "yes"]
    value_format: "#,##0.00"
  }
  measure: kw_consumidos_anterior {
    description: "KWs consumidos del mes anterior al seleccionado"
    label: "KWs Consumidos Mes Anterior"
    group_label: "Luz"
    type: sum
    sql: ${consumokwh} * ( ${porcentaje} / 100 ) ;;
    filters: [tiposervicio: "LUZ", mes_anterior: "yes"]
    value_format: "#,##0.00"
  }
  measure: factor_potencia_actual {
    description: "Factor de potencia del mes seleccionado"
    label: "Factor de Potencia"
    group_label: "Luz"
    type: max
    sql: ${factordepotencia} / 100 ;;
    html:
    {% if value <= 0.9 %}
      <span style="color: red;">{{ rendered_value }}</span></p>
    {% else %}
      {{rendered_value}}
    {% endif %} ;;
    filters: [tiposervicio: "LUZ", mes_actual: "yes"]
    value_format: "0.00%"
  }
  measure: factor_potencia_anterior {
    description: "Factor de potencia del mes anterior al seleccionado"
    label: "Factor de Potencia Mes Anterior"
    group_label: "Luz"
    type: max
    sql: ${factordepotencia} / 100 ;;
    html:
    {% if value <= 0.9 %}
      <span style="color: red;">{{ rendered_value }}</span></p>
    {% else %}
      {{rendered_value}}
    {% endif %} ;;
    filters: [tiposervicio: "LUZ", mes_anterior: "yes"]
    value_format: "0.00%"
  }
#Métricas de GAS
  measure: gas_importe_actual {
    description: "Importe de gas del mes seleccionado"
    label: "Importe"
    group_label: "Gas"
    type: sum
    sql: ${importe} ;;
    filters: [tiposervicio: "GAS",mes_actual: "yes"]
    value_format: "$#,##0.00"
  }
  measure: gas_importe_anterior {
    description: "Importe de gas del mes anterior al seleccionado"
    label: "Importe Mes Anterior"
    group_label: "Gas"
    type: sum
    sql: ${importe} ;;
    filters: [tiposervicio: "GAS",mes_anterior: "yes"]
    value_format: "$#,##0.00"
  }
  measure: m3_actual {
    description: "Consumo en metros cúbicos"
    label: "Metros Cúbicos"
    group_label: "Gas"
    type: sum
    sql: CASE WHEN ${metroscubicos} = 0 THEN NULL ELSE ${metroscubicos} END  ;;
    filters: [tiposervicio: "GAS", mes_actual: "yes"]
  }
  measure: m3_anterior {
    description: "Consumo en metros cúbicos del mes anterior"
    label: "Metros Cúbicos Mes Anterior"
    group_label: "Gas"
    type: sum
    sql: CASE WHEN ${metroscubicos} = 0 THEN NULL ELSE ${metroscubicos} END  ;;
    filters: [tiposervicio: "GAS", mes_anterior: "yes"]
  }
#Métricas de Producción
  measure: kilos_prod_actual {
    description: "Kilos producidos en la planta"
    label: "Total Kgs Producidos"
    group_label: "Producción"
    type: sum
    sql: ${total_kilos_produccion} ;;
    filters: [tiposervicio: "LUZ", mes_actual: "yes"]
    value_format: "0.00"
  }
  measure: kilos_prod_anterior {
    description: "Kilos producidos en la planta en el mes anterior"
    label: "Total Kgs Producidos Mes Anterior"
    group_label: "Producción"
    type: sum
    sql: ${total_kilos_produccion} ;;
    filters: [tiposervicio: "LUZ", mes_anterior: "yes"]
    value_format: "0.00"
  }
  measure: kg_kw_actual {
    description: "Kgs producidos por cada KW consumido"
    label: "Kgs/KW"
    group_label: "Producción"
    type: number
    sql: ${kilos_prod_actual}/ nullif(${kw_consumidos_actual},0)
      ;;
    value_format: "0.00"
  }
  measure: kg_kw_anterior {
    description: "Kgs producidos por cada KW consumido en el mes anterior"
    label: "Kgs/KW Mes Anterior"
    group_label: "Producción"
    type: number
    sql: ${kilos_prod_anterior}/ nullif(${kw_consumidos_anterior},0)
      ;;
    value_format: "0.00"
  }
#FIN DE LAS DEFINICIONES
}
