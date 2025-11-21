view: braze_sms {
  sql_table_name:`data-warehouse-333815.braze.brazeSMS`;;

  dimension: message_id {
    type: string
    sql: ${TABLE}.messageId ;;
    primary_key: yes
    hidden: no
  }
  dimension: guest_id {
    hidden: yes
    type: string
    sql: ${TABLE}.brazeUserId ;;
  }

  dimension: message_status {
    type: string
    sql: ${TABLE}.messageStatus ;;
  }

  dimension: message_app {
    type: string
    sql: ${TABLE}.messageApp ;;
  }
  dimension: userGroup {
    type: string
    label: "User Group Test/Control"
    sql: ${TABLE}.Usergroup ;;
  }
  dimension:custom_braze_canvas_step_id_str {
    type: string
    label: "Braze Canvas step Raw"
    sql: ${TABLE}.custom_braze_canvas_step_id_str ;;
  }
  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
    hidden: yes
  }

  dimension: auto {
    type: yesno
    sql: ${TABLE}.auto ;;
    hidden: yes
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    hidden: yes
  }

  dimension: direction_type {
    type: string
    sql: ${TABLE}.directionType ;;
    hidden: yes
  }

  dimension_group: message_timestamp {
    type: time
    sql: ${TABLE}.messageTimestamp ;;
    timeframes: [date, week, month, year, time]
    convert_tz: yes
    allow_fill: yes
  }

  dimension: pivot_axis {
    hidden: no
    label_from_parameter: pivot_parm
    label: "Date Group"
    type: string
    # label:
    sql:
    {% if pivot_parm._parameter_value == "'message_timestamp_date'" %}
      ${message_timestamp_date}
    {% elsif pivot_parm._parameter_value == "'message_timestamp_week'" %}
      ${message_timestamp_week}
    {% else %}
       ${message_timestamp_date}
    {% endif %};;
  }

  parameter: pivot_parm {
    label: "Group by"
    hidden: no
    type: string
    allowed_value: {
      label: "Daily"
      value: "message_timestamp_date"
    }
    allowed_value: {
      label: "Weekly"
      value: "message_timestamp_week"
    }
  }

  dimension: message_title {
    type: string
    sql: ${TABLE}.messageTitle ;;
    label: "Message Content"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customerId ;;
    label: "Customer Id"
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversationId ;;
    hidden: yes
  }

  dimension: conversation_title {
    type: string
    sql: ${TABLE}.conversationTitle ;;
    label: "Conversation/Message Title"
  }

  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmationCode ;;
    hidden: yes
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.userName ;;
    hidden: yes
  }

  dimension: error_message {
    group_label: "Error Message Details"
    type: string
    sql: ${TABLE}.errorMessage ;;
  }

  dimension_group: error_at {
    group_label: "Error Message Details"
    type: time
    timeframes: [date, week, month, year, time]
    sql: ${TABLE}.errorAt ;;
  }

  dimension: error_code {
    group_label: "Error Message Details"
    type: string
    sql: ${TABLE}.errorCode ;;
  }

  dimension: error_code_status {
    group_label: "Error Message Details"
    type: string
    sql: ${TABLE}.errorCodeStatus ;;
  }

  dimension: send_from_phone_number {
    group_label: "Error Message Details"
    type: string
    sql: ${TABLE}.sendFromPhoneNumber ;;
    hidden: yes
  }

  dimension: send_to_phone_number {
    group_label: "Error Message Details"
    type: string
    sql: ${TABLE}.sendToPhoneNumber ;;
    hidden: yes
  }
  dimension: conversation_url {
    type: string
    sql: CONCAT("https://kasa.kustomerapp.com/app/customers/",${TABLE}.customerId,"/event/",${TABLE}.conversationId) ;;
    link: {
      label: "Navigate to Kustomer"
      url: "{{ value }}"
    }
  }
  dimension: checkout_reminder_flag {
    type: yesno
    sql: ${TABLE}.checkoutReminderFlag ;;
  }

  measure: count {
    label: "# of SMS sent"
    type: count_distinct
    sql: ${message_id} ;;
    drill_fields: [detail*]
  }
  measure: count_Delivered {
    label: "# of Delivered SMS"
    description: "Count sms with 'sent' status"
    type: count_distinct
    sql: ${message_id} ;;
    filters: [message_status: "sent"]
    drill_fields: [detail*]
  }
  measure: count_error {
    label: "# of Errored SMS "
    type: count_distinct
    sql: ${message_id} ;;
    filters: [message_status: "error"]
    drill_fields: [detail*]
  }
  measure: percent_Delivered {
    label: "% of Delivered SMS"
    sql: ${count_Delivered}/${count} ;;
    type: number
    value_format: "0.0%"
    drill_fields: [detail*]
  }
  measure: percent_error {
    label: "% of Errored SMS"
    sql: ${count_error}/${count} ;;
    type: number
    value_format: "0.0%"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      message_id,
      message_status,
      message_app,
      direction,
      auto,
      channel,
      direction_type,
      message_timestamp_date,
      message_title,
      customer_id,
      conversation_id,
      conversation_title,
      confirmation_code,
      user_name,
      error_message,
      error_at_time,
      error_code,
      error_code_status,
      send_from_phone_number,
      send_to_phone_number
    ]
  }
}
