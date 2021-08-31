include: "date_comparison.view"
view: calendar_dates {
  derived_table: {
    sql: WITH
        timestamp_min_max AS (
        SELECT
          MIN(order_timestamp) min,
          MAX(order_timestamp) max
        FROM
          `bigquery-analytics-272822.ME_BI_prod.ECOM_orders_struct`
        UNION ALL
        SELECT
          MIN(session_timestamp) min,
          MAX(session_timestamp) max
        FROM
          `bigquery-analytics-272822.ME_BI_prod.GA_sessions_struct`),
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
          ;;}

  dimension: calendar_date {
    type: date
    primary_key: yes
    hidden: yes
    sql: timestamp(${TABLE}.calendar_date) ;;
  }

  dimension_group: calendar_date {
    type: time
    hidden: yes

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


  extends: [date_comparison]

  dimension: event_raw{
    sql:  ${calendar_date_time::datetime} ;;
    type: date_raw
    hidden: yes
  }
   }
