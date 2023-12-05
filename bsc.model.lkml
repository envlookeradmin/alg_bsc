connection: "envases-eon-alg"


include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

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
  join: proveedor {
    type: left_outer
    sql_on: ${ordenes_compra.Proveedor} = ${proveedor.proveedor_id} ;;
    relationship: many_to_one
  }
}
