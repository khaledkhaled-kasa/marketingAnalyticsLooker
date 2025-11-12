view: reservations {
  sql_table_name: `data-warehouse-333815.reservations.fctReservations`  ;;
  label: "Reservations"

  dimension: confirmation_code {
    label: "Confirmation Code"
    #group_label:"Reservation Summary"
    type: string
    primary_key: yes
    sql: ${TABLE}.confirmationCd ;;
    link: {
      label: "Navigate to Kontrol"
      url: "https://kontrol.kasa.com/reservations/{{ _id }}"
    }
    drill_fields: [reservation_details*]
  }

  dimension: unit_id {
    type: string
    hidden: yes
    sql: ${TABLE}.unitId ;;
  }

  dimension: gxo_prop_code {
    label: "Prop Code (GXO)"
    type: string
    hidden: yes
    sql: ${TABLE}.gxoPropCode ;;
  }

  dimension: prop_code {
    hidden: yes
    sql: ${TABLE}.propCode ;;
  }

  dimension: property_id {
    hidden: yes
    type: string
    sql: ${TABLE}.propertyId ;;
  }

  dimension: _id {
    hidden: no
    type: string
    sql: ${TABLE}.reservationId ;;
  }

  dimension: transition_to_kontrol {
    label: "Kontrol URL"
    # type: string
    hidden: yes
    sql: ${_id};;
    html: <a href="https://kontrol.kasa.com/reservations/{{ value }}">Navigate to Kontrol</a> ;;
  }

  dimension: guest_id_check_name {
    hidden: yes
    label: "Name Provided for ID Check"
    type: string
    sql: ${TABLE}.guestIdCheckName ;;
  }

  dimension: guest_id {
    hidden: yes
    type: string
    sql: ${TABLE}.guestId ;;
  }

  ######################################## reservation summary ##############################
  dimension: plannedarrival {
    label: "Checkin Time"
    type: string
    sql: ${TABLE}.plannedarrival ;;
    html: {% if value <> '16:00' %}
           <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
             {% else %}
           <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
            {% endif %};;
    group_label:"Reservation Summary"
  }

  dimension: planneddeparture {
    label: "Checkout Time"
    group_label:"Reservation Summary"
    type: string
    sql: ${TABLE}.planneddeparture ;;
    html: {% if value <> '11:00' %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% else %}
      <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;
  }

  dimension: reason_for_stay {
    description: "This will pull the reason for stay if provided by the guest."
    group_label:"Reservation Summary"
    type:  string
    sql: ${TABLE}.reasonforstay  ;;
  }

  dimension: persona_type {
    hidden: no
    label: "Persona Type"
    type: string
    group_label: "Guest Personas"
    description: "A tag showing the main persona or style of the guest, like Functional Family or Style Snobs. This helps us understand and cater to different guest needs"
    sql: ${TABLE}.personaType ;;
  }

  dimension: sourcedata_channel_refined {
    label: "Source (Simple)"
    group_label:"Reservation Summary"
    description: "This source channel has been adjusted to group to channels of interested and grouping smaller channels to others"
    type: string
    sql: ${TABLE}.channelRefined ;;
  }

  dimension: channel_medium {
    label: "Source (Medium)"
    group_label:"Reservation Summary"
    description: "This source channel has been adjusted to group to channels of interested and grouping smaller channels to others"
    type: string
    sql: ${TABLE}.channelMedium ;;
  }


  dimension: unit_stay_count {
    description: "This will pull the unit stay count sorted by earliest checkin date"
    type: number
    sql: ${TABLE}.unitStayCount ;;
    hidden: yes
  }

  dimension: first_booking {
    label: "First Booking"
    group_label:"Reservation Summary"
    description: "This will identify whether a respective reservation is the guest's first confirmed booking based on the guest's history of bookings. Unique guests are identified by the e-mail used at booking."
    type: yesno
    sql: ${TABLE}.guestStayCount = 1 ;;
  }

  dimension: building_stay_count {
    description: "This will pull the building stay count sorted by earliest checkin date first, then looking at earlier booking date for reservations with the same checkindate"
    type: number
    sql: ${TABLE}.buildingStayCount;;
    hidden: yes
  }

  dimension: discount {
    label: "Coupon Code"
    view_label:"Financials"
    group_label: "Rate Plan"
    hidden: no
    type:  string
    sql: ${TABLE}.couponCode ;;
  }

  dimension: extended_booking {
    label: "Booking Extension"
    group_label:"Reservation Summary"
    description: "An extended booking is defined as two consecutive bookings by the same guest (e-mail id) within the same building (i.e. a unit swap would still be considered an extension). An extended booking will only return Yes for the extended reservation."
    type: yesno
    sql: ${TABLE}.extendedBooking = 1 ;;
  }

  dimension: initial_booking {
    label: "Initial Booking (For Extensions Only)"
    group_label:"Reservation Summary"
    description: "This will inform us if it's the original / initial booking of an extended stay. Will only show as Yes for the initial booking of an extended reservation."
    type: yesno
    sql: ${TABLE}.initialBooking = 1 ;;
  }

  dimension_group: submittedat {
    label: "KBC Completed"
    description: "The Date when Guest completed KBC"
    view_label: "KBC Details"
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
    sql: ${TABLE}.submittedat;;
    convert_tz: no

  }

  dimension: lead_time {
    description: "This will pull the time between the booking date and checkin date."
    type:  number
    group_label:"Reservation Summary"
    sql:  ${TABLE}.leadTime ;;
  }

  dimension: length_of_stay {
    type:  number
    hidden: no
    group_label:"Reservation Summary"
    sql: lengthOfStay  ;;
  }

  dimension: preceding_cleaning_task {
    hidden: no
    type: string
    group_label:"Reservation Summary"
    description: "This will pull the BW task prior to the stay"
    sql: ${TABLE}.precedingcleaningtask ;;
  }

  dimension: length_of_stay_type {
    label: "Length of Stay (Short-term/Long-term)"
    hidden: yes
    group_label:"Reservation Summary"
    description: "Short-term stays are stays with < 28 nights; whereas long-term stays are >= 28 nights"
    type:  string
    sql: ${TABLE}.lengthOfStayType ;;
  }

  dimension: callboxcode {
    type: string
    sql: ${TABLE}.callboxcode ;;
    hidden: yes
  }

  dimension: smartlockcode {
    hidden: yes
    label: "Smart Lock Code"
    type: string
    sql: ${TABLE}.smartlockcode ;;
  }

  dimension: guesty_source {
    hidden: no
    type: string
    sql: ${TABLE}.guestySource ;;
  }

  dimension: guestscount {
    type: number
    group_label:"Reservation Summary"
    sql: ${TABLE}.guestscount ;;
  }

  dimension: source {
    hidden: no
    label: "Kontrol Source"
    type: string
    sql: ${TABLE}.KontrolSource ;;
  }

  dimension: sourcedetail {
    hidden: yes
    type: string
    sql: ${TABLE}.Kontrolsourcedetail ;;
  }

  dimension: platform {
    hidden: yes
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: timezone {
    hidden: yes
    type: string
    sql: ${TABLE}.timezone ;;
  }

  # dimension: sourcedata_channel {
  #   label: "Source (Channel)"
  #   group_label:"Reservation Summary"
  #   type: string
  #   sql: ${TABLE}.channel ;;
  # }

  dimension: sourcedata_channel {
    label: "Source (Channel)"
    group_label:"Reservation Summary"
    type: string
    sql: case when ${takeover_flag} then 'Takeover Reservation'
      else ${TABLE}.channel
      end ;;
  }

  dimension: sourcedata_channel_manager {
    label: "Source (Channel Manager)"
    type: string
    group_label:"Reservation Summary"
    sql: ${TABLE}.channelmanager ;;
  }

  dimension: specialrequest {
    label: "Special Request"
    group_label:"Reservation Summary"
    type: string
    sql: ${TABLE}.specialrequest ;;
  }

  dimension: gxoUnitfg {
    type: yesno
    label: "GXO Flag"
    description: "Reservations that are tagged to a GXO unit"
    hidden: no
    sql: ${TABLE}.gxoUnitfg = 1 ;;
  }
################################################# LCO & ECI ###################################
  dimension: late_checkout_status {
    group_label: "LCO Details"
    label: "LCO Status"
    description: "Returns whether a late checkout was approved or not. If late checkout wasn't requested, this returns notRequested."
    sql: ${TABLE}.LCOstatus ;;
    hidden: no
  }

  dimension: LCOrequestedtime {
    group_label: "LCO Details"
    label: "LCO Requested Time"
    description: "Late check out requested Time"
    type: string
    sql: CASE WHEN ${TABLE}.LCOrequestedTime >24  THEN concat(cast((${TABLE}.LCOrequestedTime - 24) as string),":00 AM +1" )
      ELSE concat(cast(${TABLE}.LCOrequestedTime as string),":00 PM") END;;
    hidden: no
  }

  dimension: ECIrequestedtime {
    label: "ECI Requested Time"
    group_label: "ECI Details"
    description: "Early check in requested Time"
    type: string
    sql: CASE WHEN  ${TABLE}.ECIRequestedTime IS NULL THEN NULL
           WHEN ${TABLE}.ECIRequestedTime < 10 and (cast(${TABLE}.ECIRequestedTime as string) like '%.5%')
           THEN concat("0",cast(floor(${TABLE}.ECIRequestedTime) as string),":30")
          WHEN ${TABLE}.ECIRequestedTime < 10 and (cast(${TABLE}.ECIRequestedTime as string) NOT like '%.5%')
           THEN concat("0",cast(${TABLE}.ECIRequestedTime as string),":00")
          WHEN ${TABLE}.ECIRequestedTime > 10 and (cast(${TABLE}.ECIRequestedTime as string) like '%.5%')
           THEN concat(cast(floor(${TABLE}.ECIRequestedTime) as string),":30")
          ELSE concat(cast(${TABLE}.ECIRequestedTime as string), ":00") END;;

  }

  dimension: age_groups {
    description: "This will pull in the age group of the guest that made the reservation at the time of checkin"
    hidden: no
    type: string
    sql: ${TABLE}.ageGroup ;;
  }

  dimension: ECIrequestedststus {
    label: "ECI Status"
    group_label: "ECI Details"
    description: "Returns whether a  Early Check-in was approved or not. If Early Check-in wasn't requested, this returns notRequested."
    type: string
    sql:${TABLE}.ECIstatus ;;
    hidden: no
  }

  dimension: ECI_RequestedBy {
    label: "ECI Requested By"
    group_label: "ECI Details"
    description: ""
    type: string
    sql: ${TABLE}.ECIrequestedBy;;
  }

  dimension: ECI_DeterminedBy {
    group_label: "ECI Details"
    label: "ECI Determined By"
    description: ""
    type: string
    sql: ${TABLE}.ECIdeterminationBy ;;
  }

  dimension_group:ECI_RequestedTimestamp  {
    group_label: "ECI Details"
    #group_item_label: "ECI Requested Timestamp"
    label: "ECI Requested Timestamp"
    description: ""
    hidden: no
    type: time
    timeframes: [
      time,
      date,raw
    ]
    sql: Timestamp(${TABLE}.ECIrequestedTimestamp);;
  }

  dimension_group:ECI_DeterminedTimestamp  {
    label: "ECI Determined Timestamp"
    #group_item_label: "ECI Determined Timestamp"
    hidden: no
    group_label: "ECI Details"
    description: ""
    type: time
    timeframes: [
      time,date,raw
    ]
    sql:  Timestamp(${TABLE}.ECIdeterminationTimestamp);;
  }

  dimension: approvedMatchedrequested {
    group_label: "ECI Details"
    label: "Is ECI Time Approved Matched Requested"
    description: "Check if the time that guest request is equal to what GX/system approved"
    type: string
    sql: ${TABLE}.ECIapprovedMatchedrequested ;;
  }

  dimension: isECIRequested {
    group_label: "ECI Details"
    label: "is ECI Requested"
    description: "Check if the Guest Requested early check in"
    type: string
    sql: ${TABLE}.isECIRequested ;;
  }

  dimension_group: ECIduration {
    group_label: "ECI Details"
    type: duration
    label: "Hours duration betwen ECI Requested and Determined"
    intervals: [day, hour]
    sql_start: Timestamp(${TABLE}.ECI_RequestedTimestamp) ;;
    sql_end: TIMESTAMP(${TABLE}.checkindatelocal);;
  }
################################################# Pets & Parkings ###################################
  dimension: bringingpets {
    type: string
    group_label: "Parking & Pets Details"
    label: "Bringing Pets"
    sql: ${TABLE}.bringingPet ;;
    html: {% if value <> 'No' %}
           <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
             {% else %}
           <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
            {% endif %};;
  }
  dimension: parkingspaceneeded {
    group_label: "Parking & Pets Details"
    description: "This will pull reservations where guests have requested for a parking spot during booking. This does not neccessarily equate to the guest using a parking spot."
    type: string
    sql: ${TABLE}.parkingSpotNeeded ;;
  }

  dimension: is_license_plate_provided {
    group_label: "Parking & Pets Details"
    type: string
    description: "This will pull reservations where guests have provided us with their license plate information."
    sql: CASE WHEN ${TABLE}.licensePlate1 is NOT NULL THEN "Yes" ELSE "No" End ;;
  }

  dimension: number_of_pets {
    group_label: "Parking & Pets Details"
    type: number
    sql: ${TABLE}.numofPets;;
  }
  dimension: licenseplate {
    type: string
    sql: ${TABLE}.licensePlate1 ;;
  }
  dimension: petdescription {
    type: string
    hidden: yes
    sql: ${TABLE}.petdescription ;;
  }

  dimension: numberofpets {
    type: number
    sql: ${TABLE}.numberofpets ;;
  }


  dimension: petfeescard {
    hidden: yes
    sql: ${TABLE}.petfeescard ;;
  }

  dimension: pets {
    type: yesno
    sql: ${TABLE}.pets ;;
  }

  dimension: pettype {
    type: string
    sql: ${TABLE}.pettype ;;
  }
################################################# DATE Dimensions ###################################
  dimension_group: cancellationdate {
    label: "Cancellation"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      month_name,
      year
    ]
    sql: ${TABLE}.cancellationdate ;;
  }

  dimension_group: checkindate {
    type: time
    label: "Checkin"
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: DATE(${TABLE}.checkindatelocal);;
    #sql: TIMESTAMP(${TABLE}.checkindatelocal);;
    datatype: date
    convert_tz: no
  }

  dimension: group_name {
    group_label: "Groups and Combined Listings"
    description: "The name of the group is provided. For Combined Listings, the confirmation code of the parent reservation is included."
    hidden: no
    type: string
    sql: ${TABLE}.groupName ;;
  }

  dimension: group_sale_type {
    group_label: "Groups and Combined Listings"
    description: "The group sale type, including combined listing and others."
    hidden: no
    type: string
    sql: ${TABLE}.groupSaleType ;;
  }

  dimension: group_sale_only {
    group_label: "Groups and Combined Listings"
    description: "The group sale type, excluding combined listings."
    hidden: no
    type: string
    sql: case when ${TABLE}.groupSaleType <> 'combined_listing' then ${TABLE}.groupSaleType end  ;;
  }

  dimension: group_reservation_type {
    group_label: "Groups and Combined Listings"
    label: "Parent vs Child"
    description: "The distinction between a child reservation vs the parent reservation in a group booking."
    hidden: no
    type: string
    sql: ${TABLE}.groupReservationType ;;
  }

  dimension: group_parent {
    group_label: "Groups and Combined Listings"
    label: "Parent Reservation Id"
    description: "The parent reservation ID for the group booking"
    hidden: no
    type: string
    sql: ${TABLE}.groupParent ;;
  }

  dimension: takeover_flag {
    label: "Takeover Reservation"
    type: yesno
    sql: ${TABLE}.takeoverFlag ;;
  }

  dimension: no_fly {
    label: "No Fly"
    type: yesno
    sql: ${TABLE}.noFlyFlag ;;

  }

  dimension: room_type_name {
    hidden: no
    type: string
    sql: ${TABLE}.roomTypeName ;;
  }

  dimension: room_type_name_full {
    hidden: yes
    type: string
    sql: ${TABLE}.roomTypeNameFull ;;
  }

  measure: group_count {
    group_label: "Groups and Combined Listings"
    label: "# of Groups"
    description: "Designate the number of groups."
    hidden: no
    type: count_distinct
    sql: ${group_parent} ;;
  }

  measure: min_checkin {
    label: "Earliest Check-in Date"
    type: string
    hidden: yes
    sql: MIN(CAST(COALESCE(CAST(${TABLE}.checkindatelocal  AS DATE), DATE '2099-12-31') AS STRING) ) ;;
  }

  dimension_group: checkoutdate {
    type: time
    label: "Checkout"
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: DATE(${TABLE}.checkoutdatelocal);;
    #sql: TIMESTAMP(${TABLE}.checkoutdatelocal);;
    datatype: date
    convert_tz: no
  }

  dimension_group: guest_checkout {
    type: time
    group_label:"Guest Checkout"
    description: "Guest confirmed checkout time through the SMS or VFD. If the guest selected both, then this is the SMS value."
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.guestCheckoutTime;;
    datatype: date
    convert_tz: no
  }

  dimension_group: guest_checkout_sms {
    type: time
    hidden: yes
    group_label:"Guest Checkout SMS"
    description: "Guest confirmed checkout time through the SMS."
    timeframes: [
      date
    ]
    sql: ${TABLE}.guestCheckoutTimeSms;;
    datatype: date
    convert_tz: no
  }

  dimension_group: guest_checkout_vfd {
    type: time
    hidden: yes
    group_label:"Guest Checkout VFD"
    description: "Guest confirmed checkout time through the VFD."
    timeframes: [
      date
    ]
    sql: ${TABLE}.guestCheckoutTimeVfd;;
    datatype: date
    convert_tz: no
  }

  dimension: guest_checkout_time_hour {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Hour"
    description: "The hour for the guest confirmed checkout time through the SMS or VFD. If the guest selected both, then this is the SMS value."
    type:  number
    sql: ${TABLE}.guestCheckoutTimeHour ;;
  }

  dimension: guest_checkout_time_hour_sms {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Hour SMS"
    description: "The hour for the guest confirmed checkout time through the SMS."
    type:  number
    sql: ${TABLE}.guestCheckoutTimeHourSms ;;
  }

  dimension: guest_checkout_time_hour_vfd {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Hour VFD"
    description: "The hour for the guest confirmed checkout time through the VFD."
    type:  number
    sql: ${TABLE}.guestCheckoutTimeHourVfd ;;
  }

  dimension: guest_checkout_time_hour_bucket {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Bucket"
    description: "15 min bucket where the guest confirmed checkout time through the SMS or VFD. If the guest selected both, then this is the SMS value."
    type:  string
    sql: ${TABLE}.guestCheckoutTimeBucket ;;
  }

  dimension: guest_checkout_time_hour_bucket_sms {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Bucket SMS"
    description: "15 min bucket where the guest confirmed checkout time through the SMS."
    type:  string
    sql: ${TABLE}.guestCheckoutTimeBucketSms ;;
  }

  dimension: guest_checkout_time_hour_bucket_vfd {
    group_label:"Guest Checkout"
    label: "Guest Checkout Time Bucket VFD"
    description: "15 min bucket where the guest confirmed checkout time through the VFD."
    type:  string
    sql: ${TABLE}.guestCheckoutTimeBucketVfd ;;
  }

  dimension: internal_note {
    description: "Internal reservations note within Kontrol"
    type: string
    sql: ${TABLE}.internalnote ;;
  }

  dimension: cancellation_window {
    description: "This will pull the time between the cancellation date and checkin date."
    type:  number
    group_label:"Reservation Summary"
    sql: ${TABLE}.cancellationWindow ;;
  }

  dimension: cancellation_policy_name {
    hidden: no
    type: string
    sql: ${TABLE}.cancellationPolicyName ;;
  }

  dimension: cancellation_policy_version {
    hidden: no
    type: string
    sql: ${TABLE}.cancellationPolicyVersion ;;
  }

  dimension_group: created {
    label: "Created"
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension_group: bookingdate {
    label: "Booking"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.bookingdate ;;
  }

  # dimension_group: updatedat {
  #   type: time
  #   hidden: yes
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.updatedat ;;
  # }

  ################################################# Authorization Status  ###################################
  dimension: termsaccepted {
    hidden: yes
    type: yesno
    view_label: "Authorization Status"
    sql: ${TABLE}.termsaccepted ;;
  }

  dimension: signeddoc {
    type: string
    hidden: yes
    view_label: "Authorization Status"
    sql: ${TABLE}.signeddoc ;;
  }

  dimension: suspicious {
    type: yesno
    sql: ${TABLE}.suspicious ;;
    view_label: "Authorization Status"
    hidden: yes
  }

  dimension: riskstatus {
    label: "Risk Status"
    group_label: "Authorization Status"
    type: string
    sql: ${TABLE}.riskstatus ;;
  }

  dimension: risklevel {
    label: "Risk Level"
    group_label: "Authorization Status"
    type: string
    sql: ${TABLE}.risklevel ;;
  }

  dimension: guestisverified {
    label: "Is Guest verified"
    group_label: "Authorization Status"
    type: yesno
    sql: ${TABLE}.guestisverified;;
  }

  # Update 08-04-2021; This will start pulling from status_revised which will convert all confirmed status with cancellation dates to canceled status
  dimension: status {
    type: string
    label: "Status"
    sql: ${TABLE}.statusRevised ;;
    #group_label: "Authorization Status"
  }
  ################################################# Guest detailes  ###################################

  dimension: guest_type {
    hidden: no
    view_label: "Guests"
    type: string
    description: "Multibooker is classified as someone making more than one UNIQUE reservation (extensions are excluded). Null records are returned for bookings made by guest with no email."
    sql: ${TABLE}.guestType;;
  }

  dimension: guest_reservations {
    view_label: "Guests"
    label: "Total Guest Reservations (Including Extensions)"
    hidden: yes
    description: "This pulls the number of reservations the guest has made including extensions"
    type: number
    sql: ${TABLE}.numberOfBookings ;;
  }

  dimension: guest_unique_reservations {
    view_label: "Guests"
    description: "This pulls the number of reservations the guest has made excluding extensions"
    label: "Total Guest Reservations (Excluding Extensions)"
    hidden: yes
    type: number
    sql: ${TABLE}.numberOfUniqueReservations ;;

  }

  dimension: channel_reservation_id {
    label: "Booking Channel Reservation ID"
    hidden: yes
    sql: ${TABLE}.externalrefs.channel_reservation_id ;;
  }

  dimension: additional_guests {
    view_label: "Guests"
    label: "Additional Guests"
    hidden: no
    sql: CONCAT(
      ${TABLE}.additionalguests[SAFE_OFFSET(0)].value.name,
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(1)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(2)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(3)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(4)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(5)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(6)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(7)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(8)].value.name), ''),
      IFNULL(CONCAT(', ', ${TABLE}.additionalguests[SAFE_OFFSET(9)].value.name), ''))  ;;
  }
  ################################################# financial details  ###################################

  dimension: rate_plan_channel {
    description: "The channel that the rate plan was recevied. It will be either 'Kasa' website or external (meaning siteminder)."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanType  ;;
  }

  dimension: rate_plan_name {
    description: "The name of the rate plan."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanName  ;;
  }

  dimension: rate_plan_type {
    description: "The type of the rate plan."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanType  ;;
  }

  dimension: rate_plan_version {
    description: "The version of the rate plan."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanName  ;;
  }

  dimension: rate_plan_code {
    description: "The code of the rate plan."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanCode  ;;
  }

  dimension: rate_plan_description {
    description: "The code of the rate plan."
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.ratePlanDescription  ;;
  }

  dimension: negotiated_rate_plan_code {
    description: "The negotiated rate plan code"
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.negotiatedRatePlanCode  ;;
  }

  dimension: negotiated_rate_plan_account_name {
    description: "The negotiated rate plan account name"
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.negotiatedRatePlanAccountName  ;;
  }

  dimension: negotiated_rate_plan_sales_manager {
    description: "The negotiated rate plan sales manager"
    view_label:"Financials"
    group_label: "Rate Plan"
    type:  string
    sql: ${TABLE}.negotiatedRatePlanSalesManager  ;;
  }

  measure: guestscount_sum {
    label: "# of Guests"
    view_label: "Metrics"
    description: "Total number of guests for the reservation(s) filtered for only confirmed / checked in bookings."
    type: sum
    sql: guestscount ;;
    filters: [status: "confirmed, checked_in", gxoUnitfg: "no"]
  }

  measure: avg_length_of_stay {
    view_label: "Metrics"
    label: "Avg Length of Stay"
    description: "Number of days of stay filtered for only confirmed / checked in bookings."
    value_format: "0.0"
    type:  average
    sql: ${length_of_stay};;
    filters: [status: "confirmed, checked_in", gxoUnitfg: "no"]
    drill_fields: [reservation_details*]
  }

  measure: median_length_of_stay {
    view_label: "Metrics"
    label: "Median Length of Stay"
    description: "Number of days of stay filtered for only confirmed / checked in bookings."
    value_format: "0.0"
    type:  median
    sql: ${length_of_stay};;
    filters: [status: "confirmed, checked_in", gxoUnitfg: "no"]
    drill_fields: [reservation_details*]
  }

# - These numbers may be slightly higher than the Kasametrics model as they are also taking into account reservations that aren't mapped to units / active units
  measure: num_reservations {
    view_label: "Metrics"
    label: "# of Reservations"
    description: "Number of unique reservations (confirmed / checked in bookings)"
    type: count_distinct
    sql: ${confirmation_code} ;;
    filters: [status: "confirmed, checked_in", gxoUnitfg: "no"]
    drill_fields: [reservation_details*]
  }

  measure: num_reservations_canceled {
    view_label: "Metrics"
    label: "# of Reservations (Canceled)"
    description: "Number of unique reservations for canceled bookings"
    type: count_distinct
    sql: ${confirmation_code} ;;
    filters: [status: "canceled, cancelled", gxoUnitfg: "no"]
    drill_fields: [reservation_details*]
  }

  set:reservation_details {
    fields: [confirmation_code, status, bookingdate_date, cancellationdate_date, checkindate_date, checkoutdate_date,  num_reservations, num_reservations_canceled, sourcedata_channel, sourcedata_channel_manager, guests.firstname, guests.middlename, guests.lastname]
  }

}
