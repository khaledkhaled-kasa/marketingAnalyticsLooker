view: me_web_events {
  sql_table_name: `data-warehouse-333815`.marketing.kasaWebsiteEvents ;;

  dimension_group: event_datetime {
    hidden: no
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: datetime(${TABLE}.event_datetime) ;;
  }
  # dimension: record_id {
  #   hidden: yes
  #   primary_key: yes
  #   type: string
  #   sql: ${TABLE}.recordId ;;
  # }
  dimension: event_id {
    hidden: yes
    type: string
    sql: ${TABLE}.event_id ;;
  }
  dimension: event_name {
    hidden: no
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: event_params {
    hidden: yes
    sql: ${TABLE}.event_params ;;
  }
  dimension: me_id {
    hidden: yes
    type: string
    sql: ${TABLE}.me_id ;;
  }
  dimension: session_id {
    hidden: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }
  dimension: session_id_str {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id_str ;;
  }
  dimension: stream_id {
    hidden: yes
    type: string
    sql: ${TABLE}.stream_id ;;
  }
  dimension: user_pseudo_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: prop_code {
    hidden: yes
    type: string
    sql: ${TABLE}.propCode ;;
  }
  dimension: reservation_id {
    hidden: yes
    type: string
    sql: ${TABLE}.reservationId ;;
  }
  dimension: location_viewed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.location_viewed ;;
  }
  dimension: property_viewed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.property_viewed ;;
  }
  dimension: checkout_start {
    hidden: yes
    type: yesno
    sql: ${TABLE}.checkout_start ;;
  }
  dimension: purchase {
    hidden: yes
    type: yesno
    sql: ${TABLE}.purchase ;;
  }
  dimension: coupon_code {
    type: string
    sql: ${TABLE}.couponCode ;;
  }
  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: [event_name]
  # }
  measure: event_count {
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
  }
  measure: location_viewed_count {
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [location_viewed: "yes"]
  }
  measure: location_viewed_by_distinct_user_count {
    type: count_distinct
    hidden: yes
    sql_distinct_key: ${user_pseudo_id} ;;
    sql: ${user_pseudo_id} ;;
    filters: [location_viewed: "yes"]
  }
  measure: property_viewed_count {
    hidden: yes
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [property_viewed: "yes"]
  }
  measure: purchase_count {
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [purchase: "yes"]
  }
}

view: me_web_events__event_params {

  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: me_web_events__event_params {
    type: string
    hidden: yes
    sql: me_web_events__event_params ;;
  }
  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }
  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }
  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }
  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

view: me_web_session_event_flags {
  sql_table_name: `data-warehouse-333815`.marketing.dimSessionEventFlags ;;

  dimension: session_id {
    hidden: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }
  dimension: location_viewed {
    type: yesno
    sql: ${TABLE}.location_viewed ;;
  }
  dimension: property_viewed {
    type: yesno
    sql: ${TABLE}.property_viewed ;;
  }
  dimension: checkout_start {
    type: yesno
    sql: ${TABLE}.checkout_start ;;
  }
  dimension: purchase {
    type: yesno
    sql: ${TABLE}.purchase ;;
  }
}
