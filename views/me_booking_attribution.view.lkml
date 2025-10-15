view: me_booking_attribution {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.me_booking_attribution` ;;

  dimension: attributed_booking_key {
    hidden: yes
    type: string
    sql: ${TABLE}.attributed_booking_key ;;
  }
  dimension: attributed_weight {
    hidden: yes
    type: number
    sql: ${TABLE}.attributed_weight ;;
  }
  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }
  dimension: booking_channel {
    type: string
    sql: ${TABLE}.booking_channel ;;
  }
  dimension: booking_conversion_path {
    hidden: yes
    sql: ${TABLE}.booking_conversion_path ;;
  }
  dimension_group: booking_datetime {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.booking_datetime ;;
  }
  dimension: booking_id {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_id ;;
  }
  dimension: booking_utm_campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_utm_campaign ;;
  }
  dimension: booking_utm_content {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_utm_content ;;
  }
  dimension: booking_utm_medium {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_utm_medium ;;
  }
  dimension: booking_utm_source {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_utm_source ;;
  }
  dimension: booking_utm_term {
    hidden: yes
    type: string
    sql: ${TABLE}.booking_utm_term ;;
  }
  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmation_code ;;
  }
  dimension: guest_id {
    hidden: yes
    type: string
    sql: ${TABLE}.guest_id ;;
  }
  dimension: lookback_window {
    type: string
    sql: cast(${TABLE}.lookback_window as string) ;;
  }
  dimension: me_id {
    hidden: yes
    type: number
    sql: ${TABLE}.me_id ;;
  }
  dimension: utm_key {
    hidden: yes
    type: number
    sql: ${TABLE}.utm_key ;;
  }
  # measure: count {
  #   type: count
  # }
}

view: me_booking_attribution__booking_conversion_path {

  dimension: me_booking_attribution__booking_conversion_path {
    type: string
    hidden: yes
    sql: me_booking_attribution__booking_conversion_path ;;
  }
  dimension: session_id {
    hidden: yes
    type: number
    sql: session_id ;;
  }
  dimension_group: session_timestamp {
    hidden: yes
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: session_timestamp ;;
  }
}

view: kasa_website_guest_mapping {
  sql_table_name: `data-warehouse-333815`.marketing.kasaWebsiteGuestMapping ;;

  dimension: me_id {
    hidden: yes
    type: string
    sql: ${TABLE}.me_id ;;
  }
  dimension: guest_id {
    label: "GID"
    hidden: no
    type: string
    sql: ${TABLE}.guest_id ;;
  }
  dimension: repeat_guest_flag {
    label: "Repeat Guest Flag (Kasa Website)"
    type: yesno
    sql: ${TABLE}.repeatGuestFlag ;;
  }
  dimension: repeat_guest_type {
    hidden: no
    label: "Repeat Guest Type (Kasa Website)"
    description: "Define how many times a guest has stayed.
      If Reservation Count = 1, classify as **First Time Guest**.
      If Reservation Count = 2, classify as **Repeat Guest**.
      If Reservation Count is between 3 and 5, classify as **Frequent Guest**.
      If Reservation Count > 5, classify as **Loyal Guest**.
      Keep in mind the guest has to have stayed at a Kasa, checked-in.
    "
    type: string
    sql: ${TABLE}.repeatGuestType ;;
  }
  dimension: property_stay_type {
    hidden: no
    label: "Property Stay Type (Kasa Website)"
    description: "Determine how many distinct properties a guest has stayed at.
      If Property Count = 1, classify as **Single Property Guest**.
      If Property Count = 2, classify as **Multi-Property Guest**.
      If Property Count > 2, classify as **Cross-Portfolio Guest**.
    "
    type: string
    sql: ${TABLE}.propertyStayType ;;
  }

}
