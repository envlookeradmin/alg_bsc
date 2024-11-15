---
- dashboard: material_de_empaque
  title: MATERIAL DE EMPAQUE
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: xyOWCPCGs9ovxId3FEPjaG
  elements:
  - title: MATERIAL DE EMPAQUE
    name: MATERIAL DE EMPAQUE
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_comercializadora, fct_materiales_stock.Familia, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.Cantidad_stock, fct_materiales_stock.valor_stock, fecha.nombre_mes,
      fct_materiales_stock.tipo_clasificacion]
    pivots: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion]
    filters: {}
    sorts: [fecha.nombre_mes, fct_materiales_stock.tipo_clasificacion, planta.planta_comercializadora,
      fct_materiales_stock.Familia, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.valor_stock desc 0]
    subtotals: [planta.planta_comercializadora, fct_materiales_stock.Familia]
    limit: 5000
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      grupo_materiales.descripcion: Familia
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Fecha: fct_materiales_stock.date_filter
      Planta: planta.planta_comercializadora
    row: 2
    col: 0
    width: 24
    height: 10
  - title: MATERIAL DE EMPAQUE TOTALES
    name: MATERIAL DE EMPAQUE TOTALES
    model: bsc
    explore: fct_materiales_stock
    type: looker_grid
    fields: [planta.planta_comercializadora, fct_materiales_stock.Familia, fct_materiales_stock.Clasificacion_proveedor,
      fct_materiales_stock.Cantidad_stock, fct_materiales_stock.valor_stock, fecha.nombre_mes]
    pivots: [fecha.nombre_mes]
    filters: {}
    sorts: [planta.planta_comercializadora, fct_materiales_stock.Familia, fecha.nombre_mes,
      fct_materiales_stock.Clasificacion_proveedor, fct_materiales_stock.valor_stock
        desc]
    subtotals: [planta.planta_comercializadora, fct_materiales_stock.Familia]
    limit: 5000
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
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      grupo_materiales.descripcion: Familia
      fecha.nombre_mes: Mes
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Fecha: fct_materiales_stock.date_filter
      Planta: planta.planta_comercializadora
    row: 12
    col: 0
    width: 24
    height: 10
  - title: MATERIAL DE EMPAQUE TOTALES (Copiar)
    name: MATERIAL DE EMPAQUE TOTALES (Copiar)
    model: bsc
    explore: fct_materiales_stock
    type: Single_Value_Viz_mul
    fields: [fct_materiales_stock.valor_stock]
    sorts: [fct_materiales_stock.valor_stock desc]
    limit: 5000
    column_limit: 50
    total: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      grupo_materiales.descripcion: Familia
      fecha.nombre_mes: Mes
    show_view_names: false
    html_template: '<table style="border-collapse: collapse; width: 99.5885%; height:
      52px;" border="0">     <tbody>         <tr style="height: 54px;">             <td
      style="width: 100%; text-align: center; height: 54px;">                 <p><span
      style="font-size: 20px; font-family: Verdana, Geneva, sans-serif;">MATERIAL
      DE EMPAQUE</span></p>                 <p><strong>&nbsp;<span style="color: #339966;">Valor
      Stock Actual &gt; Valor Stock Anterior &nbsp;- <strong><span style="color: #ff0000;">Valor
      Stock Actual &lt; Valor Stock Anterior</span></strong></span></strong></p>             </td>         </tr>     </tbody>
      </table>'
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
    series_cell_visualizations:
      fct_materiales_stock.valor_stock:
        is_active: false
    series_collapsed:
      planta.planta_comercializadora: true
    header_font_color: "#fff"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    defaults_version: 0
    title_hidden: true
    listen:
      Fecha: fct_materiales_stock.date_filter
      Planta: planta.planta_comercializadora
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/01/19
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: bsc
    explore: fct_materiales_stock
    listens_to_filters: []
    field: fct_materiales_stock.date_filter
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
    explore: fct_materiales_stock
    listens_to_filters: []
    field: planta.planta_comercializadora
