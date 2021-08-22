view: website_checkoutstepcompleted {
  sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.checkout_step_completed`
       ;;


  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension_group: check_in_date {
    type: time
    timeframes: [year,date,week,month,time]
    sql: ${TABLE}.check_in_date ;;
  }

  dimension_group: check_out_date {
    type: time
    timeframes: [year,date,week,month,time]
    sql: ${TABLE}.check_out_date ;;
  }

  dimension: checkout_id {
    type: string
    sql: ${TABLE}.checkout_id ;;
    hidden: yes
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: me_client_id {
    type: string
    sql: ${TABLE}.me_client_id ;;
    label: "Client Id"
  }

  dimension: me_session_id {
    type: string
    sql: ${TABLE}.me_session_id ;;
    label: "Session Id"
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: property_id {
    type: string
    sql: ${TABLE}.property_id ;;
    hidden: yes
  }

  dimension: property_name {
    type: string
    sql: ${TABLE}.property_name ;;
  }

  dimension: room_type_name {
    type: string
    sql: ${TABLE}.room_type_name ;;
  }

  dimension: step {
    type: number
    sql: ${TABLE}.step ;;
  }

  dimension_group: timestamp {
    type: time
    label: "Range Time"
    timeframes: [year,date,week,month,time]
    sql: ${TABLE}.timestamp ;;
  }

measure: count {
  type: count
  drill_fields: [detail*]
}
  set: detail {
    fields: [
      anonymous_id,
      check_in_date_time,
      check_out_date_time,
      checkout_id,
      context_campaign_medium,
      context_campaign_source,
      event,
      location,
      me_client_id,
      me_session_id,
      price,
      property_id,
      property_name,
      room_type_name,
      step,
      timestamp_time
    ]
  }
}
