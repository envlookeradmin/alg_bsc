---
- dashboard: bsc_energeticos
  title: BSC_ENERGETICOS
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
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.nombre_mes,
      fct_analisis_energeticos.factor_potencia_mes_anterior]
    pivots: [fct_analisis_energeticos.nombre_mes]
    filters:
      fct_analisis_energeticos.factor_potencia_mes_anterior: NOT NULL
    sorts: [fct_analisis_energeticos.nombre_mes, fct_analisis_energeticos.factor_potencia_mes_anterior
        desc 0]
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
      Fecha: fct_analisis_energeticos.date_filter
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
    row: 6
    col: 9
    width: 8
    height: 6
  - title: LUZ
    name: LUZ
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_grid
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.nombre_mes,
      fct_analisis_energeticos.kw_consumidos_mes_anterior, fct_analisis_energeticos.kg_kw_mes_anterior,
      fct_analisis_energeticos.kw_consumidos_mes_actual, fct_analisis_energeticos.kg_kw_mes_actual,
      fct_analisis_energeticos.importe_luz]
    pivots: [fct_analisis_energeticos.nombre_mes]
    filters:
      fct_analisis_energeticos.kg_kw_mes_actual: NOT NULL
    sorts: [fct_analisis_energeticos.nombre_mes, fct_analisis_energeticos.kw_consumidos_mes_anterior
        desc 0]
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
    series_value_format:
      fct_analisis_energeticos.kw_consumidos_mes_anterior: "#,##0"
      fct_analisis_energeticos.kw_consumidos_mes_actual: "#,##0"
      fct_analisis_energeticos.kg_kw_mes_anterior: 0.##
      fct_analisis_energeticos.kg_kw_mes_actual: 0.##
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: fct_analisis_energeticos.date_filter
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
    row: 0
    col: 0
    width: 15
    height: 6
  - title: Gas
    name: Gas
    model: bsc
    explore: fct_analisis_energeticos
    type: looker_grid
    fields: [fct_analisis_energeticos.facturadopara, fct_analisis_energeticos.nombre_mes,
      fct_analisis_energeticos.gas_m3_anterior, fct_analisis_energeticos.gas_m3_actual,
      fct_analisis_energeticos.importe_gas]
    pivots: [fct_analisis_energeticos.nombre_mes]
    filters:
      fct_analisis_energeticos.gas_m3_actual: ">0"
    sorts: [fct_analisis_energeticos.nombre_mes, fct_analisis_energeticos.gas_m3_anterior
        desc 0]
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
      Fecha: fct_analisis_energeticos.date_filter
      Institución: fct_analisis_energeticos.institucion
      Planta: fct_analisis_energeticos.facturadopara
    row: 0
    col: 15
    width: 9
    height: 6
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/08/22 to 2024/08/23
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: bsc
    explore: fct_analisis_energeticos
    listens_to_filters: []
    field: fct_analisis_energeticos.date_filter
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
