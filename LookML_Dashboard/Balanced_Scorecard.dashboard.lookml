---
- dashboard: balanced_scorecard
  title: Balanced Scorecard
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
      />\n<a style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envases.cloud.looker.com/dashboards/139\"\
      >INVENTARIO NO CONFORME</a>\n<a style=\"color: #5e2129; padding: 5px 20px;\n\
      \        float: left; line-height: 40px; font-weight: bold; color: white;\n\
      \        border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n\
      \        href=\"https://envases.cloud.looker.com/dashboards/169\">MATERIAL DE\
      \ EMPAQUE</a>\n<a style=\"color: #5e2129; padding: 5px 20px;\n        float:\
      \ left; line-height: 40px; font-weight: bold; color: white;\n        border-radius:\
      \ 5px; margin-left: 5px; background-color: #b46e68;\"\n        href=\"https://envases.cloud.looker.com/dashboards/134\"\
      >TIEMPOS DE ESTADIA</a>\n<a style=\"color: #5e2129; padding: 5px 20px;\n   \
      \     float: left; line-height: 40px; font-weight: bold; color: white;\n   \
      \     border-radius: 5px; margin-left: 5px; background-color: #b46e68;\"\n \
      \       href=\"https://envases.cloud.looker.com/folders/96\">COMPRAS</a>\n<a\
      \ style=\"color: #5e2129; padding: 5px 20px;\n        float: left; line-height:\
      \ 40px; font-weight: bold; color: white;\n        border-radius: 5px; margin-left:\
      \ 5px; background-color: #b46e68;\"\n        href=\"https://envases.cloud.looker.com/dashboards/157\"\
      >SEGURIDAD</a>\n\t</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"COMPRAS"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 37
    col: 0
    width: 24
    height: 2
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"TIEMPOS DE ESTADÍA"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 31
    col: 0
    width: 24
    height: 2
  - title: ADP TRIMESTRE
    name: ADP TRIMESTRE
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [fct_seguridad_anual.Total_ADP, fecha.trimestre_Letra, planta.planta_comercializadora]
    pivots: [fecha.trimestre_Letra]
    filters: {}
    sorts: [fecha.trimestre_Letra, fct_seguridad_anual.Total_ADP desc 0]
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
    listen:
      Fecha: fct_seguridad_anual.date_filter
    row: 51
    col: 0
    width: 12
    height: 6
  - title: ADP ACUMULADO
    name: ADP ACUMULADO
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [fct_seguridad_anual.Total_ADP, planta.planta_comercializadora]
    filters: {}
    sorts: [fct_seguridad_anual.Total_ADP desc]
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
    listen:
      Fecha: fct_seguridad_anual.date_filter
    row: 57
    col: 0
    width: 24
    height: 5
  - title: ADP MES
    name: ADP MES
    model: bsc
    explore: fct_seguridad
    type: looker_grid
    fields: [planta.planta_comercializadora, fecha.nombre_mes, fct_seguridad.Total_ADP]
    pivots: [fecha.nombre_mes]
    filters: {}
    sorts: [fecha.nombre_mes, planta.planta_comercializadora]
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
      planta.planta_comercializadora: left
    column_order: [planta.planta_comercializadora, Enero|FIELD|1_fct_seguridad.count_trimestre,
      Febrero|FIELD|2_fct_seguridad.count_trimestre, Marzo|FIELD|3_fct_seguridad.count_trimestre,
      Abril|FIELD|4_fct_seguridad.count_trimestre, Mayo|FIELD|5_fct_seguridad.count_trimestre,
      Junio|FIELD|6_fct_seguridad.count_trimestre, Julio|FIELD|7_fct_seguridad.count_trimestre,
      Agosto|FIELD|8_fct_seguridad.count_trimestre, Septiembre|FIELD|9_fct_seguridad.count_trimestre,
      Octubre|FIELD|10_fct_seguridad.count_trimestre, Noviembre|FIELD|11_fct_seguridad.count_trimestre,
      Diciembre|FIELD|12_fct_seguridad.count_trimestre]
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
    listen:
      Fecha: fct_seguridad.date_filter
    row: 51
    col: 12
    width: 12
    height: 6
  - name: " (Copy 2) (Copiar)"
    type: text
    title_text: " (Copy 2) (Copiar)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"SEGURIDAD"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 49
    col: 0
    width: 24
    height: 2
  - title: MATERIAL DE EMPAQUE
    name: MATERIAL DE EMPAQUE
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_comercializadora, fct_materiales_stock.Familia, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.tipo_proveedor_cliente, fct_materiales_stock.Cantidad_stock,
      fct_materiales_stock.valor_stock, fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion]
    pivots: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion]
    filters:
      planta.planta_comercializadora: ''
    sorts: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion, planta.planta_comercializadora,
      fct_materiales_stock.Familia, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.valor_stock desc 0]
    subtotals: [planta.planta_comercializadora, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.Familia]
    limit: 5000
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
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Fecha: fct_materiales_stock.date_filter
    row: 15
    col: 0
    width: 24
    height: 8
  - title: 'MATERIAL DE EMPAQUE TOTALES '
    name: 'MATERIAL DE EMPAQUE TOTALES '
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_comercializadora, grupo_materiales.descripcion, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.Cantidad_stock, fct_materiales_stock.valor_stock, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      planta.planta_comercializadora: ''
    sorts: [planta.planta_comercializadora, grupo_materiales.descripcion, fecha.nombre_mes,
      fct_materiales_stock.valor_stock desc]
    subtotals: [planta.planta_comercializadora, grupo_materiales.descripcion]
    limit: 5000
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
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: fct_materiales_stock.date_filter
    row: 23
    col: 0
    width: 24
    height: 8
  - name: " (Copy 2) (Copiar 3)"
    type: text
    title_text: " (Copy 2) (Copiar 3)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"MATERIAL DE EMPAQUE"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 0
    width: 24
    height: 2
  - title: Año anterior
    name: Año anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Prom_Estadia_AA,
      tiempos_estadia.vacio]
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
    rows_font_size: '10'
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
    series_column_widths:
      tiempos_estadia.Locacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
    row: 33
    col: 0
    width: 7
    height: 4
  - title: Por mes
    name: Por mes
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Prom_Estadia,
      fecha.nombre_mes]
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
    rows_font_size: '10'
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
    series_column_widths:
      tiempos_estadia.Locacion: 200
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
    row: 33
    col: 7
    width: 10
    height: 4
  - title: Mes seleccionado vs mes anterior
    name: Mes seleccionado vs mes anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Diferencia,
      tiempos_estadia.vacio]
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
    rows_font_size: '10'
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
    series_column_widths:
      tiempos_estadia.Locacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
    row: 33
    col: 17
    width: 7
    height: 4
  - name: " (Copy) (Copiar)"
    type: text
    title_text: " (Copy) (Copiar)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"INVENTARIO NO CONFORME"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Inventario no conforme
    name: Inventario no conforme
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [materiales_inventario.Total_pt, materiales_inventario.Total_Componentes,
      materiales_inventario.Total_Hoja, fecha.nombre_mes, planta.planta_comercializadora]
    pivots: [fecha.nombre_mes]
    filters:
      materiales_inventario.2_meses: '1'
    sorts: [fecha.nombre_mes, planta.planta_comercializadora]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '10'
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
    listen:
      Fecha: materiales_inventario.date_filter
    row: 4
    col: 0
    width: 15
    height: 9
  - title: Mes seleccionado
    name: Mes seleccionado
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [planta.planta_comercializadora, materiales_inventario.Variacion_pt, materiales_inventario.Variacion_componente,
      materiales_inventario.Variacion_hoja, materiales_inventario.desc_mes_actual]
    pivots: [materiales_inventario.desc_mes_actual]
    filters: {}
    sorts: [materiales_inventario.desc_mes_actual, planta.planta_comercializadora]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '10'
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
    listen:
      Fecha: materiales_inventario.date_filter
    row: 4
    col: 15
    width: 9
    height: 9
  - title: Productividad
    name: Productividad
    model: bsc
    explore: ordenes_compra
    type: looker_grid
    fields: [ordenes_compra.Planta, ordenes_compra.Porc_Productividad_Alcanzada, ordenes_compra.Prom_Dias_Atencion,
      comprador.gerencia, comprador.comprador]
    filters: {}
    sorts: [ordenes_compra.Planta, comprador.gerencia]
    subtotals: [ordenes_compra.Planta, comprador.gerencia]
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
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.nombre_planta: Planta
      planta.planta_completo_c: Planta
      planta.planta_completo_prod: Planta
      ordenes_compra.PlantaCompletoProd: Planta
    series_cell_visualizations: {}
    series_collapsed:
      ordenes_compra.Planta: true
      comprador.gerencia: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields:
    listen:
      Fecha: ordenes_compra.date_filter
    row: 39
    col: 0
    width: 12
    height: 10
  - title: OTIF
    name: OTIF
    model: bsc
    explore: fct_ordenes_compra_otif
    type: looker_grid
    fields: [fct_ordenes_compra_otif.planta, comprador.gerencia, fct_ordenes_compra_otif.total_ordenes,
      fct_ordenes_compra_otif.ordenes_en_tiempo, fct_ordenes_compra_otif.otif, fct_ordenes_compra_otif.comprador]
    filters:
      fct_ordenes_compra_otif.es_reco: not 1
      comprador.gerencia: "-NULL"
      fct_ordenes_compra_otif.comprador: "-JESSICA PATRICIA ALCALA,-DIANA GARCIA"
      fct_ordenes_compra_otif.material: "-000000000004000009,-000000000006000094,-000000000006000095"
    sorts: [fct_ordenes_compra_otif.planta, comprador.gerencia]
    subtotals: [fct_ordenes_compra_otif.planta, comprador.gerencia]
    limit: 500
    column_limit: 50
    total: true
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
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_ordenes_compra_otif.total_ordenes:
        is_active: false
    series_collapsed:
      fct_ordenes_compra_otif.planta: true
      comprador.gerencia: true
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
    listen:
      Fecha: fct_ordenes_compra_otif.fecha
    row: 39
    col: 12
    width: 12
    height: 10
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
