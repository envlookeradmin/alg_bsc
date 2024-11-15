---
- dashboard: manufactura
  title: MANUFACTURA
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NLEZNqqPtO4k8dbMBQFqfe
  elements:
  - title: MANUFACTURA
    name: MANUFACTURA
    model: bsc
    explore: fct_manufactura
    type: looker_grid
    fields: [planta.nombre_planta, fct_manufactura.Linea_producto, fct_manufactura.Total_cantidad_base,
      fct_manufactura.Total_cantidad_entregada, fct_manufactura.Total_NIVEL_REAL,
      fecha.nombre_mes, fct_manufactura.Total_Monto_ventas, fct_manufactura.Total_OEE,
      fct_manufactura.Puesto_trabajo]
    pivots: [fecha.nombre_mes]
    sorts: [planta.nombre_planta, fct_manufactura.Linea_producto, fecha.nombre_mes]
    subtotals: [planta.nombre_planta, fct_manufactura.Linea_producto]
    limit: 5000
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
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [planta.nombre_planta, fct_manufactura.Linea_producto, fct_manufactura.Puesto_trabajo,
      fct_manufactura.Total_cantidad_base, fct_manufactura.Total_cantidad_entregada,
      fct_manufactura.Total_Monto_ventas, fct_manufactura.Total_NIVEL_REAL]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_comercializadora: PLANTA
      fct_manufactura.Linea_producto: LINEA PRODUCTO
      material.grupo_material: GPO MATERIAL
      fct_manufactura.Puesto_trabajo: CENTRO DE TRABAJO
      planta.nombre_planta: PLANTA
      fct_manufactura.Total_Monto_ventas: BUDGET
      fecha.nombre_mes: Mes
      fct_presupuesto_ventas.total_monto: BUDGET
    series_cell_visualizations:
      fct_manufactura.Total_cantidad_base:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_collapsed:
      planta.planta_comercializadora: true
      planta.nombre_planta: true
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
      LINEA PRODUCTO: grupo_materiales.descripcion
      FECHA FIN REAL: fct_manufactura.date_filter_FECHA_FIN_REAL
      FECHA LIBERACION: fct_manufactura.date_filter_FECHA_LIBERACION
      Planta: planta.planta_comercializadora
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: FECHA FIN REAL
    title: FECHA FIN REAL
    type: field_filter
    default_value: 2024/01/01 to 2024/02/02
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: bsc
    explore: fct_manufactura
    listens_to_filters: []
    field: fct_manufactura.date_filter_FECHA_FIN_REAL
  - name: FECHA LIBERACION
    title: FECHA LIBERACION
    type: field_filter
    default_value: 2024/01/01 to 2024/02/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: bsc
    explore: fct_manufactura
    listens_to_filters: []
    field: fct_manufactura.date_filter_FECHA_LIBERACION
  - name: LINEA PRODUCTO
    title: LINEA PRODUCTO
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: bsc
    explore: fct_manufactura
    listens_to_filters: []
    field: grupo_materiales.descripcion
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: bsc
    explore: fct_manufactura
    listens_to_filters: []
    field: planta.planta_comercializadora
