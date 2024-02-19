---
- dashboard: bsc_otif
  title: BSC_OTIF
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PfzhvbWhZIaVBGWVYl6UO1
  elements:
  - title: OTIF por Linea de Negocio
    name: OTIF por Linea de Negocio
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
    listen:
      Fecha: fct_ordenes_pedidos.date_filter
      Planta: planta.planta_comercializadora
      Canal Distribucion: fct_ordenes_pedidos.canal_distribucion
    row: 14
    col: 0
    width: 24
    height: 8
  - title: OTIF &  FILL RATE
    name: OTIF &  FILL RATE
    model: bsc
    explore: fct_ordenes_pedidos
    type: looker_grid
    fields: [fct_ordenes_pedidos.Total_fill_rate, fecha.nombre_mes, planta.planta_comercializadora,
      fct_ordenes_pedidos.OTIF]
    pivots: [fecha.nombre_mes]
    filters: {}
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
    listen:
      Fecha: fct_ordenes_pedidos.date_filter
      Planta: planta.planta_comercializadora
      Canal Distribucion: fct_ordenes_pedidos.canal_distribucion
    row: 6
    col: 0
    width: 24
    height: 8
  - title: OTIF &  FILL RATE
    name: OTIF &  FILL RATE (2)
    model: bsc
    explore: fct_ordenes_pedidos_anual
    type: looker_grid
    fields: [planta.planta_comercializadora, fct_ordenes_pedidos_anual.Total_fill_rate,
      fecha.trimestre_Letra, fct_ordenes_pedidos_anual.OTIF]
    pivots: [fecha.trimestre_Letra]
    filters:
      fct_ordenes_pedidos_anual.date_filter: 2023/12/31
    sorts: [fecha.trimestre_Letra, planta.planta_comercializadora]
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
      fecha.trimestre_Letra: Trimestre
    series_cell_visualizations:
      fct_ordenes_pedidos_anual.Total_fill_rate:
        is_active: false
    series_text_format:
      fecha.trimestre_Letra:
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
    listen:
      Planta: planta.planta_comercializadora
      Canal Distribucion: fct_ordenes_pedidos_anual.canal_distribucion
    row: 0
    col: 0
    width: 24
    height: 6
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/02/13
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: fct_ordenes_pedidos
    listens_to_filters: []
    field: fct_ordenes_pedidos.date_filter
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
    explore: fct_ordenes_pedidos
    listens_to_filters: []
    field: planta.planta_comercializadora
  - name: Canal Distribucion
    title: Canal Distribucion
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bsc
    explore: fct_ordenes_pedidos
    listens_to_filters: []
    field: fct_ordenes_pedidos.canal_distribucion
