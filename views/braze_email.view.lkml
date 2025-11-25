view: braze_email {
  sql_table_name:`data-warehouse-333815.braze.brazeEmails`;;

  dimension: braze_event_id {
    type: string
    sql: ${TABLE}.brazeEventId ;;
    primary_key: yes
  }

  dimension: guest_id {
    type: string
    hidden: yes
    sql: ${TABLE}.brazeUserId ;;
  }

  dimension_group: braze_event_timestamp {
    type: time
    timeframes: [date, week, month, day_of_week, year, quarter]
    sql: ${TABLE}.brazeEventTimestamp ;;
  }

  dimension: pivot_axis {
    hidden: no
    label_from_parameter: pivot_parm
    label: "Date Group"
    type: string
    # label:
    sql:
    {% if pivot_parm._parameter_value == "'braze_event_timestamp_date'" %}
      ${braze_event_timestamp_date}
    {% elsif pivot_parm._parameter_value == "'braze_event_timestamp_week'" %}
      ${braze_event_timestamp_week}
    {% else %}
       ${braze_event_timestamp_date}
    {% endif %};;
  }

  parameter: pivot_parm {
    label: "Group by"
    hidden: no
    type: string
    allowed_value: {
      label: "Daily"
      value: "braze_event_timestamp_date"
    }
    allowed_value: {
      label: "Weekly"
      value: "braze_event_timestamp_week"
    }
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.eventName ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaignName ;;
  }

  dimension: days_to_click {
    type: number
    sql: ${TABLE}.daysToClick ;;
  }

  dimension: canvas_name {
    type: string
    sql: ${TABLE}.canvasName ;;
  }

  dimension: canvas_variation_name {
    type: string
    sql: ${TABLE}.canvasVariationName ;;
  }

  dimension: canvas_step_name {
    type: string
    sql: ${TABLE}.canvasStepName ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.userEmail ;;
  }

  dimension: link_url {
    type: string
    sql: ${TABLE}.linkURL ;;
  }
  dimension: confirmation_code {
    type: string
    sql:CASE WHEN   ${TABLE}.linkURL  like '%/b/%' THEN
        split(regexp_extract( ${TABLE}.linkURL , '/b/([^/;]+)'),'?')[OFFSET(0)]
      WHEN  ${TABLE}.linkURL like '%typeform%'  THEN
       split(regexp_extract( ${TABLE}.linkURL , '/to/([^/;]+)'),'?')[OFFSET(0)]
      WHEN  ${TABLE}.linkURL like '%c=%'  THEN
       split(regexp_extract( ${TABLE}.linkURL , 'c=([^/;]+)'),'?')[OFFSET(0)]
    WHEN  ${TABLE}.linkURL like '/p/%'  THEN
       split(regexp_extract( ${TABLE}.linkURL , 'c=([^/;]+)'),'?')[OFFSET(0)]
    end ;;
  }
  dimension: card_id {
    type: string
    sql: ${TABLE}.cardId ;;
    hidden: yes
  }

  dimension: abort_log {
    type: string
    sql: ${TABLE}.abortLog ;;
  }

  dimension: abort_type {
    type: string
    sql: ${TABLE}.abortType ;;
  }

  measure: count {
    label: "# of events"
    type: count_distinct
    sql: ${braze_event_id} ;;
    drill_fields: [detail*]
  }
  measure: total_entries
  {
    label: "# of Entries"
    type: count_distinct
    sql: ${braze_event_id} ;;
    description: "Count distinct event with status canvas_entered"
    filters: [event_name: "canvas_entered"]
    drill_fields: [detail*]
  }
  measure: total_conversions
  {
    label: "# of Canvas Conversions"
    description: "Count distinct event with status canvas_converted"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "canvas_converted"]
    drill_fields: [detail*]
  }
  measure: total_conversions_Cmapings
  {
    label: "# of Campaign Conversions"
    description: "Count distinct event with status campaign_converted"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "campaign_converted"]
    drill_fields: [detail*]
  }

  measure: conversions_rate
  {
    label: "Conversions Rate"
    type: number
    description: "# of Conversions/# of Entries"
    sql: ${total_conversions}/${total_entries} ;;
    value_format: "00.0%"
    drill_fields: [detail*]
  }
  measure: total_email_soft_bounced
  {
    label: "# of Email Soft Bounced"
    description: "Count distinct event with status email_soft_bounced"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_soft_bounced"]
    drill_fields: [detail*]
  }
  measure: total_email_bounced
  {
    label: "# of Email Bounced"
    description: "Count distinct event with status email_bounced"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_bounced"]
    drill_fields: [detail*]
  }
  measure: total_email_sent
  {
    label: "# of Email Sent"
    description: "Count distinct event with status email_sent"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_sent"]
    drill_fields: [detail*]
  }
  measure: total_email_delivered
  {
    label: "# of Email Delivered"
    description: "Count distinct event with status email_delivered"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_delivered"]
    drill_fields: [detail*]
  }
  measure: total_email_opened
  {
    label: "# of Email Opened"
    description: "Count distinct event with status email_opened"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_opened"]
    drill_fields: [detail*]
  }
  measure: total_email_link_clicked
  {
    label: "# of Email Link Clicked"
    description: "Count distinct event with status email_link_clicked"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "email_link_clicked"]
    drill_fields: [detail*]
  }
  measure: total_content_card_viewed
  {
    label: "# of Content Card Viewed"
    view_label: "Cotent Cards"
    description: "Count distinct event with status content_card_viewed"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "content_card_viewed"]
    drill_fields: [detail*]
  }
  measure: total_content_card_dismissed
  {
    label: "# of Content Card dismissed"
    view_label: "Cotent Cards"
    description: "Count distinct event with status content_card_dismissed"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "content_card_dismissed"]
    drill_fields: [detail*]
  }
  measure: total_content_card_sent
  {
    label: "# of Content Card Sent"
    view_label: "Cotent Cards"
    description: "Count distinct event with status content_card_sent"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "content_card_sent"]
    drill_fields: [detail*]
  }

  measure: total_in_app_message_clicked
  {
    label: "# of in app message clicked"
    view_label: "In App messages"
    description: "Count distinct event with status in_app_message_clicked"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "in_app_message_clicked"]
    drill_fields: [detail*]
  }
  measure: total_in_app_message_viewed
  {
    label: "# of in app message viewed"
    view_label: "In App messages"
    description: "Count distinct event with status in_app_message_viewed"
    type: count_distinct
    sql: ${braze_event_id} ;;
    filters: [event_name: "in_app_message_viewed"]
    drill_fields: [detail*]
  }
  measure: num_of_Unique_Clicks
  {
    label: "# of Unique Clicks"
    description: " number of unique external IDs that clicked at least once within a given email"
    type: count_distinct
    sql: ${guest_id} ;;
    filters: [event_name: "email_link_clicked"]
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      braze_event_id,
      guest_id,
      braze_event_timestamp_date,
      event_name,
      campaign_name,
      canvas_name,
      canvas_variation_name,
      canvas_step_name,
      user_email,
      link_url,
      card_id
    ]
  }
}
