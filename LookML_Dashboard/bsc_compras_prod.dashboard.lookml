---
- dashboard: bsc_compras_prod
  title: BSC_COMPRAS_PROD
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
    fields: [planta.planta_completo, comprador.gerencia, comprador.comprador, ordenes_compra.Porc_Productividad_Alcanzada,
      ordenes_compra.Prom_Dias_Atencion]
    filters:
      ordenes_compra.date_filter: 2023/07/31
    sorts: [planta.planta_completo, comprador.gerencia, comprador.comprador]
    subtotals: [planta.planta_completo, comprador.gerencia]
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
      planta.planta_completo: Planta
    series_cell_visualizations: {}
    series_collapsed:
      ordenes_compra.Planta: true
      comprador.gerencia: true
      planta.planta_completo: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields:
    listen:
      Fecha: ordenes_compra.Fecha_s_date
    row: 0
    col: 0
    width: 20
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <h3><span style="color: #800000;"><strong>Semáforo</strong></span></h3>
      <table style="border-collapse: collapse; width: 100%; height: 18px;" border="0">
      <tbody>
      <tr style="height: 18px;">
      <td style="width: 4%; height: 18px;"><strong><span style="color: #ff0000;">&lt;84%</span></strong></td>
      <td style="width: 4%; height: 18px;"><strong><span style="color: #ffd100;">[85-94%]</span></strong></td>
      <td style="width: 4%; height: 18px;"><strong><span style="color: #008000;">&gt;95%</span></strong></td>
      </tr>
      </tbody>
      </table>
    row: 0
    col: 20
    width: 4
    height: 3
  - title: DETALLE PRODUCTIVIDAD
    name: DETALLE PRODUCTIVIDAD
    model: bsc
    explore: ordenes_compra
    type: looker_grid
    fields: [ordenes_compra.fecha_creacion_orden, ordenes_compra.uid_pr, ordenes_compra.numero_solicitud,
      ordenes_compra.posicion, ordenes_compra.numero_orden, ordenes_compra.posicion_orden,
      ordenes_compra.fecha_modificacion_pr, ordenes_compra.fecha_creacion, ordenes_compra.dias_atencion,
      ordenes_compra.tiempo_maximo, ordenes_compra.fecha_liberacion, ordenes_compra.fecha_modificacion_orden,
      ordenes_compra.grupo_compras, ordenes_compra.planta, ordenes_compra.indicador_liberacion,
      ordenes_compra.estatus, ordenes_compra.creado_por, ordenes_compra.proveedor,
      ordenes_compra.gerencia, ordenes_compra.gerente, ordenes_compra.comprador, ordenes_compra.fecha_entrega_plan,
      ordenes_compra.fecha_entrada, ordenes_compra.orden_compra_uid]
    filters:
      ordenes_compra.date_filter: 2023/07/31
    sorts: [ordenes_compra.fecha_creacion_orden desc]
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
      planta.planta_completo: Planta
    series_cell_visualizations: {}
    series_collapsed:
      ordenes_compra.Planta: true
      comprador.gerencia: true
      planta.planta_completo: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    hidden_fields:
    hidden_pivots: {}
    listen:
      Fecha: ordenes_compra.Fecha_s_date
    row: 6
    col: 0
    width: 24
    height: 12
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2024/02/29
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: bsc
    explore: ordenes_compra
    listens_to_filters: []
    field: ordenes_compra.Fecha_s_date
