view: anal_user_segments {
  view_label: "User Segments"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_user_segments`
    ;;

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: double_segments_value {
    type: string
    sql: CONCAT(${segment_value}," - ",${anal_user_segments_recent.segment_value});;
    hidden: yes
  }

  dimension: triple_segments_value {
    type: string
    sql: CONCAT(${segment_value}," - ",${anal_user_segments_recent.segment_value}," - ",${anal_user_segments_recent2.segment_value});;
    hidden: yes
  }

  dimension: single_cohorts_segments_value {
    type: string
    sql: CONCAT(${segment_value}," from ",${anal_user_cohorts.dynamic_cohort_date});;
    hidden: yes
  }

  dimension: double_cohorts_segments_value {
    type: string
    sql: CONCAT(${double_segments_value}," from ",${anal_user_cohorts.dynamic_cohort_date});;
    hidden: yes
  }

  dimension: triple_cohorts_segments_value {
    type: string
    sql: CONCAT(${triple_segments_value}," from ",${anal_user_cohorts.dynamic_cohort_date});;
    hidden: yes
  }

  dimension: only_cohorts_value {
    type: string
    sql: CONCAT("All customers from ",${anal_user_cohorts.dynamic_cohort_date});;
    hidden: yes
  }

  parameter: segment_combinations_parameter  {
    type: unquoted
    allowed_value: {
      value: "single"
      label: "Single"
    }
    allowed_value: {
      value: "double"
      label: "Double"
    }
    allowed_value: {
      value: "triple"
      label: "Triple"
    }
      allowed_value: {
      value: "single_cohorts"
      label: "Single + Cohorts"
    }
    allowed_value: {
      value: "double_cohorts"
      label: "Double + Cohorts"
    }
    allowed_value: {
      value: "triple_cohorts"
      label: "Triple + Cohorts"
    }
    allowed_value: {
      value: "cohorts"
      label: "Only Cohorts"
    }
    label: "Select Segment Combination"
  }

  dimension: selected_segment_combinations {
    label_from_parameter: segment_combinations_parameter
    type: string
    sql:
      {% if segment_combinations_parameter._parameter_value == "single" %} ${segment_value}
      {% elsif segment_combinations_parameter._parameter_value == "double" %} ${double_segments_value}
      {% elsif segment_combinations_parameter._parameter_value == "triple" %} ${triple_segments_value}
      {% elsif segment_combinations_parameter._parameter_value == "single_cohorts" %} ${single_cohorts_segments_value}
      {% elsif segment_combinations_parameter._parameter_value == "double_cohorts" %} ${double_cohorts_segments_value}
      {% elsif segment_combinations_parameter._parameter_value == "triple_cohorts" %} ${triple_cohorts_segments_value}
      {% elsif segment_combinations_parameter._parameter_value == "cohorts" %} ${only_cohorts_value}
      {% endif %} ;;
    label: "Selected Segment Combination"
    drill_fields: [ecom_users.email]
  }

}
