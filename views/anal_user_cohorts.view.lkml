view: anal_user_cohorts {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_user_cohorts`
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
    sql: ${TABLE}.cohort_event_timestamp ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
