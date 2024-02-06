---
- dashboard: bsc_seguridad
  title: BSC_Seguridad
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: jiEuvOciWxCPceaHBJzlgg
  elements:
  - title: ADP MES
    name: ADP MES
    model: bsc
    explore: fct_seguridad
    type: looker_grid
    fields: [planta.planta_comercializadora, fecha.nombre_mes, fct_seguridad.Total_ADP]
    pivots: [fecha.nombre_mes]
    sorts: [fecha.nombre_mes, planta.planta_comercializadora]
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
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      planta.planta_comercializadora: left
    column_order: [planta.planta_comercializadora, Enero|FIELD|1_fct_seguridad.count_trimestre,
      Febrero|FIELD|2_fct_seguridad.count_trimestre, Marzo|FIELD|3_fct_seguridad.count_trimestre,
      Abril|FIELD|4_fct_seguridad.count_trimestre, Mayo|FIELD|5_fct_seguridad.count_trimestre,
      Junio|FIELD|6_fct_seguridad.count_trimestre, Julio|FIELD|7_fct_seguridad.count_trimestre,
      Agosto|FIELD|8_fct_seguridad.count_trimestre, Septiembre|FIELD|9_fct_seguridad.count_trimestre,
      Octubre|FIELD|10_fct_seguridad.count_trimestre, Noviembre|FIELD|11_fct_seguridad.count_trimestre,
      Diciembre|FIELD|12_fct_seguridad.count_trimestre]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fct_seguridad.count_trimestre: ADP Mes
      fct_seguridad.Total_ADP: ADP Mes
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_seguridad.count:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Período: fct_seguridad.date_filter
    row: 0
    col: 12
    width: 12
    height: 6
  - title: ADP TRIMESTRE
    name: ADP TRIMESTRE
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [fct_seguridad_anual.Total_ADP, fecha.trimestre_Letra, planta.planta_comercializadora]
    pivots: [fecha.trimestre_Letra]
    filters: {}
    sorts: [fecha.trimestre_Letra, fct_seguridad_anual.Total_ADP desc 0]
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
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
      fecha.trimestre_Letra: Trimestre
    series_cell_visualizations:
      fct_seguridad_anual.count_trimestre:
        is_active: false
    series_text_format:
      fct_seguridad_anual.Total_ADP:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Período: fct_seguridad_anual.date_filter
    row: 0
    col: 0
    width: 12
    height: 6
  - title: ADP ACUMULADO
    name: ADP ACUMULADO
    model: bsc
    explore: fct_seguridad_anual
    type: looker_grid
    fields: [fct_seguridad_anual.Total_ADP, planta.planta_comercializadora]
    filters: {}
    sorts: [fct_seguridad_anual.Total_ADP desc]
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
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_seguridad_anual.count_trimestre:
        is_active: false
    series_text_format:
      fct_seguridad_anual.Total_ADP:
        align: center
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Período: fct_seguridad_anual.date_filter
    row: 6
    col: 0
    width: 24
    height: 5
  filters:
  - name: Período
    title: Período
    type: field_filter
    default_value: 2023/11/30
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: fct_seguridad
    listens_to_filters: []
    field: fct_seguridad.date_filter
