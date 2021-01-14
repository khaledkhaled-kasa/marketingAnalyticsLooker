view: anal_user_segments_recent {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_user_segments_recent`
    ;;

  dimension: me_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.me_id ;;
  }

  dimension: segment_definition {
    type: string
    sql: ${TABLE}.segment_definition ;;
  }

  dimension: segment_value {
    type: string
    sql: ${TABLE}.segment_value ;;
  }

  dimension_group: segmentation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segmentation_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: anal_user_segments_recent2 {
  extends: [anal_user_segments_recent]
}
