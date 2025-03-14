---
- dashboard: tiempo_estadia
  title: TIEMPO ESTADIA
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SkVYuMphedFqNQrwB35DU5
  elements:
  - title: Año anterior
    name: Año anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Prom_Estadia_AA,
      tiempos_estadia.vacio]
    pivots: [tiempos_estadia.vacio]
    filters: {}
    sorts: [tiempos_estadia.vacio, tiempos_estadia.Orden_locacion]
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
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      planta.planta_completo_t_estadia: Planta
      tiempos_estadia.PlantaCompleto: Planta
    series_column_widths:
      tiempos_estadia.Locacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
      Actividad: actividad.descripcion
    row: 0
    col: 0
    width: 7
    height: 5
  - title: Por mes
    name: Por mes
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Prom_Estadia,
      fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters:
      tiempos_estadia.Prom_Estadia: NOT NULL
    sorts: [fecha.nombre_mes, tiempos_estadia.Orden_locacion]
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
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      fecha.nombre_mes: Mes
      tiempos_estadia.PlantaCompleto: Planta
    series_column_widths:
      tiempos_estadia.Locacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    series_text_format:
      fecha.nombre_mes:
        align: left
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [tiempos_estadia.Orden_locacion]
    listen:
      Fecha: tiempos_estadia.date_filter
      Actividad: actividad.descripcion
    row: 0
    col: 7
    width: 17
    height: 5
  - title: Mes seleccionado vs mes anterior
    name: Mes seleccionado vs mes anterior
    model: bsc
    explore: tiempos_estadia
    type: looker_grid
    fields: [tiempos_estadia.Orden_locacion, tiempos_estadia.Locacion, tiempos_estadia.Diferencia,
      tiempos_estadia.vacio]
    pivots: [tiempos_estadia.vacio]
    filters: {}
    sorts: [tiempos_estadia.vacio, tiempos_estadia.Orden_locacion]
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
      actividad.descripcion: Maniobra
      planta.planta_completo: Planta
      tiempos_estadia.PlantaCompleto: Planta
    series_column_widths:
      tiempos_estadia.Locacion: 200
    series_cell_visualizations:
      tiempos_estadia.Prom_Estadia_AA:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields: [tiempos_estadia.Orden_locacion]
    hidden_pivots: {}
    listen:
      Fecha: tiempos_estadia.date_filter
      Actividad: actividad.descripcion
    row: 5
    col: 0
    width: 24
    height: 4
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/07/01 to 2024/08/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: bsc
    explore: tiempos_estadia
    listens_to_filters: []
    field: tiempos_estadia.date_filter
  - name: Actividad
    title: Actividad
    type: field_filter
    default_value: EMBARQUES
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: bsc
    explore: tiempos_estadia
    listens_to_filters: []
    field: actividad.descripcion
