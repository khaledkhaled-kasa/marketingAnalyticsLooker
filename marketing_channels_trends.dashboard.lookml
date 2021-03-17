- dashboard: marketing_channels_trends
  title: Marketing Channels Trends
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Google Ads - Attributed Bookings
    name: Google Ads - Attributed Bookings
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_simple_attribution.attributed_total_order_volume]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6


  - title: Google Ads - Attributed Cost per Booking
    name: Google Ads - Attributed Cost per Booking
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.cost_per_order]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Google Ads - Attributed Booking Value
    name: Google Ads - Attributed Booking Value
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_simple_attribution.attributed_total_order_gross_value]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Google Ads - Ad Spend
    name: Google Ads - Ad Spend
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.total_ad_spend]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Google Ads - % CPS
    name: Google Ads - % CPS
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.inverted_roas]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Google Ads - Click-through Rates
    name: Google Ads - Click-through Rates
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.click_through_rate]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Google Ads - Booking Conversion Rate
    name: Google Ads - Booking Conversion Rate
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, ga_sessions_struct.transaction_conversion_rate]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Google Ads Branded Search,Google Ads
        Non-Branded Search
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Facebook Ads - Attributed Bookings
    name: Facebook Ads - Attributed Bookings
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_simple_attribution.attributed_total_order_volume]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    series_colors:
      anal_simple_attribution.attributed_total_order_volume: "#B1399E"
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6


  - title: Facebook Ads - Attributed Cost per Booking
    name: Facebook Ads - Attributed Cost per Booking
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.cost_per_order]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    series_colors:
      anal_ads_costs.cost_per_order: "#B1399E"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  - title: Facebook Ads - Attributed Booking Value
    name: Facebook Ads - Attributed Booking Value
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_simple_attribution.attributed_total_order_gross_value]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    series_colors:
      anal_simple_attribution.attributed_total_order_gross_value: "#B1399E"
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  - title: Facebook Ads - Ad Spend
    name: Facebook Ads - Ad Spend
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.total_ad_spend]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    series_colors:
      anal_ads_costs.total_ad_spend: "#B1399E"
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  - title: Facebook Ads - % CPS
    name: Facebook Ads - % CPS
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.inverted_roas]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    series_colors:
      anal_ads_costs.inverted_roas: "#B1399E"
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  - title: Facebook Ads - Click-through Rates
    name: Facebook Ads - Click-through Rates
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, anal_ads_costs.click_through_rate]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    limit: 500
    column_limit: 50
    total: true
    series_colors:
      anal_ads_costs.click_through_rate: "#B1399E"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  - title: Facebook Ads - Booking Conversion Rate
    name: Facebook Ads - Booking Conversion Rate
    model: marketing_analytics
    explore: new_attribution
    type: looker_line
    fields: [anal_utm_dates_crossjoin.dynamic_date, ga_sessions_struct.transaction_conversion_rate]
    filters:
      ga_utm_dictionary.ga_source: ''
      ga_utm_dictionary.paid_unpaid_traffic: ''
      ga_utm_dictionary.ga_medium: ''
      ga_utm_dictionary.ga_campaign: ''
      ga_utm_dictionary.ga_ad_content: ''
      ga_utm_dictionary.ga_keyword: ''
      ga_utm_dictionary.custom_utm_grouping: Facebook Paid
    sorts: [anal_utm_dates_crossjoin.dynamic_date]
    series_colors:
      ga_sessions_struct.transaction_conversion_rate: "#B1399E"
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      ecom_orders_struct.website_orders_value:
        is_active: true
      ga_sessions_struct__transaction_events.transaction_volume:
        is_active: true
      ecom_orders_struct.average_order_gross_value:
        is_active: true
      ecom_orders_struct.new_customer_volume:
        is_active: true
      ga_sessions_struct.transaction_conversion_rate:
        is_active: true
      anal_ads_costs.total_ad_spend:
        is_active: true
      anal_ads_costs.cost_per_order:
        is_active: true
      anal_ads_costs.cost_per_acquisition:
        is_active: true
      anal_ads_costs.total_roas:
        is_active: true
      ecom_orders_struct.repeat_customer_rate:
        is_active: true
      share_of_returning_customers:
        is_active: true
      average_booking_value:
        is_active: true
      share_of_returning_orders:
        is_active: true
      anal_simple_attribution.attributed_acquisitions_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_volume:
        is_active: true
      anal_simple_attribution.attributed_total_order_gross_value:
        is_active: true
      anal_ads_costs.inverted_roas:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ecom_orders_struct.total_customer_volume]
    listen:
      Date Granularity: anal_utm_dates_crossjoin.date_granularity
      Lookback Window: anal_simple_attribution.lookback_window
      Attribution Model: anal_simple_attribution.attribution_model
      Date Range: anal_utm_dates_crossjoin.current_date_range
    row: 0
    col: 8
    width: 8
    height: 6

  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 6 weeks
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: marketing_analytics
    explore: new_attribution
    field: anal_utm_dates_crossjoin.current_date_range
  - name: Date Granularity
    title: Date Granularity
    type: field_filter
    default_value: Week
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: marketing_analytics
    explore: new_attribution
    field: anal_utm_dates_crossjoin.date_granularity
  - name: Lookback Window
    title: Lookback Window
    type: field_filter
    default_value: '30'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '3'
      - '7'
      - '14'
      - '30'
    model: marketing_analytics
    explore: new_attribution
    field: anal_simple_attribution.lookback_window
  - name: Attribution Model
    title: Attribution Model
    type: string_filter
    default_value: '"last_click_non_direct_model"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - last_click_non_direct_model
      - first_click_model
