---
- dashboard: desperdicios
  title: DESPERDICIOS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DhILAPNbVcRM0k9bTfP37O
  elements:
  - title: IMPORTES CUENTA DESPERDICIOS
    name: IMPORTES CUENTA DESPERDICIOS
    model: bsc
    explore: desperdicios_acdoca
    type: looker_grid
    fields: [desperdicios_acdoca.nombre_planta, desperdicios_acdoca.descripcion_material,
      desperdicios_acdoca.total_importe, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    sorts: [fecha.nombre_mes, desperdicios_acdoca.nombre_planta, desperdicios_acdoca.descripcion_material,
      desperdicios_acdoca.total_importe desc 0]
    subtotals: [desperdicios_acdoca.nombre_planta]
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
    size_to_fit: false
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
      desperdicios_acdoca.fecha_documento_month_name: Mes
      desperdicios_acdoca.nombre_planta: Planta
      fecha.nombre_mes: Mes
    series_column_widths:
      desperdicios_acdoca.descripcion_material: 330
      desperdicios_acdoca.nombre_planta: 100
    series_cell_visualizations:
      desperdicios_acdoca.total_importe:
        is_active: true
    series_collapsed:
      desperdicios_acdoca.planta: true
      desperdicios_acdoca.nombre_planta: true
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    series_value_format:
      desperdicios_acdoca.total_importe:
        format_string: "$#,##0"
    truncate_column_names: false
    defaults_version: 1
    listen:
      Periodo: desperdicios_acdoca.date_filter
    row: 0
    col: 0
    width: 24
    height: 9
  - title: DETALLE DESPERDICIOS POR GRUPO MATERIAL
    name: DETALLE DESPERDICIOS POR GRUPO MATERIAL
    model: bsc
    explore: desperdicios_mseg
    type: looker_grid
    fields: [desperdicios_mseg.nombre_planta, desperdicios_mseg.descripcion_grupo_material,
      desperdicios_mseg.total_importe_desperdicio, desperdicios_mseg.kgs_produccion,
      desperdicios_mseg.kgs_desperdicio, desperdicios_mseg.kgs_desperdicio_pj, desperdicios_mseg.total_importe_desperdicio_mes,
      desperdicios_mseg.kgs_produccion_mes, desperdicios_mseg.kgs_desperdicio_mes,
      desperdicios_mseg.kgs_desperdicio_pj_mes]
    sorts: [desperdicios_mseg.nombre_planta, desperdicios_mseg.total_importe_desperdicio
        desc]
    subtotals: [desperdicios_mseg.nombre_planta]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      desperdicios_mseg.nombre_planta: Planta
      desperdicios_mseg.descripcion_grupo_material: Grupo Materiales
      desperdicios_mseg.total_importe_desperdicio: Total Importe
      desperdicios_mseg.kgs_desperdicio_pj: "% Kgs Desp."
    series_cell_visualizations:
      desperdicios_mseg.total_importe_desperdicio:
        is_active: true
    series_collapsed:
      desperdicios_mseg.nombre_planta: true
    header_font_color: "#FFF"
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
      Periodo: desperdicios_mseg.date_filter
    row: 9
    col: 0
    width: 24
    height: 13
  filters:
  - name: Periodo
    title: Periodo
    type: field_filter
    default_value: 2024/08/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: popover
      options: []
    model: bsc
    explore: desperdicios_acdoca
    listens_to_filters: []
    field: desperdicios_acdoca.date_filter
