view: website_location_viewed {
sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.location_viewed` ;;




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
    label: "Client Id"
    type: string
    sql: ${TABLE}.me_client_id ;;
    hidden: yes
  }

  dimension_group: me_hit_timestamp {
    label: "Viewed Time"
    type: time
    timeframes: [year,date,month,week,time]
    sql: ${TABLE}.me_hit_timestamp ;;
    hidden:yes
  }
  dimension_group: timestamp {
    type: time
    label: "Time Range"
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.timestamp ;;
  }


  dimension: me_session_id {
    label: "Session Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
  }
measure: count_Views {
  label: "# Location Views"
  type: count_distinct
  sql: ${me_session_id} ;;
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
      me_hit_timestamp_time,
      me_session_id
    ]
  }
}
