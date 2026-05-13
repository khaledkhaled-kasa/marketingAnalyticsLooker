view: me_web_sessions {
  sql_table_name: `data-warehouse-333815`.marketing.kasaWebsiteSessions ;;

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }
  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }
  dimension: is_with_add_payment_info {
    type: yesno
    sql: ${TABLE}.is_with_add_payment_info ;;
  }
  dimension: is_with_add_shipping_info {
    type: yesno
    sql: ${TABLE}.is_with_add_shipping_info ;;
  }
  dimension: is_with_add_to_cart {
    type: yesno
    sql: ${TABLE}.is_with_add_to_cart ;;
  }
  dimension: is_with_begin_checkout {
    type: yesno
    sql: ${TABLE}.is_with_begin_checkout ;;
  }
  dimension: is_with_purchase {
    type: yesno
    sql: ${TABLE}.is_with_purchase ;;
  }
  dimension: is_with_view_item {
    type: yesno
    sql: ${TABLE}.is_with_view_item ;;
  }
  dimension: is_with_view_item_list {
    type: yesno
    sql: ${TABLE}.is_with_view_item_list ;;
  }
  dimension: landing_page_url {
    type: string
    sql: ${TABLE}.landing_page_url ;;
  }
  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
  }
  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }
  dimension_group: session_datetime {
    label: "Session"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    datatype: datetime
    sql: ${TABLE}.session_datetime ;;
  }
  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }
  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }
  dimension: session_stream_key {
    type: string
    sql: ${TABLE}.session_stream_key ;;
  }
  dimension: stream_id {
    type: string
    sql: ${TABLE}.stream_id ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: session_identity_class {
    label: "Session Identity Class"
    description: "Identity classification for the session, computed upstream. Anonymous = browser cookie only, unreachable. Known (pre-booking) = identified user with no completed booking yet. Known (customer) = session after the user's first confirmed reservation."
    type: string
    sql: ${TABLE}.session_identity_class ;;
  }
  dimension: user_session_ranking {
    type: number
    sql: ${TABLE}.user_session_ranking ;;
  }
  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }
  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }
  dimension: utm_key {
    type: number
    sql: ${TABLE}.utm_key ;;
  }
  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }
  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }
  dimension: utm_parent_category {
    group_label: "UTM Dictionary"
    label: "UTM Parent Category"
    type: string
    sql: ${TABLE}.parent ;;
  }
  dimension: utm_child_category {
    group_label: "UTM Dictionary"
    label: "UTM Child Category"
    type: string
    sql: ${TABLE}.child ;;
  }
  dimension: utm_grandchild_category {
    group_label: "UTM Dictionary"
    label: "UTM Grandchild Category"
    type: string
    sql: ${TABLE}.grandchild ;;
  }
  dimension: utm_dictionary {
    group_label: "UTM Dictionary"
    label: "UTM Dictionary"
    type: string
    sql: ${TABLE}.utmDictionary ;;
  }

  # measure: count {
  #   type: count
  # }
  measure: session_count {
    label: "# of Unique Sessions"
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
  }
  measure: sessions_with_location_view {
    label: "# of Sessions (Location Viewed)"
    description: "Sessions where the user viewed a location page (kasa.com/locations/<city>). Funnel stage 1."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [is_with_view_item_list: "Yes"]
  }
  measure: sessions_with_property_view {
    label: "# of Sessions (Property Viewed)"
    description: "Sessions where the user viewed a property page (kasa.com/properties/<property>). Funnel stage 2."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [is_with_view_item: "Yes"]
  }
  measure: sessions_with_checkout_start {
    label: "# of Sessions (Checkout Started)"
    description: "Sessions where the user started checkout. Funnel stage 3."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [is_with_begin_checkout: "Yes"]
  }
  measure: sessions_with_purchase {
    label: "# of Sessions (Purchase)"
    description: "Sessions that completed a purchase. Funnel stage 4 — terminal."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [is_with_purchase: "Yes"]
  }
  measure: rate_location_to_property {
    label: "% Location → Property"
    description: "Rate of location-page viewers who went on to view a specific property page."
    type: number
    sql: ${sessions_with_property_view} / nullif(${sessions_with_location_view}, 0) ;;
    value_format_name: percent_2
  }
  measure: rate_property_to_checkout {
    label: "% Property → Checkout"
    description: "Rate of property-page viewers who started checkout."
    type: number
    sql: ${sessions_with_checkout_start} / nullif(${sessions_with_property_view}, 0) ;;
    value_format_name: percent_2
  }
  measure: rate_checkout_to_purchase {
    label: "% Checkout → Purchase"
    description: "Rate of checkout-starters who completed a purchase."
    type: number
    sql: ${sessions_with_purchase} / nullif(${sessions_with_checkout_start}, 0) ;;
    value_format_name: percent_2
  }
  measure: rate_session_to_purchase {
    label: "% Session → Purchase"
    description: "Overall session-to-purchase conversion rate."
    type: number
    sql: ${sessions_with_purchase} / nullif(${session_count}, 0) ;;
    value_format_name: percent_2
  }
}
