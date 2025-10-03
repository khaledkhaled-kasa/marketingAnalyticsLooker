view: me_web_events {
  sql_table_name: `data-warehouse-333815`.marketing.kasaWebsiteEvents ;;

  dimension_group: event_datetime {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.event_datetime ;;
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
    hidden: yes
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
  dimension: resevation_id {
    hidden: yes
    type: string
    sql: ${TABLE}.reservationId ;;
  }
  # measure: location_viewed {
  #   type: count_distinct
  #   sql: case when ${TABLE}.location_viewed then session_id end ;;
  # }
  # measure: property_viewed {
  #   type: count_distinct
  #   sql: case when ${TABLE}.property_viewed then session_id end ;;
  #   }
  # measure: checkout_start {
  #   type: count_distinct
  #   sql: case when ${TABLE}.checkout_start then session_id end ;;
  #   }
  # measure: purchase {
  #   type: count_distinct
  #   sql: case when ${TABLE}.purchase then session_id end ;;
  #   }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [event_name]
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
