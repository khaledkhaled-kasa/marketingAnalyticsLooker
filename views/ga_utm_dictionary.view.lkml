view: ga_utm_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.GA_utm_dictionary`
    ;;
  label: "UTM Dictionary"
  dimension: ga_ad_content {
    type: string
    sql: ${TABLE}.ga_ad_content ;;
  }

  dimension: ga_ad_content_clean {
    type: string
    # label: "Ad Content"
    sql: ${TABLE}.ga_ad_content_clean ;;
    hidden: yes
  }

  dimension: ga_campaign {
    type: string
    sql: ${TABLE}.ga_campaign ;;
    drill_fields: [ga_ad_content, ga_keyword]
  }

  dimension: ga_campaign_clean {
    type: string
    # label: "Campaign"
    sql: ${TABLE}.ga_campaign_clean ;;
    hidden: yes
  }

  dimension: ga_keyword {
    type: string
    sql: ${TABLE}.ga_keyword ;;
  }

  dimension: ga_keyword_clean {
    type: string
    # label: "Keyword"
    sql: ${TABLE}.ga_keyword_clean ;;
    hidden: yes
  }

  dimension: ga_medium {
    type: string
    sql: ${TABLE}.ga_medium ;;
    drill_fields: [ga_campaign,ga_ad_content,ga_keyword]
  }

  dimension: ga_medium_clean {
    type: string
    # label: "Medium"
    sql: ${TABLE}.ga_medium_clean ;;
    hidden: yes
  }

  dimension: ga_source {
    type: string
    sql: ${TABLE}.ga_source ;;
    drill_fields: [ga_medium, ga_campaign, ga_ad_content, ga_keyword]
  }

  dimension: ga_source_clean {
    type: string
    # label: "Source"
    sql: ${TABLE}.ga_source_clean ;;
    hidden: yes
  }

  dimension: mkt_account {
    type: string
    sql: ${TABLE}.mkt_account ;;
  }

  dimension: mkt_ad {
    type: string
    sql: ${TABLE}.mkt_ad ;;
  }

  dimension: mkt_ad_group {
    type: string
    sql: ${TABLE}.mkt_ad_group ;;
    drill_fields: [mkt_ad]
  }

  dimension: mkt_campaign {
    type: string
    sql: ${TABLE}.mkt_campaign ;;
    drill_fields: [mkt_ad_group,mkt_ad]

  }

  dimension: mkt_channel {
    type: string
    sql: ${TABLE}.mkt_channel ;;
    drill_fields: [mkt_campaign,mkt_ad_group,mkt_ad,anal_attribution.attribution_date]
  }

  dimension: paid_unpaid_traffic {
    type: string
    sql: ${TABLE}.paid_unpaid_traffic ;;
    drill_fields: [mkt_channel,mkt_campaign,mkt_ad_group,mkt_ad,custom_utm_grouping]
  }

  dimension: utm_key_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.utm_key_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: ga_source_medium {
    type: string
    sql: CONCAT(${ga_source},'/',${ga_medium});;
    label: "Source/Medium"
    drill_fields: [ga_campaign, ga_ad_content, ga_keyword]
  }

  parameter: utm_level_parameter  {
    type: unquoted
    allowed_value: { value: "Source" }
    allowed_value: { value: "Medium" }
    allowed_value: { value: "Campaign" }
    allowed_value: { value: "Ad Content" }
    allowed_value: { value: "Keyword" }
    allowed_value: { value: "Source_Medium"}
    label: "Select UTM Level"
  }


  dimension: selected_utm_level {
    label_from_parameter: utm_level_parameter
    type: string
    sql:
      {% if utm_level_parameter._parameter_value == "Source" %} ${ga_source}
      {% elsif utm_level_parameter._parameter_value == "Medium" %} ${ga_medium}
      {% elsif utm_level_parameter._parameter_value == "Campaign" %} ${ga_campaign}
      {% elsif utm_level_parameter._parameter_value == "Ad Content" %} ${ga_ad_content}
      {% elsif utm_level_parameter._parameter_value == "Source_Medium" %} ${ga_source_medium}
      {% endif %} ;;
    label: "Selected UTM Level"
  }

  # changes in custom_utm_grouping need to be propagated to anal_conversion_paths view in BQ
  dimension: custom_utm_grouping {
    type: string
    sql:
    Case
    when ${ga_source}='(direct)' and ${ga_medium}='(none)' then 'Direct'
    when ${ga_source}='google' and ${ga_medium}='cpc' and LOWER(${mkt_campaign}) like '%brand%' then 'Google Ads Branded Search'
    when ${ga_source}='google' and ${ga_medium}='cpc' and LOWER(${mkt_campaign}) like '%remarketing%' then 'Google Ads Display'
    when ${ga_source}='google' and ${ga_medium}='cpc'and LOWER(${mkt_campaign}) not like '%remarketing%' and  LOWER(${mkt_campaign}) not like '%brand%' and LOWER(${mkt_campaign}) not like '%nb_%' and LOWER(${mkt_campaign}) not like '%property_%'  then 'Google Ads Non-Branded Search'
    when ${ga_source}='google' and ${ga_medium}='cpc'and LOWER(${mkt_campaign}) not like '%remarketing%' and  LOWER(${mkt_campaign}) not like '%brand%' and (LOWER(${mkt_campaign}) like '%nb_%' or LOWER(${mkt_campaign}) like '%property_%')  then 'Google Ads Property Brands Search'
    when ${ga_source}='google' and ${ga_medium}='nonpaid' and  LOWER(${ga_campaign}) = 'gmb' then 'Google My Business'
    when ${ga_source}='kasa' and ${ga_medium}= 'gx' then 'GX referrals'
    when ${ga_source}='kasa' and ${ga_medium}='crm' then 'Braze Newsletters'
    when ${ga_source}='kasa' and ${ga_medium}='brz' then 'Braze Programs'
    when ${ga_source}='bing' and ${ga_medium}= 'cpc' then 'Bing Ads'
    when ${ga_source}='bing' and ${ga_medium}= 'paid' then 'Bing Ads'
    when ${ga_source}='tripadvisor'  then 'tripadvisor'
    when ${ga_source}='bing' and ${ga_medium}='organic' then 'Bing Organic Search'
    when ${ga_source}='google' and ${ga_medium}='organic' then 'Google Organic Search'
    when ${ga_medium}='organic' then 'Other Organic Search'
    when ${ga_source}='facebook.com' and ${ga_medium}='referral' then 'Facebook Organic'
    when ${ga_source}='instagram.com' and ${ga_medium}='referral' then 'Instagram Organic'
    when ${ga_campaign}='metasearch' then 'Metasearch'
    when ${ga_medium}='meta' then 'Metasearch'
    when LOWER(${ga_source})='facebook' and LOWER(${ga_medium})='paid' then 'Facebook Paid'
    when ${ga_source}='untracked' then 'Untracked'
    else 'Remaining Unpaid Traffic'
    end;;
    drill_fields: [ga_source, ga_medium, ga_campaign, ga_ad_content, ga_keyword]
    label: "Custom Channel Grouping"
  }

 dimension: custom_paid_media_grouping {
  type: string
  sql:
  Case
  when ${mkt_channel} = 'Google Ads' and LOWER(${mkt_campaign}) like '%brand%' then 'Google Ads Branded Search'
  when ${mkt_channel} = 'Google Ads' and LOWER(${mkt_campaign}) like '%remarketing%' then 'Google Ads Display'
  when ${mkt_channel} = 'Google Ads' and LOWER(${mkt_campaign}) not like '%remarketing%' and  LOWER(${mkt_campaign}) not like '%brand%'  then 'Google Ads Non-Branded Search'
  else ${mkt_channel}
  end;;
  drill_fields: [mkt_campaign, mkt_ad_group, mkt_ad]
  }

  dimension: paid_unpaid_braze_traffic {
    type: string
    sql:
      CASE
      when ${ga_source}='kasa' and ${ga_medium}='crm' then 'Braze CRM'
      else ${paid_unpaid_traffic}
      end
     ;;
  }

}
