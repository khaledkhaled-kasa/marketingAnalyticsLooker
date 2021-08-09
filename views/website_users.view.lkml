view: website_users {
  derived_table: {
    sql: SELECT *,
      case when context_user_agent LIKE '%Tablet%' or context_user_agent LIKE  '%iPad%' then "Tablets"
      when context_user_agent LIKE '%Mobile%' and (context_user_agent LIKE '%iPhone%' or context_user_agent LIKE '%Android%') then "Mobile"
      Else "Desktop" End
      as device_category
      FROM `bigquery-analytics-272822.website_kasa_com_transformed.users`
       ;;
  }



  dimension: affiliation {
    type: string
    sql: ${TABLE}.affiliation ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    primary_key: yes
  }

  dimension: cart_id {
    type: string
    sql: ${TABLE}.cart_id ;;
  }

  dimension: context_campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: context_campaign_name {
    type: string
    sql: ${TABLE}.context_campaign_name ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: context_campaign_term {
    type: string
    sql: ${TABLE}.context_campaign_term ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: context_locale {
    type: string
    sql: ${TABLE}.context_locale ;;
  }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: context_page_search {
    type: string
    sql: ${TABLE}.context_page_search ;;
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: coupon {
    type: string
    sql: ${TABLE}.coupon ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: loaded_at {
    type: time
    sql: ${TABLE}.loaded_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: original_timestamp {
    type: time
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension: products {
    type: string
    sql: ${TABLE}.products ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservation_id ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension_group: sent_at {
    type: time
    sql: ${TABLE}.sent_at ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: uuid_ts {
    type: time
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: checkout_id {
    type: string
    sql: ${TABLE}.checkout_id ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: products_braze_brand {
    type: string
    sql: ${TABLE}.products_braze_brand ;;
  }

  dimension_group: products_braze_check_in_date {
    type: time
    sql: ${TABLE}.products_braze_check_in_date ;;
  }

  dimension_group: products_braze_check_out_date {
    type: time
    sql: ${TABLE}.products_braze_check_out_date ;;
  }

  dimension: products_braze_image {
    type: string
    sql: ${TABLE}.products_braze_image ;;
  }

  dimension: products_braze_location {
    type: string
    sql: ${TABLE}.products_braze_location ;;
  }

  dimension: products_braze_nights {
    type: number
    sql: ${TABLE}.products_braze_nights ;;
  }

  dimension: products_braze_price {
    type: number
    sql: ${TABLE}.products_braze_price ;;
  }

  dimension: products_braze_property_id {
    type: string
    sql: ${TABLE}.products_braze_property_id ;;
  }

  dimension: products_braze_property_name {
    type: string
    sql: ${TABLE}.products_braze_property_name ;;
  }

  dimension: products_braze_room_type_id {
    type: string
    sql: ${TABLE}.products_braze_room_type_id ;;
  }

  dimension: products_braze_room_type_name {
    type: string
    sql: ${TABLE}.products_braze_room_type_name ;;
  }

  dimension: products_braze_total_value {
    type: number
    sql: ${TABLE}.products_braze_total_value ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension_group: check_in_date {
    type: time
    sql: ${TABLE}.check_in_date ;;
  }

  dimension_group: check_out_date {
    type: time
    sql: ${TABLE}.check_out_date ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
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
  }

  dimension: property_name {
    type: string
    sql: ${TABLE}.property_name ;;
  }

  dimension: room_type_id {
    type: string
    sql: ${TABLE}.room_type_id ;;
  }

  dimension: room_type_name {
    type: string
    sql: ${TABLE}.room_type_name ;;
  }

  dimension: total_value {
    type: number
    sql: ${TABLE}.total_value ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: countusers {
    label: "Users Volume "
    type: count_distinct
    sql: ${anonymous_id} ;;
  }
  set: detail {
    fields: [
      affiliation,
      anonymous_id,
      cart_id,
      context_campaign_content,
      context_campaign_medium,
      context_campaign_name,
      context_campaign_source,
      context_campaign_term,
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
      currency_code,
      email,
      first_name,
      id,
      last_name,
      loaded_at_time,
      name,
      original_timestamp_time,
      products,
      received_at_time,
      reservation_id,
      revenue,
      sent_at_time,
      timestamp_time,
      uuid_ts_time,
      checkout_id,
      currency,
      order_id,
      products_braze_brand,
      products_braze_check_in_date_time,
      products_braze_check_out_date_time,
      products_braze_image,
      products_braze_location,
      products_braze_nights,
      products_braze_price,
      products_braze_property_id,
      products_braze_property_name,
      products_braze_room_type_id,
      products_braze_room_type_name,
      products_braze_total_value,
      brand,
      check_in_date_time,
      check_out_date_time,
      image,
      location,
      nights,
      price,
      property_id,
      property_name,
      room_type_id,
      room_type_name,
      total_value,
      device_category
    ]
  }
}
