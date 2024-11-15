view: tiempos_estadia {
  derived_table: {
    sql:
      SELECT
      Folio,
      Bascula,
      Actividad,
      Placa,
      Planta,
      Locacion,
      Orden_de_Compra,
      ID_Proveedor,
      Fecha_de_Entrada,
      Hora_de_Entrada,
      Fecha_de_Despacho,
      Hora_de_Despacho,
      Tiempo_de_Estadia,
      Peso_de_Entrada,
      Peso_de_Salida
      FROM `envases-analytics-qa.RPT_S4H_MX.vw_bsc_tiempo_estadia`


      ;;
  }

  #Filtro
  filter: date_filter {
    label: "Fecha"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  #Dimensiones
  dimension: Folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: Bascula {
    type: string
    sql: ${TABLE}.Bascula ;;
  }
  dimension: IdActividad {
    type: string
    sql: ${TABLE}.Actividad ;;
  }

  dimension: Actividad {
    type: string
    sql: ${actividad.descripcion} ;;
  }

  dimension: Placa {
    type: string
    sql: ${TABLE}.Placa ;;
  }
  dimension: Planta {
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: PlantaCompleto {
    type: string
    sql: ${planta.planta_completo} ;;
  }

  dimension: Orden_locacion {
    type: number
    sql:  CASE
                WHEN ${TABLE}.Locacion = 'CUAUTITLÁN' THEN 1
                WHEN ${TABLE}.Locacion = 'CEDIS' THEN 2
                WHEN ${TABLE}.Locacion = 'MAZATLÁN' THEN 3
            END
                ;;
  }


  dimension: NombreLocacion {
    type: string
    sql: CASE
                WHEN ${TABLE}.Locacion = 'CUAUTITLÁN' THEN 'MF01 Cuautitlán'
                WHEN ${TABLE}.Locacion = 'CEDIS' THEN 'CEDIS'
                WHEN ${TABLE}.Locacion = 'MAZATLÁN' THEN 'MF03 Mazatlan I'
            END
            ;;
    link: {
      label: "Bascula"
      url: "https://envasesdirecto.cloud.looker.com/dashboards/137?&Fecha={{ _filters['tiempos_estadia.date_filter'] | url_encode }}&Locación={{ tiempos_estadia.Locacion._value | url_encode}}&Actividad={{ tiempos_estadia.Actividad._value | url_encode }}"
    }

    #order_by_field: Orden_locacion
  }

  dimension: Locacion {
    label: "Locación"
    type: string
    sql:  ${TABLE}.Locacion
          /*CASE
                WHEN ${TABLE}.Planta IN ('MF01','MF51') AND ${TABLE}.Bascula IN ('SC_F01','SC_F05') THEN 'CUAUTITLÁN'
                WHEN ${TABLE}.Planta IN ('MF01','MF51') AND ${TABLE}.Bascula IN ('SC_F02','SC_F03') THEN 'CEDIS'
                WHEN ${TABLE}.Planta IN ('MF03','MF53') THEN 'MAZATLÁN'
            END */
            ;;
    link: {
      label: "Bascula"
      url: "https://envasesdirecto.cloud.looker.com/dashboards/137?&Fecha={{ _filters['tiempos_estadia.date_filter'] | url_encode }}&Locación={{ tiempos_estadia.Locacion._value | url_encode}}&Actividad={{ tiempos_estadia.Actividad._value | url_encode }}"
    }

    #order_by_field: Orden_locacion
  }

  dimension: OrdenDeCompra {
    type: string
    sql: ${TABLE}.OrdenDeCompra ;;
  }
  dimension: IDProveedor {
    type: string
    sql: ${TABLE}.ID_Proveedor ;;
  }
  dimension: FechaDeEntrada{
    type: date
    sql: ${TABLE}.Fecha_de_Entrada ;;
  }
  dimension: HoraDeEntrada{
    type: string
    sql: ${TABLE}.Hora_de_Entrada ;;
  }
  dimension: FechaDeDespacho{
    type: date
    sql: ${TABLE}.Fecha_de_Despacho ;;
  }
  dimension: HoraDeDespacho{
    type: string
    sql: ${TABLE}.Hora_de_Despacho ;;
  }
  dimension: TiempoDeEstadia{
    type: number
    sql: ${TABLE}.Tiempo_de_Estadia ;;
  }

  dimension: PesoDeEntrada{
    type: number
    sql: ${TABLE}.Peso_de_Entrada ;;
  }
  dimension: PesoDeSalida{
    type: number
    sql: ${TABLE}.Peso_de_Salida ;;
  }

  dimension: vacio {
    type: string
    label: "_"
    sql: '_' ;;
  }

  dimension_group: fecha_filtro {
    label: "Date"
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
    sql: CAST(${TABLE}.Fecha_de_Entrada  AS TIMESTAMP) ;;
  }

  dimension: c_anio_anterior{
    hidden: yes
    type: yesno
    sql: ${fecha_filtro_date} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-12-01")  AS DATE)
      and  ${fecha_filtro_date} <= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-12-31")  AS DATE) ;;




  }

  dimension: mes_actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_end date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_end date_filter %} AS DATE)  ;;
  }

  dimension: periodo {
    hidden: yes
    type: yesno
    sql: CAST(${fecha_filtro_date}  AS date) >= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), MONTH) else CAST({% date_start date_filter %} AS DATE) end )
      and CAST(${fecha_filtro_date}  AS date) <= (case when CAST({% date_start date_filter %} AS DATE)= DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) then LAST_DAY(CAST({% date_start date_filter %} AS DATE)) else DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 DAY) end ) ;;
  }

  dimension: mes_anterior{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_end date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_end date_filter %} AS DATE), INTERVAL -1 MONTH));;
  }

  dimension: ultimos_2_meses{
    type: number
    sql:
      CASE
          WHEN DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
          AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL 0 DAY) THEN 1
          ELSE 0
          END;;
  }

  #Metricas
  measure: Prom_Estadia {
    label: "Tiempo Prom. de Estadia"
    type: average
    sql: ${TiempoDeEstadia} ;;

    filters: {
      field: periodo
      value: "yes"
    }

    html:
      {% if value > 4.0 %}
       <span style="color: red;">{{ rendered_value }}</span></p>
      {% elsif value < 4.0 %}
       <span style="color: green;">{{ rendered_value }}</span></p>
      {% elsif value == 4.0 %}
       <span style="color: #ffd100;">{{ rendered_value }}</span></p>
      {% else %}
      {{rendered_value}}
      {% endif %} ;;

    #html:
    #{% if value > 4.0 %}
    #<p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Red.png" height=8 width=8> {{ rendered_value }} </p>
    #{% elsif value < 4.0 %}
    #<p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Green.png" height=8 width=8> {{ rendered_value }} </p>
    #{% elsif value == 4.0 %}
    #<p><img src="https://cdn3.iconfinder.com/data/icons/softwaredemo/PNG/256x256/Circle_Yellow.png" height=8 width=8> {{ rendered_value }} </p>
    #{% else %}
    #{{rendered_value}}
    #{% endif %} ;;


    drill_fields: [Bascula ,Prom_Estadia]


    value_format: "0.0"
  }

  measure: Prom_Estadia_AA {
    label: "Tiempo Prom. de Estadia AA"
    type: average
    sql: ${TiempoDeEstadia} ;;

    filters: {
      field: c_anio_anterior
      value: "yes"
    }

    drill_fields: [Bascula ,Prom_Estadia_AA]

    value_format: "0.0"
  }

  measure: Prom_Estadia_Mes_Actual{
    type: average
    sql: ${TiempoDeEstadia} ;;

    filters: {
      field: mes_actual
      value: "yes"
    }
  }

  measure: Prom_Estadia_Mes_Anterior{
    type: average
    sql: ${TiempoDeEstadia} ;;

    filters: {
      field: mes_anterior
      value: "yes"
    }
  }

  measure: Diferencia {
    label: "Diferencia"
    type: number
    sql: (1-(${Prom_Estadia_Mes_Anterior}/NULLIF(${Prom_Estadia_Mes_Actual},0)))*100  ;;

    drill_fields: [Bascula ,Diferencia]

    value_format: "0.0\%"
  }

  measure: count {
    type: count
  }


}
