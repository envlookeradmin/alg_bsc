
view: fact_lento_movimiento {
  derived_table: {
    sql: with A as (
      SELECT
        *,

        CURRENT_DATE() Actual
        ,date_add(CURRENT_DATE(), INTERVAL 1 month) Mes1
        ,date_add(CURRENT_DATE(), INTERVAL 2 month) Mes2
        ,date_add(CURRENT_DATE(), INTERVAL 3 month) Mes3
        ,date_add(CURRENT_DATE(), INTERVAL 4 month) Mes4
        ,date_add(CURRENT_DATE(), INTERVAL 5 month) Mes5
        ,date_add(CURRENT_DATE(), INTERVAL 6 month) Mes6
      FROM
        `envases-analytics-qa.RPT_S4H_MX.vw_fact_lento_movimiento`)

      select * from A
      unpivot(FechaMes for Mes in (Actual, Mes1, Mes2, Mes3, Mes4, Mes5, Mes6)) ;;
  }



  parameter: rango_lento_movimiento {
    allowed_value: {
      label:"Mes Actual"
      value: "mes"
    }
    allowed_value: {
      label:"3 meses"
      value: "3meses"
    }
    allowed_value: {
      label: "6 meses"
      value: "6meses"
    }
  }












  dimension: Dif_actual {
    type: number
    sql:  date_diff(current_date(),  ${TABLE}.Fecha_Produccion, month) ;;

  }

  dimension: clasificacion {
    type: string
    sql: case
              when ${grupo}='ACEITES Y LUBRICANTES' and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='ACERO'  and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='BARNIZ'  and ${Dif_actual} <=6 then 'Rotacion regular'
              when ${grupo}='DESPERDICIO'  and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='MASTER BACH Y PIGMENTOS'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='MATERIAL DE EMPAQUE'  and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='OTRAS MP'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='OTROS'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='OTROS COMPONENTES'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='POLIETILENO'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='PRODUCTO SEMITERMINADO'  and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='PRODUCTO TERMINADO' and ${tipo}='ACERO'       and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='PRODUCTO TERMINADO' and ${tipo}='POLIETILENO' and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='REFACCIONES'  and ${Dif_actual} <=24 then 'Rotacion regular'
              when ${grupo}='SOLVENTES'  and ${Dif_actual} <=12 then 'Rotacion regular'
              when ${grupo}='TINTAS'  and ${Dif_actual} <=12 then 'Rotacion regular'
 else 'Lento movimiento' end
    ;;
}


  dimension: Dif_actual_proy {
    type: number
    sql:  date_diff(FechaMes,  ${TABLE}.Fecha_Produccion, month) ;;

  }

  dimension: clasificacion_proy {
    type: string
    sql: case
              when ${grupo}='ACEITES Y LUBRICANTES' and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='ACERO'  and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='BARNIZ'  and ${Dif_actual_proy} <=4 then 'Rotacion regular'
              when ${grupo}='DESPERDICIO'  and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='MASTER BACH Y PIGMENTOS'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='MATERIAL DE EMPAQUE'  and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='OTRAS MP'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='OTROS'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='OTROS COMPONENTES'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='POLIETILENO'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='PRODUCTO SEMITERMINADO'  and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='PRODUCTO TERMINADO' and ${tipo}='ACERO'       and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='PRODUCTO TERMINADO' and ${tipo}='POLIETILENO' and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='REFACCIONES'  and ${Dif_actual_proy} <=24 then 'Rotacion regular'
              when ${grupo}='SOLVENTES'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
              when ${grupo}='TINTAS'  and ${Dif_actual_proy} <=12 then 'Rotacion regular'
 else 'Lento movimiento' end
    ;;
  }

  dimension_group: fecha_produccion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_PRODUCCION ;;
  }

  dimension_group: fecha_mes {
     type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaMes ;;
  }



  measure: TotalStock_actual {
    label: "Stock"
    type: sum
    sql: ${TABLE}.Stock ;;
  }

  dimension: 1_Meses {
    type: yesno
    sql: ${mes} ='Actual' ;;
  }

  dimension: 3_Meses {
    type: yesno
    sql: ${mes} ='Actual' or ${mes} = 'Mes1' or  ${mes} = 'Mes2' or  ${mes} = 'Mes3' ;;
  }

  dimension: 6_Meses {
    type: yesno
    sql: ${mes} ='Actual' or ${mes} = 'Mes1'  or  ${mes} = 'Mes2' or  ${mes} = 'Mes3'  or  ${mes} = 'Mes4' or  ${mes} = 'Mes5' or  ${mes} = 'Mes6';;

  }

  measure: TotalStock_Actual {
    label: "Actual"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: 1_Meses
      value: "yes"
    }

  }


  measure: TotalStock {

    type: sum
    sql: ${TABLE}.Stock ;;



  }

  measure: Acumulado {
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: [clasificacion_proy: "Lento movimiento"]
  }


  measure: TotalStock_3_meses {
    label: "3_meses"
    type: sum
    #sql: SUM(${TABLE}.Stock) OVER (PARTITION BY ${grupo} ORDER BY ${mes}) ;;
   sql:  ${TABLE}.Stock ;;

    filters: {
      field: 3_Meses
      value: "yes"
    }

  }





  measure: TotalStock_6_meses {
    label: "6_meses"
    type: sum
    sql: ${TABLE}.Stock ;;

    filters: {
      field: 6_Meses
      value: "yes"
    }

  }


  measure: Total_segmentado {
    label_from_parameter: rango_lento_movimiento
    type: number
    sql: CASE
          WHEN {% parameter rango_lento_movimiento %} = "mes"
            THEN ${TotalStock_Actual}
          WHEN {% parameter rango_lento_movimiento %} = "3meses"
            THEN ${TotalStock_3_meses}
          WHEN {% parameter rango_lento_movimiento %} = "6meses"
            THEN ${TotalStock_6_meses}

      END ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: almacen {
    type: string
    sql: ${TABLE}.ALMACEN ;;
  }

  dimension: lote {
    type: string
    sql: ${TABLE}.LOTE ;;
  }

  dimension: especial {
    type: string
    sql: ${TABLE}.ESPECIAL ;;
  }

  dimension: nivel_2 {
    type: string
    sql: ${TABLE}.NIVEL_2 ;;
  }

  dimension: stock {
    type: number
    sql: ${TABLE}.STOCK ;;
  }

  dimension: nivel_3 {
    type: string
    sql: ${TABLE}.NIVEL_3 ;;
  }



  dimension: sitio {
    type: string
    sql: ${TABLE}.SITIO ;;
  }

  dimension: nivel_1 {
    type: string
    sql: ${TABLE}.NIVEL_1 ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.TIPO ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}.GRUPO_REAL ;;
  }

  dimension: subcontratacion {
    type: string
    sql: ${TABLE}.SUBCONTRATACION ;;
  }

  dimension: moneda {
    type: string
    sql: ${TABLE}.MONEDA ;;
  }

  dimension: valor {
    type: number
    sql: ${TABLE}.VALOR ;;
  }

  dimension: meses_rotacion_regular {
    type: number
    sql: ${TABLE}.MESES_ROTACION_REGULAR ;;
  }

  dimension: nivel_4 {
    type: string
    sql: ${TABLE}.NIVEL_4 ;;
  }



  dimension: mes {
    type: string
    sql: ${TABLE}.Mes ;;
  }

  set: detail {
    fields: [
        centro,
  material,
  almacen,
  lote,
  especial,
  nivel_2,
  stock,
  nivel_3,

  nivel_1,
  tipo,
  grupo,
  subcontratacion,
  moneda,
  valor,
  meses_rotacion_regular,
  nivel_4,

  mes
    ]
  }
}
