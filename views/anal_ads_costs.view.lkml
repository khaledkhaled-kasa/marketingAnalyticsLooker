view: anal_ads_costs {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_ads_costs`
    ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${ad_id}, ${date_date}) ;;
  }

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
    hidden: yes
  }

  dimension: aq_clicks {
    type: number
    sql: ${TABLE}.aq_clicks ;;
    hidden: yes
  }

  dimension: aq_sessions {
    type: number
    sql: ${TABLE}.aq_sessions ;;
    hidden: yes
  }

  dimension: aq_spend {
    type: number
    sql: ${TABLE}.aq_spend ;;
    hidden: yes
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: ret_clicks {
    type: number
    sql: ${TABLE}.ret_clicks ;;
    hidden: yes
  }

  dimension: ret_sessions {
    type: number
    sql: ${TABLE}.ret_sessions ;;
    hidden: yes
  }

  dimension: ret_spend {
    type: number
    sql: ${TABLE}.ret_spend ;;
    hidden: yes
  }

  dimension: total_clicks {
    type: number
    sql: ${TABLE}.total_clicks ;;
    hidden: yes
  }

  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
    hidden: yes
  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
    hidden: yes
  }

  dimension: utm_key_id {
    type: number
    sql: ${TABLE}.utm_key_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: total_ad_spend {
    type: sum
    sql: ${total_spend} ;;
    value_format_name: usd_0
  }

  measure: total_ad_impressions {
    type: sum
    sql: ${total_impressions} ;;
    value_format_name: decimal_0
  }

  measure: total_ad_clicks {
    type: sum
    sql: ${total_clicks} ;;
    value_format_name: decimal_0
  }

  measure: average_attributed_booking_value {
    type: number
    sql: if(${anal_simple_attribution.attributed_total_order_volume}=0,0,
    ${anal_simple_attribution.attributed_total_order_gross_value}/${anal_simple_attribution.attributed_total_order_volume}) ;;
    value_format_name: usd_0
    label: "Average Booking Value"
    description: "Average Value of attributed Booking"
  }

  measure: share_of_returning_orders {
    type: number
    sql: if(${anal_simple_attribution.attributed_total_order_volume}=0,0,
    ${anal_simple_attribution.attributed_acquisitions_volume}/${anal_simple_attribution.attributed_total_order_volume});;
    value_format_name: percent_0
    label: "Share of Returning Orders"
  }

  measure: click_through_rate {
    type: number
    sql: if(${total_ad_impressions}=0,NULL,${total_ad_clicks}/${total_ad_impressions}) ;;
    value_format_name: percent_1
    label: "Clickthrough Rate"
    description: "The number of clicks that your ad receives divided by the number of times your ad is show"
  }

  measure: cost_per_mile {
    type: number
    sql: if(${total_ad_impressions}=0,NULL,${total_ad_spend}/(${total_ad_impressions}/1000)) ;;
    value_format_name: usd
    label: "Cost per Mile"
    description: "The cost for one thousand ad impressions"
  }

  measure: cost_per_click {
    type: number
    sql: if(${total_ad_clicks}=0,NULL,${total_ad_spend}/${total_ad_clicks}) ;;
    value_format_name: usd
    label: "Cost per Click"
  }

  measure: cost_per_order {
    type: number
    sql: if(${anal_simple_attribution.attributed_total_order_volume}=0,NULL,${total_ad_spend}/${anal_simple_attribution.attributed_total_order_volume}) ;;
    value_format_name: usd
    label: "Cost per Booking"
    description: "The cost for total attributed bookings"
  }

  measure: cost_per_acquisition {
    type: number
    sql: if(${anal_simple_attribution.attributed_acquisitions_volume}=0,NULL,${total_ad_spend}/${anal_simple_attribution.attributed_acquisitions_volume}) ;;
    value_format_name: usd
    label: "Cost per Acquisition"
    description: "The cost for acquiring a new customer"
  }

  measure: total_roas {
    type: number
    sql: if(${total_ad_spend}=0,NULL, ${anal_simple_attribution.attributed_total_order_gross_value}/${total_ad_spend}) ;;
    value_format_name: percent_1
    label: "Total ROAS"
    description: "Total Value of Attributed Bookings divided by Total Ad Spend"
  }

  measure: inverted_roas {
    type: number
    sql: if(${anal_simple_attribution.attributed_total_order_gross_value}=0,NULL,${total_ad_spend}/ ${anal_simple_attribution.attributed_total_order_gross_value}) ;;
    value_format_name: percent_1
    label: "% CPS"
    description: "Total Ad Spend divided by Total Value of Attributed Bookings"

  }

  # measure: 30_day_sales_gross_value {
  #   type: number
  #   sql: sum(if(${anal_attribution.days_since_emmission}<=30, ${ecom_orders_struct.order_gross_value}, NULL)) ;;
  #   value_format_name: usd_0
  #   hidden: yes
  # }

  # measure: 30_day_roas {
  #   type: number
  #   sql: if(${total_ad_spend}=0 ,NULL, ${30_day_sales_gross_value}/${total_ad_spend}) ;;
  #   value_format_name: percent_1
  #   label: "30-Day ROAS"
  #   description: "Total Value of Attributed Bookings within 30 days from Acquisiton divided by Total Ad Spend"
  # }

  measure: cost_per_add_to_cart {
    type: number
    sql: if(${ga_sessions_struct__website_events.add_to_carts}=0,NULL, ${total_ad_spend}/${ga_sessions_struct__website_events.add_to_carts}) ;;
    value_format_name: usd
    label: "Cost per Add to Cart"
  }

  measure: attribution_conversion_rate {
    type: number
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${anal_simple_attribution.attributed_total_order_volume}/${ga_sessions_struct.sessions_volume})  ;;
  }

  parameter: primary_attribution_metric_selector {
    type: string
    label: "Select Primary Metric"
    description: "Select Primary Metric for Attribution Analysis"
    allowed_value: {
      label: "Total Booking Value"
      value: "total_sales_gross_value"
    }
    allowed_value: {
      label: "Total Ad Spend"
      value: "total_ad_spend"
    }
    allowed_value: {
      label: "Total Clicks"
      value: "total_ad_clicks"
    }

    allowed_value: {
      label: "Total Impressions"
      value: "total_ad_impressions"
    }

    allowed_value: {
      label: "Number of Acquired Customers"
      value: "new_customer_volume"
    }
  }

  measure: primary_attribution_selected_metric {
    label_from_parameter: primary_attribution_metric_selector
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql:
      Case
        WHEN {% parameter primary_attribution_metric_selector %} = 'total_ad_spend' then ${total_ad_spend}
        WHEN {% parameter primary_attribution_metric_selector %} = 'total_sales_gross_value' then ${anal_simple_attribution.attributed_total_order_gross_value}
        WHEN {% parameter primary_attribution_metric_selector %} = 'total_ad_clicks' then ${total_ad_clicks}
    WHEN {% parameter primary_attribution_metric_selector %} = 'total_ad_impressions' then ${total_ad_impressions}
        WHEN {% parameter primary_attribution_metric_selector %} = 'new_customer_volume' then ${anal_simple_attribution.attributed_acquisitions_volume}
        ELSE NULL
        END;;
    html:

      {% if primary_attribution_metric_selector._parameter_value ==  "'total_sales_gross_value'" or "'total_ad_spend" %}
      ${{rendered_value}}
      {% else %}
      {{rendered_value}}
      {% endif %};;
    label: "Primary Selected Metric"
    description: "Selected Metrics from Attribution Analysis"
    drill_fields: [ga_umt_dictionary.mkt_channel, primary_attribution_selected_metric]
  }

  parameter: secondary_attribution_metric_selector {
    type:  string
    label: "Select Secondary Metric"
    description: "Select Secondary Metric for Attribution Analysis"
    allowed_value: {
      label: "Clickthrough Rate"
      value: "click_through_rate"
    }
    allowed_value: {
      label: "Booking Conversion Rate"
      value: "transaction_conversion_rate"
    }
    allowed_value: {
      label: "Total ROAS"
      value: "total_roas"
    }
    # allowed_value: {
    #   label: "30-Day ROAS"
    #   value: "30_day_roas"
    # }
    allowed_value: {
      label: "Cost per Mile"
      value: "cost_per_mile"
    }

    allowed_value: {
      label: "Cost per Click"
      value: "cost_per_click"
    }

    allowed_value: {
      label: "Cost per Acquisition"
      value: "cost_per_acquisition"
    }

    allowed_value: {
      label: "Cost per Booking"
      value: "cost_per_order"
    }
  }

  measure: secondary_attribution_selected_metric {
    label_from_parameter: secondary_attribution_metric_selector
    type: number
    value_format: "0.##"
    sql:
    {% case secondary_attribution_metric_selector._parameter_value %}
    {% when "'click_through_rate'"%}
      ${click_through_rate}
    {% when "'transaction_conversion_rate'"%}
      ${attribution_conversion_rate}
    {% when "'total_roas'"%}
      ${total_roas}
    {% when "'30_day_roas'"%}
      ${cost_per_mile}
    {% when "'cost_per_click'"%}
      ${cost_per_click}
    {% when "'cost_per_acquisition'"%}
      ${cost_per_acquisition}
    {% when "'cost_per_order'"%}
      ${cost_per_order}
    {% else %} NULL
    {% endcase %}
    ;;
    html:
    {% case secondary_attribution_metric_selector._parameter_value %}
    {% when "'cost_per_mile'" or "'cost_per_click'" or "'cost_per_acquisition'" or "'cost_per_order'" %}
    ${{rendered_value}}
    {% when "'click_through_rate'" or "'transaction_conversion_rate'" or "'total_roas'" or "'30_day_roas'" %}
    {{value |times: 100 | round: 2 | append: "%"}}
    {% else %}
    {{rendered_value}}
    {% endcase %};;
    label: "Secondary Selected Metric"
    description: "Selected Metrics from Attribution Analysis"
    drill_fields: [ga_umt_dictionary.mkt_channel, secondary_attribution_selected_metric]

  }

  # measure: secondary_attribution_selected_metric {
  #   label_from_parameter: secondary_attribution_metric_selector
  #   type: number
  #   value_format: "0.##"
  #   sql:
  #   {% case secondary_attribution_metric_selector._parameter_value %}
  #   {% when "'click_through_rate'"%}
  #     ${click_through_rate}
  #   {% when "'transaction_conversion_rate'"%}
  #     ${attribution_conversion_rate}
  #   {% when "'total_roas'"%}
  #     ${total_roas}
  #   {% when "'30_day_roas'"%}
  #     ${30_day_roas}
  #   {% when "'cost_per_mile'"%}
  #     ${cost_per_mile}
  #   {% when "'cost_per_click'"%}
  #     ${cost_per_click}
  #   {% when "'cost_per_acquisition'"%}
  #     ${cost_per_acquisition}
  #   {% when "'cost_per_order'"%}
  #     ${cost_per_order}
  #   {% else %} NULL
  #   {% endcase %}
  #   ;;
  #   html:
  #   {% case secondary_attribution_metric_selector._parameter_value %}
  #   {% when "'cost_per_mile'" or "'cost_per_click'" or "'cost_per_acquisition'" or "'cost_per_order'" %}
  #   ${{rendered_value}}
  #   {% when "'click_through_rate'" or "'transaction_conversion_rate'" or "'total_roas'" or "'30_day_roas'" %}
  #   {{value |times: 100 | round: 2 | append: "%"}}
  #   {% else %}
  #   {{rendered_value}}
  #   {% endcase %};;
  #   label: "Secondary Selected Metric"
  #   description: "Selected Metrics from Attribution Analysis"
  #   drill_fields: [ga_umt_dictionary.mkt_channel, secondary_attribution_selected_metric]

  # }


  dimension: dummy_ten {
    case: {
      when: {
        label: "Attributed Booking Volume"
        sql: 1=1 ;;
      }
      when: {
        label: "Cost per Booking"
        sql: 1=1 ;;
      }
      when: {
        label: "Attributed Booking Value"
        sql: 1=1 ;;
      }
      when: {
        label: "Total ROAS"
        sql: 1=1 ;;
      }
      when: {
        label: "% CPS"
        sql: 1=1 ;;
      }
      when: {
        label: "Transaction Conversion Rate"
        sql: 1=1 ;;
      }
      when: {
        label: "Total Ad Spend"
        sql: 1=1 ;;
      }
      when: {
        label: "Attributed New Acquisitions"
        sql: 1=1 ;;
      }
      when: {
        label: "Share of Returning Orders"
        sql: 1=1 ;;
      }
      when: {
        label: "Average Booking Value"
        sql: 1=1 ;;
      }
    }
  }
}
