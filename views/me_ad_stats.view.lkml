view: me_ad_stats {
  sql_table_name: `data-warehouse-333815.marketing.kasaWebsiteAdSpend` ;;

  dimension: ad_date_key {
    hidden: yes
    type: string
    description: "Composite key (date + ad_id) — used as sql_distinct_key for impressions / clicks / platform-reported measures since those values are repeated across session rows for the same ad-day."
    sql: ${TABLE}.ad_date_key ;;
  }
  dimension: ad_campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_campaign ;;
  }
  dimension: ad_channel {
    hidden: no
    type: string
    sql: ${TABLE}.ad_channel ;;
  }
  dimension: ad_clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_clicks ;;
  }
  dimension: record_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.recordId ;;
  }
  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: ad_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_id ;;
  }
  dimension: ad_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_impressions ;;
  }
  dimension: ad_name {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_name ;;
  }
  dimension: ad_set {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_set ;;
  }
  dimension: ad_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_spend ;;
  }
  dimension_group: date {
    hidden: no
    label: "Ad Spend"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: is_with_correct_tracking {
    hidden: no
    type: yesno
    description: "True when the ad record has valid attribution tracking. Useful for filtering out un-attributable spend."
    sql: ${TABLE}.is_with_correct_tracking ;;
  }
  dimension: platform_reported_orders {
    hidden: yes
    type: number
    sql: ${TABLE}.platform_reported_orders ;;
  }
  dimension: platform_reported_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.platform_reported_revenue ;;
  }
  dimension: prop_code {
    label: "Prop Code"
    description: "Coalesced property code for this ad-session row: landing_prop_code (user impact) takes precedence, then ad_prop_code (advertiser intent) as fallback. One value per row, no Looker join inflation."
    hidden: no
    type: string
    sql: ${TABLE}.propCode ;;
  }
  dimension: landing_prop_code {
    label: "Prop Code (Landing)"
    description: "The property code the user actually viewed in this session — most-viewed propCode across all events in the session. Reflects user impact; use for ROAS / CAC / per-property paid traffic."
    hidden: no
    type: string
    sql: ${TABLE}.landing_prop_code ;;
  }
  dimension: ad_prop_code {
    label: "Prop Code (Advertiser Intent)"
    description: "The property code parsed from the Google Ads campaign name (MH_<PROP>_* pattern). Reflects advertiser intent; null when the campaign isn't property-tagged (most brand / PMAX / Cities campaigns)."
    hidden: no
    type: string
    sql: ${TABLE}.ad_prop_code ;;
  }
  dimension: campaign_class {
    label: "Campaign Class"
    description: "High-level campaign bucket: Property (MH_*), PMAX, Boost, Cities, Brand (other K_*), or Other. Always populated."
    hidden: no
    type: string
    sql: ${TABLE}.campaign_class ;;
  }
  dimension: region {
    hidden: yes
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: tracking_method {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_method ;;
  }
  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: utm_campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }
  dimension: utm_content {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_content ;;
  }
  dimension: utm_key {
    hidden: yes
    type: number
    sql: ${TABLE}.utm_key ;;
  }
  dimension: utm_medium {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_medium ;;
  }
  dimension: utm_source {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  dimension: utm_term {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_term ;;
  }
  dimension: ad_spend_flag{
    type: yesno
    sql: case when ${ad_spend} > 0 then true else false end ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [ad_name]
  }
  measure: ad_spend_amount {
    type: sum_distinct
    sql: ${ad_spend} ;;
    value_format_name: usd
  }
  measure: impressions {
    label: "# of Impressions"
    description: "Total ad impressions reported by the platform. Deduped on ad_date_key because impressions are repeated across session rows for the same (date, ad_id)."
    type: sum_distinct
    sql_distinct_key: ${ad_date_key} ;;
    sql: ${ad_impressions} ;;
    value_format_name: decimal_0
  }
  measure: clicks {
    label: "# of Clicks"
    description: "Total ad clicks reported by the platform. Deduped on ad_date_key."
    type: sum_distinct
    sql_distinct_key: ${ad_date_key} ;;
    sql: ${ad_clicks} ;;
    value_format_name: decimal_0
  }
  measure: platform_revenue {
    label: "Revenue Amount (Platform-Reported)"
    description: "Revenue as reported by the ad platform (Google Ads conversion value, etc.). Use when ad-platform fidelity is preferred over Kasa-side financials. Deduped on ad_date_key."
    type: sum_distinct
    sql_distinct_key: ${ad_date_key} ;;
    sql: ${platform_reported_revenue} ;;
    value_format_name: usd
  }
  measure: platform_conversions {
    label: "# of Conversions (Platform-Reported)"
    description: "Conversions / orders as reported by the ad platform. Deduped on ad_date_key."
    type: sum_distinct
    sql_distinct_key: ${ad_date_key} ;;
    sql: ${platform_reported_orders} ;;
    value_format_name: decimal_0
  }
  measure: ctr {
    label: "CTR"
    description: "Click-Through Rate: clicks / impressions."
    type: number
    sql: ${clicks} / nullif(${impressions}, 0) ;;
    value_format_name: percent_2
  }
  measure: cvr {
    label: "CVR"
    description: "Conversion Rate: platform-reported conversions / clicks."
    type: number
    sql: ${platform_conversions} / nullif(${clicks}, 0) ;;
    value_format_name: percent_2
  }
  measure: cpc_per_click {
    label: "CPC (per Click)"
    description: "Cost Per Click: ad spend / clicks. Use this for true CPC; the existing 'CPC' measure divides by sessions, not clicks."
    type: number
    sql: ${ad_spend_amount} / nullif(${clicks}, 0) ;;
    value_format_name: usd
  }
  measure: cost_per_conversion {
    label: "Cost per Conversion"
    description: "Ad spend / platform-reported conversions."
    type: number
    sql: ${ad_spend_amount} / nullif(${platform_conversions}, 0) ;;
    value_format_name: usd
  }
  measure: cac {
    label: "CAC"
    description: "Customer Acquisition Cost: (ad spend - discount spend) / unique new guests. Reliable at the period level. Per-campaign CAC is not yet attribution-aware (will improve once attribution-aware revenue measures are built)."
    type: number
    sql: (${ad_spend_amount} - ${financials.discount_amount_web_site}) / nullif(${guests.unique_new_guests}, 0) ;;
    value_format_name: usd
  }
  measure: ltv_to_cac {
    label: "LTV:CAC"
    description: "Ratio of LTV to CAC"
    type: number
    sql: ${guests.ltv}/nullif(${cac},0) ;;
    value_format_name: percent_1
  }
  measure: cpc {
    label: "CPC (legacy)"
    description: "Despite the name, this divides ad spend by SESSIONS, not clicks. For true CPC use 'CPC (per Click)'. Kept for backwards compatibility with existing dashboards."
    type: number
    sql: ${ad_spend_amount}/nullif(${me_web_sessions.session_count},0)  ;;
    value_format_name: usd
  }
  measure: roas {
    label: "ROAS"
    description: "Return on Ad Spend: Kasa-side revenue (financials.amount) divided by ad spend. Revenue is attributed via Last Touch Non-Direct, 30-day lookback (set in marketing_analytics.model.lkml). Filter by ad_prop_code for per-MH-campaign ROAS, by landing_prop_code for per-property paid-traffic ROAS."
    type: number
    sql: ${financials.amount}/nullif(${ad_spend_amount},0) ;;
  }
  measure: cps {
    label: "CPS"
    description: "Cost per Session: Ad Spend / Sessions. Use this when the question is 'how much did each session cost'. Note: 'CPC' (legacy) computes the same thing — these are duplicates kept for backwards compatibility."
    type: number
    sql: ${ad_spend_amount}/nullif(${me_web_sessions.session_count},0)  ;;
    value_format_name: usd
  }
  measure: cost_per_booking {
    label: "Cost per Booking"
    description: "Cost per booking: Ad spend divided by total bookings (reservations)"
    type: number
    sql: ${ad_spend_amount}/nullif(${reservations.num_reservations},0) ;;
    value_format_name: usd
  }
}
