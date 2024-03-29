view: website_orders{

  derived_table: {
    sql: Select o.*,re.confirmationcode,re.status, re.guest_type, re.guest, re.extended_booking
      FROM `bigquery-analytics-272822.website_kasa_com_transformed.order_completed` o
      left join `bigquery-analytics-272822.dbt.reservations_v3` re
      on
       o.reservation_id = re._id
       ;;
    persist_for: "1 hours"
  }





  dimension: affiliation {
    type: string
    sql: ${TABLE}.affiliation ;;
    hidden: yes
  }

   dimension: extended_booking {
    type: yesno
    sql: ${TABLE}.extended_booking=1 ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: checkout_id {
    type: string
    sql: ${TABLE}.checkout_id ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: yes
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: context_locale {
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: yes
  }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: yes
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: yes
  }

  dimension: context_page_search {
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: yes
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: yes
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: yes
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
    hidden: yes
  }

  dimension: coupon {
    type: string
    sql: ${TABLE}.coupon ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: loaded_at {
    type: time
    sql: ${TABLE}.loaded_at ;;
    hidden: yes
  }

  dimension: me_client_id {
    label: "Clint Id"
    type: string
    sql: ${TABLE}.me_client_id ;;
    hidden: yes
  }

  dimension_group: me_hit_timestamp {
    type: time
    sql: ${TABLE}.me_hit_timestamp ;;
    hidden: yes
  }

  dimension: me_session_id {
    label: "Session Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
  }

  dimension_group: original_timestamp {
    type: time
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension_group: sent_at {
    type: time
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:${TABLE}.timestamp ;;
    label: "Booking Timestamp"
  }

  dimension_group: uuid_ts {
    type: time
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    hidden: yes
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
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

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    hidden: yes
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
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

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: nights {
    type: number
    sql: ${TABLE}.nights ;;
  }

  dimension: total_value {
    type: number
    label: "Transaction Value"
    sql: ${TABLE}.total_value ;;
    hidden: no
  }
  measure: num_transactions {
    label: "#Bookings"
    type: count_distinct
    sql:  ${checkout_id} ;;
    drill_fields: [detail*]
  }

  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }
  measure: total_transaction_event_value {
    type: sum_distinct
    value_format_name: usd
    sql: ${total_value} ;;
    label: "Total Booking Value"
  }
  dimension: confirmationcode {
    type: string
    sql: ${TABLE}.confirmationcode ;;
  }

  dimension: status {
    label: "Reservation Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.guest_type ;;
  }

  dimension: guest {
    type: string
    sql: ${TABLE}.guest ;;
    hidden: no
  }
  # measure: countusers {
  #   label: "Users Volume "
  #   type: count_distinct
  #   sql: ${anonymous_id} ;;
  # }
  measure: countUniqueUsers {
    label: "Unique Users "
    type: count_distinct
    sql: ${guest} ;;
  }

  set: detail {
    fields: [
      affiliation,
      anonymous_id,
      checkout_id,
      context_ip,
      context_library_name,
      context_library_version,
      context_locale,
      context_page_path,
      context_page_referrer,
      context_page_search,
      context_page_title,
      context_page_url,
      context_user_agent,
      coupon,
      currency,
      event,
      event_text,
      id,
      loaded_at_time,
      me_client_id,
      me_hit_timestamp_time,
      me_session_id,
      original_timestamp_time,
      received_at_time,
      sent_at_time,
      timestamp_time,
      uuid_ts_time,
      reservation_id,
      brand,
      category,
      check_in_date_time,
      check_out_date_time,
      image_url,
      location,
      property_id,
      property_name,
      room_type_id,
      room_type_name,
      price,
      nights,
      total_value,
      confirmationcode,
      status,guest
    ]
  }
}
