constant: CONNECTION_NAME {
  value: "envases_analytics_qa"
  export: override_required
}

constant: GCP_PROJECT {
  value: "envases-analytics-qa"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "RPT_EHS_MX_UPG"
  export: override_required
}

constant: REPORTING_DATASET2 {
  value: "ENVASES_REPORTING_UPG"
  export: override_required

  #CALENDAR
}

#`@{GCP_PROJECT}.@{REPORTING_DATASET}.tabla
#`envases-analytics-qa.ENVASES_REPORTING_UPG.CALENDAR`
#`envases-analytics-qa.RPT_EHS_MX_UPG.vw_bsc_reporte_seguridad`
