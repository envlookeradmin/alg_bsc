---
- dashboard: bsc_fletes
  title: BSC_FLETES
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: X6C4LcWfi4ub8CHNVNbvAk
  elements:
  - title: Fletes
    name: Fletes
    model: bsc
    explore: inventario_fletes
    type: looker_grid
    fields: [inventario_fletes.Centro, inventario_fletes.RealCostoFletesMTD, inventario_fletes.PorcRealFletesVentasMTD,
      inventario_fletes.RealCostoFletesYTD, inventario_fletes.PorcRealFletesVentasYTD]
    filters:
      inventario_fletes.Planta: "-GF01"
    sorts: [inventario_fletes.Centro]
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
      planta.planta_completo: Planta
      planta.planta_comercializadora: Planta
      inventario_fletes.GpoPlantaFletes: Planta
    series_cell_visualizations:
      inventario_fletes.RealCostoFletes:
        is_active: false
    header_font_color: "#FFFFFF"
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
      Fecha: inventario_fletes.date_filter
    row: 0
    col: 0
    width: 20
    height: 4
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2023/11/30
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: inventario_fletes
    listens_to_filters: []
    field: inventario_fletes.date_filter
