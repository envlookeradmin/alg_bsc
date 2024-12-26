---
- dashboard: retenido_para_inspeccin
  title: Retenido para Inspección
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1dD7xAvVjtGd5BFFYaaUjG
  elements:
  - title: Devoluciones
    name: Devoluciones
    model: bsc
    explore: fct_devoluciones_1
    type: looker_grid
    fields: [fct_devoluciones_1.Eventos, fct_devoluciones_1.Sanitario, fct_devoluciones_1.Linea,
      fct_devoluciones_1.periodo]
    sorts: [fct_devoluciones_1.periodo desc]
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
      fct_devoluciones_1.string_field_41: Mes
      fct_devoluciones_1.fecha_ingreso_month_name: Mes
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
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
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
      Tipo periodo: fct_devoluciones_1.Tipo_periodo
    row: 13
    col: 0
    width: 12
    height: 7
  - title: Tendencia Acumulada por Línea de Negocio
    name: Tendencia Acumulada por Línea de Negocio
    model: bsc
    explore: fct_devoluciones_1
    type: looker_column
    fields: [fct_devoluciones_1.Linea, fct_devoluciones_1.Sanitario, fct_devoluciones_1.periodo]
    sorts: [fct_devoluciones_1.periodo desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      fct_devoluciones_1.Totoal_Eventos: "#F9AB00"
    series_labels:
      fct_devoluciones_1.string_field_41: Mes
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
      Tipo periodo: fct_devoluciones_1.Tipo_periodo
    row: 26
    col: 0
    width: 24
    height: 6
  - title: Tendencia de las Devoluciones
    name: Tendencia de las Devoluciones
    model: bsc
    explore: fct_devoluciones_1
    type: looker_column
    fields: [fct_devoluciones_1.fecha_ingreso_month, fct_devoluciones_1.total_stock_proyeccion]
    fill_fields: [fct_devoluciones_1.fecha_ingreso_month]
    filters: {}
    sorts: [fct_devoluciones_1.fecha_ingreso_month]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      fct_devoluciones_1.Totoal_Eventos: "#12B5CB"
    series_labels:
      fct_devoluciones_1.string_field_41: Mes
    reference_lines: []
    trend_lines: [{color: "#000000", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: string}]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
    row: 20
    col: 0
    width: 24
    height: 6
  - title: Devoluciones Plantas
    name: Devoluciones Plantas
    model: bsc
    explore: fct_devoluciones_1
    type: looker_grid
    fields: [fct_devoluciones_1.Eventos, fct_devoluciones_1.Sanitario, fct_devoluciones_1.Linea,
      fct_devoluciones_1.planta]
    sorts: [fct_devoluciones_1.planta desc]
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
      fct_devoluciones_1.string_field_41: Mes
      fct_devoluciones_1.fecha_ingreso_month_name: Mes
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
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
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
    row: 13
    col: 12
    width: 12
    height: 7
  - title: Devoluciones $
    name: Devoluciones $
    model: bsc
    explore: fct_devoluciones_1
    type: looker_grid
    fields: [fct_devoluciones_1.fecha_ingreso_quarter, fct_devoluciones_1.Total_facturacion,
      fct_devoluciones_1.Total_devolucion, fct_devoluciones_1.porc_devolucion]
    fill_fields: [fct_devoluciones_1.fecha_ingreso_quarter]
    sorts: [fct_devoluciones_1.fecha_ingreso_quarter desc]
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
      fct_devoluciones_1.string_field_41: Mes
      fct_devoluciones_1.fecha_ingreso_month_name: Mes
      fct_devoluciones_1.fecha_ingreso_quarter: Trimestre
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
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
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
    row: 0
    col: 0
    width: 12
    height: 5
  - title: RPI VS Meta
    name: RPI VS Meta
    model: bsc
    explore: fct_devoluciones_1
    type: looker_column
    fields: [fct_devoluciones_1.fecha_ingreso_quarter, fct_devoluciones_1.porc_devolucion,
      fct_devoluciones_1.porc_devolucion_meta]
    fill_fields: [fct_devoluciones_1.fecha_ingreso_quarter]
    sorts: [fct_devoluciones_1.fecha_ingreso_quarter desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: fct_devoluciones_1.porc_devolucion,
            id: fct_devoluciones_1.porc_devolucion, name: Porcentaje}, {axisId: fct_devoluciones_1.porc_devolucion_meta,
            id: fct_devoluciones_1.porc_devolucion_meta, name: "% Meta"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Trimestre
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      fct_devoluciones_1.Totoal_Eventos: "#F9AB00"
    series_labels:
      fct_devoluciones_1.string_field_41: Mes
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
    row: 0
    col: 12
    width: 12
    height: 5
  - title: "% Devoluciones por mes"
    name: "% Devoluciones por mes"
    model: bsc
    explore: fct_devoluciones_1
    type: looker_grid
    fields: [fct_devoluciones_1.porc_devolucion, fct_devoluciones_1.fecha_ingreso_month_name,
      fct_devoluciones_1.planta]
    pivots: [fct_devoluciones_1.fecha_ingreso_month_name]
    fill_fields: [fct_devoluciones_1.fecha_ingreso_month_name]
    sorts: [fct_devoluciones_1.fecha_ingreso_month_name, fct_devoluciones_1.planta desc]
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
      fct_devoluciones_1.string_field_41: Mes
      fct_devoluciones_1.fecha_ingreso_month_name: Mes
      fct_devoluciones_1.fecha_ingreso_quarter: Trimestre
    series_cell_visualizations:
      fct_devoluciones_1.Totoal_Eventos:
        is_active: false
    series_text_format:
      fct_devoluciones_1.fecha_ingreso_month_name: {}
    header_font_color: "#fff"
    header_background_color: "#AA0C23"
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
      fecha_ingreso Date: fct_devoluciones_1.fecha_ingreso_date
      Planta: fct_devoluciones_1.planta
      Medida: fct_devoluciones_1.Medidas_dinamicas
      Tipo: fct_devoluciones_1.Tipo
    row: 5
    col: 0
    width: 24
    height: 8
  filters:
  - name: fecha_ingreso Date
    title: fecha_ingreso Date
    type: field_filter
    default_value: 2024/01/01 to 2024/11/16
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: bsc
    explore: fct_devoluciones_1
    listens_to_filters: []
    field: fct_devoluciones_1.fecha_ingreso_date
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
    explore: fct_devoluciones_1
    listens_to_filters: []
    field: fct_devoluciones_1.planta
  - name: Medida
    title: Medida
    type: field_filter
    default_value: Evento
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: bsc
    explore: fct_devoluciones_1
    listens_to_filters: []
    field: fct_devoluciones_1.Medidas_dinamicas
  - name: Tipo
    title: Tipo
    type: field_filter
    default_value: Piezas
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: bsc
    explore: fct_devoluciones_1
    listens_to_filters: []
    field: fct_devoluciones_1.Tipo
  - name: Tipo periodo
    title: Tipo periodo
    type: field_filter
    default_value: Mes
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: bsc
    explore: fct_devoluciones_1
    listens_to_filters: []
    field: fct_devoluciones_1.Tipo_periodo
