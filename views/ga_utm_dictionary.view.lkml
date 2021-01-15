view: ga_utm_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_utm_dictionary`
    ;;
  label: "UTM Dictionary"
  dimension: ga_ad_content {
    type: string
    sql: ${TABLE}.ga_ad_content ;;
  }

  dimension: ga_ad_content_clean {
    type: string
    # label: "Ad Content"
    sql: ${TABLE}.ga_ad_content_clean ;;
  }

  dimension: ga_campaign {
    type: string
    sql: ${TABLE}.ga_campaign ;;
  }

  dimension: ga_campaign_clean {
    type: string
    # label: "Campaign"
    sql: ${TABLE}.ga_campaign_clean ;;
  }

  dimension: ga_keyword {
    type: string
    sql: ${TABLE}.ga_keyword ;;
  }

  dimension: ga_keyword_clean {
    type: string
    # label: "Keyword"
    sql: ${TABLE}.ga_keyword_clean ;;
  }

  dimension: ga_medium {
    type: string
    sql: ${TABLE}.ga_medium ;;
  }

  dimension: ga_medium_clean {
    type: string
    # label: "Medium"
    sql: ${TABLE}.ga_medium_clean ;;
  }

  dimension: ga_source {
    type: string
    sql: ${TABLE}.ga_source ;;
  }

  dimension: ga_source_clean {
    type: string
    # label: "Source"
    sql: ${TABLE}.ga_source_clean ;;
  }

  dimension: mkt_account {
    type: string
    sql: ${TABLE}.mkt_account ;;
  }

  dimension: mkt_ad {
    type: string
    sql: ${TABLE}.mkt_ad ;;
  }

  dimension: mkt_ad_group {
    type: string
    sql: ${TABLE}.mkt_ad_group ;;
  }

  dimension: mkt_campaign {
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: mkt_channel {
    type: string
    sql: ${TABLE}.mkt_channel ;;
  }

  dimension: paid_unpaid_traffic {
    type: string
    sql: ${TABLE}.paid_unpaid_traffic ;;
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
}
