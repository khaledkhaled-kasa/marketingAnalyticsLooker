include: "date_comparison.view"
view: website_calendar_dates{
  derived_table: {
    sql: WITH
        timestamp_min_max AS (
        SELECT
          MIN(timestamp) min,
          MAX(timestamp) max
        FROM
          `bigquery-analytics-272822.website_kasa_com_transformed.order_completed`
        UNION ALL
        SELECT
          MIN(session_timestamp) min,
          MAX(session_timestamp) max
        FROM
          `bigquery-analytics-272822.website_kasa_com_transformed.sessions_struct`),
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
          ;;
          persist_for: "24 hours"
          }
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
