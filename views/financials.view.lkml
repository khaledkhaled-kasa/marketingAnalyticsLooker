view: financials {
  label: "Financials"
  sql_table_name: `data-warehouse-333815.financeAccounting.fctFinancialsV2`  ;;

  dimension: record_id {
    label: "Record ID"
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.recordId ;;
  }

  dimension: unit {
    type: string
    hidden: yes
    sql: ${TABLE}.unitId ;;
  }

  dimension: amount_dimension {
    hidden: yes
    label: "Amount (V2)"
    description: "This will correct for unavailable amount__fl values"
    type: number
    value_format: "$#,##0.00"
    sql:  ${TABLE}.amount ;;
  }

  dimension: financials_override_flag {
    hidden: no
    label: "Kontrol Financials Override Flag"
    type: yesno
    sql:  ${TABLE}.goWithCalcValue = 1;;
  }

  dimension_group: night {
    hidden:  no
    group_label: "Financial Night"
    description: "An occupied night at a Kasa"
    label: "Financial"
    type: time
    timeframes: [
      date,
      week_of_year,
      week,
      month,
      day_of_week
    ]
    sql: TIMESTAMP(${TABLE}.nightDate) ;;
    convert_tz: no
  }

  dimension: reservation_id {
    hidden: yes
    type: string
    sql: ${TABLE}.reservationId ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.financialType ;;
  }

  measure: amount {
    label: "Amount"
    description: "This amount will automatically filter for only confirmed / checked-in bookings and filtered financial types (excluding taxes & channel fees). Also, this includes extended bookings as a SEPARATE booking."
    type: sum_distinct
    # type: sum
    value_format: "$#,##0.00"
    # sql_distinct_key: ${record_id} ;;
    sql: ${TABLE}.revenueAmount ;;
    drill_fields: [reservations.confirmationcode, reservations.sourcedata_channel, reservations.rate_plan_name, reservations.bookingdate_date, reservations.checkindate_date, reservations.checkoutdate_date, reservations.status, reservations.reservation_night, reservations.medium_term_rental_flag, amount]
  }

  measure: amount_unfiltered {
    label: "Amount (Unfiltered)"
    description: "This amount is unfiltered (all reservation status, including cancellations & financial types). Also, this includes extended bookings as a SEPARATE booking."
    # type: sum_distinct
    type: sum
    value_format: "$#,##0.00"
    # sql_distinct_key: ${record_id} ;;value_format: "$#,##0.00"
    sql: ${TABLE}.amount ;;
  }

  measure: discount_amount_web_site {
    label: "Discount Amount from Kasa.com"
    type: sum
    sql: ${TABLE}.amount ;;
    filters: [
      type: "Discounts",
      me_web_events.coupon_code: "-NULL"
    ]
    value_format_name: usd
  }

  measure: reservation_amount {
    label: "Reservation Amount"
    type: max
    value_format: "$#,##0.00"
    # sql_distinct_key: ${record_id} ;;
    sql: ${TABLE}.reservationAmount ;;
  }

# Parking Fee... only needed for the parking fee project - 12/2/2022 added, can be depreciated in the future.
  measure: parking_fee{
    hidden: no
    label: "Parking Fee Amount"
    description: "Parking Fee Amount"
    # type: sum_distinct
    type: sum
    # sql_distinct_key: ${record_id} ;;
    value_format: "$#,##0.00"
    sql: ${TABLE}.parkingFeeAmount;;
  }

  measure: amount_medium_term_rentals {
    label: "Amount for Medium Term Rentals"
    description: "The amount for medium Term Rentals."
    hidden: yes
    # type: sum_distinct
    type: sum
    # sql_distinct_key: ${record_id} ;;
    value_format: "$#,##0.00"
    sql: ${TABLE}.mediumTermRentalAmount ;;
  }

  measure: amount_original_ancillary {
    label: "Original Amount (Ancillary)"
    hidden: yes
    description: "This is amount as per payment received dates from Ancillary financial types"
    # type: sum_distinct
    type: sum
    # sql_distinct_key: ${record_id} ;;
    value_format: "$#,##0.00"
    sql: ${TABLE}.ancillaryAmount ;;
  }

  measure: amount_ancillary {
    label: "Amount (Ancillary)"
    description: "This amount will automatically filter for only confirmed / checked-in bookings and filtered financial types (AccessCharge,AddCleanCharge,DamageCharge,Fees,PetFees,SecurityFee,LateCheckoutCharge). Also, this includes extended bookings as a SEPARATE booking."
    type: number
    value_format: "$#,##0.00"
    sql: ${amount_original_ancillary};;
  }

}
