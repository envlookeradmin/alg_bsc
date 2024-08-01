---
- dashboard: reporte_de_operacines_alg
  title: Reporte de Operaciónes ALG
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wcdpfqjKBLIVOs1wzwD9al
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-radius: 15px; padding: 5px; background: white;\
      \ height: 65px; color: red; border: solid #8d1107\">\n\t<nav style=\"font-size:\
      \ 18px;\">\n\t\t<img style=\"height: 50px; float: left\" src=\"https://www.envases.mx/media/1245/icon_brands.png\"\
      />\n\n\n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left;\
      \ line-height: 40px; font-weight: bold; color: white;\n        border-radius:\
      \ 5px; margin-left: 5px; background-color: #b46e68;\"\n        href=\"https://envasesdirecto.cloud.looker.com/dashboards/180\"\
      ><h6>OTIF</h6></a>\n\n   <a style=\"color: #5e2129; padding: 5px 20px;\n   \
      \     float: left; line-height: 40px; font-weight: bold; color: white;\n   \
      \     border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n \
      \       href=\"https://envasesdirecto.cloud.looker.com/dashboards/182\"><h6>INVENTARIOS</h6></a>\n\
      \n\n\n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envasesdirecto.cloud.looker.com/dashboards/139\"\
      >\n<h6>INVENTARIO NO CONFORME</h6></a>\n\n<a style=\"color: #5e2129; padding:\
      \ 5px 20px;\n        float: left; line-height: 40px; font-weight: bold; color:\
      \ white;\n        border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\
      \n        href=\"https://envasesdirecto.cloud.looker.com/dashboards/169\"><h6>MATERIAL\
      \ DE EMPAQUE</h6></a>\n   <a style=\"color: #5e2129; padding: 5px 20px;\n  \
      \      float: left; line-height: 40px; font-weight: bold; color: white;\n  \
      \      border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n\
      \        href=\"https://envasesdirecto.cloud.looker.com/dashboards/184\"><h6>DESPERDICIOS</h6></a>\n\
      \n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envasesdirecto.cloud.looker.com/dashboards/134\"\
      ><h6>TIEMPOS DE ESTADIA</h6></a>\n\n<a style=\"color: #5e2129; padding: 5px\
      \ 20px;\n        float: left; line-height: 40px; font-weight: bold; color: white;\n\
      \        border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n\
      \        href=\"https://envasesdirecto.cloud.looker.com/dashboards/181\"><h6>FLETES</h6></a>\n\
      \n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envasesdirecto.cloud.looker.com/folders/96\"\
      ><h6>COMPRAS</h6></a>\n\n   <a style=\"color: #5e2129; padding: 5px 20px;\n\
      \        float: left; line-height: 40px; font-weight: bold; color: white;\n\
      \        border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n\
      \        href=\"https://envasesdirecto.cloud.looker.com/dashboards/151\"><h6>CALIDAD</h6></a>\n\
      \n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envasesdirecto.cloud.looker.com/dashboards/157\"\
      ><h6>SEGURIDAD</h6></a>\n\n<a style=\"color: #5e2129; padding: 5px 20px;\n \
      \       float: left; line-height: 40px; font-weight: bold; color: white;\n \
      \       border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n\
      \        href=\"https://envasesdirecto.cloud.looker.com/dashboards/208\"><h6>RPM</h6></a>\n\
      \n\n\n\t</nav>\n</div>\n\n\n\n"
    row: 3
    col: 0
    width: 24
    height: 2
  - title: ADP Trimestre
    name: ADP Trimestre
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [planta.planta_completo, planta.planta_id, fct_seguridad_anual.Total_ADP,
      fecha.trimestre_Letra]
    pivots: [fecha.trimestre_Letra]
    filters: {}
    sorts: [fecha.trimestre_Letra, planta.planta_id]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
      fecha.trimestre_Letra: Trimestre
      planta.planta_completo: Planta
    series_cell_visualizations:
      fct_seguridad_anual.count_trimestre:
        is_active: false
    series_text_format:
      fct_seguridad_anual.Total_ADP:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [planta.planta_id]
    listen:
      Fecha: fct_seguridad_anual.date_filter
      Planta: planta.planta_completo
    row: 149
    col: 0
    width: 12
    height: 5
  - title: ADP Acumulado
    name: ADP Acumulado
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [planta.planta_completo, planta.planta_id, fct_seguridad_anual.Total_ADP]
    filters: {}
    sorts: [planta.planta_id]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
      planta.planta_completo: Planta
    series_cell_visualizations:
      fct_seguridad_anual.count_trimestre:
        is_active: false
    series_text_format:
      fct_seguridad_anual.Total_ADP:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [planta.planta_id]
    listen:
      Fecha: fct_seguridad_anual.date_filter
      Planta: planta.planta_completo
    row: 154
    col: 0
    width: 24
    height: 5
  - title: ADP Mes
    name: ADP Mes
    model: bsc
    explore: fct_seguridad
    type: looker_grid
    fields: [fecha.nombre_mes, fct_seguridad.Total_ADP, planta.planta_id, planta.planta_completo]
    pivots: [fecha.nombre_mes]
    filters: {}
    sorts: [fecha.nombre_mes, planta.planta_id]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      planta.planta_completo: left
      planta.planta_comercializadora: left
    column_order: [planta.planta_completo, planta.planta_comercializadora, Septiembre|FIELD|2023-09_fct_seguridad.Total_ADP,
      Octubre|FIELD|2023-10_fct_seguridad.Total_ADP, Noviembre|FIELD|2023-11_fct_seguridad.Total_ADP]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fct_seguridad.count_trimestre: ADP Mes
      fct_seguridad.Total_ADP: ADP Mes
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_seguridad.count:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [planta.planta_id]
    listen:
      Fecha: fct_seguridad.date_filter
      Planta: planta.planta_completo
    row: 149
    col: 12
    width: 12
    height: 5
  - title: Material de Empaque
    name: Material de Empaque
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_completo, fct_materiales_stock.Cantidad_stock, fct_materiales_stock.valor_stock,
      fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion]
    pivots: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion]
    filters:
      planta.planta_comercializadora: ''
    sorts: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion, planta.planta_completo,
      fct_materiales_stock.valor_stock desc 0]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [planta.planta_completo, planta.planta_comercializadora, fct_materiales_stock.Familia,
      fct_materiales_stock.Clasificacion_proveedor, fct_materiales_stock.tipo_proveedor_cliente,
      Diciembre|FIELD|2023-12|FIELD|Cliente_fct_materiales_stock.Cantidad_stock, Diciembre|FIELD|2023-12|FIELD|Cliente_fct_materiales_stock.valor_stock,
      Diciembre|FIELD|2023-12|FIELD|Envases_fct_materiales_stock.Cantidad_stock, Diciembre|FIELD|2023-12|FIELD|Envases_fct_materiales_stock.valor_stock,
      Enero|FIELD|2024-01|FIELD|Cliente_fct_materiales_stock.Cantidad_stock, Enero|FIELD|2024-01|FIELD|Cliente_fct_materiales_stock.valor_stock,
      Enero|FIELD|2024-01|FIELD|Envases_fct_materiales_stock.Cantidad_stock, Enero|FIELD|2024-01|FIELD|Envases_fct_materiales_stock.valor_stock]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      grupo_materiales.descripcion: Familia
      fecha.nombre_mes: Mes
      planta.planta_comercializadora: Planta
      planta.planta_completo: Planta
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
      planta.planta_completo: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Fecha: fct_materiales_stock.date_filter
      Planta: planta.planta_completo
    row: 69
    col: 0
    width: 24
    height: 12
  - title: 'Material de Empaque Totales '
    name: 'Material de Empaque Totales '
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_completo, fct_materiales_stock.Cantidad_stock, fct_materiales_stock.valor_stock,
      fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      planta.planta_comercializadora: ''
    sorts: [fecha.nombre_mes, planta.planta_completo]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      grupo_materiales.descripcion: Familia
      fecha.nombre_mes: Mes
      planta.planta_completo: Planta
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
      planta.planta_completo: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: fct_materiales_stock.date_filter
      Planta: planta.planta_completo
    row: 81
    col: 0
    width: 24
    height: 11
  - title: Año anterior
    name: Año anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Prom_Estadia_AA, tiempos_estadia.vacio,
      tiempos_estadia.NombreLocacion]
    pivots: [tiempos_estadia.vacio]
    filters:
      actividad.descripcion: EMBARQUES
    sorts: [tiempos_estadia.vacio, tiempos_estadia.Orden_locacion]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      planta.planta_completo_t_estadia: Planta
      tiempos_estadia.PlantaCompleto: Planta
      tiempos_estadia.NombreLocacion: Locacion
    series_column_widths:
      tiempos_estadia.NombreLocacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
      Planta: planta.planta_completo
    row: 107
    col: 0
    width: 7
    height: 4
  - title: Por mes
    name: Por mes
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Prom_Estadia, fecha.nombre_mes,
      tiempos_estadia.NombreLocacion]
    pivots: [fecha.nombre_mes]
    filters:
      tiempos_estadia.ultimos_2_meses: '1'
      actividad.descripcion: EMBARQUES
    sorts: [fecha.nombre_mes, tiempos_estadia.Orden_locacion]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      fecha.nombre_mes: Mes
      tiempos_estadia.PlantaCompleto: Planta
      tiempos_estadia.NombreLocacion: Locación
    series_column_widths:
      tiempos_estadia.NombreLocacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    series_text_format:
      fecha.nombre_mes:
        align: left
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
      Planta: planta.planta_completo
    row: 107
    col: 7
    width: 10
    height: 4
  - title: Mes seleccionado vs mes anterior
    name: Mes seleccionado vs mes anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Diferencia, tiempos_estadia.vacio,
      tiempos_estadia.NombreLocacion]
    pivots: [tiempos_estadia.vacio]
    filters:
      actividad.descripcion: EMBARQUES
    sorts: [tiempos_estadia.vacio, tiempos_estadia.Orden_locacion]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      tiempos_estadia.PlantaCompleto: Planta
      tiempos_estadia.NombreLocacion: Locacion
    series_column_widths:
      tiempos_estadia.NombreLocacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
      Planta: planta.planta_completo
    row: 107
    col: 17
    width: 7
    height: 4
  - title: Inventario no conforme
    name: Inventario no conforme
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [materiales_inventario.Total_pt, materiales_inventario.Total_Componentes,
      materiales_inventario.Total_Hoja, fecha.nombre_mes, planta.planta_comercializadora,
      planta.planta_id, planta.planta_completo]
    pivots: [fecha.nombre_mes]
    filters:
      materiales_inventario.2_meses: '1'
    sorts: [fecha.nombre_mes, planta.planta_id]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
    series_column_widths:
      planta.planta_comercializadora: 150
    series_cell_visualizations:
      materiales_inventario.Total_pt:
        is_active: false
    series_text_format:
      planta.planta_comercializadora:
        align: left
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [planta.planta_id, planta.planta_comercializadora]
    listen:
      Fecha: materiales_inventario.date_filter
      Planta: planta.planta_completo
    row: 57
    col: 0
    width: 13
    height: 10
  - title: Mes seleccionado
    name: Mes seleccionado
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [planta.planta_comercializadora, materiales_inventario.Variacion_pt, materiales_inventario.Variacion_componente,
      materiales_inventario.Variacion_hoja, materiales_inventario.desc_mes_actual,
      planta.planta_id, planta.planta_completo]
    pivots: [materiales_inventario.desc_mes_actual]
    filters: {}
    sorts: [materiales_inventario.desc_mes_actual, planta.planta_id]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
      materiales_inventario.desc_mes_actual: Mes
    series_column_widths:
      planta.planta_comercializadora: 150
    series_cell_visualizations:
      materiales_inventario.Total_pt:
        is_active: false
    series_text_format:
      planta.planta_comercializadora:
        align: left
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [planta.planta_id, planta.planta_comercializadora]
    listen:
      Fecha: materiales_inventario.date_filter
      Planta: planta.planta_completo
    row: 57
    col: 13
    width: 11
    height: 10
  - title: Productividad
    name: Productividad
    model: bsc
    explore: ordenes_compra
    type: looker_grid
    fields: [ordenes_compra.Planta, planta.planta_completo, comprador.gerencia, comprador.comprador,
      ordenes_compra.Porc_Productividad_Alcanzada, ordenes_compra.Prom_Dias_Atencion]
    filters:
      ordenes_compra.date_filter: 2023/07/31
    sorts: [ordenes_compra.Planta, planta.planta_completo, comprador.gerencia]
    subtotals: [ordenes_compra.Planta, planta.planta_completo, comprador.gerencia]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [planta.planta_completo, comprador.gerencia, comprador.comprador,
      ordenes_compra.Porc_Productividad_Alcanzada, ordenes_compra.Prom_Dias_Atencion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.nombre_planta: Planta
      planta.planta_completo_c: Planta
      planta.planta_completo_prod: Planta
      ordenes_compra.PlantaCompletoProd: Planta
      planta.planta_completo: Planta
    series_cell_visualizations: {}
    series_collapsed:
      ordenes_compra.Planta: true
      comprador.gerencia: true
      planta.planta_completo: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [ordenes_compra.Planta]
    listen:
      Fecha: ordenes_compra.Fecha_s_date
      Planta: planta.planta_completo
    row: 123
    col: 0
    width: 24
    height: 7
  - title: OTIF Compras
    name: OTIF Compras
    model: bsc
    explore: fct_ordenes_compra_otif
    type: looker_grid
    fields: [planta.planta_completo, fct_ordenes_compra_otif.planta, comprador.gerencia,
      fct_ordenes_compra_otif.total_ordenes, fct_ordenes_compra_otif.ordenes_en_tiempo,
      fct_ordenes_compra_otif.otif]
    filters:
      comprador.gerencia: "-NULL"
      fct_ordenes_compra_otif.comprador: "-JESSICA PATRICIA ALCALA,-DIANA GARCIA"
      fct_ordenes_compra_otif.material: "-000000000004000009,-000000000006000094,-000000000006000095"
    sorts: [planta.planta_completo, fct_ordenes_compra_otif.planta, comprador.gerencia]
    subtotals: [planta.planta_completo, fct_ordenes_compra_otif.planta]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
    series_cell_visualizations:
      fct_ordenes_compra_otif.total_ordenes:
        is_active: false
    series_collapsed:
      fct_ordenes_compra_otif.planta: true
      comprador.gerencia: true
      planta.planta_completo: true
    header_font_color: "#ffffff"
    header_background_color: "#702119"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [fct_ordenes_compra_otif.planta]
    listen:
      Fecha: fct_ordenes_compra_otif.fecha
      Planta: planta.planta_completo
    row: 130
    col: 0
    width: 24
    height: 6
  - title: OTIF & FILL RATE TRIMESTRAL
    name: OTIF & FILL RATE TRIMESTRAL
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: looker_grid
    fields: [fct_ordenes_pedidos_anual.Total_fill_rate, fecha.trimestre_Letra, fct_ordenes_pedidos_anual.OTIF,
      fct_ordenes_pedidos_anual.planta, planta.planta_completo]
    pivots: [fecha.trimestre_Letra]
    filters:
      dim_canal_distribucion.canal_distribucion: ''
      planta.planta_comercializadora: ''
    sorts: [fecha.trimestre_Letra, fct_ordenes_pedidos_anual.planta]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
      planta.planta_completo: Planta
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    series_text_format:
      fecha.trimestre_Letra:
        align: center
      fct_ordenes_pedidos_anual.Total_fill_rate:
        align: center
      fct_ordenes_pedidos_anual.OTIF:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [fct_ordenes_pedidos_anual.planta]
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 7
    col: 0
    width: 24
    height: 11
  - title: OTIF & FILL RATE MENSUAL
    name: OTIF & FILL RATE MENSUAL
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [fct_ordenes_pedidos.Total_fill_rate, fecha.nombre_mes, fct_ordenes_pedidos.OTIF,
      fct_ordenes_pedidos.planta, planta.planta_completo]
    pivots: [fecha.nombre_mes]
    filters:
      planta.planta_comercializadora: ''
      dim_canal_distribucion.canal_distribucion: ''
    sorts: [fecha.nombre_mes, fct_ordenes_pedidos.planta]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      fecha.nombre_mes: Mes
      fct_ordenes_pedidos.Total_fill_rate: FR
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_ordenes_pedidos.Total_fill_rate:
        is_active: false
    series_text_format:
      fct_ordenes_pedidos.Total_fill_rate:
        align: center
      fct_ordenes_pedidos.OTIF:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [fct_ordenes_pedidos.planta]
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos.date_filter
      Planta: planta.planta_completo
    row: 18
    col: 0
    width: 24
    height: 12
  - title: Últimos 3 meses
    name: Últimos 3 meses
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      inventario_fletes.ValorStock, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      inventario_fletes.ultimos_3_meses: '1'
    sorts: [fecha.nombre_mes, inventario_fletes.grupo_planta_inv]
    subtotals: [inventario_fletes.grupo_planta_inv]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      Octubre|FIELD|10_inventario_fletes.ValorStock, Noviembre|FIELD|11_inventario_fletes.ValorStock,
      Diciembre|FIELD|12_inventario_fletes.ValorStock]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 100
    series_labels:
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      inventario_fletes.PlantaComercializadora: Planta
    series_column_widths:
      inventario_fletes.grupo_planta_inv: 100
      inventario_fletes.PlantaComercializadora: 160
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
    series_collapsed:
      inventario_fletes.grupo_planta_inv: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Fecha: inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 40
    col: 0
    width: 12
    height: 5
  - title: Variación mes seleccionado vs mes anterior
    name: Variación mes seleccionado vs mes anterior
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      inventario_fletes.VariacionMesPrevio, inventario_fletes.vacio]
    pivots: [inventario_fletes.vacio]
    filters: {}
    sorts: [inventario_fletes.vacio, inventario_fletes.grupo_planta_inv]
    subtotals: [inventario_fletes.grupo_planta_inv]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      __inventario_fletes.VariacionMesPrevio]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 120
    series_labels:
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      inventario_fletes.PlantaComercializadora: Planta
      inventario_fletes.vacio: _
    series_column_widths:
      inventario_fletes.PlantaComercializadora: 200
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
    series_collapsed:
      inventario_fletes.grupo_planta_inv: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Fecha: inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 40
    col: 12
    width: 12
    height: 5
  - title: Días de inventario trimestre
    name: Días de inventario trimestre
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      inventario_fletes.DiasInventarioTrimestre, fecha.trimestre_Letra]
    pivots: [fecha.trimestre_Letra]
    filters:
      inventario_fletes.anio_actual: '1'
      fecha.mes: ''
    sorts: [fecha.trimestre_Letra, inventario_fletes.grupo_planta_inv]
    subtotals: [inventario_fletes.grupo_planta_inv]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [inventario_fletes.grupo_planta_inv, inventario_fletes.PlantaComercializadora,
      Q1_inventario_fletes.DiasInventarioTrimestre, Q2_inventario_fletes.DiasInventarioTrimestre,
      Q3_inventario_fletes.DiasInventarioTrimestre, Q4_inventario_fletes.DiasInventarioTrimestre]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 100
    series_labels:
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      fecha.date_quarter: Trimestre
      inventario_fletes.PlantaComercializadora: Planta
      inventario_fletes.DiasInventarioTrimestre: Días de inventario
      fecha.trimestre_Letra: Trimestre
    series_column_widths:
      inventario_fletes.PlantaComercializadora: 160
      inventario_fletes.grupo_planta_inv: 200
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
    series_text_format:
      inventario_fletes.DiasInventarioTrimestre:
        align: center
    series_collapsed:
      inventario_fletes.grupo_planta_inv: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Fecha: inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 45
    col: 0
    width: 24
    height: 5
  - title: Días de inventario mes seleccionado
    name: Días de inventario mes seleccionado
    model: bsc
    explore: presupuesto_inventario_fletes
    type: looker_grid
    fields: [presupuesto_inventario_fletes.vacio, presupuesto_inventario_fletes.grupo_planta_inv,
      presupuesto_inventario_fletes.PlantaComercializadora, presupuesto_inventario_fletes.dias_inventario_mes,
      presupuesto_inventario_fletes.pre_dias_inventario_mes]
    pivots: [presupuesto_inventario_fletes.vacio]
    filters: {}
    sorts: [presupuesto_inventario_fletes.vacio, presupuesto_inventario_fletes.grupo_planta_inv,
      presupuesto_inventario_fletes.dias_inventario_mes desc 0]
    subtotals: [presupuesto_inventario_fletes.grupo_planta_inv]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 120
    series_labels:
      presupuesto_inventario_fletes.PlantaComercializadora: Planta
    series_column_widths:
      presupuesto_inventario_fletes.PlantaComercializadora: 200
    series_cell_visualizations:
      presupuesto_inventario_fletes.dias_inventario_mes:
        is_active: false
    series_collapsed:
      presupuesto_inventario_fletes.grupo_planta_inv: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Fecha: presupuesto_inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 50
    col: 0
    width: 24
    height: 5
  - title: Fletes
    name: Fletes
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.Centro, inventario_fletes.RealCostoFletesMTD, inventario_fletes.PorcRealFletesVentasMTD,
      inventario_fletes.RealCostoFletesYTD, inventario_fletes.PorcRealFletesVentasYTD,
      planta.planta_completo]
    sorts: [inventario_fletes.Centro]
    subtotals: [inventario_fletes.Centro]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      planta.planta_comercializadora: Planta
      inventario_fletes.GpoPlantaFletes: Planta
      inventario_fletes.PlantaFletes: Planta
    series_cell_visualizations:
      inventario_fletes.RealCostoFletes:
        is_active: false
    series_collapsed:
      inventario_fletes.Centro: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Fecha: inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 112
    col: 0
    width: 24
    height: 5
  - title: Presupuesto Fletes
    name: Presupuesto Fletes
    model: bsc
    explore: presupuesto_inventario_fletes
    type: looker_grid
    fields: [presupuesto_inventario_fletes.Centro, presupuesto_inventario_fletes.pre_costo_fletes_MTD,
      presupuesto_inventario_fletes.pre_porc_fletes_ventas_MTD, presupuesto_inventario_fletes.pre_costo_fletes_YTD,
      presupuesto_inventario_fletes.pre_porc_fletes_ventas_YTD, presupuesto_inventario_fletes.PlantaComercializadora]
    sorts: [presupuesto_inventario_fletes.Centro, presupuesto_inventario_fletes.pre_costo_fletes_MTD
        desc]
    subtotals: [presupuesto_inventario_fletes.Centro]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: 12
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      presupuesto_inventario_fletes.PlantaComercializadora: Planta
    series_cell_visualizations:
      presupuesto_inventario_fletes.pre_costo_fletes_MTD:
        is_active: false
    series_collapsed:
      presupuesto_inventario_fletes.Centro: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fecha: presupuesto_inventario_fletes.date_filter
      Planta: planta.planta_completo
    row: 117
    col: 0
    width: 24
    height: 4
  - title: BSC - Importes Cuenta Desperdicios
    name: BSC - Importes Cuenta Desperdicios
    model: bsc
    explore: fct_desperdicio_prod
    type: looker_grid
    fields: [planta.planta_completo, fecha.nombre_mes, fct_desperdicio_prod.Total_importe_produccion]
    pivots: [fecha.nombre_mes]
    filters:
      fct_desperdicio_prod.fuente: ACDOCA
      planta.planta_comercializadora: ''
    sorts: [fecha.nombre_mes, planta.planta_completo]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [planta.planta_completo, fct_desperdicio_prod.material, material.descripcion_material,
      fct_desperdicio_prod.Total_importe_produccion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      fct_desperdicio_prod.descripcion_material: Material
      fecha.nombre_mes: Mes
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_desperdicio_prod.Total_cantidad_produccion:
        is_active: false
    series_collapsed:
      planta.planta_completo: true
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    subtotals: [planta.planta_completo]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_desperdicio_prod.date_filter
      Planta: planta.planta_completo
    row: 94
    col: 0
    width: 24
    height: 5
  - title: BSC - Detalle Desperdicios por Material
    name: BSC - Detalle Desperdicios por Material
    model: bsc
    explore: fct_desperdicio_prod
    type: looker_grid
    fields: [planta.planta_completo, grupo_materiales.descripcion, fct_desperdicio_prod.Total_importe_produccion,
      fct_desperdicio_prod.Total_cantidad_produccion, fct_desperdicio_prod.Total_cantidad_desperdicio,
      fct_desperdicio_prod.Por_cantidad_desperdicio, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      fct_desperdicio_prod.fuente: MSEG
      grupos_articulos_desperdicios.grupo_articulo: "-BLI1018,-CAN1024,-BPP1018,-DRM1026,-HND3003,-JRY1025,-OLI1018,-OPP1018"
      planta.planta_comercializadora: ''
    sorts: [planta.planta_completo, fecha.nombre_mes]
    subtotals: [planta.planta_completo]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", planta.planta_completo, grupo_materiales.descripcion,
      Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_importe_produccion, Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_cantidad_produccion,
      Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_cantidad_desperdicio, Noviembre|FIELD|2023-11_fct_desperdicio_prod.Por_cantidad_desperdicio,
      Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_cantidad_produccion, Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_cantidad_desperdicio,
      Diciembre|FIELD|2023-12_fct_desperdicio_prod.Por_cantidad_desperdicio, Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_importe_produccion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      fct_desperdicio_prod.descripcion_material: Material
      fecha.nombre_mes: Mes
      grupo_materiales.descripcion: Grupo Materiales
    series_cell_visualizations:
      fct_desperdicio_prod.Total_cantidad_produccion:
        is_active: false
    series_collapsed:
      planta.planta_completo: true
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_desperdicio_prod.date_filter
      Planta: planta.planta_completo
    row: 99
    col: 0
    width: 24
    height: 6
  - title: Encabezado
    name: Encabezado
    model: bsc
    explore: fct_seguridad
    type: Single_Value_Viz_mul
    fields: [fct_seguridad.fecha_ultimo, fct_seguridad.created_date]
    filters: {}
    sorts: [fct_seguridad.fecha_ultimo desc]
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fct_seguridad.count_trimestre: ADP Mes
      fct_seguridad.Total_ADP: ADP Mes
      fecha.nombre_mes: Mes
    show_view_names: false
    html_template: '<table style="width: 99.3696%;"> <tbody> <tr> <td style="width:
      2.08333%; background-color: #ffffff; padding: 0px; border: none #000000; text-align:
      center;"><strong><strong><strong><span style="font-size: 15px; font-family:
      Arial, sans-serif;"><img style="float: right;" src="https://www.envases.mx/media/10273/envaseslogo_icon_new.png"
      width="151" height="60" /></span></strong></strong></strong></td> <td style="width:
      46.4625%; background-color: #5e2129; padding: 0px; border: none #000000; text-align:
      center;"> <h2><strong><span style="color: #ffffff;">Reporte de Operaci&oacute;nes
      ALG</span></strong></h2> <p><span style="color: #ffffff;">{{ fct_seguridad.fecha_ultimo
      }}</span></p> </td> </tr> </tbody> </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      planta.planta_completo: left
      planta.planta_comercializadora: left
    column_order: [planta.planta_completo, planta.planta_comercializadora, Septiembre|FIELD|2023-09_fct_seguridad.Total_ADP,
      Octubre|FIELD|2023-10_fct_seguridad.Total_ADP, Noviembre|FIELD|2023-11_fct_seguridad.Total_ADP]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_seguridad.count:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    hidden_pivots: {}
    defaults_version: 0
    title_hidden: true
    listen:
      Fecha: fct_seguridad.date_filter
      Planta: planta.planta_completo
    row: 0
    col: 0
    width: 24
    height: 3
  - name: FLETES
    type: text
    title_text: FLETES
    subtitle_text: ''
    body_text: ''
    row: 111
    col: 0
    width: 24
    height: 1
  - name: SEGURIDAD
    type: text
    title_text: SEGURIDAD
    subtitle_text: ''
    body_text: ''
    row: 148
    col: 0
    width: 24
    height: 1
  - title: Calidad por trimestre
    name: Calidad por trimestre
    model: bsc
    explore: calidad
    type: looker_grid
    fields: [calidad.grupo_planta, calidad.planta_completo, calidad.quejas, calidad.devoluciones,
      calidad.porc_pnc, fecha.trimestre_Letra]
    pivots: [fecha.trimestre_Letra]
    filters:
      calidad.anio_actual: '1'
    sorts: [fecha.trimestre_Letra, calidad.grupo_planta, calidad.planta_completo]
    subtotals: [calidad.grupo_planta]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 100
    series_labels:
      calidad.fecha_filtro_quarter: Trimestre
      fecha.trimestre_Letra: Trimestre
    series_column_widths:
      calidad.planta_completo: 160
      calidad.grupo_planta: 200
    series_cell_visualizations:
      calidad.Quejas:
        is_active: false
    series_text_format:
      calidad.quejas:
        align: center
      calidad.devoluciones:
        align: center
      calidad.porc_pnc:
        align: center
    series_collapsed:
      calidad.grupo_planta: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: calidad.date_filter
      Planta: planta.planta_completo
    row: 137
    col: 0
    width: 24
    height: 5
  - title: Calidad últimos 3 mes
    name: Calidad últimos 3 mes
    model: bsc
    explore: calidad
    type: looker_grid
    fields: [calidad.grupo_planta, calidad.planta_completo, calidad.quejas, calidad.devoluciones,
      calidad.porc_pnc, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      calidad.ultimos_3_meses: '1'
    sorts: [fecha.nombre_mes, calidad.grupo_planta, calidad.planta_completo]
    subtotals: [calidad.grupo_planta]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 100
    series_labels:
      calidad.fecha_filtro_quarter: Trimestre
      fecha.nombre_mes: Mes
    series_column_widths:
      calidad.planta_completo: 160
      calidad.grupo_planta: 200
    series_cell_visualizations:
      calidad.Quejas:
        is_active: false
    series_text_format:
      calidad.porc_pnc:
        align: center
      calidad.devoluciones:
        align: center
      calidad.quejas:
        align: center
    series_collapsed:
      calidad.grupo_planta: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: calidad.date_filter
      Planta: planta.planta_completo
    row: 142
    col: 0
    width: 24
    height: 6
  - name: CALIDAD
    type: text
    title_text: CALIDAD
    subtitle_text: ''
    body_text: ''
    row: 136
    col: 0
    width: 24
    height: 1
  - title: BSC LOGISTICA RPM
    name: BSC LOGISTICA RPM
    model: bsc
    explore: fct_rpm
    type: looker_grid
    fields: [fct_rpm.Total_porcentaje_efiiencia, planta.planta_completo, fecha.nombre_mes,
      fct_rpm.Total_utilidad]
    pivots: [fecha.nombre_mes]
    filters: {}
    sorts: [fecha.nombre_mes, fct_rpm.Total_porcentaje_efiiencia desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fct_rpm.Total_utilidad: UTI
      fecha.nombre_mes: Mes
      fct_rpm.Total_porcentaje_efiiencia: EFI
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_rpm.Total_porcentaje_efiiencia:
        is_active: false
    series_text_format:
      planta.planta_completo: {}
      fct_rpm.Total_porcentaje_efiiencia:
        align: center
      fct_rpm.Total_utilidad:
        align: center
      fecha.nombre_mes:
        align: center
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fecha: fct_rpm.date_filter
      Planta: planta.planta_completo
    row: 161
    col: 0
    width: 24
    height: 6
  - title: RPM SEMANAL
    name: RPM SEMANAL
    model: bsc
    explore: fct_rpm
    type: looker_grid
    fields: [fct_rpm.Total_porcentaje_efiiencia, planta.planta_completo, fecha.date_week,
      fct_rpm.Total_utilidad]
    pivots: [fecha.date_week]
    fill_fields: [fecha.date_week]
    filters: {}
    sorts: [fecha.date_week, fct_rpm.Total_porcentaje_efiiencia desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fct_rpm.Total_porcentaje_efiiencia: EFI
      fct_rpm.Total_utilidad: UTI
      fecha.date_week: Semana
      planta.planta_completo: Planta
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_rpm.Total_porcentaje_efiiencia:
        is_active: false
    series_text_format:
      fct_rpm.Total_utilidad:
        align: center
      fecha.date_week:
        align: center
      planta.planta_completo: {}
      fct_rpm.Total_porcentaje_efiiencia:
        align: center
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fecha: fct_rpm.date_filter
      Planta: planta.planta_completo
    row: 167
    col: 0
    width: 24
    height: 7
  - title: OTIF por Linea de Negocio Mes de Consulta
    name: OTIF por Linea de Negocio Mes de Consulta
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [planta.planta_completo, grupo_materiales.descripcion, fct_ordenes_pedidos.OTIF]
    pivots: [grupo_materiales.descripcion]
    filters:
      fct_ordenes_pedidos.date_filter: 2024/02/13 to 2024/02/22
      grupo_materiales.descripcion: Bote Línea General,Bote Ovalado,Bote Sanitario,Bote
        de Aerosol,Bote de Pescado,Bote de Pintura,Cubeta de Plástico n,Cubeta de
        Plástico s,Tambor de Polietilen
      planta.planta_comercializadora: ''
      dim_canal_distribucion.canal_distribucion: ''
    sorts: [grupo_materiales.descripcion, planta.planta_completo]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      fecha.nombre_mes: Mes
      grupo_materiales.descripcion: Grupo Materiales
    series_column_widths:
      planta.planta_completo: 200
    series_cell_visualizations:
      fct_ordenes_pedidos.Total_fill_rate:
        is_active: false
    series_text_format:
      fct_ordenes_pedidos.OTIF:
        align: center
    series_collapsed:
      fct_ordenes_pedidos.planta: true
      planta.planta_completo: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Planta: planta.planta_completo
    row: 30
    col: 0
    width: 24
    height: 8
  - title: OTIF
    name: OTIF
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">OTIF</span></p>                 <p><strong><span
      style="color: #ff0000;">84%&lt;</span> <span style="color: #ffcc00;">[85-94%]</span>
      <span style="color: #339966;">&gt;94%</span></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 5
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar)
    name: OTIF (Copiar)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">INVENTARIOS</span></p>                 <p><span
      style="color: #ff0000;"><span style="color: #339966;"><strong>0%&lt; &nbsp;&nbsp;</strong></span><strong>&gt;=0%</strong></span></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 38
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 2)
    name: OTIF (Copiar 2)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">INVENTARIO
      NO CONFORME</span></p>                 <p><strong><span style="color: rgb(226,
      80, 65);"><strong>Importe Actual&gt;Importe Anterior</strong></span><span style="color:
      #ff0000;"> &nbsp;</span> <span style="color: #ffcc00;">Importe Actual=Importe
      Anterior</span> <strong><span style="color: rgb(65, 168, 95);">Importe Actual&lt;Importe
      Anterior</span></strong></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 55
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 3)
    name: OTIF (Copiar 3)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">MATERIAL
      DE EMPAQUE</span></p>                 <p><strong>&nbsp;<span style="color: #339966;">Valor
      Stock Actual &gt; Valor Stock Anterior &nbsp;- <strong><span style="color: #ff0000;">Valor
      Stock Actual &lt; Valor Stock Anterior</span></strong></span></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 67
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 4)
    name: OTIF (Copiar 4)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">DESPERDICIOS</span></p>                 <p><span
      style="color: #ff0000;"><span style="color: #339966;"><strong>16%&lt;= &nbsp;&nbsp;</strong></span><strong>&gt;16%</strong></span></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 92
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 5)
    name: OTIF (Copiar 5)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">TIEMPOS DE
      ESTADIA</span></p>                 <p><strong><strong><span style="color: #339966;"><strong><strong><span
      style="color: #339966;">4.0&lt;</span></strong></strong></span></strong>&nbsp;
      &nbsp; <span style="color: #ffcc00;">=4.0&nbsp; &nbsp;&nbsp;</span> <span style="color:
      #339966;"><strong><span style="color: #ff0000;">4.0&gt;</span></strong></span></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 105
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 6)
    name: OTIF (Copiar 6)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">COMPRAS</span></p>                 <p><strong><span
      style="color: #ff0000;">84%&lt;</span> <span style="color: #ffcc00;">[85-94%]</span>
      <span style="color: #339966;">&gt;94%</span></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 121
    col: 0
    width: 24
    height: 2
  - title: OTIF (Copiar 7)
    name: OTIF (Copiar 7)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: Single_Value_Viz_mul
    fields: [fct_ordenes_pedidos_anual.OTIF]
    filters: {}
    limit: 500
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      fecha.trimestre_Letra: Trimestre
      fct_ordenes_pedidos_anual.Total_fill_rate: FR
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">RPM</span></p>                 <p><strong><span
      style="color: #ff0000;">90%&lt;</span> <span style="color: #ffcc00;">[91%-92%]</span>
      <span style="color: #339966;">&gt;92%</span></strong></p>             </td>         </tr>     </tbody>
      </table>'
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    title_hidden: true
    listen:
      Linea de Negocio: grupo_materiales.descripcion
      Fecha: fct_ordenes_pedidos_anual.date_filter
      Planta: planta.planta_completo
    row: 159
    col: 0
    width: 24
    height: 2
  filters:
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bsc
    explore: ordenes_compra
    listens_to_filters: []
    field: planta.planta_completo
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/01/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: fct_seguridad
    listens_to_filters: []
    field: fct_seguridad.date_filter
  - name: Linea de Negocio
    title: Linea de Negocio
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bsc
    explore: fct_ordenes_pedidos
    listens_to_filters: []
    field: grupo_materiales.descripcion
