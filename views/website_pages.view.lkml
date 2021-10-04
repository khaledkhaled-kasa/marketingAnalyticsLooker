view: website_pages {
  sql_table_name:`bigquery-analytics-272822.dbt_bizops.GA_sessions`  ;;
  # derived_table: {
  #   sql: SELECT
  #     anonymous_id,
  #     context_campaign_medium,
  #     context_campaign_source,
  #     search,
  #     timestamp,
  #     me_session_id,
  #     me_client_id,
  #     id ,
  #     ga.device_category,
  #     ga.session_duration,
  #     ga.session_bounce
  #     FROM `bigquery-analytics-272822.website_kasa_com_transformed.pages` p
  #     left join
  #     `bigquery-analytics-272822.ME_BI_prod.GA_sessions_struct` ga
  #         ON
  #       p.me_client_id = ga.client_id
  #     ;;
  # }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: me_session_id {
    type: string
    sql: ${TABLE}.me_session_id ;;
  }

  dimension: me_client_id {
    type: string
    sql: ${TABLE}.me_client_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: session_bounce {
    type: number
    sql: ${TABLE}.session_bounce ;;
  }

  set: detail {
    fields: [
      anonymous_id,
      context_campaign_medium,
      context_campaign_source,
      search,
      timestamp_time,
      me_session_id,
      me_client_id,
      id,
      # device_category,
      # session_duration,
      # session_bounce
    ]
  }
}
