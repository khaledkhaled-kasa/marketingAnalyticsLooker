view: website_checkout_finished_book_button {
  sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.checkout_finished`;;




  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: checkout_id {
    type: string
    sql: ${TABLE}.checkout_id ;;
    hidden: yes
  }

  dimension_group: check_in_date {
    type: time
    timeframes: [year,month,time,week,date]
    sql: ${TABLE}.check_in_date ;;
  }

  dimension_group: check_out_date {
    type: time
    timeframes: [year,month,time,week,date]
    sql: ${TABLE}.check_out_date ;;
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

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: me_client_id {
    type: string
    sql: ${TABLE}.me_client_id ;;
    label: "Client Id"
    hidden: yes
  }

  dimension: me_session_id {
    label: "Seesion Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
  }

  dimension: nights {
    type: number
    sql: ${TABLE}.nights ;;
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

  dimension: room_type_id {
    type: string
    sql: ${TABLE}.room_type_id ;;
    hidden: yes
  }

  dimension: room_type_name {
    type: string
    sql: ${TABLE}.room_type_name ;;
    label: "Room Type"
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
    timeframes: [year,month,week,date,time]
    label: "Range Time"
  }
measure: count_Book_buttin_clicked {
  type: count_distinct
  label: "# Clicked Book Button"
  sql: ${me_session_id} ;;
  drill_fields: [detail*]
}


  measure: num_transactions {
    label: "#Transactions"
    type: count_distinct
    sql: ${checkout_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      anonymous_id,
      checkout_id,
      check_in_date_time,
      check_out_date_time,
      context_campaign_medium,
      context_campaign_source,
      event,
      id,
      location,
      me_client_id,
      me_session_id,
      nights,
      price,
      property_id,
      property_name,
      room_type_id,
      room_type_name,
      timestamp_time
    ]
  }
}
