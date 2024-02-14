---
- dashboard: BSC_OTIF
  title: BSC_OTIF
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PfzhvbWhZIaVBGWVYl6UO1
  elements:
  - name: OTIF &  FILL RATE
    title: OTIF &  FILL RATE
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [fct_ordenes_pedidos.Total_fill_rate, fct_ordenes_pedidos.OTIF, planta.planta_comercializadora,
      fecha.trimestre_Letra]
    pivots: [fecha.trimestre_Letra]
    filters:
      fecha.anio: '2023'
    sorts: [fecha.trimestre_Letra, fct_ordenes_pedidos.Total_fill_rate desc 0]
    limit: 500
    column_limit: 50
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
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.date_quarter: Trimestre
      fecha.trimestre_Letra: Trimestre
    series_column_widths:
      planta.planta_comercializadora: 180
    series_cell_visualizations:
      fct_ordenes_pedidos.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 7
  - name: OTIF por Linea de Negocio
    title: OTIF por Linea de Negocio
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [fct_ordenes_pedidos.Total_fill_rate, grupo_materiales.descripcion, planta.planta_comercializadora]
    pivots: [grupo_materiales.descripcion]
    sorts: [grupo_materiales.descripcion, fct_ordenes_pedidos.Total_fill_rate desc
        0]
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
    series_cell_visualizations:
      fct_ordenes_pedidos.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 15
    col: 0
    width: 24
    height: 8
  - title: OTIF &  FILL RATE
    name: OTIF &  FILL RATE (2)
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [fct_ordenes_pedidos.Total_fill_rate, fct_ordenes_pedidos.OTIF, fecha.nombre_mes,
      planta.planta_comercializadora]
    pivots: [fecha.nombre_mes]
    filters:
      fecha.trimestre: '4'
      fecha.anio: '2023'
    sorts: [fecha.nombre_mes, fct_ordenes_pedidos.Total_fill_rate desc 0]
    limit: 500
    column_limit: 50
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
      planta.planta_completo: Planta_Comercializadora
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_ordenes_pedidos.Total_fill_rate:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 7
    col: 0
    width: 24
    height: 8
