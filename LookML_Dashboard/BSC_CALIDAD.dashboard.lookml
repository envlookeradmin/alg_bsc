---
- dashboard: bsc_calidad
  title: BSC_CALIDAD
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VVcTsDIK3h1tP2nj5Gbqyc
  elements:
  - title: Calidad por trimestre
    name: Calidad por trimestre
    model: bsc
    explore: calidad
    type: looker_grid
    fields: [calidad.quejas, calidad.devoluciones, calidad.porc_pnc, calidad.planta_completo,
      fecha.trimestre_Letra]
    pivots: [fecha.trimestre_Letra]
    filters: {}
    sorts: [fecha.trimestre_Letra, calidad.planta_completo]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
      calidad.fecha_filtro_quarter: Trimestre
      fecha.trimestre_Letra: Trimestre
    series_column_widths:
      calidad.planta_completo: 180
    series_cell_visualizations:
      calidad.Quejas:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: calidad.date_filter
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Calidad últimos 3 mes
    name: Calidad últimos 3 mes
    model: bsc
    explore: calidad
    type: looker_grid
    fields: [calidad.quejas, calidad.devoluciones, calidad.porc_pnc, calidad.planta_completo,
      fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      calidad.ultimos_3_meses: '1'
    sorts: [fecha.nombre_mes, calidad.planta_completo]
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
      calidad.fecha_filtro_quarter: Trimestre
      fecha.nombre_mes: Mes
    series_column_widths:
      calidad.planta_completo: 180
    series_cell_visualizations:
      calidad.Quejas:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: calidad.date_filter
    row: 7
    col: 0
    width: 24
    height: 7
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023/12/28
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: calidad
    listens_to_filters: []
    field: calidad.date_filter
