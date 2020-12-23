view: ga_utm_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_utm_dictionary`
    ;;

  dimension: ga_ad_content {
    type: string
    sql: ${TABLE}.ga_ad_content ;;
  }

  dimension: ga_campaign {
    type: string
    sql: ${TABLE}.ga_campaign ;;
  }

  dimension: ga_keyword {
    type: string
    sql: ${TABLE}.ga_keyword ;;
  }

  dimension: ga_medium {
    type: string
    sql: ${TABLE}.ga_medium ;;
  }

  dimension: ga_source {
    type: string
    sql: ${TABLE}.ga_source ;;
  }

  dimension: utm_key_id {
    type: number
    sql: ${TABLE}.utm_key_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
