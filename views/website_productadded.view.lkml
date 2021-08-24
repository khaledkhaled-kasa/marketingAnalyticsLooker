view: website_productadded {
 sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.product_added` ;;




  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension_group: check_in_date {
    type: time
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.check_in_date ;;
  }

  dimension_group: check_out_date {
    type: time
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.check_out_date ;;
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
    label: "Clint Id"
    type: string
    sql: ${TABLE}.me_client_id ;;
    hidden: yes
  }

  dimension: me_session_id {
    label: "Session Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
  }

  dimension: nights {
    type: number
    sql: ${TABLE}.nights ;;
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
    label: "Room Type"
  }

  dimension: total_value {
    type: number
    sql: ${TABLE}.total_value ;;
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    label: "Time Range"
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.timestamp ;;
  }


  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
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
      event,
      location,
      me_client_id,
      me_session_id,
      nights,
      property_id,
      property_name,
      room_type_name,
      total_value,
      timestamp_time,
      price,
      context_campaign_medium,
      context_campaign_source
    ]
  }
}
