view: website_searches{
sql_table_name: `bigquery-analytics-272822.website_kasa_com_transformed.search` ;;



  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
    primary_key: yes
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
  dimension: adults {
    label: "# Adults"
    type: number
    sql: ${TABLE}.adults ;;
  }

  dimension: children {
    label: "# Children"
    type: number
    sql: ${TABLE}.children ;;
  }
  dimension: total_guests {
    type: number
    sql: ${TABLE}.total_guests ;;
  }
  dimension: infants {
    label: "# Infants "
    type: number
    sql: ${TABLE}.infants ;;
  }

  dimension: persona {
    type: string
    sql: case when ${adults} =2 and ( ${children}=0 and ${infants}=0) then "Couple"
     when ${adults} =1 and ( ${children}=0 and ${infants}=0) then "Single"
     when  ${adults} =2  and ( ${children} >= 1 or ${infants} >= 1) then "Family"
     when ${total_guests} >= 3 then "Group" end ;;
  }

  dimension: business {
    label: "Traveling for business"
    type: yesno
    sql: ${TABLE}.business ;;
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
    type: time
    timeframes: [month,year,week,date,time]
    sql: ${TABLE}.me_hit_timestamp ;;
    hidden: yes
  }

  dimension: me_session_id {
    label: "Session Id"
    type: string
    sql: ${TABLE}.me_session_id ;;
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    label: "Time Range"
    timeframes: [year,month,date,time,week]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    label: "# Searches"
    type: count_distinct
    sql: ${id};;
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
      me_session_id,
      adults,
      children,
      infants,
      total_guests
    ]
  }
}
