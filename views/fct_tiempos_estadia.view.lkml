view: tiempos_estadia {
    derived_table: {
      sql:
      SELECT
      Folio,
      Bascula,
      Actividad,
      Placa,
      Planta,
      Orden_de_Compra,
      ID_Proveedor,
      Fecha_de_Entrada,
      Hora_de_Entrada,
      Fecha_de_Despacho,
      Hora_de_Despacho,
      Tiempo_de_Estadia,
      Peso_de_Entrada,
      Peso_de_Salida
      FROM `envases-analytics-eon-poc.RPT_S4H_MX_QA.vw_bsc_tiempo_estadia` ;;
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
    dimension: Actividad {
      type: string
      sql: ${TABLE}.Actividad ;;
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

      link: {
        label: "Maniobra"
        url: "https://envases.cloud.looker.com/dashboards/137?&Fecha={{ _filters['tiempos_estadia.date_filter'] | url_encode }}&Planta={{ tiempos_estadia.Planta._value | url_encode}}"
      }
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

    dimension: anio_anterior{
      hidden: yes
      type: yesno
      sql: ${fecha_filtro_date} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
        and  ${fecha_filtro_date} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
    }

    dimension: mes_actual{
      hidden: yes
      type: yesno
      sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
        AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= CAST({% date_start date_filter %} AS DATE)  ;;
    }

    dimension: mes_anterior{
      hidden: yes
      type: yesno
      sql: DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH)
      AND DATE_TRUNC(CAST(${fecha_filtro_date} AS DATE),DAY) <= LAST_DAY(DATE_ADD(CAST({% date_start date_filter %} AS DATE), INTERVAL -1 MONTH));;
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
      label: "Tiempo Promedio de Estadia"
      type: average
      sql: ${TiempoDeEstadia} ;;

      drill_fields: [actividad.descripcion ,Prom_Estadia]

      value_format: "0"
    }

    measure: Prom_Estadia_AA {
      label: "Tiempo Promedio de Estadia AA"
      type: average
      sql: ${TiempoDeEstadia} ;;

      filters: {
        field: anio_anterior
        value: "yes"
      }

      drill_fields: [actividad.descripcion ,Prom_Estadia_AA]

      value_format: "0"
    }

    measure: Prom_Estadia_Mes_Actual{
      type: average
      sql: ${TiempoDeEstadia} ;;

      filters: {
        field: mes_actual
        value: "yes"
      }

      value_format: "0"
    }

    measure: Prom_Estadia_Mes_Anterior{
      type: average
      sql: ${TiempoDeEstadia} ;;

      filters: {
        field: mes_anterior
        value: "yes"
      }

      value_format: "0"
    }

    measure: Diferencia {
      label: "Diferencia"
      type: number
    sql: (${Prom_Estadia_Mes_Actual}/NULLIF(${Prom_Estadia_Mes_Anterior},0))*100  ;;

      html:
      {% if value <= 4.0 %}
      <span style="color: red;">{{ rendered_value }}</span></p>
      {% else %}
      {{rendered_value}}
      {% endif %} ;;

      drill_fields: [actividad.descripcion ,Diferencia]

      value_format: "0.00\%"
    }

    measure: registros {
      type: count_distinct
      sql: ${TABLE}.PO ;;
    }

    measure: count {
      type: count
    }


  }
