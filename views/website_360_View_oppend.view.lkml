view: website_360_view_opened
{
  sql_table_name: `bigquery-analytics-272822.website_kasa_com.360_view_opened` ;;

    dimension: anonymous_id {
      type: string
      sql: ${TABLE}.anonymous_id ;;
      hidden: yes
    }

    dimension: context_page_title {
      type: string
      label: "Property Name"
      sql:split(${TABLE}.context_page_title,"|") [OFFSET(0)];;
    }

    dimension: event {
      type: string
      sql: ${TABLE}.event ;;
    }


    dimension: evnet_id {
      type: string
      sql: ${TABLE}.id ;;
      primary_key: yes
    }

    dimension: property_id {
      type: string
      sql: ${TABLE}.property_id ;;
      hidden: yes
    }

    dimension: me_session_id {
      type: string
      sql: ${TABLE}.me_session_id ;;
      hidden: yes
    }

    dimension: me_client_id {
      type: string
      sql: ${TABLE}.me_client_id ;;
      hidden: yes
    }

    dimension_group: timestamp {
      type: time
      sql: ${TABLE}.timestamp ;;
      hidden: yes
    }

    dimension: user_id {
      type: string
      sql: ${TABLE}.user_id ;;
      hidden: yes
    }

measure: count {
  type: count_distinct
  sql: ${evnet_id};;
  drill_fields: [detail*]
}
set: detail {
  fields: [
    anonymous_id,
    context_page_title,
    event,
    evnet_id,
    property_id,
    me_session_id,
    me_client_id,
    timestamp_time,
    user_id
  ]
}
}
