
view: fct_materiales_stock {
  derived_table: {


    sql: SELECT  LAST_DAY(c.fecha,MONTH) FECHA
                ,c.id_material
                ,c.centro
                ,c.id_provedor_cliente
                ,c.tipo_stock
                ,c.familia
                ,c.TIPO_PROVEEDOR_CLIENTE
                ,sum(c.STOCK_LIBRE_UTILIZACION) STOCK_LIBRE_UTILIZACION
                ,sum(c.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ) VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION
                ,(SELECT SUM(VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION) FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_materiales_stock`
                   WHERE LAST_DAY(fecha,MONTH) = LAST_DAY(DATE_ADD(c.fecha, INTERVAL -1 MONTH),MONTH)
                     AND id_material = c.id_material
                     AND centro=c.centro
                     AND id_provedor_cliente=c.id_provedor_cliente
                     AND tipo_stock=c.tipo_stock
                     AND familia =c.familia
                     AND TIPO_PROVEEDOR_CLIENTE =c.TIPO_PROVEEDOR_CLIENTE ) AS VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION_previous_month
         FROM `envases-analytics-qa.RPT_S4H_MX.tbl_fact_materiales_stock` c
         WHERE  DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -4 MONTH) AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
           and GRUPO_MATERIAL = 'PAC9006'
           and centro in ( select planta_id  from `envases-analytics-qa.RPT_S4H_MX.vw_bsc_planta`)

      GROUP BY  c.fecha
      ,c.id_material
      ,c.centro
      ,c.id_provedor_cliente
      ,c.tipo_stock
      ,c.familia
      ,c.TIPO_PROVEEDOR_CLIENTE
      ;;




    #sql: SELECT  * FROM `envases-analytics-eon-poc.RPT_S4H_MX.tbl_fact_materiales_stock` c
    #    WHERE  DATE_TRUNC(CAST(FECHA AS DATE),DAY) >=DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -4 MONTH) AND DATE_TRUNC(CAST(FECHA AS DATE),DAY) <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
    #   and GRUPO_MATERIAL = 'PAC9006'
    #   and centro in ( select planta_id  from `envases-analytics-eon-poc.RPT_S4H_MX.vw_bsc_planta`)


  }


  filter: date_filter {
    label: "Período"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date

  }

  dimension_group: created {
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









  dimension: fecha_costo {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_costo ;;
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

  dimension: tipo_proveedor_cliente {
    type: string
    sql: ${TABLE}.TIPO_PROVEEDOR_CLIENTE ;;
  }

  dimension: id_provedor_cliente {
    type: string
    sql: ${TABLE}.ID_PROVEDOR_CLIENTE ;;
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

  dimension: tipo_stock {
    type: number
    sql: ${TABLE}.TIPO_STOCK ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA ;;
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

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }


  dimension: tipo_clasificacion {
    type: string
    sql: case when ${tipo_stock}=2 then 'Cliente' else 'Envases' end ;;
  }

  dimension: Proveedor_nombre {
    type: string
    sql:  UPPER(${proveedor.nombre})    ;;
  }


  dimension: Cliente_nombre {
    type: string
    sql:  UPPER(${cliente.nombre})  ;;
  }

  dimension: planta_nombre {
    type: string
    sql:  UPPER(${planta.planta_comercializadora})  ;;
  }

  dimension: planta_completo {
    type: string
    sql:  UPPER(${planta.planta_completo})  ;;
    drill_fields: [Familia]
  }


  dimension: Familia {
    type: string
    sql: ${TABLE}.familia ;;
    drill_fields: [Proveedor_nombre]
  }





  dimension: Clasificacion_proveedor {
    label: "Proveedor"
    type: string
    sql: CASE WHEN  ${tipo_proveedor_cliente}='Cliente'   then ${Cliente_nombre}
              WHEN  ${tipo_proveedor_cliente}='Proveedor' then ${Proveedor_nombre}
              WHEN  ${tipo_proveedor_cliente}='Planta'    then ${planta_nombre} ELSE ${id_provedor_cliente}  END ;;
  }



  dimension: Filtro_Mes_Actual{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha} AS DATE),DAY) >=DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), month) AND DATE_TRUNC(CAST(${fecha} AS DATE),DAY) <=  DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;

  }

  dimension: Filtro_Mes_Anterior{
    hidden: yes
    type: yesno
    sql: DATE_TRUNC(CAST(${fecha} AS DATE),DAY) >= DATE_TRUNC(DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH), month) AND DATE_TRUNC(CAST(${fecha} AS DATE),DAY) <= LAST_DAY(DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -2 MONTH))  ;;

  }

  measure: Cantidad_stock_Mes_Anterior {
    label: "Cantidad Mes Anterior"
    type: sum
    sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION_previous_month ;;
    value_format: "#,##0"

  }



  measure: Cantidad_stock_Mes_Actual {
    type: sum
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;

    filters: {
      field: Filtro_Mes_Actual
      value: "yes"
    }


    html:
    {% if value < Cantidad_stock_Mes_Anterior._value %}
   <p> <span style="color: green;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_green.png"    height=10 width=10></p>

      {% else %}
      <span style="color: red;">{{ rendered_value }}</span><img src="https://findicons.com/files/icons/1036/function/48/circle_red.png"    height=10 width=10></p>

      {% endif %} ;;



  }



  measure: Cantidad_stock {
    label: "Cantidad"
    type: sum
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION ;;
    value_format: "#,##0"
  }

  measure: util_stock {

    type: sum
    sql: ${TABLE}.STOCK_LIBRE_UTILIZACION  ;;
    value_format: "#,##0"
  }


  measure: bloque_stock {

    type: sum
    sql: ${TABLE}.STOCK_BLOQUEADO  ;;
    value_format: "#,##0"
  }

  measure: Calidad_stock {

    type: sum
    sql:  ${TABLE}.STOCK_INSPECCION_CALIDAD ;;
    value_format: "#,##0"
  }





  measure: valor_stock {
    label: "Valor (MXN)"
    type: sum
    sql: ${TABLE}.VALOR_ACTUAL_STOCK_LIBRE_UTILIZACION ;;
    value_format: "$#,##0"

    html:
    {% if value >= Cantidad_stock_Mes_Anterior._value %}
    <p> <span style="color: red;">{{ rendered_value }}</span></p>

      {% else %}
      <span style="color: green;">{{ rendered_value }}</span></p>

      {% endif %} ;;

  }



  dimension: mes{
    type: string
    sql: "Noviembre" ;;
  }

  dimension: last_year{
    type: string
    sql: extract(month from CAST({% date_start date_filter %} AS DATE))-2 ;;
  }


  dimension: year{
    type: string
    sql: extract(year from CAST({% date_start date_filter %} AS DATE))-0 ;;
  }








  set: detail {
    fields: [
      fecha_costo,
      id_material,
      centro,
      tipo_proveedor_cliente,
      id_provedor_cliente,
      stock_libre_utilizacion,
      stock_inspeccion_calidad,
      stock_bloqueado,
      grupo_material,
      tipo_stock,
      fecha,
      valor_actual_stock_libre_utilizacion,
      valor_actual_inspeccion_calidad,
      valor_actual_bloqueado,
      row_num
    ]
  }
}
