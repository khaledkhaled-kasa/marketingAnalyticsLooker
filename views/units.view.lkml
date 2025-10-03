view: units {

  sql_table_name: `data-warehouse-333815.Warehouse.dimUnits` ;;

  dimension: _id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.unitId ;;
  }

  dimension: room_type_has_parking {
    type: yesno
    label: "Room Type Has Parking"
    view_label: "Buildings & Geographic"
    hidden: no
    group_label: "Parking Details"
    description: "This is pulled from Portfolio Manager"
    sql: ${TABLE}.roomtypehasparking ;;
  }

  dimension: property_parking_modified_date {
    type: date
    label: "Property Paid Parking Modified Date"
    view_label: "Buildings & Geographic"
    hidden: no
    group_label: "Parking Details"
    description: "This is pulled from Portfolio Manager"
    sql: TIMESTAMP(${TABLE}.propertyParkingModifiedAt) ;;
  }

  dimension: property_parking_paid {
    type: yesno
    label: "Property Parking Paid"
    view_label: "Buildings & Geographic"
    hidden: no
    group_label: "Parking Details"
    description: "This is pulled from Portfolio Manager"
    sql: propertyParkingPaid ;;
  }

  dimension: unit_id_capacities {
    hidden: yes
    type: string
    sql: ${TABLE}.unitIdCapacities ;;
  }

  dimension: UID {
    hidden:  yes # yes
    description: "UID from PM"
    type: string
    sql: ${TABLE}.unitPropCode ;;
  }

  dimension: room_type {
    label: "Room Type (Kontrol)"
    description: "This field is used by Marketing to segment different room types based on Guesty Listings"
    type: string
    sql: ${TABLE}.roomType ;;
  }

  dimension: room_type_id {
    label: "Room Type ID"
    type: string
    sql: ${TABLE}.roomTypeId ;;
  }

# City, States and Region are getting pulled from Geo Location
  dimension: city {
    type: string
    label: "City"
    hidden: no
    view_label: "Buildings & Geographic"
    sql: ${TABLE}.city;;
  }

  dimension: metro {
    view_label: "Buildings & Geographic"
    label: "Metro Area"
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension: state {
    label: "State"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: zip {
    hidden: no
    view_label: "Buildings & Geographic"
    label: "ZIP Code"
    description: "Property ZIP code (only available for active properties)"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: street {
    hidden: no
    view_label: "Buildings & Geographic"
    label: "Street"
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: location_lon_lat {
    hidden: no
    view_label: "Buildings & Geographic"
    label: "Latitude/Longitude"
    description: "Property longitude and latitude (only available for active properties)"
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: segment {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: year_built {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.yearBuilt ;;
  }

  dimension: product_type {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.productType ;;
  }

  dimension: property_persona {
    type: string
    view_label: "Buildings & Geographic"
    hidden: no
    group_label: "Guest Personas"
    description: "This will display the most dominant guest persona of a given property"
    sql: ${TABLE}.propPersona ;;
  }

  dimension: property_persona_breakdown {
    view_label: "Buildings & Geographic"
    hidden: no
    type: string
    group_label: "Guest Personas"
    description: "This will show the break-down of the guest personas for a given property"
    sql: ${TABLE}.propPersonaBreakdown ;;
  }

  dimension: lm_property_id {
    hidden: yes
    type: string
    sql: ${TABLE}.lm_propertyId ;;
  }

  dimension: lm_room_type_id {
    hidden: yes
    type: string
    sql: ${TABLE}.lm_roomTypeId ;;
  }

  dimension: lm_layout_type {
    hidden: no
    label: "Layout Type"
    type: string
    sql: ${TABLE}.lm_layoutType ;;
  }

  measure: booking_dot_com_fee {
    description: "This will pull the value from Portfolio Manager"
    label: "Booking.com Fee"
    view_label: "Buildings & Geographic"
    hidden: yes
    type: max
    value_format: "$#,##0"
    sql: ${TABLE}.bookingDotComCleaningFee ;;
  }

  measure: extra_person_fee {
    description: "This will pull the value from Portfolio Manager"
    label: "Extra Person Fee"
    view_label: "Buildings & Geographic"
    type: max
    hidden: yes
    value_format: "$#,##0"
    sql: ${TABLE}.extraPersonFee ;;
  }

  dimension: parking_fee_range {
    description: "Parking fee range varies based on the length of stay"
    label: "Parking Fee"
    view_label: "Buildings & Geographic"
    type: string
    hidden: yes
    sql: ${TABLE}.parkingFeeRange ;;
  }

  dimension: cleaning_fee_range {
    description: "This will pull the value from Portfolio Manager"
    label: "Cleaning Fee"
    view_label: "Buildings & Geographic"
    type: string
    hidden: yes
    sql: ${TABLE}.cleaningFeeRange ;;
  }

  dimension: has_stairs {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: yesno
    sql: ${TABLE}.hasStairs ;;
  }

  measure: has_stairs_measure {
    hidden: yes
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: max
    sql: ${has_stairs} ;;
  }

  dimension: has_washer_dryer {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: yesno
    sql: ${TABLE}.hasWasherAndDryer ;;
  }

  measure: has_washer_dryer_measure {
    hidden: yes
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: max
    sql: ${TABLE}.hasWasherAndDryer ;;
  }

  dimension: parking_spots {
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: number
    sql: ${TABLE}.parkingSpots ;;
    link: {
      label: "Navigate to Kontrol"
      url: "https://pms.kasa.com/properties/{{propcode._value}}/units/{{internaltitle._value}}#unit-parking"
    }
  }

  dimension: unit_star_rating {
    label: "Unit Star Rating (PM)"
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: number
    sql: ${TABLE}.unitStarRating ;;
  }

  measure: parking_spots_measure {
    hidden: yes
    description: "This will pull the value from Portfolio Manager"
    view_label: "Units"
    type: max
    sql: ${TABLE}.parkingSpots ;;
  }

  dimension: max_parking_spots {
    hidden: yes
    description: "This will total the available parking spots from Portfolio Manager via roomtype"
    view_label: "Units"
    type: number
    sql: ${TABLE}.maxNumberOfParkingSpots ;;
  }

  measure: parking_spots_total {
    hidden: no
    description: "This will total the available parking spots from Portfolio Manager via roomtype"
    view_label: "Units"
    type: sum
    sql: ${max_parking_spots} ;;
  }

  dimension: city_state {
    type: string
    view_label: "Buildings & Geographic"
    description: "Appends together City and State in 1 column"
    label: "City, State"
    sql: ${TABLE}.cityState ;;
  }

  dimension: region {
    view_label: "Buildings & Geographic"
    type: string
    hidden: yes
    label: "Region (Old)"
    sql: ${TABLE}.region ;;
  }

  dimension: portfolio {
    view_label: "Buildings & Geographic"
    type: string
    hidden: no
    sql: ${TABLE}.oldPortfolio ;;
  }

  dimension: booking_url {
    view_label: "Buildings & Geographic"
    group_label: "URL"
    label: "Booking URL"
    type: string
    sql: ${TABLE}.bookingUrl ;;
    link: {
      label: "Navigate to Booking.com"
      url: "{{ value }}"
    }
  }

  dimension: expedia_url {
    view_label: "Buildings & Geographic"
    group_label: "URL"
    label: "Expedia URL"
    type: string
    sql: ${TABLE}.expediaUrl ;;
    link: {
      label: "Navigate to Expedia"
      url: "{{ value }}"
    }
  }

  dimension: google_url {
    view_label: "Buildings & Geographic"
    group_label: "URL"
    label: "Google URL"
    type: string
    sql: ${TABLE}.googleUrl ;;
    link: {
      label: "Navigate to Google"
      url: "{{ value }}"
    }
  }

  dimension: kasa_com_url {
    view_label: "Buildings & Geographic"
    group_label: "URL"
    label: "Kasa.com URL"
    type: string
    sql: ${TABLE}.kasaComUrl ;;
    link: {
      label: "Navigate to Kasa.com"
      url: "{{ value }}"
    }
  }

  dimension: tripadvisor_url {
    view_label: "Buildings & Geographic"
    group_label: "URL"
    label: "Tripadvisor URL"
    type: string
    sql: ${TABLE}.tripadvisorUrl ;;
    link: {
      label: "Navigate to TripAdvisor"
      url: "{{ value }}"
    }
  }

  # dimension: city_code {
  #   label: "City Code"
  #   type: string
  #   sql: ${TABLE}.cityCode ;;
  # }

  dimension: city_full_uid {
    label: "UID (Full)"
    hidden: yes
    view_label: "Units"
    type: string
    sql: ${TABLE}.cityFullUid ;;
  }

  dimension_group: Date_Contract_Signed {
    label: "Contract Signed"
    view_label: "Units"
    description: "This will pull the contract signed date from Col BK of the Kasa Portfolio Overview"
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.contractSignedDt ;;
    convert_tz: no
    # html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension_group: effective_date {
    label: "Contract Effective"
    hidden: yes
    view_label: "Units"
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.effectiveDt ;;
    convert_tz: no
    # html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension: initial_contract_signed_date {
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: date
    hidden: yes
    sql: ${TABLE}.initialContractStartDate ;;
    convert_tz: no
  }

  dimension_group: availability_startdate
  {
    label: "Unit Availability Start"
    description: "First Available Date as per Portfolio Manager"
    type: time
    view_label: "Units"
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.unitAvailabilityStartDt) ;;
    convert_tz: no
    # html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension_group: availability_startdate_v2
  {
    label: "Unit Availability Start"
    description: "First Available Date as per Portfolio Manager"
    type: time
    view_label: "Units"
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.unitAvailabilityStartDt) ;;
    convert_tz: no
    hidden: yes
    html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension_group: availability_enddate {
    label: "Unit Availability End"
    description: "Deactivation Date as per Portfolio Manager"
    type: time
    view_label: "Units"
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.unitAvailabilityEndDt);;
    convert_tz: no
    # html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension_group: availability_enddate_v2 {
    label: "Unit Availability End"
    description: "Deactivation Date as per Portfolio Manager"
    type: time
    view_label: "Units"
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.unitAvailabilityEndDt);;
    convert_tz: no
    hidden: yes
    html: <a href="https://pms.kasa.com/properties/{{ propcode_original._value }}/buildings/{{ buildinginternaltitle._value }}/units/{{ UID._value }}#unit-contract-details" target="_blank" style="color: #00008B; text-decoration: underline;">{{ rendered_value }}</a> ;;
  }

  dimension: current_contract_signed_date {
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: date
    hidden: no
    sql: ${TABLE}.currentContractStartDate ;;
    convert_tz: no
  }

  dimension: latest_expiration_date {
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: date
    hidden: yes
    sql: ${TABLE}.latestExpirationDate ;;
    convert_tz: no
  }

  dimension: extension_option {
    type: string
    hidden: yes
    description: "as per Portfolio Manager"
    view_label: "Units"
    sql: ${TABLE}.extensionOption ;;
  }

  dimension: renewal_notification_ {
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: number
    hidden: yes
    label: "Renewal Notification pre-expire"
    sql: ${TABLE}.renewalNotificationPreExpire ;;
  }

  dimension: current_term_period {
    hidden: yes
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: number
    sql: ${TABLE}.currentTerm ;;
  }

  dimension: renewal_notice_sent_date {
    description: "as per Portfolio Manager"
    view_label: "Units"
    type: date
    hidden: yes
    sql: ${TABLE}.renewalNoticeSentDate ;;
    convert_tz: no
  }

  dimension: contract_type {
    type: string
    label: "Contract Type"
    sql: ${TABLE}.contractType ;;
  }

  dimension: count_fg {
    label: "# of Unique Units"
    description: "This includes all units we had during the time-period of interest. This would count a unit that moved out mid-month as an entire unit. On the other hand, the # of units available takes into consideration the # of active nights in a given time period"
    hidden: yes
    type: number
    sql: ${TABLE}.countFg;;
  }

  dimension: combined_nqs__overall_dim_ {
    label: "Building Profitable NQS Target"
    hidden: yes
    view_label: "GM Portfolio Ops/Reviews Thresholds"
    type:number
    value_format: "0"
    sql: ${TABLE}.profitableNQS    ;;
  }

  dimension: combined_nqs__overall_reach_dim_ {
    label: "Building Min. Quality Threshold (Reach)"
    hidden: yes
    view_label: "GM Portfolio Ops/Reviews Thresholds"
    type:number
    value_format: "0"
    sql: ${TABLE}.minQualityThreshold    ;;
  }

  dimension: unit_status {
    description: "Status of Unit (Active/Deactivated/Expiring/Onboarding)"
    type: string
    sql: ${TABLE}.unitCurrentStatus ;;
  }

  dimension: active_property {
    type: yesno
    sql: ${unit_status} != "Deactivated" ;;
  }

  dimension: unit_status_pm {
    label: "Unit Status (PM)"
    hidden: yes
    description: "Status of Unit (Active/Deactivated/Expiring/Onboarding)"
    type: string
    sql: CASE
      WHEN ${TABLE}.pmStatus = "onboarding" THEN "Onboarding"
      WHEN ${TABLE}.pmStatus = "published" THEN "Active"
      WHEN ${TABLE}.pmStatus = "deactivated" THEN "Deactivated"
      END ;;
  }

  dimension: availability_enddate_string {
    hidden: yes
    type:  string
    label: "Unit Availability End Date"
    sql: ${TABLE}.availabilityEndDt;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}.bathroomCt;;
  }

  dimension: bedrooms {
    type: number
    sql: ${TABLE}.bedroomCt ;;
  }

  dimension: bedroom_type {
    type: string
    hidden: yes
    sql: ${TABLE}.bedroomBathroom ;;
  }

  dimension: complex {
    label: "Property ID"
    view_label: "Buildings & Geographic"
    description: "This is the unique property id stored in our internal database"
    hidden: yes
    type: string
    sql: ${TABLE}.complexId ;;
  }

  dimension: breezeway_id {
    label: "Breezeway ID"
    hidden: yes
    type: string
    sql: ${TABLE}.breezewayId;;
  }

  # dimension: door {
  #   hidden: yes
  #   sql: ${TABLE}.doorNum ;;
  # }

  dimension: floor {
    type: string
    sql: ${TABLE}.floorNum ;;
  }

  dimension: sqfootage {
    type: number
    value_format: "0"
    label: "Square Footage"
    sql: ${TABLE}.sqFeet ;;
  }

  measure: sqfootage_min {
    hidden: yes
    type: min
    value_format: "0"
    label: "Square Footage (Min)"
    sql: ${TABLE}.sqFeet ;;
  }

  measure: sqfootage_max {
    hidden: yes
    type: max
    value_format: "0"
    label: "Square Footage (Max)"
    sql: ${TABLE}.sqFeet ;;
  }

  measure: sqfootage_total {
    hidden: no
    type: sum_distinct
    value_format: "0"
    label: "Square Footage"
    sql: ${TABLE}.sqFeet ;;
  }

  # dimension: floor__it {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.floor__it ;;
  # }

  dimension: hashighriskneighbor {
    label: "Has High Risk Neighbor?"
    type: yesno
    sql: ${TABLE}.hasHighRiskNeighborFg ;;
  }

  dimension: oldunit {
    label: "Old Unit?"
    description: "This is referring to the old unit when a unit swap takes place"
    type: yesno
    sql: ${TABLE}.oldUnit = 1 ;;
  }

  dimension: hassmartlock {
    label: "Has Smart Lock?"
    type: yesno
    sql: ${TABLE}.hasSmartLockFg ;;
  }

  dimension: internaltitle {
    label: "Unit #"
    type: string
    sql: ${TABLE}.lookerUnitPropCode ;;
  }

  dimension: evergreen_prop_id {
    label: "Evergreen Prop ID"
    type: string
    hidden: yes
    sql: ${TABLE}.everGreenPropId ;;
  }

  dimension: prop_time_zone {
    view_label: "Buildings & Geographic"
    label: "Building Time Zone"
    hidden: no
    type: string
    sql: ${TABLE}.propTimeZone ;;
  }

  dimension: location_type {
    view_label: "Buildings & Geographic"
    type: string
    hidden: no
    sql: ${TABLE}.locationType ;;
  }

  dimension: property_units {
    label: "# of Units at Property"
    view_label: "Buildings & Geographic"
    type: string
    hidden: no
    sql: ${TABLE}.totalUnitsOfProperty ;;
  }

  dimension: owner_type {
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.ownerType ;;
  }

  dimension: property_manager {
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.propertyManager ;;
  }

  dimension: lock_id {
    hidden: yes
    type: string
    sql: ${TABLE}.lockId ;;
  }

  dimension: lockmodel{
    label: "Lock Model"
    type: string
    hidden: yes
    sql: ${TABLE}.lockModel;;
  }

  dimension: nexiaid {
    label: "Nexia ID"
    hidden: yes
    type: string
    sql: ${TABLE}.nexiaId ;;
  }

  dimension: petsallowed {
    label: "Pets Allowed?"
    type: yesno
    sql: ${TABLE}.petsAllowedFg ;;
  }

  dimension: airbnbid {
    label: "Airbnb ID"
    description: "This airbnbid may be dedicated for a single listing or a parent listing (group of units)"
    type: string
    sql: ${TABLE}.airbnbId ;;
    link: {
      label: "Navigate to Airbnb"
      url: "https://www.airbnb.com/rooms/{{ value }}"
    }
  }

  dimension: airbnb_url {
    label: "Airbnb URL"
    type: string
    sql: CONCAT("https://www.airbnb.com/rooms/",${TABLE}.airbnbId) ;;
    link: {
      label: "Navigate to Airbnb"
      url: "{{ value }}"
    }
  }

  dimension: title {
    type: string
    hidden: no
    sql: ${TABLE}.unitTitle ;;
  }

  dimension: new_partner {
    label: "Partner (New/Existing)"
    description: "This will pull the value from Portfolio Manager"
    type: string
    sql: ${TABLE}.newPartner ;;
  }

  dimension: cleaning_status {
    type: string
    hidden: yes
    sql: ${TABLE}.cleaningStatus ;;
  }

  dimension: min_Len_Of_Stay_Sunday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Sunday"
    description: "Unit minimum length of stay for Sunday"
    type: string
    sql: ${TABLE}.minLenOfStaySunday ;;
  }

  dimension: min_Len_Of_Stay_Monday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Monday"
    description: "Unit minimum length of stay for Monday"
    type: string
    sql: ${TABLE}.minLenOfStayMonday ;;
  }

  dimension: min_Len_Of_Stay_Tuesday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Tuesday"
    description: "Unit minimum length of stay for Tuesday"
    type: string
    sql: ${TABLE}.minLenOfStayTuesday ;;
  }

  dimension: min_Len_Of_Stay_Wednesday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Wednesday"
    description: "Unit minimum length of stay for Wednesday"
    type: string
    sql: ${TABLE}.minLenOfStayWednesday ;;
  }

  dimension: min_Len_Of_Stay_Thursday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Thursday"
    description: "Unit minimum length of stay for Thursday"
    type: string
    sql: ${TABLE}.minLenOfStayThursday ;;
  }

  dimension: min_Len_Of_Stay_Friday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Friday"
    description: "Unit minimum length of stay for Friday"
    type: string
    sql: ${TABLE}.minLenOfStayFriday ;;
  }

  dimension: min_Len_Of_Stay_Saturday {
    group_label: "Minimum Length of Stay"
    label: "Minimum Length of Stay - Saturday"
    description: "Unit minimum length of stay for Saturday"
    type: string
    sql: ${TABLE}.minLenOfStaySaturday ;;
  }

  dimension: airbnb_pricing_strategy {
    hidden: yes
    view_label: "Buildings & Geographic"
    label: "Airbnb LoS Pricing Lift Strategy"
    type: string
    sql: ${TABLE}.airbnbPricingStrategy;;
  }

  dimension: propcode_original {
    hidden: yes
    view_label: "Buildings & Geographic"
    description: "This provides the raw property codes (for e.g. Ozark SFHs will not be grouped into the same entity, OZA)"
    label: "Property Code"
    type: string
    sql: ${TABLE}.propCode;;
  }

  # dimension: pivot_axis {
  #   hidden: no
  #   label_from_parameter: pivot_parm
  #   sql:
  #   {% if pivot_parm._parameter_value == "''" %}
  #   "Kasa Living"
  #   {% elsif pivot_parm._parameter_value == "'property_type_buckets'" %}
  #     ${units.property_type_buckets}
  #   {% elsif pivot_parm._parameter_value == "'RevenueManager'" %}
  #     ${units.RevenueManager}
  #   {% elsif pivot_parm._parameter_value == "'Portfolio'" %}
  #     ${units.Portfolio}
  #   {% elsif pivot_parm._parameter_value == "'city_state'" %}
  #     ${city_state}
  #   {% elsif pivot_parm._parameter_value == "'complex_title'" %}
  #     ${units.complex_title}
  #   {% else %}
  #     ${units.complex_title}
  #   {% endif %};;
  #   link: {
  #     label: "RPI Drill-Down by Portfolio Group Level"
  #     url: "/dashboards/1704?Portfolio+Group+Level={{ value }}&Reporting+Type={{ _filters['rpi.reporting_type'] | url_encode }}&Same+Store+Flag+%28Yes+%2F+No%29={{ _filters['rpi.same_store_flag'] | url_encode }}"
  #   }
  # }

  # parameter: pivot_parm {
  #   hidden: no
  #   type: string
  #   allowed_value: {
  #     label: "Kasa Living"
  #     value: ""
  #   }
  #   allowed_value: {
  #     label: "Property Category"
  #     value: "property_type_buckets"
  #   }
  #   allowed_value: {
  #     label: "Revenue Manager"
  #     value: "RevenueManager"
  #   }
  #   allowed_value: {
  #     label: "Region"
  #     value: "Portfolio"
  #   }
  #   allowed_value: {
  #     label: "Market"
  #     value: "city_state"
  #   }
  #   allowed_value: {
  #     label: "Property"
  #     value: "complex_title"
  #   }
  # }

  dimension: propcode {
    hidden: no
    view_label: "Buildings & Geographic"
    label: "Property Code"
    type: string
    sql: ${TABLE}.lookerPropCode;;
    # sql: CASE WHEN ${TABLE}.lookerPropCode IN ("ALH","ALR") THEN "ALL" ELSE ${TABLE}.lookerPropCode END ;;
  }

  dimension: company_id {
    label: "Company Id"
    description: "The Power By Company ID"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.companyId ;;
  }

  dimension: company_name {
    label: "Company Name"
    description: "The Power By Company Name"
    view_label: "Buildings & Geographic"
    type: string
    sql: ${TABLE}.companyName ;;
  }

  dimension: complex_title {
    view_label: "Buildings & Geographic"
    label: "Building Title"
    type: string
    sql: ${TABLE}.lookerPropTitle;;
  }

  dimension: complex_title_view {
    view_label: "Buildings & Geographic"
    label: "Building Title"
    type: string
    hidden: yes
    sql: ${TABLE}.lookerPropTitle;;
    link: {
      label: "View Dashboard"
      url: "/dashboards/2209?Property={{ value }}"
    }}

  dimension: complex_title_original {
    view_label: "Buildings & Geographic"
    label: "Building Title*"
    description: "This will pull the original building title such as Lantern or SSTBldg i.e. buildings that got split for reporting purposes"
    type: string
    hidden: no
    sql: ${TABLE}.propTitle;;
  }

  dimension: externalrefs_stripepayoutaccountid {
    view_label: "Buildings & Geographic"
    label: "Expected Stripe Account"
    hidden: yes
    type: string
    sql: ${TABLE}.externalrefs.propStripePayoutAccountId ;;
  }

  dimension: Portfolio {
    view_label: "Buildings & Geographic"
    label: "Region"
    hidden: no
    description: "This data point is pulled from Portfolio Manager"
    type: string
    sql: ${TABLE}.portfolio;;
  }

  dimension: Portfolio_drilldown {
    view_label: "Buildings & Geographic"
    label: "Region"
    hidden: yes
    description: "This data point is pulled from Portfolio Manager"
    type: string
    sql: ${TABLE}.portfolio;;
    link: {
      label: "Drill-down by Building"
      url: "https://kasaliving.looker.com/looks/2029?f[units.Portfolio]={{ value }}"
    }
  }

  dimension: portfolio_east_west {
    view_label: "Buildings & Geographic"
    label: "Portfolio East West"
    hidden: no
    description: "The portfolio parent category, where it is designated as PortfolioOps East or PortfolioOps West."
    type: string
    sql: ${TABLE}.portfolioEastWest;;
  }

  dimension: prop_short_name {
    view_label: "Buildings & Geographic"
    label: "Prop Short Name"
    hidden: yes
    description: "Property name used on the website"
    type: string
    sql: ${TABLE}.propShortName;;
  }

  dimension: property_owner {
    view_label: "Buildings & Geographic"
    description: "This data point is pulled from Portfolio Manager"
    hidden: no
    type: string
    sql: ${TABLE}.propOwner ;;
  }

  dimension: property_class {
    view_label: "Buildings & Geographic"
    description: "This data point is pulled from Portfolio Manager"
    hidden: no
    type: string
    sql: ${TABLE}.propClass ;;
  }


  dimension: marketing_property_dash_transition {
    type: string
    sql: "Click to continue ⏭️️ " ;;
    link: {
      label: "Move to next Dashboard"
      url: "https://kasaliving.looker.com/dashboards-next/439?Building%20Filter={{ _filters['complex_title'] | url_encode }}&City%20Filter={{ _filters['city'] | url_encode }}"
    }
  }

  # dimension: PropOfficial {
  #   hidden: yes
  #   view_label: "Field Operations Information"
  #   type: string
  #   sql: ${TABLE}.propOfficial ;;
  # }

  dimension: transition_to_this_month {
    # type: string
    hidden: yes
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/384?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/L0nTzjL/Screen-Shot-2022-11-03-at-7-50-08-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_this_month_yoy {
    # type: string
    hidden: no
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/512?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/L0nTzjL/Screen-Shot-2022-11-03-at-7-50-08-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_next_month {
    # type: string
    hidden: yes
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/385?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/2ckdbsh/Screen-Shot-2022-11-03-at-7-50-13-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_next_month_yoy {
    # type: string
    hidden: no
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/524?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/2ckdbsh/Screen-Shot-2022-11-03-at-7-50-13-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_next_two_months {
    # type: string
    hidden: yes
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/386?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/hsDQKwz/Screen-Shot-2022-11-03-at-7-50-19-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_next_two_months_yoy {
    # type: string
    hidden: no
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/525?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://i.ibb.co/hsDQKwz/Screen-Shot-2022-11-03-at-7-50-19-PM.png"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_yoy {
    # type: string
    hidden: yes
    sql: ""  ;;
    html: <a href="https://kasaliving.looker.com/dashboards/512?Building={{ _filters['units.complex_title'] | url_encode }}&City={{ _filters['units.city'] | url_encode }}&Property+Owner={{ _filters['units.property_owner'] | url_encode }}&Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Revenue+Manager={{ _filters['units.RevenueManager'] | url_encode }}"><img src="https://drive.google.com/uc?export=view&id=11USpOgfqulkjk8zxyLmrvEots6YYQHrX"width="75" height="75"/></a> ;;
  }

  dimension: transition_to_overview {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/660?Portfolio={{ value }}"><font size = "4">Overview</font></a> ;;
  }

  dimension: transition_to_finance {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/670?Portfolio={{ value }}"><font size = "4">Financials</font></a> ;;
  }

  dimension: transition_to_operations {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/671?Portfolio={{ value }}"><font size = "4">Operations</font></a> ;;
  }

  dimension: transition_to_quality {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/672?Portfolio={{ value }}"><font size = "4">Quality</font></a> ;;
  }

  dimension: transition_to_feel_good_dash {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/769?Portfolio={{ value }}"><font size = "6"; color = "orange")>Cheer up! It's not all bad reviews. Click here to check out the <b>Feel Good Dash</b> 😃 🏝 </font></a> ;;
  }

  dimension: transition_to_idiomatic {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/1045?Portfolio={{ value }}"><font size = "5"; color = "darkorange")>For more information, check out the <b><u>Guest Review Feedback Dashboard!</u></b> </font></a> ;;
  }

  dimension: transition_to_underperforming_units {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/886?Portfolio={{ value }}"><font size = "6")>Click here to check out your portfolio's <b>underperforming units</b> 👎 </font></a> ;;
  }

  dimension: transition_to_financials_section {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    # html:   <a href="/dashboards/670?Portfolio={{ value }}"><font size = "6")>Click here for a more extensive review of our financials against STLM and STLY</b></font></a> ;;
    html: <a href="https://kasaliving.looker.com/dashboards/670?Portfolio={{ _filters['units.Portfolio'] | url_encode }}&Building={{ _filters['units.complex_title'] | url_encode }}&State={{ _filters['units.state'] | url_encode }}&Metro+Area={{ _filters['units.metro'] | url_encode }}"><font size = "6"; color = "black")<b>Click here for a more extensive review of our financials against STLM and STLY</b></font></a> ;;
  }


  dimension: transition_to_coordinator_daily {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/646?Portfolio={{ value }}"><font size = "4">Coordinator View</font></a> ;;
  }

  dimension: transition_to_coordinator_daily_view {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/646?Portfolio={{ value }}"><font size = "4">Daily View</font></a> ;;
  }

  dimension: transition_to_weekly_monthly {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/654?Portfolio={{ value }}"><font size = "4">Weekly/Monthly View</font></a> ;;
  }

  dimension: transition_to_financial {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/655?Portfolio={{ value }}"><font size = "4">Financial Performance</font></a> ;;
  }

  dimension: transition_to_Access {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/665?Portfolio={{ value }}"><font size = "4">Access / IoT</font></a> ;;
  }

  dimension: transition_to_GMportfolio {
    # type: string
    hidden: yes
    sql: regexp_replace(${TABLE}.portfolio,'\\+',"%2B");; ## This will replace the + sign at the end of Chicago with %2B
    html:   <a href="/dashboards/660?Portfolio={{ value }}"><font size = "4">GM Dashboard</font></a> ;;
  }

  dimension: RevenueManager {
    view_label: "Buildings & Geographic"
    label: "Revenue Manager"
    hidden: no
    description: "This data point is pulled from Portfolio Manager"
    type: string
    sql: ${TABLE}.revenueManager ;;
  }

  dimension: AccountManager {
    view_label: "Buildings & Geographic"
    label: "Account Manager"
    hidden: no
    description: "This data point is pulled from Portfolio Manager"
    type: string
    sql: ${TABLE}.accountManager ;;
  }

  dimension: PortfolioManager {
    view_label: "Buildings & Geographic"
    label: "P&L Owner"
    hidden: no
    description: "This data point is pulled from Portfolio Manager"
    type: string
    sql: ${TABLE}.portfolioManager ;;
  }


  dimension: building_start_date {
    description: "Building Start Date as per Portfolio Manager"
    view_label: "Buildings & Geographic"
    type: date
    hidden: no
    sql: ${TABLE}.propStartDttm ;;
    convert_tz: no
  }

  dimension: property_contract_signed_date {
    label: "Property Contract Signed Date (Min)"
    description: "This will display the first unit contract signed date for a particular property"
    view_label: "Buildings & Geographic"
    type: date
    hidden: no
    sql: ${TABLE}.propContractSignedDt ;;
    convert_tz: no
  }

  dimension: building_cohort {
    description: "Based on Building Start Date"
    view_label: "Buildings & Geographic"
    hidden: yes
    type: string
    sql: ${TABLE}.propCohortName;;
  }

  dimension: property_type {
    type: string
    description:  "This data point is pulled from Portfolio Manager"
    label: "Property Sub-Category (Property Type)"
    view_label: "Buildings & Geographic"
    hidden: no
    sql: ${TABLE}.propType ;;
  }

  dimension: min_los {
    label: "Property Min LOS"
    description: "This will pull the property's minimum length of stay in days as shown in the Portfolio Manager"
    type: number
    hidden: yes
    view_label: "Buildings & Geographic"
    sql: ${TABLE}.minLenOfStay ;;
  }

  dimension: max_los {
    label: "Property Max LOS"
    description: "This will pull the property's maximum length of stay in days as shown in the Portfolio Manager"
    type: number
    hidden: yes
    view_label: "Buildings & Geographic"
    sql: ${TABLE}.maxLenOfStay ;;
  }

  dimension: property_type_buckets {
    type: string
    label: "Property Category (Multifamily / Full Building / Single Family Home)"
    view_label: "Buildings & Geographic"
    hidden: no
    description: "Apartment buildings and dorms are classified as a multifamily property, hotels and apart-hotels are classified as a full building; whereas, individual or HOA are classified as Single Family Homes."
    sql: ${TABLE}.propCat ;;
  }

  dimension: hk_channel_name {
    type: string
    label: "Housekeeping Slack Channel Name"
    group_label: "Housekeeping Slack Channel"
    hidden: no
    view_label: "Buildings & Geographic"
    sql: ${TABLE}.hkSlackChannel;;
  }

  dimension: hk_slack_channel_link {
    type: string
    label: "Housekeeping Slack Channel Link"
    group_label: "Housekeeping Slack Channel"
    hidden: no
    view_label: "Buildings & Geographic"
    sql: ${TABLE}.hkSlackChannelLink;;
  }

  dimension: hk_slack_channel_id {
    type: string
    label: "Housekeeping Slack Channel ID"
    group_label: "Housekeeping Slack Channel"
    hidden: no
    view_label: "Buildings & Geographic"
    sql: REGEXP_EXTRACT(${TABLE}.hkSlackChannelLink, r'/([^/?]+)(?:\?|$)');;
    # sql:
    # CASE
    #   WHEN ${TABLE}.hkSlackChannelLink IS NOT NULL
    #   THEN REGEXP_EXTRACT(hkSlackChannelLink, r'[^/]+$')
    #   ELSE NULL
    # END;;
  }

  dimension: advanceNoticeCutOffTime {
    type: string
    label: "Advanced Notice Cut-Off Time"
    view_label: "Buildings & Geographic"
    hidden: no
    sql: FORMAT_TIMESTAMP('%I:%M%p', PARSE_TIMESTAMP('%H:%M', ${TABLE}.advanceNoticeCutOffTime)) ;;
  }

  dimension: advanceNoticeDays {
    type: yesno
    label: "Advanced Notice Days"
    view_label: "Buildings & Geographic"
    hidden: no
    sql: CASE WHEN ${TABLE}.advanceNoticeDays = 0 THEN true
      WHEN ${TABLE}.advanceNoticeDays >= 1 THEN false ELSE NULL END;;
  }

  measure: unit_count {
    label: "# of Unique Units"
    description: "This includes all units we've had irrespective on whether or not they are currently active."
    type: sum_distinct
    sql: ${TABLE}.countFg;;
    link: {
      label: "Drill by Portfolio"
      url: "{{ drill_fields_by_portfolio._link }}"
    }
    link: {
      label: "Drill by Contract Type"
      url: "{{ drill_fields_by_contract_type._link }}"
    }
    link: {
      label: "Drill by Property"
      url: "{{ drill_fields_by_property._link }}&sorts=units.Portfolio+asc,units.unit_count+desc"
    }
    link: {
      label: "Drill by Unit"
      url: "{{ drill_fields_by_unit._link }}"
    }
  }

  measure: unit_count_historical_launch {
    label: "# of Unique Units"
    description: "This includes all units we've had irrespective on whether or not they are currently active."
    type: sum_distinct
    hidden: yes
    sql: ${TABLE}.countFg;;
    link: {
      label: "Drill by Unit (Last 90 Days)"
      url: "{{ drill_fields_by_unit._link }}"
    }
    link: {
      label: "Drill by Property (Last 90 Days)"
      url: "{{ drill_fields_by_property._link }}&sorts=units.Portfolio+asc,units.complex_title+asc, units.unit_count+desc"
    }
    link: {
      label: "Recent Launch Performance (T5W)"
      url: "{{ drill_fields_by_performance._link }}&sorts=units.availability_startdate_week+desc&f[units.availability_startdate_week]=5+weeks&f[fctcapacity.night_available_dt_week]=5+weeks"
    }
  }

  measure: active_unit_count {
    label: "# of Active Unique Units"
    type: sum_distinct
    hidden: no
    description: "This includes all units which have a unit status of Active or Expiring based on the Portfolio Manager"
    sql: ${TABLE}.activeCountFg ;;
    filters: [unit_status: "Active, Expiring"]
    drill_fields: [internaltitle, unit_status, availability_startdate_date, availability_enddate_date]
  }

  measure: active_property_count {
    label: "# of Active Unique Properties"
    description: "This includes all properties which have any unit status of Active or Expiring based on the Portfolio Manager"
    view_label: "Buildings & Geographic"
    type: count_distinct
    sql: CASE WHEN ${TABLE}.activeCountFg = 1 THEN ${TABLE}.complexId
      END ;;
    filters: [unit_status: "Active, Expiring"]
    drill_fields: [complex_title]
  }

  measure: property_count {
    label: "# of Unique Properties"
    description: "This includes all properties we've had irrespective on whether or not they are currently active."
    view_label: "Buildings & Geographic"
    type: count_distinct
    sql: ${TABLE}.complexId ;;
  }

  # measure: property_count_available {
  #   label: "# of Available Properties"
  #   description: "This includes all properties we've had irrespective on whether or not they are currently active."
  #   hidden: yes
  #   view_label: "Buildings & Geographic"
  #   type: count_distinct
  #   sql: ${TABLE}.complexId ;;
  #   filters: [fctcapacity.capacity_dim: "1"]
  # }

  dimension_group: mongo_availability_startdate {
    label: "Unit Availability Start Date (mongo)"
    type: time
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.availabilityStartDt);;
    hidden: yes
  }

  dimension: mongo_availability_enddate {
    type:  date
    hidden: yes
    label: "Unit Table  Availability End Date (mongo)"
    sql: ${TABLE}.availabilityEndDt;;
    convert_tz: no
  }

  dimension: source {
    hidden: yes
    label: "Data Source"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: buildinginternaltitle {
    label: "Building Internal Title"
    type: string
    hidden: yes
    sql: ${TABLE}.buildingTitle ;;
  }

  dimension: propertyexternaltitle {
    view_label: "Buildings & Geographic"
    description: "This is the property label sent out to guests via VFD CI, etc."
    type: string
    label: "Property External Title"
    hidden: no
    sql: ${TABLE}.propExternalTitle ;;
  }

  dimension: tax_rate {
    view_label: "Buildings & Geographic"
    group_label: "ToT Tracker"
    label: "Tax Rate"
    hidden: yes
    value_format: "0.00%"
    type: number
    sql: ${TABLE}.taxRate ;;
  }

  dimension: property_status {
    view_label: "Buildings & Geographic"
    type: string
    hidden: yes
    sql: ${TABLE}.propStatus ;;
  }

  dimension: taxable_up_to {
    view_label: "Buildings & Geographic"
    group_label: "ToT Tracker"
    hidden: yes
    label: "Taxable Up To"
    value_format: "0"
    type: number
    sql: ${TABLE}.taxableUpTo ;;
  }

  dimension: airbnb_remit {
    view_label: "Buildings & Geographic"
    group_label: "ToT Tracker"
    hidden: yes
    label: "Airbnb Remit"
    type: yesno
    sql: ${TABLE}.airbnbRemit = "Yes" ;;
  }

  dimension: expedia_remit {
    hidden: yes
    view_label: "Buildings & Geographic"
    group_label: "ToT Tracker"
    label: "Expedia Remit"
    type: yesno
    sql: ${TABLE}.expediaRemit ;;
  }

  measure: live_partners {
    hidden: yes
    label: "Total Live Partners"
    view_label: "Buildings & Geographic"
    type: count_distinct
    sql: CASE WHEN ${count_fg} = 0 THEN NULL
          ELSE ${property_owner}
          END ;;
    filters: [unit_status: "Active, Expiring"]
    drill_fields: [property_owner, live_partners]
  }

  dimension: hk_partners {
    hidden: yes
    label: "HK Name"
    group_label: "Housekeeping"
    type: string
    sql: ${TABLE}.hkPartners ;;
  }

  dimension: hk_email {
    hidden: yes
    label: "HK Email"
    group_label: "Housekeeping"
    type: string
    sql: ${TABLE}.hkEmail ;;
  }

  dimension: hk_phone {
    hidden: yes
    label: "HK Phone"
    group_label: "Housekeeping"
    type: string
    sql: ${TABLE}.hkPhone ;;
  }

  dimension: hk_bw_user_id {
    hidden: yes
    label: "HK Breezeway User ID"
    group_label: "Housekeeping"
    type: string
    sql: ${TABLE}.hkBreezewayUserId ;;
  }

  dimension: hk_bw_username {
    hidden: yes
    label: "HK Breezeway Username"
    group_label: "Housekeeping"
    type: string
    sql: ${TABLE}.hkBreezewayUserName ;;
  }

  dimension: wifiSsid {
    hidden: yes
    label: "WiFi Network Name"
    description: "WiFi SSID"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.wifiSsid ;;
  }

  dimension: wifiPassword {
    hidden: yes
    label: "WiFi Password"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.wifiPassword ;;
  }

  dimension: ispUserName {
    hidden: yes
    label: "ISP Username"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispUserName ;;
  }

  dimension: ispPassword {
    hidden: yes
    label: "ISP Password"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispPassword ;;
  }

  dimension: ispLoginSite {
    hidden: yes
    label: "ISP Login Site"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispLoginSite ;;
  }

  dimension: ispAccount {
    hidden: yes
    label: "ISP Account"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispAccount ;;
  }

  dimension: ispAccountType {
    hidden: yes
    label: "ISP Account Type"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispAccountType ;;
  }

  dimension: ispPin {
    hidden: yes
    label: "ISP Pin"
    group_label: "WiFi & ISP"
    type: string
    sql: ${TABLE}.ispPin ;;
  }

  dimension: has_late_check_out{
    label: "Has Late Check Out"
    type: yesno
    sql: ${TABLE}.isLateCheckOutAvailable ;;
  }

  ## FIELDS FROM `bigquery-analytics-272822.Gsheets.gm_portfolio_thresholds`

  measure: safety_incidents {
    label: "# of Safety Incidents"
    hidden: yes
    view_label: "GM Portfolio Ops/Reviews Thresholds"
    type:average_distinct
    sql_distinct_key: ${propcode} ;;
    value_format: "0.00"
    sql: 1.95 ;;
  }

  measure: blocked_rooms {
    label: "% of Blocks Rooms"
    hidden: yes
    view_label: "GM Portfolio Ops/Reviews Thresholds"
    type:average_distinct
    sql_distinct_key: ${propcode} ;;
    value_format: "0%"
    sql: 0.05;;
  }

  measure: __clean_refunded {
    label: "% of Cleans Refunded"
    hidden: yes
    view_label: "GM Portfolio Ops/Reviews Thresholds"
    type:average_distinct
    sql_distinct_key: ${propcode} ;;
    value_format: "0%"
    sql: 0.03;;
  }


  measure: combined_nqs__overall_ {
    label: "Building Profitable NQS Target"
    description: "This will pull the Non-reach Combined NQS (Overall) Goal set on a property level for H2 2022"
    hidden: no
    group_label: "GM Portfolio Ops/Reviews Thresholds"
    type:average_distinct
    sql_distinct_key: ${propcode} ;;
    value_format: "0"
    sql: ${TABLE}.profitableNQS   ;;
  }

  measure: combined_nqs__overall_reach {
    label: "Building Min. Quality Threshold"
    description: "This will pull the Reach Combined NQS (Overall) Goal set on a property level for H2 2022"
    hidden: no
    group_label: "GM Portfolio Ops/Reviews Thresholds"
    type:average_distinct
    sql_distinct_key: ${propcode} ;;
    value_format: "0"
    sql: ${TABLE}.minQualityThreshold   ;;
  }


  measure: count_partners {
    type: count_distinct
    label: "# of Unique Property Owners"
    hidden: yes
    filters: [contract_type: "-Distribution Agreement"]
    sql:${TABLE}.PropOwner ;;
  }


  parameter: trend_by_parm {
    hidden: yes
    type:  string
    allowed_value: {
      label: "PropCode"
      value: "units.propcode"
    }
    allowed_value: {
      label: "PropType"
      value: "units.property_type"
    }
    allowed_value: {
      label: "Region"
      value: "units.Portfolio"
    }
  }

  dimension: trend_axis {
    hidden: yes
    label_from_parameter: trend_by_parm
    sql:
    {% if trend_by_parm._parameter_value == "'units.propcode'" %}
      ${units.propcode}
    {% elsif trend_by_parm._parameter_value == "'units.property_type'" %}
      ${units.property_type}
    {% elsif trend_by_parm._parameter_value == "'units.Portfolio'" %}
      ${units.Portfolio}
    {% endif %} ;;
  }

  dimension: portfolio_hidden {
    #use to filter out NULL portfolio, while using units.Portfolio as dashboard filter
    view_label: "Buildings & Geographic"
    hidden: yes
    type: string
    sql: ${Portfolio};;
  }

  parameter: axis_parm {
    hidden: yes
    type:  string
    allowed_value: {
      label: "Region"
      value: "units.Portfolio"
    }
    allowed_value: {
      label: "Property Code"
      value: "units.propcode"
    }
    allowed_value: {
      label: "# of Bedrooms"
      value: "units.bedrooms"
    }
    allowed_value: {
      label: "City, State"
      value: "units.city_state"
    }
    allowed_value: {
      label: "Property Category"
      value: "units.property_type_buckets"
    }
  }

  dimension: axis {
    hidden: yes
    label_from_parameter: axis_parm
    sql:
    {% if axis_parm._parameter_value == "'units.propcode'" %}
      ${units.propcode}
    {% elsif axis_parm._parameter_value == "'units.Portfolio'" %}
      ${units.Portfolio}
    {% elsif axis_parm._parameter_value == "'units.bedrooms'" %}
      ${units.bedrooms}
    {% elsif axis_parm._parameter_value == "'units.city_state'" %}
      ${units.city_state}
    {% elsif axis_parm._parameter_value == "'units.property_type_buckets'" %}
      ${units.property_type_buckets}
    {% endif %} ;;
  }

  measure: drill_fields_by_portfolio {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [portfolio_east_west, Portfolio, unit_count]
  }

  measure: drill_fields_by_contract_type {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [contract_type, unit_count]
  }

  measure: drill_fields_by_property {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [Portfolio, complex_title, property_type_buckets, unit_count]
  }

  measure: drill_fields_by_unit {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [Portfolio, complex_title, property_type_buckets, internaltitle, Date_Contract_Signed_date, availability_startdate_date, availability_enddate_date, unit_status, unit_count]
  }

  measure: drill_fields_by_performance {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [availability_startdate_week, property_type_buckets, Portfolio, complex_title, unit_count, fctReservations.num_reservations, fctReservations.occupancy, financials_v3.adr, financials_v3.revpar]
  }

}
