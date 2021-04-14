view: anal_website_funnel {
  view_label: "Website Funnel"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_website_funnel`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: step_1 {
    type: string
    sql: ${TABLE}.step_1 ;;
  }

  dimension: step_2 {
    type: string
    sql: ${TABLE}.step_2 ;;
  }

  dimension: step_3 {
    type: string
    sql: ${TABLE}.step_3 ;;
  }

  dimension: step_4 {
    type: string
    sql: ${TABLE}.step_4 ;;
  }

  dimension: step_5 {
    type: string
    sql: ${TABLE}.step_5 ;;
  }

  dimension: is_property_view_in_path {
    type: yesno
    sql: if(
    ${step_1} like ('propertyView') or
    ${step_2} like ('propertyView') or
    ${step_3} like ('propertyView') or
    ${step_4} like ('propertyView') or
    ${step_5} like ('propertyView')
    ,true,false) ;;
  }

  dimension: is_location_view_in_path {
    type: yesno
    sql:
    if(
    ${step_1} like ('locationView') or
    ${step_2} like ('locationView') or
    ${step_3} like ('locationView') or
    ${step_4} like ('locationView') or
    ${step_5} like ('locationView')
    ,true,false);;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}