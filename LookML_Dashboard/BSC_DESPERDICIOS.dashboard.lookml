---
- dashboard: bsc__desperdicios
  title: BSC - DESPERDICIOS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Jh6yRtpopPPVleP8AdTWBK
  elements:
  - title: 'BSC - IMPORTES CUENTA DESPERDICIOS '
    name: 'BSC - IMPORTES CUENTA DESPERDICIOS '
    model: bsc
    explore: fct_desperdicio_prod
    type: looker_grid
    fields: [planta.planta_completo, fecha.nombre_mes, fct_desperdicio_prod.Total_importe_produccion,
      material.descripcion_material]
    pivots: [fecha.nombre_mes]
    filters:
      fct_desperdicio_prod.fuente: ACDOCA
    sorts: [planta.planta_completo, fecha.nombre_mes]
    subtotals: [planta.planta_completo]
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
      planta.planta_completo: Planta
      fct_desperdicio_prod.descripcion_material: Material
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_desperdicio_prod.Total_cantidad_produccion:
        is_active: false
    series_collapsed:
      planta.planta_completo: true
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: fct_desperdicio_prod.date_filter
    row: 0
    col: 0
    width: 24
    height: 9
  - title: BSC - DETALLE DESPERDICIOS POR MATERIAL
    name: BSC - DETALLE DESPERDICIOS POR MATERIAL
    model: bsc
    explore: fct_desperdicio_prod
    type: looker_grid
    fields: [planta.planta_completo, fecha.nombre_mes, fct_desperdicio_prod.Total_cantidad_produccion,
      fct_desperdicio_prod.Total_cantidad_desperdicio, fct_desperdicio_prod.Por_cantidad_desperdicio,
      fct_desperdicio_prod.Total_importe_produccion, grupo_materiales.descripcion]
    pivots: [fecha.nombre_mes]
    filters:
      fct_desperdicio_prod.fuente: MSEG
    sorts: [planta.planta_completo, fecha.nombre_mes]
    subtotals: [planta.planta_completo]
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
    column_order: ["$$$_row_numbers_$$$", planta.planta_completo, grupo_materiales.descripcion,
      Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_importe_produccion, Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_cantidad_produccion,
      Noviembre|FIELD|2023-11_fct_desperdicio_prod.Total_cantidad_desperdicio, Noviembre|FIELD|2023-11_fct_desperdicio_prod.Por_cantidad_desperdicio,
      Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_cantidad_produccion, Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_cantidad_desperdicio,
      Diciembre|FIELD|2023-12_fct_desperdicio_prod.Por_cantidad_desperdicio, Diciembre|FIELD|2023-12_fct_desperdicio_prod.Total_importe_produccion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      planta.planta_completo: Planta
      fct_desperdicio_prod.descripcion_material: Material
      fecha.nombre_mes: Mes
      grupo_materiales.descripcion: Grupo Materiales
    series_cell_visualizations:
      fct_desperdicio_prod.Total_cantidad_produccion:
        is_active: false
    series_collapsed:
      planta.planta_completo: true
    header_font_color: "#FFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Fecha: fct_desperdicio_prod.date_filter
    row: 9
    col: 0
    width: 24
    height: 8
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/02/19 to 2024/02/24
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bsc
    explore: fct_desperdicio_prod
    listens_to_filters: []
    field: fct_desperdicio_prod.date_filter
