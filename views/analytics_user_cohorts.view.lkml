view: anal_user_cohorts {
  view_label: "User Cohorts"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_user_cohorts`
    ;;

  dimension: cohort_definition {
    type: string
    sql: ${TABLE}.cohort_definition ;;
  }

  # dimension_group: cohort_event {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     month_num,
  #     quarter,
  #     quarter_of_year,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.cohort_event_date ;;
  # }

  # dimension_group: cohort_event_datetime {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.cohort_event_datetime ;;
  # }

  # dimension: cohort_event_month {
  #   type: string
  #   sql: ${TABLE}.cohort_event_month ;;
  # }

  # dimension: cohort_event_month_number {
  #   type: number
  #   sql: ${TABLE}.cohort_event_month_number ;;
  # }

  dimension: cohort_event_monthyear {
    type: string
    sql: ${TABLE}.cohort_event_monthyear ;;
  }

  # dimension: cohort_event_quarter_number {
  #   type: number
  #   sql: ${TABLE}.cohort_event_quarter_number ;;
  # }

  dimension_group: cohort_event_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      quarter_of_year,
      year
    ]
    sql:TIMESTAMP(DATETIME(${TABLE}.cohort_event_timestamp,"America/Los_Angeles")) ;;
    label: "Show Users Acquired At"
  }

  # dimension: cohort_event_week_number {
  #   type: number
  #   sql: ${TABLE}.cohort_event_week_number ;;
  # }

  # dimension: cohort_event_year {
  #   type: number
  #   sql: ${TABLE}.cohort_event_year ;;
  # }

  dimension: cohort_event_yearmonth_number {
    type: number
    sql: ${TABLE}.cohort_event_yearmonth_number ;;
  }

  dimension: me_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.me_id ;;
  }

  parameter: cohort_date_granularity  {
    label: "Define Cohort Intervals"
    type: unquoted
    allowed_value: { value: "Daily" }
    allowed_value: { value: "Weekly" }
    allowed_value: { value: "Monthly" }
    allowed_value: { value: "Quarterly" }
    allowed_value: { value: "Yearly" }
  }

  # dimension: dynamic_cohort_date {
  #   label_from_parameter: cohort_date_granularity
  #   sql:
  #   CASE
  #     WHEN {% parameter cohort_date_granularity %} = 'Daily' THEN CAST(${cohort_event_timestamp_date} AS STRING)
  #     WHEN {% parameter cohort_date_granularity %} = 'Weekly' THEN CAST(${cohort_event_timestamp_week} AS STRING)
  #     WHEN {% parameter cohort_date_granularity %} = 'Monthly' THEN CAST(${cohort_event_timestamp_month} AS STRING)
  #     WHEN {% parameter cohort_date_granularity %} = 'Quarterly' THEN CAST(${cohort_event_timestamp_quarter} AS STRING)
  #     WHEN {% parameter cohort_date_granularity %} = 'Yearly' THEN CAST(${cohort_event_timestamp_year} AS STRING)
  #     END ;;
  # }

  dimension: dynamic_cohort_date {
    label_from_parameter: cohort_date_granularity
    sql:
      {% if cohort_date_granularity._parameter_value == "Daily" %} CAST(${cohort_event_timestamp_date} AS STRING)
      {% elsif cohort_date_granularity._parameter_value == "Weekly" %} CAST(${cohort_event_timestamp_week} AS STRING)
      {% elsif cohort_date_granularity._parameter_value == "Monthly" %} CAST(${cohort_event_timestamp_month} AS STRING)
      {% elsif cohort_date_granularity._parameter_value == "Quarterly" %} CAST(${cohort_event_timestamp_quarter} AS STRING)
      {% elsif cohort_date_granularity._parameter_value == "Yearly" %} CAST(${cohort_event_timestamp_year} AS STRING)
      {% endif %} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
