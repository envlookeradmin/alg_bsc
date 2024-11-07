---
- dashboard: energeticos
  title: ENERGETICOS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: W0bnyvZYILQU47np5ZOgy5
  elements:
  - title: Factor Potencia
    name: Factor Potencia
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_grid
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.factor_potencia_anterior,
      fct_analisis_energeticos.factor_potencia_actual]
    sorts: [fct_analisis_energeticos.facturadopara]
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
      fct_analisis_energeticos.facturadopara: Planta
    series_cell_visualizations:
      fct_analisis_energeticos.factor_potencia_mes_anterior:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
      Fecha: fct_analisis_energeticos.filtro_fecha
    row: 7
    col: 0
    width: 12
    height: 7
  - title: LUZ
    name: LUZ
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_grid
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.kw_consumidos_anterior,
      fct_analisis_energeticos.kg_kw_anterior, fct_analisis_energeticos.kw_consumidos_actual,
      fct_analisis_energeticos.kg_kw_actual, fct_analisis_energeticos.luz_importe_actual]
    sorts: [fct_analisis_energeticos.facturadopara]
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
      fct_analisis_energeticos.facturadopara: Planta
      fct_analisis_energeticos.kw_consumidos_mes_anterior: kW Consumidos Anterior
      fct_analisis_energeticos.kg_kw_mes_anterior: kg / kW Anterior
      fct_analisis_energeticos.kw_consumidos_mes_actual: kW Consumidos Actual
      fct_analisis_energeticos.kg_kw_mes_actual: kg / kW Actual
    series_cell_visualizations:
      fct_analisis_energeticos.factor_potencia_mes_anterior:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
      Fecha: fct_analisis_energeticos.filtro_fecha
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Gas
    name: Gas
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_grid
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.m3_anterior,
      fct_analisis_energeticos.m3_actual, fct_analisis_energeticos.gas_importe_actual]
    filters:
      fct_analisis_energeticos.gas_importe_actual: ''
    sorts: [fct_analisis_energeticos.facturadopara]
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
      fct_analisis_energeticos.nombre_mes: Mes
      fct_analisis_energeticos.facturadopara: Planta
      fct_analisis_energeticos.total_kilos_produccion_mes_anterior: Total kg Produccion
        Mes Anterior
      fct_analisis_energeticos.total_kilos_produccion_mes_actual: Total kg Produccion
        Mes Actual
    series_cell_visualizations:
      fct_analisis_energeticos.factor_potencia_mes_anterior:
        is_active: false
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
      Fecha: fct_analisis_energeticos.filtro_fecha
    row: 7
    col: 13
    width: 11
    height: 7
  - title: Consumo CFE por Planta
    name: Consumo CFE por Planta
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_area
    fields: [fct_analisis_energeticos.luz_importe_actual, fct_analisis_energeticos.facturadopara]
    sorts: [fct_analisis_energeticos.luz_importe_actual desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    swap_axes: false
    defaults_version: 1
    listen:
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
      Fecha: fct_analisis_energeticos.filtro_fecha
    row: 14
    col: 0
    width: 24
    height: 5
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024-05
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bsc
    explore: fct_analisis_energeticos
    listens_to_filters: []
    field: fct_analisis_energeticos.filtro_fecha
  - name: Institución
    title: Institución
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: bsc
    explore: fct_analisis_energeticos
    listens_to_filters: []
    field: fct_analisis_energeticos.institucion
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
    explore: fct_analisis_energeticos
    listens_to_filters: []
    field: fct_analisis_energeticos.facturadopara
