view: rate_plan_segmentation {

  sql_table_name: `data-warehouse-333815.revenueManagement.ratePlanSegmentation`;;

  dimension: applied_promo_flag {
    type: number
    description: "Applied Promotion Flag"
    sql: ${TABLE}.appliedPromoFlag ;;
    hidden: yes
  }

  dimension: channel {
    group_label: "Rate Plan Segments"
    type: string
    description: "Booking (Source) Channel"
    sql: ${TABLE}.channel ;;
    hidden: yes
  }

  dimension: channelmanager {
    group_label: "Rate Plan Segments"
    type: string
    description: "Booking Channel Manager"
    sql: ${TABLE}.channelmanager ;;
    hidden: yes
  }

  dimension: confirmation_cd {
    group_label: "Rate Plan Segments"
    type: string
    description: "Confirmation Code"
    sql: ${TABLE}.confirmationCd ;;
    hidden: yes
  }

  dimension: major_segment {
    group_label: "Rate Plan Segments"
    label: "Major Segment"
    type: string
    description: "Rate Plan Segment"
    sql: ${TABLE}.majorSegment ;;
  }

  dimension: sales_type {
    group_label: "Rate Plan Segments"
    label: "Sales Type"
    type: string
    description: "The sales type or category, which are Negotiated, Group or Contract"
    sql: ${TABLE}.salesType ;;
  }

  dimension: domain {
    group_label: "Rate Plan Segments"
    type: string
    description: "Booking Channel Manager"
    sql: ${TABLE}.domain ;;
    hidden: no
  }

  dimension: sales_flag {
    type: yesno
    hidden: no
    description: "Sales type is Group or Negotiated; or Negotiated Sales Plan Code is not null"
    sql: case
      when ${sales_type} in ('Negotiated','Group') then true
      when ${negotiated_rate_plan_code} is not null then true
      else false
    end
        ;;
  }

  dimension: notes_raw {
    group_label: "Rate Plan"
    label: "Raw Guesty Notes"
    type: string
    description: "Raw Guesty Notes Field"
    sql: ${TABLE}.notesRaw ;;
  }

  dimension: promo_external_id {
    group_label: "Rate Plan"
    label: "Promotion External ID - Booking.com"
    type: string
    description: "Promotion External ID"
    sql: ${TABLE}.promoExternalId ;;
  }

  dimension: promo_name {
    group_label: "Rate Plan"
    label: "Promotion Name - Expedia"
    type: string
    description: "Promotion Name"
    sql: ${TABLE}.promoName ;;
  }

  dimension: rate_plan_code {
    group_label: "Rate Plan Segments"
    label: "Rate Plan Code"
    hidden: no
    type: string
    description: "Rate Plan Code"
    sql: ${TABLE}.ratePlanCode ;;
  }

  dimension: rate_plan_id {
    group_label: "Rate Plan Segments"
    label: "Rate Plan ID"
    hidden: yes
    type: string
    description: "Rate Plan ID"
    sql: ${TABLE}.ratePlanId ;;
  }

  dimension: rate_plan_name {
    group_label: "Rate Plan Segments"
    label: "Rate Plan Name"
    hidden: no
    type: string
    description: "Rate Plan Name"
    sql: ${TABLE}.ratePlanName ;;
  }

  dimension: rate_plan_type {
    group_label: "Rate Plan Segments"
    type: string
    description: "Rate Plan Type"
    sql: ${TABLE}.ratePlanType ;;
    hidden: no
  }

  dimension: rate_plan_version {
    group_label: "Rate Plan Segments"
    type: number
    description: "Rate Plan Version"
    sql: ${TABLE}.ratePlanVersion ;;
    hidden: no
  }

  dimension: reservation_id {
    group_label: "Rate Plan Segments"
    type: string
    description: "Reservation ID"
    sql: ${TABLE}.reservationId ;;
    primary_key: yes
    hidden: yes
  }

  dimension: sub_segment {
    group_label: "Rate Plan Segments"
    label: "SubSegment"
    type: string
    description: "Rate Plan SubSegment"
    sql: ${TABLE}.subSegment ;;
  }

  dimension: sub_segment_detail {
    group_label: "Rate Plan Segments"
    label: "SubSegment Detail"
    type: string
    description: "Rate Plan SubSegment Detail"
    sql: ${TABLE}.subSegmentDetail ;;
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

}
