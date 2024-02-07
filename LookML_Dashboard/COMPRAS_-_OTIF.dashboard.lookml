---
- dashboard: compras__otif
  title: COMPRAS - OTIF
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5d5I1TzY3AVqifR8Y4Oq9q
  elements:
  - title: COMPRAS - OTIF
    name: COMPRAS - OTIF
    model: bsc
    explore: fct_ordenes_compra_otif
    type: looker_grid
    fields: [fct_ordenes_compra_otif.planta, comprador.gerencia, fct_ordenes_compra_otif.total_ordenes,
      fct_ordenes_compra_otif.ordenes_en_tiempo, fct_ordenes_compra_otif.otif, fct_ordenes_compra_otif.comprador]
    filters:
      fct_ordenes_compra_otif.es_reco: not 1
      comprador.gerencia: "-NULL"
      fct_ordenes_compra_otif.comprador: "-JESSICA PATRICIA ALCALA,-DIANA GARCIA"
      fct_ordenes_compra_otif.material: "-000000000004000009,-000000000006000094,-000000000006000095"
    sorts: [fct_ordenes_compra_otif.planta, comprador.gerencia]
    subtotals: [fct_ordenes_compra_otif.planta, comprador.gerencia]
    limit: 500
    column_limit: 50
    total: true
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
    series_cell_visualizations:
      fct_ordenes_compra_otif.total_ordenes:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#702119"
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
      Fecha: fct_ordenes_compra_otif.fecha
      Planta: fct_ordenes_compra_otif.planta
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023-11
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bsc
    explore: fct_ordenes_compra_otif
    listens_to_filters: []
    field: fct_ordenes_compra_otif.fecha
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
    explore: fct_ordenes_compra_otif
    listens_to_filters: []
    field: fct_ordenes_compra_otif.planta
