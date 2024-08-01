---
- dashboard: bsc_inventarios_ciclicos
  title: BSC_INVENTARIOS_CICLICOS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: WhRTtOwhBr2r1Ax2DlJLG4
  elements:
  - title: Inventario cíclicos
    name: Inventario cíclicos
    model: bsc
    explore: inventarios_ciclicos
    type: looker_grid
    fields: [planta.planta_completo, inventarios_ciclicos.clasificacion, inventarios_ciclicos.conteo_material_real_ytd,
      inventarios_ciclicos.conteo_material_meta_ytd, inventarios_ciclicos.porc_real_meta]
    pivots: [planta.planta_completo]
    filters:
      inventarios_ciclicos.clasificacion: "-NULL"
    sorts: [planta.planta_completo, inventarios_ciclicos.clasificacion]
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
      planta.planta_completo: Planta
    series_column_widths:
      inventarios_ciclicos.clasificacion: 200
    series_cell_visualizations:
      inventarios_ciclicos.Conteo_material_real:
        is_active: false
    header_font_color: "#FFFFFF"
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
      Fecha: inventarios_ciclicos.date_filter
    row: 0
    col: 0
    width: 24
    height: 5
  - title: Diferencia y exactitud
    name: Diferencia y exactitud
    model: bsc
    explore: fct_inventarios_ciclicos2
    type: looker_grid
    fields: [fct_inventarios_ciclicos2.planta, fct_inventarios_ciclicos2.exactitud,
      fct_inventarios_ciclicos2.diferencia]
    filters: {}
    sorts: [fct_inventarios_ciclicos2.exactitud desc 0]
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
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      fct_inventarios_ciclicos2.exactitud:
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
    defaults_version: 1
    listen:
      Fecha: fct_inventarios_ciclicos2.date_filter
    row: 5
    col: 0
    width: 24
    height: 5
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023/06/30
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: inventarios_ciclicos
    listens_to_filters: []
    field: inventarios_ciclicos.date_filter
