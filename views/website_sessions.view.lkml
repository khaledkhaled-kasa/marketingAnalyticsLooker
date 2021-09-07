view: website_sessions {
  derived_table: {
    sql: SELECT
      anonymous_id,
      event_key.event,
      event_key.id,
      session_id,
      session_timestamp
      FROM `bigquery-analytics-272822.website_kasa_com_transformed.sessions_struct`
      LEFT JOIN UNNEST(event_key) as event_key
       ;;

  }


  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    primary_key: yes
  }


  dimension_group: session_timestamp {
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
    sql:${TABLE}.session_timestamp ;;
  }



  measure: numberOfsessionWlocation  {
   label: "# Sessions w/ Location Viewed"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event: "location_viewed"]
    drill_fields: [detail*]
  }
  measure: numberOfsessionWclickBookButton  {
    label: "# Sessions w/ Click Book Button"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event: "checkout_finished"]
    drill_fields: [detail*]
  }
  measure: numberOfsessionWproperty   {
    label: "# Sessions w/ Property Viewed"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event: "property_viewed,product_viewed"]
    drill_fields: [session_id]
  }
  measure: numberOfsessionWcheckout  {
    label: "# Sessions w/ Checkout"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event: "checkout_step_completed,checkout"]
    drill_fields: [detail*]
  }
  measure: numberOfsessionWSearches  {
    label: "# Searches"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event: "search"]
    drill_fields: [detail*]
  }
  measure: numberOfsessionWTransactions  {
    label: "# Sessions w/ Transactions"
    type: count_distinct
    sql: ${id} ;;
    filters: [event: "purchase,order_completed"]
    drill_fields: [detail*]
  }
  measure: numberOfsessions  {
    label: "# Sessions"
    type: count_distinct
    sql: ${session_id} ;;
    value_format:"[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    drill_fields: [detail*]
  }


  measure: numberOflocationViewed  {
    label: "# Location Page Views"
    type: count_distinct
    sql: ${id} ;;
    filters: [event: "location_viewed"]
    drill_fields: [detail*]
  }

  measure: numberOfpropertyViewed   {
    label: "# Property Page Views"
    type: count_distinct
    sql: ${id} ;;
    filters: [event: "property_viewed,product_viewed"]
    drill_fields: [detail*]
  }


  measure: checkout_rate {
    type: number
    sql: if(${numberOfsessions} = 0, 0, ${numberOfsessionWcheckout}/${numberOfsessions});;
    value_format_name:  percent_1
    description: "Ratio of sessions w/ Complete Checkout Event to all session"
    drill_fields: [numberOfsessions,numberOfsessionWcheckout]
  }
  measure: location_Viewed_rate {
    type: number
    sql: if(${numberOfsessions} = 0, 0, ${numberOfsessionWlocation}/${numberOfsessions});;
    value_format_name:  percent_1
    description: "Ratio of sessions w/ location Viewed Event to all session"
    drill_fields: [numberOfsessions,numberOfsessionWlocation]
  }
  measure: property_Viewed_rate {
    type: number
    sql: if(${numberOfsessions} = 0, 0, ${numberOfsessionWproperty}/${numberOfsessions});;
    value_format_name:  percent_1
    description: "Ratio of sessions w/ Property Viewed Event to all session"
    drill_fields: [numberOfsessions,numberOfsessionWproperty]
  }
  measure: transaction_conversion_rate {
    value_format_name: percent_1
    type: number
    description: "Percentage of website transactions divided by sessions"
    sql: if(${numberOfsessions} = 0, 0, ${numberOfsessionWTransactions}/${numberOfsessions});;
    drill_fields: [numberOfsessions,numberOfsessionWTransactions]
    }


  measure:property_views_per_locations_views{
    value_format_name: percent_2
    type: number
    description: "Ratio of sessions w/ Property Viewed Event to location Viewed sessions"
    sql: if(${numberOfsessions} = 0, 0, ${numberOfsessionWproperty}/${numberOfsessionWTransactions});;
    hidden: yes
  }
  measure:checkout_per_property_views{
    value_format_name: percent_1
    type: number
    description: "Ratio of sessions w/Checkout Event to Property Viewed sessions"
    sql: if(${numberOfsessions} = 0, Null, ${numberOfsessionWcheckout}/${numberOfsessionWproperty});;
  }
  measure:Transactions_per_checkout{
    value_format_name: percent_1
    label: "Transaction Per Checkouts"
    type: number
    description: "Ratio of sessions w/Transaction Event to Checkout Event "
    sql: if(${numberOfsessions} = 0, Null, ${numberOfsessionWTransactions}/${numberOfsessionWcheckout});;
  }



  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }
  measure: countusers {
    label: "Users Volume "
    type: count_distinct
    value_format:"[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: ${anonymous_id} ;;
  }

  set: detail {
    fields: [anonymous_id, event, id, session_id]
  }
}
