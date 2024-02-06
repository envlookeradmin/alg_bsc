---
- dashboard: bsc_inventario_no_conforme
  title: BSC_INVENTARIO_NO_CONFORME
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: WqmPwJ6KQqgefnSftRKjWn
  elements:
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
      Período: materiales_inventario.date_filter
    row: 0
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
      Período: materiales_inventario.date_filter
    row: 0
    col: 15
    width: 9
    height: 9
  - title: Mes seleccionado piezas
    name: Mes seleccionado piezas
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [planta.planta_comercializadora, materiales_inventario.Variacion_pt_pzas,
      materiales_inventario.Variacion_componente_pzas, materiales_inventario.Variacion_hoja_pzas,
      materiales_inventario.desc_mes_actual]
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
      Período: materiales_inventario.date_filter
    row: 9
    col: 15
    width: 9
    height: 9
  - title: Inventario no conforme piezas
    name: Inventario no conforme piezas
    model: bsc
    explore: materiales_inventario
    type: looker_grid
    fields: [planta.planta_comercializadora, materiales_inventario.Total_pt_pzas,
      materiales_inventario.Total_Componentes_pzas, materiales_inventario.Total_Hoja_pzas,
      fecha.nombre_mes]
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
      Período: materiales_inventario.date_filter
    row: 9
    col: 0
    width: 15
    height: 9
  filters:
  - name: Período
    title: Período
    type: field_filter
    default_value: 2024/01/02
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: materiales_inventario
    listens_to_filters: []
    field: materiales_inventario.date_filter
