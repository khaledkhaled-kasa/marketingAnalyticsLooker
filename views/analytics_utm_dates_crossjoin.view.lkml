include: "date_comparison.view"
view: anal_utm_dates_crossjoin {
  view_label: "Utm Dates Crossjoin"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_utm_dates_crossjoin`
    ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${date_date}, ${utm_key_id} ) ;;
  }

  dimension: date {
    type: date
    primary_key: no
    hidden: yes
    sql: timestamp(${TABLE}.date) ;;
  }

  dimension_group: date {
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
    sql: timestamp(${TABLE}.date) ;;
  }

  dimension: utm_key_id {
    type: string
    sql: ${TABLE}.utm_key_id ;;
    hidden: no
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  extends: [date_comparison]

  dimension: event_raw{
    sql:  ${date_time::datetime} ;;
    type: date_raw
    hidden: yes
  }
}
