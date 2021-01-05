view: anal_order_cohorts {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_order_cohorts`
    ;;

  dimension: cohort_definition {
    type: string
    sql: ${TABLE}.cohort_definition ;;
  }

  dimension: days_since_cohort_event {
    type: number
    sql: ${TABLE}.days_since_cohort_event ;;
  }

  dimension: hours_since_cohort_event {
    type: number
    sql: ${TABLE}.hours_since_cohort_event ;;
  }

  dimension: months_since_cohort_event {
    type: number
    sql: ${TABLE}.months_since_cohort_event ;;
  }

  dimension: order_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: weeks_since_cohort_event {
    type: number
    sql: TRUNC(${days_since_cohort_event}/7);;
  }

  dimension: quarters_since_cohort_event {
    type: number
    sql: TRUNC(${months_since_cohort_event}/3);;
  }

  dimension: years_since_cohort_event {
    type: number
    sql: TRUNC(${months_since_cohort_event}/12);;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  parameter: orders_since_granularity  {
    type: unquoted
    allowed_value: { value: "Days" }
    allowed_value: { value: "Weeks" }
    allowed_value: { value: "Months" }
    allowed_value: { value: "Quarters" }
    allowed_value: { value: "Years" }
    label: "Define Time Intervals Since Acquisition"
  }

  # dimension: dynamic_periods_since {
  #   label_from_parameter: orders_since_granularity
  #   type: number
  #   sql:
  #   CASE
  #     WHEN {% parameter orders_since_granularity %} = 'Days' THEN ${days_since_cohort_event}
  #     WHEN {% parameter orders_since_granularity %} = 'Weeks' THEN ${weeks_since_cohort_event}
  #     WHEN {% parameter orders_since_granularity %} = 'Months' THEN ${months_since_cohort_event}
  #     WHEN {% parameter orders_since_granularity %} = 'Quarters' THEN ${quarters_since_cohort_event}
  #     WHEN {% parameter orders_since_granularity %} = 'Years' THEN ${years_since_cohort_event}
  #     END ;;
  # }

  dimension: dynamic_periods_since {
    label_from_parameter: orders_since_granularity
    type: number
    sql:
      {% if orders_since_granularity._parameter_value == "Days" %} ${days_since_cohort_event}
      {% elsif orders_since_granularity._parameter_value == "Weeks" %} ${weeks_since_cohort_event}
      {% elsif orders_since_granularity._parameter_value == "Months" %} ${months_since_cohort_event}
      {% elsif orders_since_granularity._parameter_value == "Quarters" %} ${quarters_since_cohort_event}
      {% elsif orders_since_granularity._parameter_value == "Years" %} ${years_since_cohort_event}
      {% endif %} + 1 ;;
  }
}
