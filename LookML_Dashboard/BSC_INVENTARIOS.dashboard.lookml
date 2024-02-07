---
- dashboard: bsc_inventarios
  title: BSC_INVENTARIOS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VwS2LH09tD8dcz7tWGjFXa
  elements:
  - title: Últimos 3 meses
    name: Últimos 3 meses
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.ValorStock, fecha.nombre_mes, inventario_fletes.PlantaComercializadora]
    pivots: [fecha.nombre_mes]
    filters:
      inventario_fletes.ultimos_3_meses: '1'
    sorts: [fecha.nombre_mes, inventario_fletes.PlantaComercializadora]
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
    column_order: [inventario_fletes.PlantaComercializadora, Octubre|FIELD|10_inventario_fletes.ValorStock,
      Noviembre|FIELD|11_inventario_fletes.ValorStock, Diciembre|FIELD|12_inventario_fletes.ValorStock]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      inventario_fletes.PlantaComercializadora: Planta
    series_column_widths:
      inventario_fletes.PlantaComercializadora: 200
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
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
    row: 0
    col: 0
    width: 15
    height: 7
  - title: Variación
    name: Variación
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.VariacionMesPrevio, inventario_fletes.PlantaComercializadora,
      inventario_fletes.vacio]
    pivots: [inventario_fletes.vacio]
    filters: {}
    sorts: [inventario_fletes.vacio, inventario_fletes.PlantaComercializadora]
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
    column_order: [inventario_fletes.PlantaComercializadora, inventario_fletes.VariacionMesPrevio]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
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
    row: 0
    col: 15
    width: 9
    height: 7
  - title: Días de inventario mes actual
    name: Días de inventario mes actual
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.DiasInventarioMes, inventario_fletes.PlantaComercializadora,
      inventario_fletes.vacio]
    pivots: [inventario_fletes.vacio]
    filters: {}
    sorts: [inventario_fletes.vacio, inventario_fletes.PlantaComercializadora]
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
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      fecha.date_quarter: Trimestre
      inventario_fletes.PlantaComercializadora: Planta
      inventario_fletes.vacio: _
      inventario_fletes.DiasInventarioMes: Días de inventario
    series_column_widths:
      inventario_fletes.PlantaComercializadora: 200
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
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
    row: 7
    col: 15
    width: 9
    height: 7
  - title: Días de inventario trimestre
    name: Días de inventario trimestre
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.PlantaComercializadora, fecha.trimestre_Letra, inventario_fletes.DiasInventarioTrimestre]
    pivots: [fecha.trimestre_Letra]
    filters:
      inventario_fletes.anio_actual: '1'
      fecha.mes: '3,6,9,12'
    sorts: [fecha.trimestre_Letra, inventario_fletes.PlantaComercializadora]
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
    column_order: [inventario_fletes.PlantaComercializadora, 2023-01_inventario_fletes.DiasInventarioMes,
      2023-04_inventario_fletes.DiasInventarioMes, 2023-07_inventario_fletes.DiasInventarioMes,
      2023-10_inventario_fletes.DiasInventarioMes]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      inventario_fletes.PlantaCompleto: Planta
      fecha.nombre_mes: Mes
      fecha.date_quarter: Trimestre
      inventario_fletes.PlantaComercializadora: Planta
      inventario_fletes.DiasInventarioTrimestre: Días de inventario
    series_column_widths:
      inventario_fletes.PlantaComercializadora: 200
    series_cell_visualizations:
      inventario_fletes.ValorStock:
        is_active: false
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
    row: 7
    col: 0
    width: 15
    height: 7
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023/12/15
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: inventario_fletes
    listens_to_filters: []
    field: inventario_fletes.date_filter
