constant: CONNECTION_NAME {
  value: "envases_analytics_qa"
  export: override_required
}

constant: GCP_PROJECT {
  value: "envases-analytics-qa"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "RPT_S4H_MX"
  export: override_required
}

constant: REPORTING_DATASET2 {
  value: "ENVASES_REPORTING_UPG"
  export: override_required
  #calendar
}

constant: REPORTING_DATASET3 {
  value: "RPT_S4H_MX_UPG"
  export: override_required
}

constant: REPORTING_DATASET4 {
  value: "RAW_S4H_MX"
  export: override_required
}

constant: REPORTING_DATASET5 {
  value: "CDC_S4H_MX"
  export: override_required
}

















#`@{GCP_PROJECT}.@{REPORTING_DATASET}.tabla
#`envases-analytics-qa.ENVASES_REPORTING_UPG.CALENDAR`
# `envases-analytics-qa.RPT_EHS_MX_UPG.vw_bsc_reporte_seguridad`
# `envases-analytics-qa.RPT_S4H_MX_UPG.vw_bsc_planta`
#`envases-analytics-qa.RPT_S4H_MX_UPG.vw_bsc_planta
#SELECT * FROM `envases-analytics-qa.RPT_EHS_MX_UPG.vw_bsc_reporte_seguridad` LIMIT 10
