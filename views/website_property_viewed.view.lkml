view: website_property_viewed {
  sql_table_name:  `bigquery-analytics-272822.website_kasa_com_transformed.product_viewed`;;


  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
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
    label: "Client id"
    type: string
    sql: ${TABLE}.me_client_id ;;
    hidden: yes
  }

  dimension: me_session_id {
    label: "Session id"
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
  dimension_group: me_hit_timestamp {
    label: "Viewed Time"
    type: time
    timeframes: [year,date,month,week]
    sql: ${TABLE}.me_hit_timestamp ;;
    hidden: yes
  }
  dimension_group: timestamp {
    type: time
    label: "Time Range"
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }
  measure: countViews {
  label: "# Property Viwes"
  type: count_distinct
  sql: ${id};;
  drill_fields: [detail*]
}
  measure: counSession {
    label: "# Sessions"
    type: count_distinct
    sql: ${me_session_id};;
    drill_fields: [detail*]
  }



  set: detail {
    fields: [
      anonymous_id,
      event,
      location,
      me_client_id,
      me_session_id,
      property_id,
      property_name
    ]
  }

}
