---
- dashboard: bsc_compras_productividad
  title: BSC_COMPRAS_PRODUCTIVIDAD
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lyDevllpyClfl0uwwruoK0
  elements:
  - title: PRODUCTIVIDAD
    name: PRODUCTIVIDAD
    model: bsc
    explore: ordenes_compra
    type: looker_grid
    fields: [ordenes_compra.Planta, ordenes_compra.Porc_Productividad_Alcanzada, ordenes_compra.Prom_Dias_Atencion,
      comprador.gerencia, comprador.comprador]
    filters: {}
    sorts: [ordenes_compra.Planta, comprador.gerencia]
    subtotals: [ordenes_compra.Planta, comprador.gerencia]
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
    header_text_alignment: left
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
      planta.nombre_planta: Planta
      planta.planta_completo_c: Planta
      planta.planta_completo_prod: Planta
      ordenes_compra.PlantaCompletoProd: Planta
    series_cell_visualizations: {}
    series_collapsed:
      ordenes_compra.Planta: true
      comprador.gerencia: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields:
    listen:
      Fecha: ordenes_compra.date_filter
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023/08/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: ordenes_compra
    listens_to_filters: []
    field: ordenes_compra.date_filter
