include: "date_comparison.view"
view: anal_attribution {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_attribution`
    ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${session_id}, ${order_id}, ${attribution_model}, ${attribution_lookback_window} ) ;;
  }

  dimension: acquisition {
    type: yesno
    sql: ${TABLE}.acquisition ;;
  }

  dimension_group: attribution {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.attribution_date ;;
    label: "Emmission"
    hidden: yes
  }

  dimension: attribution_lookback_window {
    type: string
    sql: ${TABLE}.attribution_lookback_window ;;
  }

  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }

  dimension: attribution_utm_key_id {
    type: number
    sql: ${TABLE}.attribution_utm_key_id ;;
    hidden: yes
  }

  dimension: days_since_emmission {
    type: number
    sql: ${TABLE}.days_since_emmission ;;
  }

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
    hidden: yes
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    hidden: yes
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

 # parameter: ad_emmission_date_granularity  {
 #  allowed_value: { value: "Day" }
 #  allowed_value: { value: "Week" }
 #    allowed_value: { value: "Month" }
 #   allowed_value: { value: "Quarter" }
 #    allowed_value: { value: "Year" }
 #  }

 #  dimension: ad_emmission_dynamic_date {
 #    label_from_parameter: ad_emmission_date_granularity
 #   sql:
 #   CASE
 #     WHEN {% parameter ad_emmission_date_granularity %} = 'Day' THEN CAST(${attribution_date} AS STRING)
 #      WHEN {% parameter ad_emmission_date_granularity %} = 'Week' THEN CAST(${attribution_week} AS STRING)
 #     WHEN {% parameter ad_emmission_date_granularity %} = 'Month' THEN CAST(${attribution_month} AS STRING)
 #     WHEN {% parameter ad_emmission_date_granularity %} = 'Quarter' THEN CAST(${attribution_quarter} AS STRING)
 #      WHEN {% parameter ad_emmission_date_granularity %} = 'Year' THEN CAST(${attribution_year} AS STRING)
 #     END ;;
 #  }

extends: [date_comparison]

  dimension: event_raw{
    sql:  ${attribution_time::datetime} ;;
    type: date_raw
    hidden: yes
  }
}