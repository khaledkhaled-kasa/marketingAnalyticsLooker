view: guests {

  #sql_table_name:`data-warehouse-333815`.reservations.dimGuests;;
  sql_table_name: `data-warehouse-333815.reservations.dimGuestProfile`
    ;;

  dimension: age {
    type: number
    description: "Guest age"
    sql: ${TABLE}.age ;;
  }

  dimension: ancillary_amount {
    group_label: "Total Guest Stats"
    label: "Total Ancillary Amount"
    type: number
    hidden: yes
    description: "Total ancillary amount"
    sql: ${TABLE}.ancillaryAmount ;;
  }

  dimension: phone_area_code {
    hidden: yes
    type: string
    description: "Guest area code"
    sql: ${TABLE}.areaCode ;;
  }

  # dimension: isGuestLocal {
  #   hidden: no
  #   type: string
  #   label:"Is guest local?"
  #   description: "Check if guest's phone area code matches the area code where they booked"
  #   sql:
  #   CASE
  #   WHEN ${phone_area_code} = ${area_code_phone.area_code_1} THEN "Yes"
  #   WHEN ${phone_area_code} = ${area_code_phone.area_code_2}  THEN "Yes"
  #   WHEN ${phone_area_code} = ${area_code_phone.area_code_3}  THEN "Yes"
  #   WHEN ${phone_area_code} = ${area_code_phone.area_code_4}  THEN "Yes"
  #   ELSE "No"
  #   END
  #   ;;
  # }

  dimension: avg_lead_time {
    group_label: "Total Guest Stats"
    label: "Average Lead Time"
    hidden: yes
    type: number
    description: "Avg lead time between bookng date and checkin date"
    sql: ${TABLE}.avgLeadTime ;;
  }

  dimension: avg_length_of_stay {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "Average LOS"
    type: number
    description: "Avg length of stay"
    sql: ${TABLE}.avgLengthOfStay ;;
  }

  dimension: backgroundCheckStatus {
    hidden: yes
    type: string
    description: "Status of background check"
    sql: ${TABLE}.backGroundCheckStatus ;;
  }

  dimension: booking_amount {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "Total Booking Amount"
    type: number
    description: "Total booking amount"
    sql: ${TABLE}.bookingAmount ;;
  }

  dimension: booking_amount_first_booking {
    group_label: "First Reservation"
    label: "Booking Amount"
    hidden: yes
    type: number
    description: "Booking amount for first reservation"
    sql: ${TABLE}.bookingAmountFirstBooking ;;
  }

  dimension: booking_amount_last_booking {
    group_label: "Latest Reservation"
    hidden: yes
    label: "Booking Amount"
    type: number
    description: "Booking amount for latest reservation"
    sql: ${TABLE}.bookingAmountLastBooking ;;
  }

  dimension_group: booking_date_first_booking {
    label: "Booking (First)"
    group_label: "First Reservation"
    hidden: no
    type: time
    description: "Booking date for first reservation"
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.bookingDateFirstBooking ;;
  }

  dimension_group: booking_date_last_booking {
    label: "Booking (Latest)"
    group_label: "Latest Reservation"
    hidden: no
    type: time
    description: "Booking date for latest reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.bookingDateLastBooking ;;
  }

  dimension: channel_first_booking {
    hidden: no
    label: "Channel (First)"
    group_label: "First Reservation"
    type: string
    description: "Booking channel for first reservation"
    sql: ${TABLE}.channelFirstBooking ;;
  }

  dimension: kontrol_source_first_booking {
    hidden: yes
    label: "Kontrol Source"
    group_label: "First Reservation"
    type: string
    description: "Kontrol Source for first reservation"
    sql: ${TABLE}.kontrolSourceFirstBooking ;;
  }

  dimension: prop_code_first_booking {
    label: "Property Code"
    hidden: yes
    group_label: "First Reservation"
    type: string
    description: "Property code for first reservation"
    sql: ${TABLE}.propCodeFirstBooking ;;
  }

  dimension: guests_count_first_booking {
    label: "Group Size"
    hidden: yes
    group_label: "First Reservation"
    type: number
    description: "Number of guests for first reservation"
    sql: ${TABLE}.guestsCountFirstBooking ;;
  }

  dimension: prop_code_last_booking {
    label: "Property Code"
    hidden: yes
    group_label: "Latest Reservation"
    type: string
    description: "Property code for latest reservation"
    sql: ${TABLE}.propCodeLastBooking ;;
  }

  dimension: guests_count_last_booking {
    label: "Group Size"
    hidden: yes
    group_label: "Latest Reservation"
    type: number
    description: "Number of guests for latest reservation"
    sql: ${TABLE}.guestsCountLastBooking ;;
  }

  dimension: channel_last_booking {
    label: "Channel (Latest)"
    hidden: no
    group_label: "Latest Reservation"
    type: string
    description: "Booking channel for latest reservation"
    sql: ${TABLE}.channelLastBooking ;;
  }

  dimension_group: checkin_date_local_first_booking {
    label: "Checkin"
    hidden: yes
    group_label: "First Reservation"
    type: time
    description: "Checkin date for first reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkinDateLocalFirstBooking ;;
  }

  dimension_group: checkin_date_local_last_booking {
    label: "Checkin"
    hidden: yes
    group_label: "Latest Reservation"
    type: time
    description: "Checkin date for latest reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkinDateLocalLastBooking ;;
  }

  dimension_group: checkout_date_local_first_booking {
    label: "Checkout"
    hidden: yes
    group_label: "First Reservation"
    type: time
    description: "Checkout date for first reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkoutDateLocalFirstBooking ;;
  }

  dimension_group: checkout_date_local_last_booking {
    label: "Checkout"
    hidden: yes
    group_label: "Latest Reservation"
    type: time
    description: "Checkout date for latest reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkoutDateLocalLastBooking ;;
  }

  dimension: country {
    hidden: no
    group_label: "Guest Address"
    type: string
    map_layer_name: countries
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    Country (Guest)
    {% else %}
    Country (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      UPPER(${TABLE}.country)
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension_group: dateofbirth {
    type: time
    description: "Guest date of birth"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dateOfBirth ;;
    hidden: yes
  }

  dimension: days_bt_first_and_last_booking {
    label: "Days Between First and Last Booking"
    hidden: yes
    type: number
    description: "Number of days between first and latest reservation"
    sql: ${TABLE}.daysBtFirstAndLastBooking ;;
  }

  dimension: email {
    hidden: no
    type: string
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    Email (Guest)
    {% else %}
    Email (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      ${TABLE}.email
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension: emailmarketingaccepted {
    label: "Does the guest accepted email marketing?"
    type: yesno
    description: "Guest accepted marketing email"
    sql: ${TABLE}.emailMarketingAccepted ;;
  }

  dimension: first_and_last_booking_channel_match {
    label: "Same channel used for first and latest booking?"
    type: yesno
    description: "First and latest reservations made via the same channel"
    sql: CASE WHEN ${TABLE}.firstAndLastBookingChannelMatch = 1 THEN TRUE ELSE FALSE END;;
  }

  dimension: firstname {
    label: "First Name (Guest)"
    type: string
    description: "Guest first name"
    sql: ${TABLE}.firstName ;;
    # label:
    # "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    # First Name (Guest)
    # {% else %}
    # First Name (Guest) (Redacted due to insufficient permissions)
    # {% endif %}"
    # sql:
    # {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
    #   ${TABLE}.firstname
    # {% else %}
    #   '[REDACTED]'
    # {% endif %} ;;
  }

  dimension: guest_account_status {
    type: string
    description: "Guest account status"
    sql: ${TABLE}.guestAccountStatus ;;
  }

  dimension: _id {
    type: string
    label: "GID"
    description: "Unique guest identifier"
    sql: ${TABLE}.guestId ;;
    primary_key: yes
    hidden: no
  }

  dimension: idcheckstatus {
    hidden: yes
    type: string
    description: "Status of ID check"
    sql: ${TABLE}.idCheckStatus ;;
  }

  dimension: is_verified {
    type: yesno
    description: "Verification flag"
    sql: ${TABLE}.isVerified ;;
  }

  dimension_group: kbc_completed_date_first_booking {
    label: "PAC/KBC Completed"
    group_label: "First Reservation"
    type: time
    description: "PAC/KBC completed date for first reservation"
    timeframes: [date]
    hidden: yes
    convert_tz: no
    datatype: date
    sql: ${TABLE}.kbcCompletedDateFirstBooking ;;
  }

  dimension_group: kbc_completed_date_last_booking {
    label: "PAC/KBC Completed"
    group_label: "Latest Reservation"
    hidden: yes
    type: time
    description: "PAC/KBC completed date for latest reservation"
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.kbcCompletedDateLastBooking ;;
  }

  dimension: kbc_completed_gt24_hr_before_ci_first_booking {
    label: "PAC/KBC Completed More Than 24 Hours Before CI"
    group_label: "First Reservation"
    hidden: yes
    type: number
    description: "KBC/PAC completed more than 24 hours before checkin for first reservation flag"
    sql: ${TABLE}.kbcCompletedGt24HrBeforeCiFirstBooking ;;
  }

  dimension: kbc_completed_gt24_hr_before_ci_last_booking {
    label: "PAC/KBC Completed More Than 24 Hours Before CI"
    group_label: "Latest Reservation"
    type: number
    hidden: yes
    description: "KBC/PAC completed more than 24 hours before checkin for latest reservation flag"
    sql: ${TABLE}.kbcCompletedGt24HrBeforeCiLastBooking ;;
  }

  dimension: kbc_to_ci_date_first_booking {
    label: "Lead Time of PAC/KBC to CI"
    group_label: "First Reservation"
    hidden: yes
    type: number
    description: "Lead time (days) between KBC/PAC completion and checkin for first reservation"
    sql: ${TABLE}.kbcToCiDateFirstBooking ;;
  }

  dimension: kbc_to_ci_date_last_booking {
    label: "Lead Time of PAC/KBC to CI"
    hidden: yes
    group_label: "Latest Reservation"
    type: number
    description: "Lead time (days) between KBC/PAC completion and checkin for latest reservation"
    sql: ${TABLE}.kbcToCiDateLastBooking ;;
  }

  dimension: last_booking_direct_channel {
    label: "Was latest booking completed via direct channel?"
    type: yesno
    hidden: yes
    description: "Latest booking completed via direct channel"
    sql:CASE WHEN ${TABLE}.lastBookingDirectChannel = 1 THEN TRUE ELSE FALSE END ;;
  }

  dimension: last_booking_in_future {
    label: "Is latest booking in the future?"
    hidden: yes
    type: yesno
    description: "Latest reservation is in the future flag"
    sql: CASE WHEN ${TABLE}.lastBookingInFuture = 1 THEN TRUE ELSE FALSE END;;
  }

  dimension: lastname {
    label: "Last Name (Guest)"
    type: string
    description: "Guest last name"
    sql: ${TABLE}.lastName ;;
    # label:
    # "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    # Last Name (Guest)
    # {% else %}
    # Last Name (Guest) (Redacted due to insufficient permissions)
    # {% endif %}"
    # sql:
    # {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
    #   ${TABLE}.lastname
    # {% else %}
    #   '[REDACTED]'
    # {% endif %} ;;
  }

  dimension: last_res_gt6_months {
    label: "Was latest booking more than 6 months ago"
    type: yesno
    hidden: yes
    description: "Latest reservation was greater than 6 month ago flag"
    sql: CASE WHEN ${TABLE}.lastResGt6Months = 1 THEN TRUE ELSE FALSE END;;
  }

  dimension: lead_time_first_booking {
    label: "Lead Time"
    hidden: yes
    group_label: "First Reservation"
    type: number
    description: "Lead time for first reservation"
    sql: ${TABLE}.leadTimeFirstBooking ;;
  }

  dimension: lead_time_last_booking {
    label: "Lead Time"
    group_label: "Latest Reservation"
    hidden: yes
    type: number
    description: "Lead time for latest reservation"
    sql: ${TABLE}.leadTimeLastBooking ;;
  }

  dimension: length_of_stay_first_booking {
    label: "Length of Stay"
    hidden: yes
    group_label: "First Reservation"
    type: number
    description: "Length of stay for first booking"
    sql: ${TABLE}.lengthOfStayFirstBooking ;;
  }

  dimension: length_of_stay_last_booking {
    label: "Length of Stay"
    hidden: yes
    group_label: "Latest Reservation"
    type: number
    description: "Length of stay for latest booking"
    sql: ${TABLE}.lengthOfStayLastBooking ;;
  }

  dimension: middlename {
    label: "Middle Name (Guest)"
    type: string
    description: "Guest middle name"
    sql: ${TABLE}.middleName ;;
  }

  dimension: most_visited_property {
    type: string
    hidden: yes
    description: "Most (or latest if no repeated stays) visited property"
    sql: ${TABLE}.mostVisitedProperty ;;
  }

  dimension: num1_star_reviews {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of 1 Star Reviews"
    type: number
    description: "Number of 1 star review given"
    sql: ${TABLE}.num1StarReviews ;;
  }

  dimension: num2_star_reviews {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of 2 Star Reviews"
    type: number
    description: "Number of 2 star review given"
    sql: ${TABLE}.num2StarReviews ;;
  }

  dimension: num3_star_reviews {
    hidden: yes
    group_label: "Total Guest Stats"
    label: "# of 3 Star Reviews"
    type: number
    description: "Number of 3 star review given"
    sql: ${TABLE}.num3StarReviews ;;
  }

  dimension: num4_star_reviews {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of 4 Star Reviews"
    type: number
    description: "Number of 4 star review given"
    sql: ${TABLE}.num4StarReviews ;;
  }

  dimension: num5_star_reviews {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of 5 Star Reviews"
    type: number
    description: "Number of 5 star review given"
    sql: ${TABLE}.num5StarReviews ;;
  }

  dimension: num_cancellations {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Cancellations"
    type: number
    description: "Number of cancelled reservations"
    sql: ${TABLE}.numCancellations ;;
  }

  dimension: num_checkins {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Checkins"
    type: number
    description: "Number of checkins (excludes extensions)"
    sql: ${TABLE}.numCheckins ;;
  }

  dimension: num_eci_approved {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of ECIs Approved"
    type: number
    description: "Number of early checkin requests approved"
    sql: ${TABLE}.numEciApproved ;;
  }

  dimension: num_eci_requests {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of ECIs Requested"
    type: number
    description: "Number of early checkin requests"
    sql: ${TABLE}.numEciRequests ;;
  }

  dimension: num_extensions {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Extensions"
    type: number
    description: "Number of extensions"
    sql: ${TABLE}.numExtensions ;;
  }

  dimension: num_lco_approved {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of LCOs Approved"
    type: number
    description: "Number of late checkout requests approved"
    sql: ${TABLE}.numLcoApproved ;;
  }

  dimension: num_lco_requests {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of LCOs Requested"
    type: number
    description: "Number of late checkout requests"
    sql: ${TABLE}.numLcoRequests ;;
  }

  dimension: num_of_properties_stayed {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Properties Visited"
    type: number
    description: "Number of properties stayed at"
    sql: ${TABLE}.numOfPropertiesStayed ;;
  }

  dimension: num_of_properties_stayed_actual_non_extensions {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Properties Visited actual, non-extension"
    type: number
    description: "Number of properties stayed at where status is confirmed, checked-in and the booking isn't an extension"
    sql: ${TABLE}.numOfPropertiesStayed_acutalNonExtension ;;
  }

  dimension: num_reservation_nights {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservation Nights"
    type: number
    description: "Number of reservation nights"
    sql: ${TABLE}.numReservationNights ;;
  }

  dimension: num_reservation_nights_cancelled {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservation Nights Cancelled"
    type: number
    description: "Number of reservations nights cancelled"
    sql: ${TABLE}.numReservationNightsCancelled ;;
  }

  dimension: num_reservations {
    group_label: "Total Guest Stats"
    hidden: no
    label: "Number of Lifetime Reservations"
    type: number
    description: "Number of reservations (confirmed or checked in, excludes extensions as separate booking)"
    sql: ${TABLE}.numReservations ;;
  }

  dimension: num_reservations_including_extensions {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservations (with Ext. counted separate)"
    type: number
    description: "Number of reservations (confirmed or checked in, includes extensions as separate booking)"
    sql: ${TABLE}.numReservationsIncludingExtensions ;;
  }

  dimension: num_reservations_lco {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservations with LCO"
    type: number
    description: "Number of reservations with a late checkout"
    sql: ${TABLE}.numReservationsLco ;;
  }

  dimension: num_reservations_parking {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservations with Parking"
    type: number
    description: "Number of reservations with a parking"
    sql: ${TABLE}.numReservationsParking ;;
  }

  dimension: num_reservations_pet {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Reservations with Pet"
    type: number
    description: "Number of reservations with a pet"
    sql: ${TABLE}.numReservationsPet ;;
  }

  dimension: num_unreviewed_stays {
    group_label: "Total Guest Stats"
    hidden: yes
    label: "# of Unreviewed Reservations"
    type: number
    description: "Number of unreviewed stays"
    sql: ${TABLE}.numUnreviewedStays ;;
  }

  dimension: overall_rating_first_booking {
    label: "Overall Rating"
    group_label: "First Reservation"
    hidden: yes
    type: number
    description: "Overall rating  for first reservation"
    sql: ${TABLE}.overallRatingFirstBooking ;;
  }

  dimension: overall_rating_last_booking {
    label: "Overall Rating"
    group_label: "Latest Reservation"
    hidden: yes
    type: number
    description: "Overall rating  for latest reservation"
    sql: ${TABLE}.overallRatingLastBooking ;;
  }

  dimension: phone {
    hidden: no
    type: string
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    Phone # (Guest)
    {% else %}
    Phone # (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      ${TABLE}.phone
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension: preferred_name {
    type: string
    description: "Preferred Name (Guest)"
    sql: ${TABLE}.preferredName ;;
  }

  dimension: reason_for_stay_first_booking {
    label: "Reason for Stay"
    group_label: "First Reservation"
    hidden: yes
    type: string
    description: "Reason of stay for first reservation"
    sql: ${TABLE}.reasonForStayFirstBooking ;;
  }

  dimension: reason_for_stay_last_booking {
    label: "Reason for Stay"
    hidden: yes
    group_label: "Latest Reservation"
    type: string
    description: "Reason of stay for latest reservation"
    sql: ${TABLE}.reasonForStayLastBooking ;;
  }

  dimension: state {
    hidden: no
    group_label: "Guest Address"
    type: string
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    State (Guest)
    {% else %}
    State (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      ${TABLE}.state
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension: city {
    hidden: no
    group_label: "Guest Address"
    type: string
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    City (Guest)
    {% else %}
    City (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      INITCAP(${TABLE}.city)
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension: zip {
    hidden: no
    group_label: "Guest Address"
    type: zipcode
    label:
    "{% if _user_attributes['pii_guest_contact_info'] == 'yes' %}
    ZIP (Guest)
    {% else %}
    ZIP (Guest) (Redacted due to insufficient permissions)
    {% endif %}"
    sql:
    {% if _user_attributes['pii_guest_contact_info']  == 'yes' %}
      ${TABLE}.zip
    {% else %}
      '[REDACTED]'
    {% endif %} ;;
  }

  dimension: tag {
    type: string
    description: "Guest tags (VIP, Partner, Employee, etc.)"
    sql: ${TABLE}.tags ;;
  }

  dimension: vip {
    label: "VIP"
    description: "This will pull tags associated with Potential Partners, Potential Investors, Partner Property Management, Partner Ownership Group, Partner Deal Signer or Investors."
    type: yesno
    sql: ${tag} IN ("vipPotentialPartner", "vipPotentialInvestor", "vipPartnerPropertyManagement", "vipPartnerOwnershipGroup", "vipPartnerDealSigner", "vipNeighbor", "vipMedia", "vipInvestor", "vipFriendsOfKasa", "vipFormerPartner", "vipCompetitor", "partnerRegionalPartner", "vipPartnerStaff") ;;
    html: {% if value <> 'No' %}
          <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
          {% else %}
          <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
          {% endif %};;
  }

  dimension: is_kasa_employee {
    label: "Is a Kasa Employee"
    type: yesno
    sql: case when ${email} like "%@kasa.com%" then true else false end ;;
  }

  # dimension: repeat_guest {
  #   label: "Repeat Guest"
  #   type: yesno
  #   sql: ${fctReservations.guest_unique_reservations}>1;;
  #   html: {% if value <> 'No' %}
  #         <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
  #         {% else %}
  #         <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
  #         {% endif %};;
  # }

  # dimension: repeat_guest_res_clean {
  #   label: "Repeat Guest"
  #   type: yesno
  #   hidden: yes
  #   sql: ${reservations_clean.guest_unique_reservations}>1;;
  #   html: {% if value <> 'No' %}
  #         <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
  #         {% else %}
  #         <p style="color: black; background-color: ; font-size:100%; text-align:center">{{ rendered_value }}</p>
  #         {% endif %};;
  # }

  dimension_group: updated_date {
    label: "Updated"
    hidden: yes
    type: time
    description: "Date of last guest record update"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedDate ;;
  }

  dimension_group: verification {
    hidden: yes
    type: time
    description: "Verification date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.verificationDate ;;
  }

  # First 12 month metrics
  dimension: first_12_month_flag {
    type: yesno
    hidden: yes
    sql: ${TABLE}.first12Month_flag ;;
  }

  dimension: first_channel_booked_then_kasa {
    label: "First Channel Booked then Kasa"
    description: "Booked First Channel from OTA then Kasa, this shows the source of the first channel (Kasa, Airbnb, Booking.com, or Expedia)"
    type: string
    sql: ${TABLE}.firstChannelBookedThenKasa ;;
  }

  dimension: repeat_guest_flag {
    label: "Repeat Guest Flag"
    type: yesno
    sql: ${TABLE}.repeatGuestFlag ;;
  }

  dimension: repeat_guest_type {
    hidden: no
    label: "Repeat Guest Type"
    description: "Define how many times a guest has stayed.
    If Reservation Count = 1, classify as **First Time Guest**.
    If Reservation Count = 2, classify as **Repeat Guest**.
    If Reservation Count is between 3 and 5, classify as **Frequent Guest**.
    If Reservation Count > 5, classify as **Loyal Guest**.
    Keep in mind the guest has to have stayed at a Kasa, checked-in.
    "
    type: string
    sql: ${TABLE}.repeatGuestType ;;
  }

  # dimension: guest_mapped_flag {
  #   type: yesno
  #   sql: case when ${guest_id} is not null then true end ;;
  # }

  dimension: property_stay_type {
    hidden: no
    label: "Property Stay Type"
    description: "Determine how many distinct properties a guest has stayed at.
    If Property Count = 1, classify as **Single Property Guest**.
    If Property Count = 2, classify as **Multi-Property Guest**.
    If Property Count > 2, classify as **Cross-Portfolio Guest**.
    "
    type: string
    sql: ${TABLE}.propertyStayType ;;
  }

  measure: first_12_month_revenue_amount {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "Revenue Amount - First 12 Month"
    description: "The total revenue amount in the first 12 month after the guest's initial booking."
    sql: ${TABLE}.first12Month_revenueAmount ;;
    value_format_name: usd_0
  }

  measure: first_12_month_booking_amount {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "Booking Amount - First 12 Month"
    description: "The total booking amount in the first 12 month after the guest's initial booking."
    sql: ${TABLE}.first12Month_bookingAmount ;;
    value_format_name: usd_0
  }

  measure: first_12_month_anciliary_amount {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "Anciliary Amount - First 12 Month"
    description: "The total anciliary amount in the first 12 month after the guest's initial booking."
    sql: ${TABLE}.first12Month_ancillaryAmount ;;
    value_format_name: usd_0
  }

  measure: first_12_month_reservation_count {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "# of Reservations - First 12 Month"
    description: "The number of reservations in the first 12 month after the guest's initial booking."
    sql: ${TABLE}.first12Month_reservationCount ;;
    value_format_name: decimal_0
  }

  measure: first_12_month_reservation_average {
    type: average_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "Avg # of Reservations - First 12 Month"
    description: "The average number of reservations in the first 12 month per guests after the guest's initial booking."
    sql: ${TABLE}.first12Month_reservationCount ;;
    value_format_name: decimal_2
  }

  measure: first_12_month_property_count {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "# of Distinct Properties - First 12 Month"
    description: "The number of reservations in the first 12 month after the guest's initial booking."
    sql: ${TABLE}.first12Month_propCount ;;
  }

  measure: first_12_month_property_average {
    type: average_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "Avg # of Distinct Properties - First 12 Month"
    description: "The average number of reservations in the first 12 month per guest after the guest's initial booking."
    sql: ${TABLE}.first12Month_propCount ;;
    value_format_name: decimal_2
  }

  measure: first_12_month_guest_count {
    type: sum_distinct
    hidden: yes
    group_label: "First 12 Month"
    label: "# of Guests - First 12 Month"
    description: "The number of guests that have booked who falls in the first 12 month after the guest's initial booking."
    # sql_distinct_key: ${_id} ;;
    sql: case when ${first_12_month_flag} is true then 1 else 0 end ;;
    # filters: [first_12_month_flag: "yes"]
    value_format_name: decimal_0
  }

  measure: num_reservations_count {
    group_label: "Total Guest Stats"
    hidden: no
    label: "# of Reservations (without Ext. counted separate)"
    type: sum_distinct
    description: "Number of reservations (confirmed or checked in, excludes extensions as separate booking)"
    sql: ${num_reservations} ;;
  }

  measure: booking_amount_total {
    group_label: "Total Guest Stats"
    hidden: no
    label: "Booking Amount"
    type: sum_distinct
    description: "Total booking amount"
    sql: ${booking_amount} ;;
    value_format_name: usd
  }

  measure: revenue_amount_total {
    group_label: "Total Guest Stats"
    hidden: no
    label: "Revenue Amount"
    type: sum_distinct
    description: "Total Revenue Amount"
    sql: ${TABLE}.revenueAmount ;;
    value_format_name: usd
  }

  measure: median_days_first_and_second{
    label: "Median days beteen 1st and 2nd bookings"
    type: median
    sql: ${TABLE}.dateDiffFirstSecondBooking ;;
    value_format_name: decimal_1
  }

  measure: ltv {
    label: "LTV"
    type: number
    sql: ${revenue_amount_total}/nullif(${num_reservations_count},0) ;;
    # sql: ${financials.amount}/nullif(${reservations.num_reservations},0) ;;
    value_format_name: usd
  }



}
