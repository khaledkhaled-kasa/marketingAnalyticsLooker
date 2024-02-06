view: reservations {
  sql_table_name: `data-warehouse-333815.reservations.fctReservations`  ;;
  label: "Reservations"


######################################## PK and FK ##############################
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
  }

  dimension: unit {
    type: string
    hidden: yes
    sql: ${TABLE}.unitId ;;
  }

  dimension: property {
    hidden: yes
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: _id {
    hidden: yes
    type: string
    sql: ${TABLE}.reservationId ;;
  }

  dimension: persona_type {
    hidden: no
    label: "Persona Type"
    type: string
    group_label: "Guest Personas"
    description: "A tag showing the main persona or style of the guest, like Functional Family or Style Snobs. This helps us understand and cater to different guest needs"
    sql: ${TABLE}.personaType ;;
  }

  dimension: source {
    label: "Source (Channel) - Kontrol"
    group_label:"Reservation Summary"
    hidden: yes
    type: string
    sql: ${TABLE}.KontrolSource ;;
  }

  dimension: source_detail {
    label: "Source (Channel) Detail - Kontrol"
    group_label:"Reservation Summary"
    hidden: yes
    type: string
    sql: ${TABLE}.Kontrolsourcedetail ;;
  }

  dimension: sourcedata_channel {
    label: "Source (Channel)"
    group_label:"Reservation Summary"
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: sourcedata_channel_refined {
    label: "Source (Channel)*"
    hidden: yes
    group_label:"Custom Groupings"
    description: "This source channel has been adjusted to group to channels of interested and grouping smaller channels to others"
    type: string
    sql: ${TABLE}.channelRefined ;;
  }

  dimension: sourcedata_channel_manager {
    label: "Source (Channel Manager)"
    type: string
    group_label:"Reservation Summary"
    sql: ${TABLE}.channelmanager ;;
  }
}
