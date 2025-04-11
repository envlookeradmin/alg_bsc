connection: "@{CONNECTION_NAME}"


include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

include: "/**/*.dashboard"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: ordenes_compra{
  join: comprador {
    type: left_outer
    sql_on: ${ordenes_compra.Grupo_Compras} = ${comprador.grupo_compras} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${ordenes_compra.Planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${fecha.fecha} = ${ordenes_compra.Fecha_Modificacion_Solicitud} ;;
    relationship: many_to_one
  }

  join: fecha_solicitud {
    type: left_outer
    sql_on: ${fecha_solicitud.fecha} = ${ordenes_compra.Fecha_Modificacion_Solicitud} ;;
    relationship: many_to_one
  }
  join: fecha_orden {
    type: left_outer
    sql_on: ${fecha_orden.fecha} = ${ordenes_compra.Fecha_Creacion_PO} ;;
    relationship: many_to_one
  }

  join: proveedor {
    type: left_outer
    sql_on: ${ordenes_compra.Proveedor} = ${proveedor.proveedor_id} ;;
    relationship: many_to_one
  }
}

explore: tiempos_estadia{
  join: planta {
    type: left_outer
    sql_on: ${tiempos_estadia.Planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${tiempos_estadia.FechaDeEntrada} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
  join: actividad {
    type: left_outer
    sql_on: ${tiempos_estadia.IdActividad} = ${actividad.actividad_id} ;;
    relationship: many_to_one
  }
  join: proveedor {
    type: left_outer
    sql_on: ${tiempos_estadia.IDProveedor} = ${proveedor.proveedor_id} ;;
    relationship: many_to_one
  }
}

explore: materiales_inventario {
  join: material {
    type: left_outer
    sql_on:${materiales_inventario.id_material}=${material.id_material};;
    relationship: many_to_one
  }

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${material.grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }

  join: planta  {
    type: left_outer
    sql_on: ${materiales_inventario.centro} = ${planta.planta_id} ;;
    relationship: many_to_one
  }

  join: fecha {
    type: left_outer
    sql_on:   ${materiales_inventario.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }

}

explore: fct_ordenes_pedidos {

  join: material {
    type: left_outer
    sql_on:${fct_ordenes_pedidos.id_material}=${material.id_material};;
    relationship: many_to_one
  }

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${material.grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }

  join: planta {
    type: left_outer
    sql_on: ${fct_ordenes_pedidos.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on:${fct_ordenes_pedidos.fecha_entrega_planeada}  = ${fecha.fecha} ;;
    relationship: many_to_one
  }

  join: dim_canal_distribucion {
    type: left_outer
    sql_on: ${fct_ordenes_pedidos.canal_distribucion} = ${dim_canal_distribucion.canal_distribucion} ;;
    relationship: many_to_one
  }

}

explore: fct_ordenes_pedidos_anual {

  join: material {
    type: left_outer
    sql_on:${fct_ordenes_pedidos_anual.id_material}=${material.id_material};;
    relationship: many_to_one
  }

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${material.grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }

  join: planta {
    type: left_outer
    sql_on: ${fct_ordenes_pedidos_anual.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${fct_ordenes_pedidos_anual.fecha_entrega_planeada} = ${fecha.fecha} ;;
    relationship: many_to_one
  }


  join: dim_canal_distribucion {
    type: left_outer
    sql_on: ${fct_ordenes_pedidos_anual.canal_distribucion} = ${dim_canal_distribucion.canal_distribucion} ;;
    relationship: many_to_one
  }



}

explore: inventarios_ciclicos {
  join: planta {
    type: left_outer
    sql_on: ${inventarios_ciclicos.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  #join: fecha {
  #  type: left_outer
  #  sql_on: ${inventarios_ciclicos.fecha_documento} = ${fecha.fecha} ;;
  #  relationship: many_to_one
  #}
}


explore: inventario_fletes {
  join: planta {
    type: left_outer
    sql_on: ${inventario_fletes.Planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${inventario_fletes.Fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
}

explore: presupuesto_inventario_fletes {
  join: planta {
    type: left_outer
    sql_on: ${presupuesto_inventario_fletes.Planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${presupuesto_inventario_fletes.Fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
}


explore: calidad {
  join: planta {
    type: left_outer
    sql_on: ${calidad.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${calidad.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
  join: motivo_devolucion {
    type:  left_outer
    sql_on: ${calidad.codigo_devolucion} = ${motivo_devolucion.codigo_devolucion};;
    relationship: many_to_one
  }
}

explore: fct_seguridad {
  join: planta {
    type: left_outer
    sql_on: ${fct_seguridad.centro} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${fct_seguridad.fecha} = ${fecha.fecha} ;;

    relationship: many_to_one
  }
}

explore: fct_seguridad_anual {
  join: planta {
    type: left_outer
    sql_on: ${fct_seguridad_anual.centro} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${fct_seguridad_anual.fecha} = ${fecha.fecha} ;;

    relationship: many_to_one
  }
}




explore: fct_ordenes_compra_otif {
  join: comprador {
    type: left_outer
    sql_on: ${fct_ordenes_compra_otif.grupo_compras} = ${comprador.grupo_compras} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${fct_ordenes_compra_otif.planta} = ${planta.planta_id} ;;

    relationship: many_to_one
  }
}

explore: fct_manufactura {



  join: grupo_materiales  {
    type: left_outer
    sql_on: ${fct_manufactura.id_grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${fct_manufactura.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }

  join: fecha {
    type: left_outer
    sql_on: ${fct_manufactura.fecha_fin_real} = ${fecha.fecha} ;;

    relationship: many_to_one
  }
}


explore: fct_presupuesto_ventas {

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${fct_presupuesto_ventas.id_grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${fct_presupuesto_ventas.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: fecha {
    type: left_outer
    sql_on: ${fct_presupuesto_ventas.fecha} = ${fecha.fecha} ;;

    relationship: many_to_one
  }

  join: cliente {
    type: left_outer
    sql_on: ${fct_presupuesto_ventas.id_cliente} = ${cliente.id_cliente} ;;

    relationship: many_to_one
  }

}

explore: fct_materiales_stock {

  join: material {
    type: left_outer
    sql_on:${fct_materiales_stock.id_material}=${material.id_material};;
    relationship: many_to_one
  }

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${material.grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }


  join: fecha {
    type: left_outer
    sql_on: ${fct_materiales_stock.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }

  join: planta {
    type: left_outer
    sql_on: ${fct_materiales_stock.centro} = ${planta.planta_id} ;;
    relationship: many_to_one
  }

  join: proveedor {
    type: left_outer
    sql_on: ${fct_materiales_stock.id_provedor_cliente} = ${proveedor.proveedor_id} ;;
    relationship: many_to_one
  }
  join: cliente {
    type: left_outer
    sql_on: ${fct_materiales_stock.id_provedor_cliente} = ${cliente.id_cliente} ;;
    relationship: many_to_one
  }

}

explore: fct_desperdicio_prod {

  join: material {
    type: left_outer
    sql_on:${fct_desperdicio_prod.material}=REGEXP_REPLACE( ${material.id_material}, '^0+','') ;;
    relationship: many_to_one
  }

  join: grupo_materiales  {
    type: left_outer
    sql_on: ${material.grupo_material} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
  }

  join: grupos_articulos_desperdicios  {
    type: left_outer
    sql_on: ${fct_desperdicio_prod.planta} = ${grupos_articulos_desperdicios.centro}
      and ${grupo_materiales.id_grupo} = ${grupos_articulos_desperdicios.grupo_articulo} ;;
    relationship: many_to_one
  }

  join: fecha {
    type: left_outer
    sql_on: ${fct_desperdicio_prod.fecha_documento} = ${fecha.fecha} ;;
    relationship: many_to_one
  }


  join: planta {
    type: left_outer
    sql_on: ${fct_desperdicio_prod.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }

}

explore: dim_canal_distribucion {}
explore: fct_rpm {
  join: fecha {
    type: left_outer
    sql_on: ${fct_rpm.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }


  join: planta {
    type: left_outer
    sql_on: ${fct_rpm.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
}

explore: fct_inventarios_ciclicos2 {}
explore: grupo_materiales {}

explore: fct_analisis_energeticos {}

explore: fact_lento_movimiento {
  join: grupo_materiales {
    type: left_outer
    sql_on: ${fact_lento_movimiento.grupo_sap} = ${grupo_materiales.id_grupo} ;;
    relationship: many_to_one
    view_label: ""
  }
}

explore: fct_logistica_transporte {}
explore: fct_gastos_adicionales {}


explore: fct_retorno_material_empaque {
  join: planta {
    type: left_outer
    sql_on: ${fct_retorno_material_empaque.planta} = ${planta.planta_id} ;;
    relationship: many_to_one
  }
  join: cliente {
    type: left_outer
    sql_on: ${fct_retorno_material_empaque.ID_CLIENTE} = ${cliente.id_cliente} ;;
    relationship: many_to_one
  }
}

explore: fct_produccion_pet {}
explore: fct_devoluciones {}
explore: fct_devoluciones_1 {}

explore: desperdicios_acdoca {
  join: fecha {
    type: inner
    relationship: many_to_one
    sql_on: ${desperdicios_acdoca.fecha_documento_date} = ${fecha.fecha} ;;
  }
}
explore: desperdicios_mseg {
  join: fecha {
    type: inner
    relationship: many_to_one
    sql_on: ${desperdicios_mseg.fecha_documento_date} = ${fecha.fecha} ;;
  }
}
