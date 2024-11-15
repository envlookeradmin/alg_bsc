---
- dashboard: envases_inyeccion_v2
  title: Envases_inyeccion v2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: EziUB3NcFlewc16JFLrXlI
  elements:
  - title: Producción Acumulada
    name: Producción Acumulada
    model: envases_iny
    explore: envases
    type: looker_column
    fields: [envases.Total_salida_real, envases.pais]
    sorts: [envases.Total_salida_real desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_colors:
      envases.Total_salida_real: "#002060"
    defaults_version: 1
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 16
    col: 0
    width: 8
    height: 6
  - title: 'Producción Planeada VS Real (Millones) '
    name: 'Producción Planeada VS Real (Millones) '
    model: envases_iny
    explore: envases
    type: looker_line
    fields: [envases.Total_salida_real, envases.pais, envases.Total_prod_plan]
    sorts: [envases.Total_salida_real desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Prod Plan}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_types:
      envases.Total_prod_plan: column
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
    series_labels:
      envases.Total_salida_real: Salida Real
      envases.Total_prod_plan: Prod Plan
    series_point_styles:
      envases.Total_prod_plan: auto
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 16
    col: 8
    width: 7
    height: 6
  - title: Disponibilidad
    name: Disponibilidad
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 6
    col: 0
    width: 5
    height: 5
  - title: ''
    name: ''
    model: envases_iny
    explore: envases
    type: Single_Value_Viz
    fields: [envases.Total_salida_real, envases.pais, envases.Total_prod_plan]
    sorts: [envases.Total_salida_real desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    html_template: '<table style="width: 99.3696%;"> <tbody> <tr>  <td style="width:
      2.08333%; background-color: #ffffff; padding: 0px; border: none #000000; text-align:
      center;">  <strong><strong><strong><span style="font-size: 15px; font-family:
      Arial, sans-serif;"><img style="float: right;" src="https://www.envases.mx/media/10273/envaseslogo_icon_new.png"
      width="151" height="60" />  </span></strong></strong></strong></td> <td style="width:
      46.4625%; background-color: #5e2129; padding: 0px; border: none #000000; text-align:
      center;">   <h2><strong><span style="color: #ffffff;">REPORTE INYECCIÓN-NISSEI
      DIVISIÓN PET 2024</span></strong></h2> <p><span style="color: #ffffff;">{{ fct_seguridad.fecha_ultimo
      }}</span></p> </td> </tr> </tbody> </table>'
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
    series_point_styles:
      envases.Total_prod_plan: auto
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    title_hidden: true
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 0
    col: 0
    width: 24
    height: 3
  - title: OEE Acumulado por Equipo
    name: OEE Acumulado por Equipo
    model: envases_iny
    explore: envases
    type: looker_line
    fields: [envases.maq_int, envases.pro_OEE_Acumulado]
    filters: {}
    sorts: [envases.maq_int]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Prod Plan}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    font_size: '10'
    trellis_rows: 2
    series_colors:
      envases.Total_prod_plan: "#EA4335"
      envases.Total_salida_real: "#00B050"
      envases.por_delta: "#00B0F0"
      envases.pro_OEE_Acumulado: "#4F81BD"
    series_labels:
      envases.Total_prod_plan: Prod Plan
      envases.Total_salida_real: Salida Real
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 37
    col: 12
    width: 12
    height: 8
  - title: CAVIDADES CANCELADAS
    name: CAVIDADES CANCELADAS
    model: envases_iny
    explore: envases
    type: looker_area
    fields: [envases.maq_int, envases.Total_canceladas]
    filters:
      envases.concepto_cav_cancelada: "-EMPTY"
    sorts: [envases.maq_int]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Prod Plan}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    font_size: '10'
    trellis_rows: 2
    series_colors:
      envases.Total_prod_plan: "#EA4335"
      envases.Total_salida_real: "#00B050"
      envases.por_delta: "#00B0F0"
      envases.pro_OEE_Acumulado: "#4F81BD"
    series_labels:
      envases.Total_prod_plan: Prod Plan
      envases.Total_salida_real: Salida Real
    ordering: none
    show_null_labels: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 45
    col: 0
    width: 12
    height: 7
  - title: 'CICLO ESTANDAR VS CICLO REAL '
    name: 'CICLO ESTANDAR VS CICLO REAL '
    model: envases_iny
    explore: envases
    type: looker_line
    fields: [envases.maq_int, envases.pro_real2, envases.pro_estandar_proveedor]
    filters: {}
    sorts: [envases.maq_int]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: envases.pro_estandar_proveedor,
            id: envases.pro_estandar_proveedor, name: Pro Estandar Proveedor}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear},
      {label: '', orientation: left, series: [{axisId: envases.pro_real2, id: envases.pro_real2,
            name: Pro Real2}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    font_size: '10'
    trellis_rows: 2
    series_types:
      envases.pro_real2: column
    series_colors:
      envases.Total_prod_plan: "#079c98"
      envases.Total_salida_real: "#80868B"
      envases.por_delta: "#00B0F0"
      envases.Total_delta: "#FF8168"
      envases.pro_real2: "#079c98"
      envases.pro_estandar_proveedor: "#EA4335"
    series_labels:
      envases.Total_prod_plan: Prod Plan
      envases.Total_salida_real: Salida Real
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 45
    col: 12
    width: 12
    height: 7
  - title: 'Producción por Gramaje '
    name: 'Producción por Gramaje '
    model: envases_iny
    explore: envases
    type: looker_column
    fields: [envases.Total_salida_real, envases.gramaje]
    filters: {}
    sorts: [envases.Total_salida_real desc]
    limit: 13
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#4F81BD"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Prod Plan}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    font_size: '10'
    trellis_rows: 2
    series_colors:
      envases.Total_prod_plan: "#079c98"
      envases.Total_salida_real: "#4F81BD"
      envases.por_delta: "#00B0F0"
      envases.Total_delta: "#FF8168"
      envases.pro_real2: "#079c98"
      envases.pro_estandar_proveedor: "#EA4335"
    series_labels:
      envases.Total_prod_plan: Prod Plan
      envases.Total_salida_real: Salida Real
    show_null_points: true
    interpolation: linear
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 37
    col: 0
    width: 12
    height: 8
  - title: Eficiencia
    name: Eficiencia
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#00B0F0"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 6
    col: 5
    width: 5
    height: 5
  - title: Calidad
    name: Calidad
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#7030A0"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 6
    col: 10
    width: 5
    height: 5
  - title: OEE
    name: OEE
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#e6465e"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 6
    col: 15
    width: 5
    height: 5
  - title: PTTE
    name: PTTE
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#7030A0"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 11
    col: 5
    width: 5
    height: 5
  - title: Aprovechamiento
    name: Aprovechamiento
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#00B0F0"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 11
    col: 0
    width: 5
    height: 5
  - title: Merma
    name: Merma
    model: envases_iny
    explore: envases
    type: looker_line
    fields: [envases.Total_salida_real, envases.fecha_year, envases.fecha_month_name]
    pivots: [envases.fecha_year]
    fill_fields: [envases.fecha_month_name, envases.fecha_year]
    filters:
      envases.fecha_year: 2022/01/01 to 2024/05/31
    sorts: [envases.fecha_year, envases.fecha_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Prod Plan}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    hidden_series: []
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
    series_labels:
      envases.Total_salida_real: Salida Real
      envases.Total_prod_plan: Prod Plan
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 16
    col: 15
    width: 9
    height: 6
  - title: Comparativo vs Año Anterior y Tendencia
    name: Comparativo vs Año Anterior y Tendencia
    model: envases_iny
    explore: envases
    type: looker_grid
    fields: [envases.fecha_year, envases.pais, envases.Total_salida_real, envases.Total_prod_plan]
    filters: {}
    sorts: [envases.Total_salida_real desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${envases.Total_prod_plan}-${envases.Total_salida_real})*10"
      label: Tendencia
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: tendencia
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", envases.fecha_year, envases.pais, envases.Total_prod_plan,
      envases.Total_salida_real]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      envases.Total_salida_real: Salida Real
      envases.Total_prod_plan: Prod Plan
    series_cell_visualizations:
      envases.Total_salida_real:
        is_active: false
    series_text_format:
      tendencia:
        align: right
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: ef6b2243-7a46-7d3b-9908-0018971810e8, label: Custom, type: continuous,
            stops: [{color: "#d3e863", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#7CB342", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_colors:
      envases.Total_salida_real: "#002060"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 26
    col: 0
    width: 24
    height: 4
  - title: Comparativo vs Año Anterior y Tendencia
    name: Comparativo vs Año Anterior y Tendencia (2)
    model: envases_iny
    explore: envases
    type: looker_grid
    fields: [envases.fecha_year, envases.pais, envases.Total_salida_real, envases.Total_prod_plan,
      envases.modelo, envases.planta, envases.maq_int]
    filters: {}
    sorts: [envases.Total_prod_plan desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${envases.Total_prod_plan}-${envases.Total_salida_real})*10"
      label: Tendencia
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: tendencia
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", envases.fecha_year, envases.pais, envases.maq_int,
      envases.modelo, envases.planta, envases.Total_prod_plan, envases.Total_salida_real,
      tendencia]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      envases.Total_salida_real: Salida Real
      envases.Total_prod_plan: Prod Plan
      envases.maq_int: Linea
    series_cell_visualizations:
      envases.Total_salida_real:
        is_active: false
    series_text_format:
      tendencia:
        align: right
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: ef6b2243-7a46-7d3b-9908-0018971810e8, label: Custom, type: continuous,
            stops: [{color: "#d3e863", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#7CB342", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [envases.Total_salida_real, envases.Total_prod_plan,
          tendencia]}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_colors:
      envases.Total_salida_real: "#002060"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 30
    col: 0
    width: 24
    height: 7
  - title: Nuevo mosaico
    name: Nuevo mosaico
    model: envases_iny
    explore: envases
    type: single_value
    fields: [envases.Total_salida_real]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: PRODUCCIÓN ACUMULADA
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 3
    col: 0
    width: 5
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 3
    col: 5
    width: 19
    height: 3
  - title: Planta Criticas   Linea Todas
    name: Planta Criticas   Linea Todas
    model: envases_iny
    explore: envases_resumen
    type: looker_line
    fields: [envases_resumen.peirodo, envases_resumen.orden, envases_resumen.Total_general,
      envases_resumen.tipo]
    pivots: [envases_resumen.tipo]
    sorts: [envases_resumen.tipo, envases_resumen.orden, envases_resumen.peirodo]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: envases_resumen.Total_anual,
            id: envases_resumen.Total_anual, name: Año}, {axisId: envases_resumen.Total_Mensual,
            id: envases_resumen.Total_Mensual, name: Mes}, {axisId: envases_resumen.Total_Semanal,
            id: envases_resumen.Total_Semanal, name: Semana}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      Anual - envases_resumen.Total_general: column
    series_colors:
      envases_resumen.Total_Mensual: "#E8710A"
      envases_resumen.Total_Semanal: "#80868B"
      Mensual - envases_resumen.Total_general: "#E8710A"
      Semanal - envases_resumen.Total_general: "#A8A116"
    series_labels:
      envases_resumen.Total_anual: Año
      envases_resumen.Total_Mensual: Mes
      envases_resumen.Total_Semanal: Semana
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#A8A116",
        value_format: '', line_value: mean, label: Meta}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [envases_resumen.orden]
    hidden_pivots: {}
    listen:
      Planta: envases_resumen.planta
    row: 52
    col: 0
    width: 24
    height: 9
  - title: PPE
    name: PPE
    model: envases_iny
    explore: envases
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [envases.por_Cumplimiento]
    filters:
      envases.pais: Brasil,Colombia,México,Uruguay
      envases.planta: ''
      envases.tipo_cuello: ''
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 8
    range_min: 0
    value_label_type: both
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    spinner_type: needle
    fill_color: "#7030A0"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
    bar_arm_length: 25
    bar_arm_weight: 50
    bar_spinner_length: 100
    bar_spinner_weight: 50
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
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: envases.Total_prod_plan,
            id: envases.Total_prod_plan, name: Total Prod Plan}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      envases.Total_prod_plan: "#215968"
      envases.Total_salida_real: "#e81531"
      envases.por_delta: "#00B0F0"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#079c98",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    up_color: false
    down_color: false
    total_color: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Linea: envases.maq_int
    row: 11
    col: 10
    width: 5
    height: 5
  - title: Merma
    name: Merma (2)
    model: envases_iny
    explore: envases
    type: looker_grid
    fields: [envases.planta, envases.Total_salida_real, envases.Total_prod_plan]
    filters: {}
    sorts: [envases.Total_salida_real desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: "% Merma"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: merma
      args:
      - envases.Total_prod_plan
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", envases.planta, merma, envases.Total_salida_real,
      envases.Total_prod_plan]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      envases.Total_prod_plan: Pza Merma
      envases.Total_salida_real: Kg Merma
    series_cell_visualizations:
      envases.Total_salida_real:
        is_active: false
    series_text_format:
      merma:
        align: right
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: ef6b2243-7a46-7d3b-9908-0018971810e8, label: Custom, type: continuous,
            stops: [{color: "#d3e863", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#7CB342", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: envases.Total_salida_real,
            id: envases.Total_salida_real, name: Total Salida Real}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    series_colors:
      envases.Total_salida_real: "#002060"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Pais: envases.pais
      Tipo Cuello: envases.tipo_cuello
      Fecha Date: envases.fecha_date
      Modelo: envases.modelo
      Planta: envases.planta
      Linea: envases.maq_int
    row: 22
    col: 0
    width: 24
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 11
    col: 15
    width: 8
    height: 5
  filters:
  - name: Pais
    title: Pais
    type: field_filter
    default_value: Brasil,Colombia,México,Uruguay
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: envases_iny
    explore: envases
    listens_to_filters: [Planta, Tipo Cuello]
    field: envases.pais
  - name: Modelo
    title: Modelo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: envases_iny
    explore: envases
    listens_to_filters: []
    field: envases.modelo
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: envases_iny
    explore: envases
    listens_to_filters: [Pais, Tipo Cuello]
    field: envases.planta
  - name: Tipo Cuello
    title: Tipo Cuello
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: envases_iny
    explore: envases
    listens_to_filters: [Pais, Planta]
    field: envases.tipo_cuello
  - name: Fecha Date
    title: Fecha Date
    type: field_filter
    default_value: 2020/01/01 to 2024/10/18
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: envases_iny
    explore: envases
    listens_to_filters: []
    field: envases.fecha_date
  - name: Linea
    title: Linea
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - '1'
      - '2'
      - '3'
    model: envases_iny
    explore: envases
    listens_to_filters: []
    field: envases.maq_int
