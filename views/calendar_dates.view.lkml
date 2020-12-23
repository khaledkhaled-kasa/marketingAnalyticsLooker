view: calendar_dates {
  derived_table: {
    sql: WITH
        timestamp_min_max AS (
        SELECT
          MIN(order_timestamp) min,
          MAX(order_timestamp) max
        FROM
          `bigquery-analytics-272822.ME_BI.ECOM_orders_struct`
        UNION ALL
        SELECT
          MIN(session_timestamp) min,
          MAX(session_timestamp) max
        FROM
          `bigquery-analytics-272822.ME_BI.GA_sessions_struct`),
        array_date_range AS (
        SELECT
          GENERATE_DATE_ARRAY(DATE(MIN(min)), DATE(MAX(max)), INTERVAL 1 DAY) dates
        FROM
          timestamp_min_max)
      SELECT
        calendar_date
      FROM
        array_date_range,
        UNNEST(dates) calendar_date
          ;; }

  dimension: calendar_date {
    type: date
    primary_key: yes
    hidden: yes
    sql: timestamp(${TABLE}.calendar_date) ;;
  }

  dimension_group: calendar_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month_name,
      month_num
    ]
    sql: timestamp(${TABLE}.calendar_date);;
  }

  parameter: date_granularity  {
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }

  # dimension: dynamic_date {
  #   label_from_parameter: date_granularity
  #   sql:
  #   {% if date_granularity._parameter_value == "Day" %} ${date_in_period_date}
  #   {% elsif date_granularity._parameter_value == "Week" %} ${date_in_period_week}
  #   {% elsif date_granularity._parameter_value == "Month" %} ${date_in_period_month}
  #   {% elsif date_granularity._parameter_value == "Quarter" %} ${date_in_period_quarter}
  #   {% elsif date_granularity._parameter_value == "Year" %} ${date_in_period_year}
  #   {% endif %} ;;

  #   }

  dimension: dynamic_date {
    label_from_parameter: date_granularity
    sql:
    CASE
      WHEN {% parameter date_granularity %} = 'Day' THEN CAST(${calendar_date_date} AS STRING)
      WHEN {% parameter date_granularity %} = 'Week' THEN CAST(${calendar_date_week} AS STRING)
      WHEN {% parameter date_granularity %} = 'Month' THEN CAST(${calendar_date_month} AS STRING)
      WHEN {% parameter date_granularity %} = 'Quarter' THEN CAST(${calendar_date_quarter} AS STRING)
      WHEN {% parameter date_granularity %} = 'Year' THEN CAST(${calendar_date_year} AS STRING)
      END ;;

    }

## ---------------------- COMPARISON PERIOD ----------------------------- ##
  filter: current_date_range {
    type: date
    label: "Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
  }

  parameter: compare_to {
    description: "Select a previous period you would like to compare to"
    label: "Comparison Period"
    type: unquoted
    allowed_value: {
      label: "Previous Period"
      value: "period"
    }
    allowed_value: {
      label: "Previous Week"
      value: "week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "year"
    }
    default_value: "period"
  }

  dimension: days_in_period {
    hidden:  yes
    view_label: "Comparison Period"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATE_DIFF(DATE({% date_end current_date_range %}), DATE({% date_start current_date_range %}), DAY) ;;
  }

  dimension: period_2_start {
    hidden:  yes
    view_label: "Comparison Period"
    description: "Calculates the start of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -${days_in_period} DAY )
        {% else %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: period_2_end {
    hidden:  yes
    view_label: "Comparison Period"
    description: "Calculates the end of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "period" %}
        DATE_ADD( DATE({% date_start current_date_range %}), INTERVAL -1 DAY)
        {% else %}
        DATE_ADD(DATE_ADD(DATE({% date_end current_date_range %}), INTERVAL -1 DAY), INTERVAL -1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: day_in_period {
    hidden: yes
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
    {% if current_date_range._is_filtered %}
        CASE
        WHEN {% condition current_date_range %} ${calendar_date_raw} {% endcondition %}
        THEN DATE_DIFF(DATE({% date_start current_date_range %}),${calendar_date_date}, DAY) + 1
        WHEN ${calendar_date_date} between ${period_2_start} and ${period_2_end}
        THEN DATE_DIFF( ${period_2_start}, ${calendar_date_date}, DAY) + 1
        END
    {% else %} 0
    {% endif %}
    ;;
  }

  dimension: order_for_period {
    hidden: yes
    type: number
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${calendar_date_raw} {% endcondition %}
            THEN 1
            WHEN ${calendar_date_date} between ${period_2_start} and ${period_2_end}
            THEN 2
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Date"
    type: time
    sql: TIMESTAMP(DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -${day_in_period} + 1 DAY)) ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month_name,
      month_num
      ]
  }

  dimension: period {
    label: "Period"
    hidden: yes
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    order_by_field: order_for_period
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${calendar_date_raw} {% endcondition %}
            THEN 'This {% parameter compare_to %}'
            WHEN ${calendar_date_date} between ${period_2_start} and ${period_2_end}
            THEN 'Last {% parameter compare_to %}'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }

  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${calendar_date_raw} {% endcondition %} THEN 'this'
            WHEN ${calendar_date_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} 'this' {% endif %} ;;
  }

}
