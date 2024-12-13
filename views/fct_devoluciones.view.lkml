
view: fct_devoluciones {
  derived_table: {
    sql: SELECT * FROM `envases-analytics-qa.DATASET_RAW.mck_reporte_integral_calidad` where no_ is not null and string_field_43 is not null ;;
  }


  parameter: Medidas_dinamicas {
    description: "Parámetro que define unidad a medir"
    label: "Concepto"
    allowed_value: {
      label:"Evento"
      value: "Evento"
    }
    allowed_value: {
      label: "Sanitario"
      value: "Sanitario"
    }

    allowed_value: {
      label: "Lineas Generales"
      value: "Linea"
    }
  }



  parameter: Tipo {
    description: "Parámetro que define unidad a medir"
    label: "Tipo"
    allowed_value: {
      label:"Piezas"
      value: "Piezas"
    }
    allowed_value: {
      label: "Dinero"
      value: "Dinero"
    }


  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }



  dimension: no_ {
    type: string
    sql: ${TABLE}.No_ ;;
  }

  dimension: estado_embarques {
    type: string
    sql: ${TABLE}.Estado_Embarques ;;
  }

  dimension: __rea_recibo {
    type: string
    sql: ${TABLE}.__rea_Recibo ;;
  }

  dimension_group: fecha_ingreso {
    label: "fecha_ingreso"
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
    sql: PARSE_TIMESTAMP('%d/%m/%Y', ${TABLE}.fecha_ingreso) ;;
  }




  dimension: autorizado {
    type: string
    sql: ${TABLE}.Autorizado ;;
  }

  dimension: l__nea_negocio {
    type: string
    sql: ${TABLE}.L__nea_Negocio ;;
  }

  dimension: pedido_devoluci__n {
    type: string
    sql: ${TABLE}.Pedido_Devoluci__n ;;
  }

  dimension: nota_cr__dito {
    type: string
    sql: ${TABLE}.Nota_Cr__dito ;;
  }

  dimension: factura {
    type: string
    sql: ${TABLE}.Factura ;;
  }

  dimension: motivo_devoluci__n {
    type: string
    sql: ${TABLE}.Motivo_devoluci__n ;;
  }

  dimension: supervisor {
    type: string
    sql: ${TABLE}.Supervisor ;;
  }

  dimension: tipo_de_devoluci__n {
    type: string
    sql: ${TABLE}.Tipo_de_Devoluci__n ;;
  }

  dimension: fecha_y_hora_de_descarga {
    type: date
    datatype: date
    sql: ${TABLE}.Fecha_y_Hora_de_Descarga ;;
  }

  dimension: tiempo_de_descarga {
    type: string
    sql: ${TABLE}.Tiempo_de_Descarga ;;
  }

  dimension: fecha_y_hora_de_reporte_de_incidencia {
    type: string
    sql: ${TABLE}.Fecha_y_Hora_de_Reporte_de_Incidencia ;;
  }

  dimension: __rea_responsable_del_seguimiento {
    type: string
    sql: ${TABLE}.__rea_Responsable_del_Seguimiento ;;
  }

  dimension: fecha_de_ingreso_de_material_a_sap {
    type: string
    sql: ${TABLE}.Fecha_de_ingreso_de_Material_a_SAP ;;
  }

  dimension: fecha_de_entrega_de_nota_de_cr__dito {
    type: date
    datatype: date
    sql: ${TABLE}.Fecha_de_Entrega_de_Nota_de_Cr__dito ;;
  }

  dimension: autorizado_por_jonas {
    type: string
    sql: ${TABLE}.Autorizado_por_Jonas ;;
  }

  dimension: linea_de_transporte {
    type: string
    sql: ${TABLE}.Linea_de_Transporte ;;
  }

  dimension: operador {
    type: string
    sql: ${TABLE}.Operador ;;
  }

  dimension: consigna {
    type: string
    sql: ${TABLE}.Consigna ;;
  }

  dimension: caso {
    type: number
    sql: ${TABLE}.Caso ;;
  }

  dimension: concesi__n {
    type: string
    sql: ${TABLE}.Concesi__n ;;
  }

  dimension: __cliente {
    type: string
    sql: ${TABLE}.__Cliente ;;
  }

  dimension: c__digo {
    type: number
    sql: ${TABLE}.C__digo ;;
  }

  dimension: descripci__n_ {
    type: string
    sql: ${TABLE}.Descripci__n_ ;;
  }

  dimension: cantidad_devuelta {
    type: number
    sql: ${TABLE}.Cantidad_Devuelta ;;
  }

  dimension: cantidad_liberada {
    type: number
    sql: ${TABLE}.Cantidad_Liberada ;;
  }

  dimension: cantidad_rechazada {
    type: number
    sql: ${TABLE}.Cantidad_Rechazada ;;
  }

  dimension: defecto {
    type: string
    sql: ${TABLE}.Defecto ;;
  }

  dimension: __rea_responsable {
    type: string
    sql: ${TABLE}.__rea_responsable ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: string_field_33 {
    type: string
    sql: ${TABLE}.string_field_33 ;;
  }

  dimension: string_field_34 {
    type: string
    sql: ${TABLE}.string_field_34 ;;
  }

  dimension: string_field_35 {
    type: string
    sql: ${TABLE}.string_field_35 ;;
  }

  dimension: string_field_36 {
    type: string
    sql: ${TABLE}.string_field_36 ;;
  }

  dimension: string_field_37 {
    type: string
    sql: ${TABLE}.string_field_37 ;;
  }

  dimension: string_field_38 {
    type: string
    sql: ${TABLE}.string_field_38 ;;
  }

  dimension: int64_field_39 {
    type: number
    sql: ${TABLE}.int64_field_39 ;;
  }

  dimension: int64_field_40 {
    type: number
    sql: ${TABLE}.int64_field_40 ;;
  }

  dimension: string_field_41 {
    label: "Mes Abierto"
    type: string
    sql: ${TABLE}.string_field_41 ;;
  }

  dimension: int64_field_42 {
    type: number
    sql: ${TABLE}.int64_field_42 ;;
  }

  dimension: string_field_43 {
    type: string
    sql: ${TABLE}.string_field_43 ;;
  }


  measure: Totoal_Sanitario {
    label: "Sanitario pza"
    type: sum
    sql: ${TABLE}.int64_field_40 ;;
    filters: [l__nea_negocio: "Sanitario"]
  }

  measure: Totoal_Lineas_Generales {
    label: "Líneas Generales pza"
    type: sum
    sql: ${TABLE}.int64_field_40 ;;
    filters: [l__nea_negocio: "Líneas Generales"]
  }

  measure: Totoal_Eventos {
    label: "Eventos pza"
    type: sum
    sql: ${TABLE}.int64_field_40 ;;

  }


  measure: Totoal_Sanitario_dinero {
    label: "Sanitario $"
    type: sum
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) end;;
    filters: [l__nea_negocio: "Sanitario"]
    value_format:"$#.00;($#.00)"
  }

  measure: Totoal_Lineas_Generales_dinero {
    label: "Líneas Generales $"
    type: sum
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) end;;
    filters: [l__nea_negocio: "Líneas Generales"]
    value_format:"$#.00;($#.00)"
  }

  measure: Totoal_Eventos_dinero {
    label: "Eventos $"
    type: sum
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) end;;
    value_format:"$#.00;($#.00)"

  }

  measure: Total_facturacion {
    label: "Facturación"
    type: sum
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) * (FLOOR(10*RAND())*150) end;;
    value_format:"$#.00;($#.00)"

  }

  measure: Total_devolucion {
    label: "Devolución"
    type: sum
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) end;;
    value_format:"$#.00;($#.00)"

  }

  measure: porc_devolucion {
    label: "Porcentaje"
    type:  number
    sql: ( case
           when ${Total_facturacion} != 0
           then ${Total_devolucion} / ${Total_facturacion}
           else 0
           end )*100 ;;

    value_format: "0.00\%"
  }

  measure: Total_facturacion_meta {
    hidden: yes
    type: average
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) * 620 end;;
    value_format:"$#.00;($#.00)"

  }

  measure: Total_devolucion_meta {
    hidden: yes
    type: average
    sql: case when ${TABLE}.string_field_34 like '%-%' then 0 else cast( ( REPLACE(REPLACE(${TABLE}.string_field_34,'$',''),',','')  ) as float64) end;;
    value_format:"$#.00;($#.00)"

  }

  measure: porc_devolucion_meta {
    label: "% Meta"
    type:  number
    sql: ( case
           when ${Total_facturacion_meta} != 0
           then ( ${Total_devolucion_meta} * 0.7) / ( ${Total_facturacion_meta} * 0.8)
           else 0
           end )*100 ;;

    value_format: "0.00\%"
  }



  measure: Eventos {
    label: "Evento"
    type: number
    sql: CASE
    WHEN {% parameter Tipo  %} = "Piezas"
    THEN ${Totoal_Eventos}
    WHEN {% parameter Tipo  %} = "Dinero"
    THEN ${Totoal_Eventos_dinero}

    END;;

    value_format: "#,##0.00"
  }


  measure: Sanitario {
    label: "Sanitario"
    type: number
    sql: CASE
    WHEN {% parameter Tipo  %} = "Piezas"
    THEN ${Totoal_Sanitario}
    WHEN {% parameter Tipo  %} = "Dinero"
    THEN ${Totoal_Sanitario_dinero}
    END;;

    value_format: "#,##0.00"
  }


    measure: Linea {
    label: "Lineas Generales"
    type: number
    sql: CASE
    WHEN {% parameter Tipo  %} = "Piezas"
    THEN ${Totoal_Lineas_Generales}
    WHEN {% parameter Tipo  %} = "Dinero"
    THEN ${Totoal_Lineas_Generales_dinero}
    END;;

      value_format: "#,##0.00"
  }



  measure: total_stock_proyeccion {
    label_from_parameter: Medidas_dinamicas
    type: number
    sql: CASE
          WHEN {% parameter Medidas_dinamicas %} = "Evento" and {% parameter Tipo  %} = "Piezas"
            THEN ${Totoal_Eventos}
          WHEN {% parameter Medidas_dinamicas %} = "Sanitario" and {% parameter Tipo  %} = "Piezas"
            THEN ${Totoal_Sanitario}
          WHEN {% parameter Medidas_dinamicas %} = "Linea" and {% parameter Tipo  %} = "Piezas"
            THEN ${Totoal_Lineas_Generales}

          WHEN {% parameter Medidas_dinamicas %} = "Evento" and {% parameter Tipo  %} = "Dinero"
            THEN ${Totoal_Eventos_dinero}
          WHEN {% parameter Medidas_dinamicas %} = "Sanitario" and {% parameter Tipo  %} = "Dinero"
            THEN ${Totoal_Sanitario_dinero}
          WHEN {% parameter Medidas_dinamicas %} = "Linea" and {% parameter Tipo  %} = "Dinero"
            THEN ${Totoal_Lineas_Generales_dinero}


      END ;;
    value_format: "#,##0.00"
  }




  dimension: planta {
    type: string
    sql: case when Pedido_Devoluci__n='60046070' then 'Partidor, MX'
             when Pedido_Devoluci__n='60046070' then 'Tijuana, MX'
when Pedido_Devoluci__n='60046017' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60045804' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60045801' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60046193' then 'Tijuana, MX'
when Pedido_Devoluci__n='60046147' then 'Monterrey , MX'
when Pedido_Devoluci__n='60046306' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60046199' then 'Guaymas, MX'
when Pedido_Devoluci__n='60046447' then 'Tijuana, MX'
when Pedido_Devoluci__n='60046654' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60046694' then 'Partidor, MX'
when Pedido_Devoluci__n='60046693' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60046918' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60046919' then 'San Lucas, GT'
when Pedido_Devoluci__n='60046925' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60047001' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60046923' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60047095' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60047074' then 'Guaymas, MX'
when Pedido_Devoluci__n='60047207' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60047262' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60047538' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60047537' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60047536' then 'Partidor, MX'
when Pedido_Devoluci__n='60047835' then 'Partidor, MX'
when Pedido_Devoluci__n='60047834' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60048012' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60048013' then 'Guaymas, MX'
when Pedido_Devoluci__n='60048014' then 'Guaymas, MX'
when Pedido_Devoluci__n='60048094' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60048095' then 'Guaymas, MX'
when Pedido_Devoluci__n='60048127' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60048102' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60048057' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60048229' then 'Partidor, MX'
when Pedido_Devoluci__n='60048275' then 'Monterrey , MX'
when Pedido_Devoluci__n='60048287' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60048369' then 'Monterrey , MX'
when Pedido_Devoluci__n='60050707' then 'Tijuana, MX'
when Pedido_Devoluci__n='60050709' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60048162' then 'Monterrey , MX'
when Pedido_Devoluci__n='60048166' then 'Tijuana, MX'
when Pedido_Devoluci__n='60048167' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60048176' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60048364' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60048307' then 'San Lucas, GT'
when Pedido_Devoluci__n='60047422' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60047269' then 'San Lucas, GT'
when Pedido_Devoluci__n='60048502' then 'Monterrey , MX'
when Pedido_Devoluci__n='60048504' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60048693' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60048695' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60048799' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60048843' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60048583' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60046774' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60046773' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60049134' then 'Tijuana, MX'
when Pedido_Devoluci__n='60049135' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60048431' then 'San Lucas, GT'
when Pedido_Devoluci__n='60049293' then 'Guaymas, MX'
when Pedido_Devoluci__n='60051534' then 'Guaymas, MX'
when Pedido_Devoluci__n='60051528' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60051523' then 'Guaymas, MX'
when Pedido_Devoluci__n='60052394' then 'San Lucas, GT'
when Pedido_Devoluci__n='60054652' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60050199' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60050200' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60050202' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60049236' then 'Guaymas, MX'
when Pedido_Devoluci__n='60047443' then 'Monterrey , MX'
when Pedido_Devoluci__n='60049860' then 'Partidor, MX'
when Pedido_Devoluci__n='60050107' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60050108' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60050109' then 'Guaymas, MX'
when Pedido_Devoluci__n='60050110' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60050112' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60050236' then 'Guaymas, MX'
when Pedido_Devoluci__n='60050325' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60050330' then 'Monterrey , MX'
when Pedido_Devoluci__n='60050293' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60050408' then 'San Lucas, GT'
when Pedido_Devoluci__n='60050453' then 'San Lucas, GT'
when Pedido_Devoluci__n='60050503' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60050716' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60050365' then 'Tijuana, MX'
when Pedido_Devoluci__n='60050697' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60050470' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60050835' then 'Partidor, MX'
when Pedido_Devoluci__n='60051377' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60051378' then 'Monterrey , MX'
when Pedido_Devoluci__n='60050838' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60051583' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60051595' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60051596' then 'Guaymas, MX'
when Pedido_Devoluci__n='60051592' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60051594' then 'San Lucas, GT'
when Pedido_Devoluci__n='60051706' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60052049' then 'Partidor, MX'
when Pedido_Devoluci__n='60051811' then 'Partidor, MX'
when Pedido_Devoluci__n='60051773' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60052119' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60052018' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60052019' then 'Tijuana, MX'
when Pedido_Devoluci__n='60052343' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60052178' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60052179' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60050956' then 'Monterrey , MX'
when Pedido_Devoluci__n='60052291' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60052293' then 'Monterrey , MX'
when Pedido_Devoluci__n='60052359' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60052438' then 'Guaymas, MX'
when Pedido_Devoluci__n='60052301' then 'San Lucas, GT'
when Pedido_Devoluci__n='60052540' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60051929' then 'Guaymas, MX'
when Pedido_Devoluci__n='60051930' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60052770' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60051793' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60051792' then 'Monterrey , MX'
when Pedido_Devoluci__n='60052779' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60052945' then 'Monterrey , MX'
when Pedido_Devoluci__n='60051928' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60053000' then 'Tijuana, MX'
when Pedido_Devoluci__n='60053001' then 'Partidor, MX'
when Pedido_Devoluci__n='60053063' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60053101' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60053115' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60053116' then 'Guaymas, MX'
when Pedido_Devoluci__n='60053423' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60053508' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60053509' then 'Guaymas, MX'
when Pedido_Devoluci__n='60053510' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60052415' then 'Tijuana, MX'
when Pedido_Devoluci__n='60053462' then 'San Lucas, GT'
when Pedido_Devoluci__n='60053545' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60053546' then 'Guaymas, MX'
when Pedido_Devoluci__n='60053713' then 'Partidor, MX'
when Pedido_Devoluci__n='60053711' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60053720' then 'Tijuana, MX'
when Pedido_Devoluci__n='60054022' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60054029' then 'Tijuana, MX'
when Pedido_Devoluci__n='60052777' then 'San Lucas, GT'
when Pedido_Devoluci__n='60054566' then 'San Lucas, GT'
when Pedido_Devoluci__n='60054488' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60054410' then 'Monterrey , MX'
when Pedido_Devoluci__n='60054414' then 'Partidor, MX'
when Pedido_Devoluci__n='60054897' then 'Guaymas, MX'
when Pedido_Devoluci__n='60054898' then 'Monterrey , MX'
when Pedido_Devoluci__n='60054899' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60054707' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60053846' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60054020' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60054961' then 'Tijuana, MX'
when Pedido_Devoluci__n='60055070' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60055071' then 'Partidor, MX'
when Pedido_Devoluci__n='60055469' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60054715' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60054880' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60055049' then 'Partidor, MX'
when Pedido_Devoluci__n='60055317' then 'Guaymas, MX'
when Pedido_Devoluci__n='60055181' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60055260' then 'Guaymas, MX'
when Pedido_Devoluci__n='60055461' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60055484' then 'San Lucas, GT'
when Pedido_Devoluci__n='60055534' then 'Guaymas, MX'
when Pedido_Devoluci__n='60055471' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60055472' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60055473' then 'Monterrey , MX'
when Pedido_Devoluci__n='60055504' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60055505' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60055408' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60055428' then 'Tijuana, MX'
when Pedido_Devoluci__n='60055502' then 'San Lucas, GT'
when Pedido_Devoluci__n='60055503' then 'Tijuana, MX'
when Pedido_Devoluci__n='60055736' then 'CDI Guadalajara, MX'
when Pedido_Devoluci__n='60055712' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60055261' then 'Partidor, MX'
when Pedido_Devoluci__n='60055859' then 'San Lucas, GT'
when Pedido_Devoluci__n='60055619' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60055663' then 'Monterrey , MX'
when Pedido_Devoluci__n='60055665' then 'Partidor, MX'
when Pedido_Devoluci__n='60055964' then 'San Lucas, GT'
when Pedido_Devoluci__n='60056008' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60056005' then 'San Lucas, GT'
when Pedido_Devoluci__n='60056007' then 'Partidor, MX'
when Pedido_Devoluci__n='60056204' then 'Monterrey , MX'
when Pedido_Devoluci__n='60052120' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60052121' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60054976' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60056449' then 'San Lucas, GT'
when Pedido_Devoluci__n='60056661' then 'Tijuana, MX'
when Pedido_Devoluci__n='60056388' then 'San Lucas, GT'
when Pedido_Devoluci__n='60056387' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60056386' then 'Guaymas, MX'
when Pedido_Devoluci__n='60056384' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60056826' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60056959' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60056629' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60056958' then 'Cuautitlán, MX'
when Pedido_Devoluci__n='60056568' then 'Mazatlan I, MX'
when Pedido_Devoluci__n='60057404' then 'San Lucas, GT'
when Pedido_Devoluci__n='60057405' then 'CDI Constitucion, MX'
when Pedido_Devoluci__n='60057402' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60057503' then 'San Lucas, GT'
when Pedido_Devoluci__n='60057582' then 'San Lucas, GT'
when Pedido_Devoluci__n='60057574' then 'Monterrey , MX'
when Pedido_Devoluci__n='60058733' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60057527' then 'Monterrey , MX'
when Pedido_Devoluci__n='60057888' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60052514' then 'Tijuana, MX'
when Pedido_Devoluci__n='60057892' then 'CDI Monterrey, MX'
when Pedido_Devoluci__n='60057890' then 'Mazatlan II, MX'
when Pedido_Devoluci__n='60058098' then 'Cuautitlán, MX'




    else 'Cuautitlán, MX' end ;;
  }





  set: detail {
    fields: [
        no_,
  estado_embarques,
  __rea_recibo,

  autorizado,
  l__nea_negocio,
  pedido_devoluci__n,
  nota_cr__dito,
  factura,
  motivo_devoluci__n,
  supervisor,
  tipo_de_devoluci__n,
  fecha_y_hora_de_descarga,
  tiempo_de_descarga,
  fecha_y_hora_de_reporte_de_incidencia,
  __rea_responsable_del_seguimiento,
  fecha_de_ingreso_de_material_a_sap,
  fecha_de_entrega_de_nota_de_cr__dito,
  autorizado_por_jonas,
  linea_de_transporte,
  operador,
  consigna,
  caso,
  concesi__n,
  __cliente,
  c__digo,
  descripci__n_,
  cantidad_devuelta,
  cantidad_liberada,
  cantidad_rechazada,
  defecto,
  __rea_responsable,
  estado,
  string_field_33,
  string_field_34,
  string_field_35,
  string_field_36,
  string_field_37,
  string_field_38,
  int64_field_39,
  int64_field_40,
  string_field_41,
  int64_field_42,
  string_field_43
    ]
  }
}
