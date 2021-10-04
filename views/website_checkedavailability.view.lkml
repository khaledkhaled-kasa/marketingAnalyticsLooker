view: website_checkedavailability {
sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.availability_checked` ;;




  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension_group: check_in_date {
    type: time
    timeframes: [week,year,month,date,time]
    sql: ${TABLE}.check_in_date ;;
  }

  dimension_group: check_out_date {
    type: time
    timeframes: [week,year,month,date,time]
    sql: ${TABLE}.check_out_date ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
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
    label: "Client Id"
    type: string
    sql: ${TABLE}.me_client_id ;;
    hidden: yes
  }

  dimension: me_session_id {
    label: "Session Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
    hidden: yes
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

dimension_group: timestamp {
  type: time
  label: "Time Range"
  timeframes: [year,month,date,time,week]
  sql: ${TABLE}.timestamp ;;
}
  measure: count {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      anonymous_id,
      check_in_date_time,
      check_out_date_time,
      context_campaign_source,
      context_campaign_medium,
      event,
      id,
      location,
      me_client_id,
      me_session_id,
      property_id,
      property_name,
      timestamp_time
    ]
  }
}
