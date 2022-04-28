view: revenue_predictor {
  view_label: "Last 7 Day Conversion"
  derived_table: {
    sql: WITH calendar_dates AS (WITH
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
          )
    SELECT
    RIGHT(IF(INSTR(ga_sessions_struct__website_events.website_event_url,'?')=0,ga_sessions_struct__website_events.website_event_url,LEFT(ga_sessions_struct__website_events.website_event_url,INSTR(ga_sessions_struct__website_events.website_event_url,'?')-1)),
    IF(LENGTH(IF(INSTR(ga_sessions_struct__website_events.website_event_url,'?')=0,ga_sessions_struct__website_events.website_event_url,LEFT(ga_sessions_struct__website_events.website_event_url,INSTR(ga_sessions_struct__website_events.website_event_url,'?')-1)))-INSTR(ga_sessions_struct__website_events.website_event_url,'locations/')-10<0,0,
    LENGTH(IF(INSTR(ga_sessions_struct__website_events.website_event_url,'?')=0,ga_sessions_struct__website_events.website_event_url,LEFT(ga_sessions_struct__website_events.website_event_url,INSTR(ga_sessions_struct__website_events.website_event_url,'?')-1)))-INSTR(ga_sessions_struct__website_events.website_event_url,'locations/')-9))
     AS ga_sessions_struct__website_events_website_event_location_label,
    COUNT(DISTINCT if(((ga_sessions_struct__website_events.website_event_category ) = 'Ecommerce' OR (ga_sessions_struct__website_events.website_event_category ) = 'All') AND ((ga_sessions_struct__website_events.website_event_action ) = 'categoryView' OR (ga_sessions_struct__website_events.website_event_action ) = 'Location Viewed'), ga_sessions_struct.session_id , NULL)) AS ga_sessions_struct__website_events_categoryview_sessions_1,
    COUNT(DISTINCT ga_sessions_struct__transaction_events.transaction_event_id ) AS ga_sessions_struct__transaction_events_transaction_volume
    FROM calendar_dates
    LEFT JOIN `bigquery-analytics-272822.ME_BI_prod.GA_sessions_struct`
     AS ga_sessions_struct ON (DATE(timestamp(calendar_dates.calendar_date), 'America/Los_Angeles')) = (DATE(ga_sessions_struct.session_timestamp , 'America/Los_Angeles'))
    LEFT JOIN UNNEST(ga_sessions_struct.website_events) as ga_sessions_struct__website_events
    LEFT JOIN UNNEST(ga_sessions_struct.transaction_events) as ga_sessions_struct__transaction_events
    LEFT JOIN `bigquery-analytics-272822.ME_BI_prod.GA_utm_dictionary`
     AS ga_utm_dictionary ON ga_sessions_struct.utm_key_id = ga_utm_dictionary.utm_key_id
    WHERE (ga_sessions_struct__website_events.website_event_action ) IN ('Location Viewed', 'categoryView') AND (Case
    when ga_utm_dictionary.ga_source='(direct)' and ga_utm_dictionary.ga_medium='(none)' then 'Direct'
    when ga_utm_dictionary.ga_source='google' and ga_utm_dictionary.ga_medium='cpc' and LOWER(ga_utm_dictionary.mkt_campaign) like '%brand%' then 'Google Ads Branded Search'
    when ga_utm_dictionary.ga_source='google' and ga_utm_dictionary.ga_medium='cpc' and LOWER(ga_utm_dictionary.mkt_campaign) like '%remarketing%' then 'Google Ads Display'
    when ga_utm_dictionary.ga_source='google' and ga_utm_dictionary.ga_medium='cpc'and LOWER(ga_utm_dictionary.mkt_campaign) not like '%remarketing%' and   LOWER(ga_utm_dictionary.mkt_campaign) not like '%brand%'  then 'Google Ads Non-Branded Search'
    when ga_utm_dictionary.ga_source='google' and ga_utm_dictionary.ga_medium='nonpaid' and  LOWER(ga_utm_dictionary.ga_campaign) = 'gmb' then 'Google My Business'
    when ga_utm_dictionary.ga_source='kasa' and ga_utm_dictionary.ga_medium= 'gx' then 'GX referrals'
    when ga_utm_dictionary.ga_source='kasa' and ga_utm_dictionary.ga_medium='crm' then 'Braze CRM'
    when ga_utm_dictionary.ga_source='tripadvisor'  then 'tripadvisor'
    when ga_utm_dictionary.ga_medium='organic' then 'Organic Search'
    when ga_utm_dictionary.ga_source='facebook.com' and ga_utm_dictionary.ga_medium='referral' then 'Facebook Organic'
    when ga_utm_dictionary.ga_source='instagram.com' and ga_utm_dictionary.ga_medium='referral' then 'Instagram Organic'
    when ga_utm_dictionary.ga_campaign='metasearch' then 'Metasearch'
    when LOWER(ga_utm_dictionary.ga_source)='facebook' and LOWER(ga_utm_dictionary.ga_medium)='paid' then 'Facebook Paid'
    when ga_utm_dictionary.ga_source='untracked' then 'Untracked'
    else 'Remaining Unpaid Traffic'
    end) IN ('Google Ads Branded Search', 'Google Ads Display', 'Google Ads Non-Branded Search', 'Metasearch', 'Organic Search') AND (
  ((( (timestamp(calendar_dates.calendar_date)) ) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'America/Los_Angeles'), INTERVAL -7 DAY))) AND ( (timestamp(calendar_dates.calendar_date)) ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'America/Los_Angeles'), INTERVAL -7 DAY), INTERVAL 7 DAY))))))

    GROUP BY 1 ;;
  }

  dimension: website_event_location_label {
    label: "Website Events Location - Search List"
    type: string
    primary_key: yes
    sql: ${TABLE}.ga_sessions_struct__website_events_website_event_location_label ;;
  }

  dimension: events_city_state {
    label: "Website Events Location - City, State"
    description: "This field has been created to associate cities to website event locations"
    type: string
    sql:    if(${website_event_location_label} = "austin-tx","Austin, TX",
            if(${website_event_location_label} = "ocean-city-md","Ocean City, MD",
            if(${website_event_location_label} = "denver-co","Denver, CO",
            if(${website_event_location_label} = "alexandria-va","Alexandria, VA",
            if(${website_event_location_label} = "arlington-tx","Arlington, TX",
            if(${website_event_location_label} = "arlington-va","Arlington, VA",
            if(${website_event_location_label} = "atlanta-ga","Atlanta, GA",
            if(${website_event_location_label} = "bellevue-wa","Bellevue, WA",
            if(${website_event_location_label} = "charlotte-nc","Charlotte, NC",
            if(${website_event_location_label} = "columbia-sc","Columbia, SC",
            if(${website_event_location_label} = "chicago-il","Chicago, IL",
            if(${website_event_location_label} = "dallas-tx" OR ${website_event_location_label} = "dallas-fort-worth-area-tx","Dallas, TX",
            if(${website_event_location_label} = "davenport-fl" OR ${website_event_location_label} = "disney-world-orlando-area-fl","Davenport, FL",
            if(${website_event_location_label} = "davie-fl" OR ${website_event_location_label} = "fort-lauderdale-area-fl","Davie, FL",
            if(${website_event_location_label} = "delray-beach-fl","Delray Beach, FL",
            if(${website_event_location_label} = "des-moines-ia","Des Moines, IA",
            if(${website_event_location_label} = "frisco-tx","Frisco, TX",
            if(${website_event_location_label} = "king-of-prussia-pa","King Of Prussia, PA",
            if(${website_event_location_label} = "louisville-ky","Louisville, KY",
            if(${website_event_location_label} = "memphis-tn","Memphis, TN",
            if(${website_event_location_label} = "milwaukee-wi","Milwaukee, WI",
            if(${website_event_location_label} = "minneapolis-mn","Minneapolis, MN",
            if(${website_event_location_label} = "nashville-tn","Nashville, TN",
            if(${website_event_location_label} = "new-haven-ct","New Haven, CT",
            if(${website_event_location_label} = "new-york-city-ny","New York City, NY",
            if(${website_event_location_label} = "orange-ca","Orange, CA",
            if(${website_event_location_label} = "philadelphia-area-pa","Others",
            if(${website_event_location_label} = "pittsburgh-pa","Pittsburgh, PA",
            if(${website_event_location_label} = "plano-tx","Plano, TX",
            if(${website_event_location_label} = "salt-lake-city-ut","Salt Lake City, UT",
            if(${website_event_location_label} = "san-diego-ca","San Diego, CA",
            if(${website_event_location_label} = "san-jose-ca","San Jose, CA",
            if(${website_event_location_label} = "san-mateo-ca","San Mateo, CA",
            if(${website_event_location_label} = "santa-clara-ca","Santa Clara, CA",
            if(${website_event_location_label} = "scottsdale-area-az","Others",
            if(${website_event_location_label} = "seattle-area-wa" OR ${website_event_location_label} = "seattle-wa","Seattle, WA",
            if(${website_event_location_label} = "slos-angeles-area-ca" OR ${website_event_location_label} = "los-angeles-ca","Others",
            if(${website_event_location_label} = "south-bend-in","South Bend, IN",
            if(${website_event_location_label} = "st-louis-mo","St. Louis, MO",
            if(${website_event_location_label} = "tempe-az","Tempe, AZ",
            if(${website_event_location_label} = "washington-area-dc","Others",
            if(${website_event_location_label} = "wellington-fl","Wellington, FL",
            if(${website_event_location_label} = "winston-salem-nc","Winston-Salem, NC",
            if(${website_event_location_label} = "san-francisco-bay-area-ca" OR ${website_event_location_label} = "san-francisco-ca","San Francisco, CA","Others")))))))))))))))))))))))))))))))))))))))))))) ;;
  }

  dimension: categoryView_sessions {
    hidden: yes
    label: "Website Events Sessions with Location Views"
    description: "Number of sessions with location view events registerd by Google Analytics"
    type: number
    sql: ${TABLE}.ga_sessions_struct__website_events_categoryview_sessions_1 ;;
  }
  dimension: transaction_volume {
    hidden: yes
    label: "Transaction Website Events Website Booking Volume"
    description: "Volume of bookings registered on site by Google Analytics"
    type: number
    sql: ${TABLE}.ga_sessions_struct__transaction_events_transaction_volume ;;
  }

  measure: categoryView_sessions_measure {
    label: "Website Events Sessions with Location Views"
    description: "Number of sessions with location view events registerd by Google Analytics"
    type: sum_distinct
    sql: ${categoryView_sessions} ;;
  }

  measure: transaction_volume_measure {
    label: "Transaction Website Events Website Booking Volume"
    description: "Volume of bookings registered on site by Google Analytics"
    type: sum_distinct
    sql: ${transaction_volume} ;;
  }

  measure: conversions {
    label: "Website Conversions"
    description: "Booking Volumes / Session Views"
    type: number
    value_format: "0.000"
    sql: ${transaction_volume_measure} / ${categoryView_sessions_measure} ;;
  }
}

view: revenue_predictor_occupancy {
  view_label: "Last 7 Day Occupancy"
  derived_table: {
    sql:
    SELECT CONCAT(units.address.city,", ",units.address.state)  AS geo_location_city_state,
            COUNT(DISTINCT CASE WHEN ((DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) < (DATE(CAST(reservations_v3.checkoutdate as TIMESTAMP), 'America/Los_Angeles')) and
            (DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) >= (DATE(TIMESTAMP(reservations_v3.checkindate), 'America/Los_Angeles'))) AND (reservations_v3.status_revised LIKE 'checked_in' OR reservations_v3.status_revised = 'confirmed') THEN CONCAT( reservations_v3.confirmationcode  , '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) )) ELSE NULL END) / NULLIF(COUNT(DISTINCT CASE WHEN ((capacities.propUnitCd LIKE "%-XX") OR (capacities.propUnitCd LIKE "%XXX") OR (capacities.propUnitCd LIKE "%-RES") OR (capacities.propUnitCd LIKE "%-S") OR (capacities.propUnitCd LIKE "%GXO%")) THEN NULL
            ELSE CONCAT(capacities.propUnitCd, '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) ))
            END), 0) AS reservations_v3_occupancy

        FROM `data-warehouse-333815.Warehouse.fctCapacity`  AS capacities
        INNER JOIN `bigquery-analytics-272822.dbt.units`  AS units ON capacities.unitIdCapacities = units._id
        LEFT JOIN `bigquery-analytics-272822.dbt.reservations_v3`   AS reservations_v3 ON units._id = reservations_v3.unit
        WHERE ((( CAST(capacities.nightAvailableDt as TIMESTAMP)  ) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY), INTERVAL -7 DAY))) AND ( CAST(capacities.nightAvailableDt as TIMESTAMP)  ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY), INTERVAL -7 DAY), INTERVAL 7 DAY)))))

        GROUP BY 1 ;;
  }

  dimension: city_state {
    label: "City, State"
    type: string
    primary_key: yes
    sql: ${TABLE}.geo_location_city_state ;;
  }

  dimension: occupancy {
    label: "Last 7 Day Occupancy"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${TABLE}.reservations_v3_occupancy ;;
  }

  measure: occupancy_measure {
    label: "Last 7 Day Occupancy"
    type: sum_distinct
    value_format: "0.0%"
    sql: ${occupancy} ;;
  }

}

view: revenue_predictor_occupancy_pace_1 {
  view_label: "Pacing Occupancy + 1"
  derived_table: {
    sql: SELECT CONCAT(units.address.city,", ",units.address.state)  AS geo_location_city_state,
        COUNT(DISTINCT CASE WHEN ((DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) < (DATE(CAST(reservations_v3.checkoutdate as TIMESTAMP), 'America/Los_Angeles')) and
        (DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) >= (DATE(TIMESTAMP(reservations_v3.checkindate), 'America/Los_Angeles'))) AND (reservations_v3.status_revised LIKE 'checked_in' OR reservations_v3.status_revised = 'confirmed') THEN CONCAT( reservations_v3.confirmationcode  , '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) )) ELSE NULL END) / NULLIF(COUNT(DISTINCT CASE WHEN ((capacities.propUnitCd LIKE "%-XX") OR (capacities.propUnitCd LIKE "%XXX") OR (capacities.propUnitCd LIKE "%-RES") OR (capacities.propUnitCd LIKE "%-S") OR (capacities.propUnitCd LIKE "%GXO%")) THEN NULL
          ELSE CONCAT(capacities.propUnitCd, '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) ))
          END), 0) AS reservations_v3_occupancy
FROM `data-warehouse-333815.Warehouse.fctCapacity`  AS capacities
INNER JOIN `bigquery-analytics-272822.dbt.units`  AS units ON capacities.unitIdCapacities = units._id
LEFT JOIN `bigquery-analytics-272822.dbt.reservations_v3`   AS reservations_v3 ON units._id = reservations_v3.unit
WHERE (((((( CAST(capacities.nightAvailableDt as TIMESTAMP)  ))) >= ((TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY))) AND ((( CAST(capacities.nightAvailableDt as TIMESTAMP)  ))) < ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY), INTERVAL 7 DAY))))))
GROUP BY 1
;;
  }

  dimension: city_state {
    label: "City, State"
    type: string
    primary_key: yes
    sql: ${TABLE}.geo_location_city_state ;;
  }

  dimension: pacing_occupancy {
    label: "Pacing Occupancy + 1"
    hidden: yes
    type: number
    value_format: "0.0%"
    sql: ${TABLE}.reservations_v3_occupancy ;;
  }

  measure: pacing_occupancy_measure {
    label: "Pacing Occupancy + 1"
    type: sum_distinct
    value_format: "0.0%"
    sql: ${pacing_occupancy} ;;
  }
}

view: revenue_predictor_occupancy_pace_2 {
  view_label: "Pacing Occupancy + 2"
  derived_table: {
    sql: SELECT CONCAT(units.address.city,", ",units.address.state)  AS geo_location_city_state,
        COUNT(DISTINCT CASE WHEN ((DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) < (DATE(CAST(reservations_v3.checkoutdate as TIMESTAMP), 'America/Los_Angeles')) and
        (DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) )) >= (DATE(TIMESTAMP(reservations_v3.checkindate), 'America/Los_Angeles'))) AND (reservations_v3.status_revised LIKE 'checked_in' OR reservations_v3.status_revised = 'confirmed') THEN CONCAT( reservations_v3.confirmationcode  , '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) )) ELSE NULL END) / NULLIF(COUNT(DISTINCT CASE WHEN ((capacities.propUnitCd LIKE "%-XX") OR (capacities.propUnitCd LIKE "%XXX") OR (capacities.propUnitCd LIKE "%-RES") OR (capacities.propUnitCd LIKE "%-S") OR (capacities.propUnitCd LIKE "%GXO%")) THEN NULL
          ELSE CONCAT(capacities.propUnitCd, '-', ( DATE(CAST(capacities.nightAvailableDt as TIMESTAMP) ) ))
          END), 0) AS reservations_v3_occupancy
FROM `data-warehouse-333815.Warehouse.fctCapacity`  AS capacities
INNER JOIN `bigquery-analytics-272822.dbt.units`  AS units ON capacities.unitIdCapacities = units._id
LEFT JOIN `bigquery-analytics-272822.dbt.reservations_v3`   AS reservations_v3 ON units._id = reservations_v3.unit
WHERE (((((( CAST(capacities.nightAvailableDt as TIMESTAMP)  ))) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY), INTERVAL 7 DAY))) AND ((( CAST(capacities.nightAvailableDt as TIMESTAMP)  ))) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', CURRENT_TIMESTAMP(), 'America/Los_Angeles')), DAY), INTERVAL 7 DAY), INTERVAL 7 DAY))))))
GROUP BY
    1
;;
  }

  dimension: city_state {
    label: "City, State"
    type: string
    primary_key: yes
    sql: ${TABLE}.geo_location_city_state ;;
  }

  dimension: pacing_occupancy {
    label: "Pacing Occupancy + 2"
    hidden: yes
    type: number
    value_format: "0.0%"
    sql: ${TABLE}.reservations_v3_occupancy ;;
  }

  measure: pacing_occupancy_measure {
    label: "Pacing Occupancy + 2"
    type: sum_distinct
    value_format: "0.0%"
    sql: ${pacing_occupancy} ;;
  }

}
