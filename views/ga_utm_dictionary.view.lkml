view: ga_utm_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_utm_dictionary`
    ;;
  label: "UTM Dictionary"
  dimension: ga_ad_content {
    type: string
    sql: ${TABLE}.ga_ad_content ;;
    label: "Ad Content"
  }

  dimension: ga_campaign {
    type: string
    sql: ${TABLE}.ga_campaign ;;
    label: "Campaign"
  }

  dimension: ga_keyword {
    type: string
    sql: ${TABLE}.ga_keyword ;;
    label: "Keyword"
  }

  dimension: ga_medium {
    type: string
    sql: ${TABLE}.ga_medium ;;
    label: "Medium"
  }

  dimension: ga_source {
    type: string
    sql: ${TABLE}.ga_source ;;
    label: "Source"
  }

  dimension: utm_key_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.utm_key_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: ga_source_medium {
    type: string
    sql: CONCAT(${ga_source}," / ",${ga_medium});;
    label: "Source/Medium"
  }

  parameter: utm_level_parameter  {
    type: unquoted
    allowed_value: { value: "Source" }
    allowed_value: { value: "Medium" }
    allowed_value: { value: "Campaign" }
    allowed_value: { value: "Ad Content" }
    allowed_value: { value: "Keyword" }
    allowed_value: { value: "Source_Medium"}
    label: "Select UTM Level"
  }

  dimension: selected_utm_level {
    label_from_parameter: utm_level_parameter
    type: string
    sql:
      {% if utm_level_parameter._parameter_value == "Source" %} ${ga_source}
      {% elsif utm_level_parameter._parameter_value == "Medium" %} ${ga_medium}
      {% elsif utm_level_parameter._parameter_value == "Campaign" %} ${ga_campaign}
      {% elsif utm_level_parameter._parameter_value == "Ad Content" %} ${ga_ad_content}
      {% elsif utm_level_parameter._parameter_value == "Source_Medium" %} ${ga_source_medium}
      {% endif %} ;;
    label: "Selected UTM Level"
  }
}
