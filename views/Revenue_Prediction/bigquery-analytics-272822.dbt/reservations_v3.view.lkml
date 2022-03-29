view: reservations_v3 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-analytics-272822.dbt.reservations_v3`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " V" in Explore.

  dimension: __v {
    type: number
    sql: ${TABLE}.__v ;;
  }

  dimension: _id {
    type: string
    sql: ${TABLE}._id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_deleted {
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
    sql: ${TABLE}._sdc_deleted_at ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: additionalguests {
    hidden: yes
    sql: ${TABLE}.additionalguests ;;
  }

  dimension: additionalguests__re___id {
    type: string
    sql: ${TABLE}.additionalguests__re._id ;;
    group_label: "Additionalguests Re"
    group_item_label: "ID"
  }

  dimension: additionalguests__re__email {
    type: string
    sql: ${TABLE}.additionalguests__re.email ;;
    group_label: "Additionalguests Re"
    group_item_label: "Email"
  }

  dimension: additionalguests__re__name {
    type: string
    sql: ${TABLE}.additionalguests__re.name ;;
    group_label: "Additionalguests Re"
    group_item_label: "Name"
  }

  dimension: apis__guesty_reservation {
    type: string
    sql: ${TABLE}.apis.guesty_reservation ;;
    group_label: "Apis"
    group_item_label: "Guesty Reservation"
  }

  dimension: basd {
    type: string
    sql: ${TABLE}.basd ;;
  }

  dimension_group: bookingdate {
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
    sql: ${TABLE}.bookingdate ;;
  }

  dimension: bookingflags {
    hidden: yes
    sql: ${TABLE}.bookingflags ;;
  }

  dimension: bookings_with_extensions {
    type: number
    sql: ${TABLE}.bookings_with_extensions ;;
  }

  dimension: bringingpets {
    type: yesno
    sql: ${TABLE}.bringingpets ;;
  }

  dimension: building_stay_count {
    type: number
    sql: ${TABLE}.building_stay_count ;;
  }

  dimension: callboxcode {
    type: string
    sql: ${TABLE}.callboxcode ;;
  }

  dimension_group: cancellationdate {
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
    sql: ${TABLE}.cancellationdate ;;
  }

  dimension: cards {
    hidden: yes
    sql: ${TABLE}.cards ;;
  }

  dimension: chargelogs {
    hidden: yes
    sql: ${TABLE}.chargelogs ;;
  }

  dimension: checkindate {
    type: string
    sql: ${TABLE}.checkindate ;;
  }

  dimension: checkindatelocal {
    type: string
    sql: ${TABLE}.checkindatelocal ;;
  }

  dimension: checkoutdate {
    type: string
    sql: ${TABLE}.checkoutdate ;;
  }

  dimension: checkoutdatelocal {
    type: string
    sql: ${TABLE}.checkoutdatelocal ;;
  }

  dimension: confirmationcode {
    type: string
    sql: ${TABLE}.confirmationcode ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: discounts {
    hidden: yes
    sql: ${TABLE}.discounts ;;
  }

  dimension: earlycheckin__acceptedtime {
    type: number
    sql: ${TABLE}.earlycheckin.acceptedtime ;;
    group_label: "Earlycheckin"
    group_item_label: "Acceptedtime"
  }

  dimension: earlycheckin__approvedtime {
    type: number
    sql: ${TABLE}.earlycheckin.approvedtime ;;
    group_label: "Earlycheckin"
    group_item_label: "Approvedtime"
  }

  dimension: earlycheckin__approvedtime__fl {
    type: number
    sql: ${TABLE}.earlycheckin.approvedtime__fl ;;
    group_label: "Earlycheckin Approvedtime"
    group_item_label: "Fl"
  }

  dimension: earlycheckin__requestedtime {
    type: number
    sql: ${TABLE}.earlycheckin.requestedtime ;;
    group_label: "Earlycheckin"
    group_item_label: "Requestedtime"
  }

  dimension: earlycheckin__requestedtime__fl {
    type: number
    sql: ${TABLE}.earlycheckin.requestedtime__fl ;;
    group_label: "Earlycheckin Requestedtime"
    group_item_label: "Fl"
  }

  dimension: earlycheckin__requestnote {
    type: string
    sql: ${TABLE}.earlycheckin.requestnote ;;
    group_label: "Earlycheckin"
    group_item_label: "Requestnote"
  }

  dimension: earlycheckin__status {
    type: string
    sql: ${TABLE}.earlycheckin.status ;;
    group_label: "Earlycheckin"
    group_item_label: "Status"
  }

  dimension: email {
    hidden: yes
    sql: ${TABLE}.email ;;
  }

  dimension: extended_booking {
    type: number
    sql: ${TABLE}.extended_booking ;;
  }

  dimension: extension__blockedfrom {
    type: string
    sql: ${TABLE}.extension.blockedfrom ;;
    group_label: "Extension"
    group_item_label: "Blockedfrom"
  }

  dimension: extension__blockedto {
    type: string
    sql: ${TABLE}.extension.blockedto ;;
    group_label: "Extension"
    group_item_label: "Blockedto"
  }

  dimension: extension__extendedby {
    type: string
    sql: ${TABLE}.extension.extendedby ;;
    group_label: "Extension"
    group_item_label: "Extendedby"
  }

  dimension: extension__extensionof {
    type: string
    sql: ${TABLE}.extension.extensionof ;;
    group_label: "Extension"
    group_item_label: "Extensionof"
  }

  dimension: extension__inquiry {
    type: string
    sql: ${TABLE}.extension.inquiry ;;
    group_label: "Extension"
    group_item_label: "Inquiry"
  }

  dimension: externalrefs__guesty_id {
    type: string
    sql: ${TABLE}.externalrefs.guesty_id ;;
    group_label: "Externalrefs"
    group_item_label: "Guesty ID"
  }

  dimension: externalrefs__stripecardid {
    type: string
    sql: ${TABLE}.externalrefs.stripecardid ;;
    group_label: "Externalrefs"
    group_item_label: "Stripecardid"
  }

  dimension: fullname {
    hidden: yes
    sql: ${TABLE}.fullname ;;
  }

  dimension: guest {
    type: string
    sql: ${TABLE}.guest ;;
  }

  dimension: guest_type {
    type: string
    sql: ${TABLE}.guest_type ;;
  }

  dimension: guestid {
    type: string
    sql: ${TABLE}.guestid ;;
  }

  dimension: guestisverified {
    type: yesno
    sql: ${TABLE}.guestisverified ;;
  }

  dimension: guests_email {
    type: string
    sql: ${TABLE}.guests_email ;;
  }

  dimension: guestscount {
    type: number
    sql: ${TABLE}.guestscount ;;
  }

  dimension: guestscount__fl {
    type: number
    sql: ${TABLE}.guestscount__fl ;;
  }

  dimension: guesty__source {
    type: string
    sql: ${TABLE}.guesty.source ;;
    group_label: "Guesty"
    group_item_label: "Source"
  }

  dimension: history {
    hidden: yes
    sql: ${TABLE}.history ;;
  }

  dimension: incidentreport__incidentnote {
    type: string
    sql: ${TABLE}.incidentreport.incidentnote ;;
    group_label: "Incidentreport"
    group_item_label: "Incidentnote"
  }

  dimension: incidentreport__incidents {
    hidden: yes
    sql: ${TABLE}.incidentreport.incidents ;;
    group_label: "Incidentreport"
    group_item_label: "Incidents"
  }

  dimension: infinitystones__auditlog {
    hidden: yes
    sql: ${TABLE}.infinitystones.auditlog ;;
    group_label: "Infinitystones"
    group_item_label: "Auditlog"
  }

  dimension: infinitystones__awaitingresponsedetails__leftvoicemail {
    type: yesno
    sql: ${TABLE}.infinitystones.awaitingresponsedetails.leftvoicemail ;;
    group_label: "Infinitystones Awaitingresponsedetails"
    group_item_label: "Leftvoicemail"
  }

  dimension: infinitystones__awaitingresponsedetails__phonerang {
    type: yesno
    sql: ${TABLE}.infinitystones.awaitingresponsedetails.phonerang ;;
    group_label: "Infinitystones Awaitingresponsedetails"
    group_item_label: "Phonerang"
  }

  dimension: infinitystones__guestisverified {
    type: yesno
    sql: ${TABLE}.infinitystones.guestisverified ;;
    group_label: "Infinitystones"
    group_item_label: "Guestisverified"
  }

  dimension: infinitystones__haspaid {
    type: yesno
    sql: ${TABLE}.infinitystones.haspaid ;;
    group_label: "Infinitystones"
    group_item_label: "Haspaid"
  }

  dimension: infinitystones__haspaid__st {
    type: string
    sql: ${TABLE}.infinitystones.haspaid__st ;;
    group_label: "Infinitystones Haspaid"
    group_item_label: "St"
  }

  dimension_group: infinitystones__partyrisk__calculatedat {
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
    sql: ${TABLE}.infinitystones.partyrisk.calculatedat ;;
    group_label: "Infinitystones Partyrisk"
    group_item_label: "Calculatedat"
  }

  dimension: infinitystones__partyrisk__reservationriskscore {
    type: string
    sql: ${TABLE}.infinitystones.partyrisk.reservationriskscore ;;
    group_label: "Infinitystones Partyrisk"
    group_item_label: "Reservationriskscore"
  }

  dimension: infinitystones__partyrisk__risklevel {
    type: string
    sql: ${TABLE}.infinitystones.partyrisk.risklevel ;;
    group_label: "Infinitystones Partyrisk"
    group_item_label: "Risklevel"
  }

  dimension: infinitystones__passedphonedetails__answeredphone {
    type: yesno
    sql: ${TABLE}.infinitystones.passedphonedetails.answeredphone ;;
    group_label: "Infinitystones Passedphonedetails"
    group_item_label: "Answeredphone"
  }

  dimension: infinitystones__passedphonedetails__calledback {
    type: yesno
    sql: ${TABLE}.infinitystones.passedphonedetails.calledback ;;
    group_label: "Infinitystones Passedphonedetails"
    group_item_label: "Calledback"
  }

  dimension: infinitystones__passedphonedetails__messagedback {
    type: yesno
    sql: ${TABLE}.infinitystones.passedphonedetails.messagedback ;;
    group_label: "Infinitystones Passedphonedetails"
    group_item_label: "Messagedback"
  }

  dimension: infinitystones__passedphonedetails__notes {
    type: string
    sql: ${TABLE}.infinitystones.passedphonedetails.notes ;;
    group_label: "Infinitystones Passedphonedetails"
    group_item_label: "Notes"
  }

  dimension: infinitystones__riskstatus {
    type: string
    sql: ${TABLE}.infinitystones.riskstatus ;;
    group_label: "Infinitystones"
    group_item_label: "Riskstatus"
  }

  dimension: infinitystones__status {
    type: string
    sql: ${TABLE}.infinitystones.status ;;
    group_label: "Infinitystones"
    group_item_label: "Status"
  }

  dimension: infinitystones__status__bo {
    type: yesno
    sql: ${TABLE}.infinitystones.status__bo ;;
    group_label: "Infinitystones Status"
    group_item_label: "Bo"
  }

  dimension_group: infinitystones__trustrisk__calculatedat {
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
    sql: ${TABLE}.infinitystones.trustrisk.calculatedat ;;
    group_label: "Infinitystones Trustrisk"
    group_item_label: "Calculatedat"
  }

  dimension: infinitystones__trustrisk__reservationriskscore {
    type: string
    sql: ${TABLE}.infinitystones.trustrisk.reservationriskscore ;;
    group_label: "Infinitystones Trustrisk"
    group_item_label: "Reservationriskscore"
  }

  dimension: infinitystones__trustrisk__risklevel {
    type: string
    sql: ${TABLE}.infinitystones.trustrisk.risklevel ;;
    group_label: "Infinitystones Trustrisk"
    group_item_label: "Risklevel"
  }

  dimension: initial_booking {
    type: number
    sql: ${TABLE}.initial_booking ;;
  }

  dimension: isverified {
    type: yesno
    sql: ${TABLE}.isverified ;;
  }

  dimension_group: kbc__submittedat {
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
    sql: ${TABLE}.kbc.submittedat ;;
    group_label: "Kbc"
    group_item_label: "Submittedat"
  }

  dimension: keycafeaccess__accesscode {
    type: string
    sql: ${TABLE}.keycafeaccess.accesscode ;;
    group_label: "Keycafeaccess"
    group_item_label: "Accesscode"
  }

  dimension: keycafeaccess__accessid {
    type: string
    sql: ${TABLE}.keycafeaccess.accessid ;;
    group_label: "Keycafeaccess"
    group_item_label: "Accessid"
  }

  dimension: latch__link {
    type: string
    sql: ${TABLE}.latch.link ;;
    group_label: "Latch"
    group_item_label: "Link"
  }

  dimension: latch__smartlockcode {
    type: string
    sql: ${TABLE}.latch.smartlockcode ;;
    group_label: "Latch"
    group_item_label: "Smartlockcode"
  }

  dimension: latecheckout__approvedtime {
    type: number
    sql: ${TABLE}.latecheckout.approvedtime ;;
    group_label: "Latecheckout"
    group_item_label: "Approvedtime"
  }

  dimension: latecheckout__requestedtime {
    type: number
    sql: ${TABLE}.latecheckout.requestedtime ;;
    group_label: "Latecheckout"
    group_item_label: "Requestedtime"
  }

  dimension: latecheckout__status {
    type: string
    sql: ${TABLE}.latecheckout.status ;;
    group_label: "Latecheckout"
    group_item_label: "Status"
  }

  dimension: licenseplate {
    type: string
    sql: ${TABLE}.licenseplate ;;
  }

  dimension: listingaddress {
    type: string
    sql: ${TABLE}.listingaddress ;;
  }

  dimension: listingname {
    type: string
    sql: ${TABLE}.listingname ;;
  }

  dimension: maybebringingpetsdespiteban {
    type: yesno
    sql: ${TABLE}.maybebringingpetsdespiteban ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: notes {
    hidden: yes
    sql: ${TABLE}.notes ;;
  }

  dimension: number_of_bookings {
    type: number
    sql: ${TABLE}.number_of_bookings ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_bookings {
    type: sum
    sql: ${number_of_bookings} ;;
  }

  measure: average_number_of_bookings {
    type: average
    sql: ${number_of_bookings} ;;
  }

  dimension: number_of_unique_reservations {
    type: number
    sql: ${TABLE}.number_of_unique_reservations ;;
  }

  dimension: numberofpets {
    type: number
    sql: ${TABLE}.numberofpets ;;
  }

  dimension: numberofpets__st {
    type: string
    sql: ${TABLE}.numberofpets__st ;;
  }

  dimension: parkingspaceneeded {
    type: yesno
    sql: ${TABLE}.parkingspaceneeded ;;
  }

  dimension_group: partition {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.partition_date ;;
  }

  dimension: petdescription {
    type: string
    sql: ${TABLE}.petdescription ;;
  }

  dimension_group: petfeescard__submittedat {
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
    sql: ${TABLE}.petfeescard.submittedat ;;
    group_label: "Petfeescard"
    group_item_label: "Submittedat"
  }

  dimension: petfeescard__wasprovided {
    type: yesno
    sql: ${TABLE}.petfeescard.wasprovided ;;
    group_label: "Petfeescard"
    group_item_label: "Wasprovided"
  }

  dimension: pets {
    type: yesno
    sql: ${TABLE}.pets ;;
  }

  dimension: pettype {
    type: string
    sql: ${TABLE}.pettype ;;
  }

  dimension: phone {
    hidden: yes
    sql: ${TABLE}.phone ;;
  }

  dimension: plannedarrival {
    type: string
    sql: ${TABLE}.plannedarrival ;;
  }

  dimension: planneddeparture {
    type: string
    sql: ${TABLE}.planneddeparture ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: precedingcleaningtask {
    type: string
    sql: ${TABLE}.precedingcleaningtask ;;
  }

  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: reasonforstay {
    type: string
    sql: ${TABLE}.reasonforstay ;;
  }

  dimension: reservationrisk__backgroundstatus {
    type: string
    sql: ${TABLE}.reservationrisk.backgroundstatus ;;
    group_label: "Reservationrisk"
    group_item_label: "Backgroundstatus"
  }

  dimension: reservationrisk__backgroundstatusaudit {
    hidden: yes
    sql: ${TABLE}.reservationrisk.backgroundstatusaudit ;;
    group_label: "Reservationrisk"
    group_item_label: "Backgroundstatusaudit"
  }

  dimension: reservationrisk__guestphotolocation {
    type: string
    sql: ${TABLE}.reservationrisk.guestphotolocation ;;
    group_label: "Reservationrisk"
    group_item_label: "Guestphotolocation"
  }

  dimension: reservationrisk__iddocumentlocation {
    type: string
    sql: ${TABLE}.reservationrisk.iddocumentlocation ;;
    group_label: "Reservationrisk"
    group_item_label: "Iddocumentlocation"
  }

  dimension: reservationrisk__iddocumenttype {
    type: string
    sql: ${TABLE}.reservationrisk.iddocumenttype ;;
    group_label: "Reservationrisk"
    group_item_label: "Iddocumenttype"
  }

  dimension: reservationrisk__verificationstatus {
    type: string
    sql: ${TABLE}.reservationrisk.verificationstatus ;;
    group_label: "Reservationrisk"
    group_item_label: "Verificationstatus"
  }

  dimension: reservationrisk__verificationstatusaudit {
    hidden: yes
    sql: ${TABLE}.reservationrisk.verificationstatusaudit ;;
    group_label: "Reservationrisk"
    group_item_label: "Verificationstatusaudit"
  }

  dimension: roomtype {
    type: string
    sql: ${TABLE}.roomtype ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: securitydeposit__amountcharged {
    type: number
    sql: ${TABLE}.securitydeposit.amountcharged ;;
    group_label: "Securitydeposit"
    group_item_label: "Amountcharged"
  }

  dimension: securitydeposit__amountreleased {
    type: number
    sql: ${TABLE}.securitydeposit.amountreleased ;;
    group_label: "Securitydeposit"
    group_item_label: "Amountreleased"
  }

  dimension: securitydeposit__amounttowithhold {
    type: number
    sql: ${TABLE}.securitydeposit.amounttowithhold ;;
    group_label: "Securitydeposit"
    group_item_label: "Amounttowithhold"
  }

  dimension_group: securitydeposit__releasedat {
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
    sql: ${TABLE}.securitydeposit.releasedat ;;
    group_label: "Securitydeposit"
    group_item_label: "Releasedat"
  }

  dimension: securitydeposit__status {
    type: string
    sql: ${TABLE}.securitydeposit.status ;;
    group_label: "Securitydeposit"
    group_item_label: "Status"
  }

  dimension: securitydepositref {
    type: string
    sql: ${TABLE}.securitydepositref ;;
  }

  dimension: signeddoc {
    type: string
    sql: ${TABLE}.signeddoc ;;
  }

  dimension: signeddoc2 {
    type: string
    sql: ${TABLE}.signeddoc2 ;;
  }

  dimension: smartlock {
    type: string
    sql: ${TABLE}.smartlock ;;
  }

  dimension: smartlockcode {
    type: string
    sql: ${TABLE}.smartlockcode ;;
  }

  dimension: smartlockcode__it {
    type: number
    sql: ${TABLE}.smartlockcode__it ;;
  }

  dimension: smartlockcodeisset {
    type: yesno
    sql: ${TABLE}.smartlockcodeisset ;;
  }

  dimension: smartlockcodeisset__st {
    type: string
    sql: ${TABLE}.smartlockcodeisset__st ;;
  }

  dimension: smartlockcodetype {
    type: string
    sql: ${TABLE}.smartlockcodetype ;;
  }

  dimension: smartlockisset {
    type: yesno
    sql: ${TABLE}.smartlockisset ;;
  }

  dimension: smartlocktype {
    type: string
    sql: ${TABLE}.smartlocktype ;;
  }

  dimension: smartloctype {
    type: string
    sql: ${TABLE}.smartloctype ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: sourcedata__channel {
    type: string
    sql: ${TABLE}.sourcedata.channel ;;
    group_label: "Sourcedata"
    group_item_label: "Channel"
  }

  dimension: sourcedata__channelmanager {
    type: string
    sql: ${TABLE}.sourcedata.channelmanager ;;
    group_label: "Sourcedata"
    group_item_label: "Channelmanager"
  }

  dimension: sourcedetail {
    type: string
    sql: ${TABLE}.sourcedetail ;;
  }

  dimension: specialrequest {
    type: string
    sql: ${TABLE}.specialrequest ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_revised {
    type: string
    sql: ${TABLE}.status_revised ;;
  }

  dimension_group: submittedat {
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
    sql: ${TABLE}.submittedat ;;
  }

  dimension: suspicious {
    type: yesno
    sql: ${TABLE}.suspicious ;;
  }

  dimension: termsaccepted {
    type: yesno
    sql: ${TABLE}.termsaccepted ;;
  }

  dimension: termsaccepted2 {
    type: yesno
    sql: ${TABLE}.termsaccepted2 ;;
  }

  dimension: termsaccepted__st {
    type: string
    sql: ${TABLE}.termsaccepted__st ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: unit_stay_count {
    type: number
    sql: ${TABLE}.unit_stay_count ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  measure: count {
    type: count
    drill_fields: [nickname, listingname, additionalguests__re__name, fullname]
  }
}

# The name of this view in Looker is "Reservations V3 Phone"
view: reservations_v3__phone {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__phone {
    type: string
    hidden: yes
    sql: reservations_v3__phone ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Email"
view: reservations_v3__email {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__email {
    type: string
    hidden: yes
    sql: reservations_v3__email ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Notes"
view: reservations_v3__notes {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__notes {
    type: string
    hidden: yes
    sql: reservations_v3__notes ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__kind {
    type: string
    sql: value.kind ;;
    group_label: "Value"
    group_item_label: "Kind"
  }

  dimension: value__value {
    type: string
    sql: value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}

# The name of this view in Looker is "Reservations V3 Cards"
view: reservations_v3__cards {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__cards {
    type: string
    hidden: yes
    sql: reservations_v3__cards ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__card {
    type: string
    sql: value.card ;;
    group_label: "Value"
    group_item_label: "Card"
  }

  dimension: value__usefor {
    hidden: yes
    sql: value.usefor ;;
    group_label: "Value"
    group_item_label: "Usefor"
  }
}

# The name of this view in Looker is "Reservations V3 History"
view: reservations_v3__history {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__history {
    type: string
    hidden: yes
    sql: reservations_v3__history ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__diff__additionalguests {
    hidden: yes
    sql: value.diff.additionalguests ;;
    group_label: "Value Diff"
    group_item_label: "Additionalguests"
  }

  dimension: value__diff__bookingdate {
    type: string
    sql: value.diff.bookingdate ;;
    group_label: "Value Diff"
    group_item_label: "Bookingdate"
  }

  dimension: value__diff__bookingflags {
    hidden: yes
    sql: value.diff.bookingflags ;;
    group_label: "Value Diff"
    group_item_label: "Bookingflags"
  }

  dimension: value__diff__bringingpets {
    type: yesno
    sql: value.diff.bringingpets ;;
    group_label: "Value Diff"
    group_item_label: "Bringingpets"
  }

  dimension: value__diff__cancellationdate {
    type: string
    sql: value.diff.cancellationdate ;;
    group_label: "Value Diff"
    group_item_label: "Cancellationdate"
  }

  dimension: value__diff__cards {
    hidden: yes
    sql: value.diff.cards ;;
    group_label: "Value Diff"
    group_item_label: "Cards"
  }

  dimension: value__diff__checkindate {
    type: string
    sql: value.diff.checkindate ;;
    group_label: "Value Diff"
    group_item_label: "Checkindate"
  }

  dimension: value__diff__checkindatelocal {
    type: string
    sql: value.diff.checkindatelocal ;;
    group_label: "Value Diff"
    group_item_label: "Checkindatelocal"
  }

  dimension: value__diff__checkoutdate {
    type: string
    sql: value.diff.checkoutdate ;;
    group_label: "Value Diff"
    group_item_label: "Checkoutdate"
  }

  dimension: value__diff__checkoutdatelocal {
    type: string
    sql: value.diff.checkoutdatelocal ;;
    group_label: "Value Diff"
    group_item_label: "Checkoutdatelocal"
  }

  dimension: value__diff__confirmationcode {
    type: string
    sql: value.diff.confirmationcode ;;
    group_label: "Value Diff"
    group_item_label: "Confirmationcode"
  }

  dimension: value__diff__discounts {
    hidden: yes
    sql: value.diff.discounts ;;
    group_label: "Value Diff"
    group_item_label: "Discounts"
  }

  dimension: value__diff__earlycheckin__approvedtime {
    type: number
    sql: value.diff.earlycheckin.approvedtime ;;
    group_label: "Value Diff Earlycheckin"
    group_item_label: "Approvedtime"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__diff__earlycheckin__approvedtime {
    type: sum
    sql: ${value__diff__earlycheckin__approvedtime} ;;
  }

  measure: average_value__diff__earlycheckin__approvedtime {
    type: average
    sql: ${value__diff__earlycheckin__approvedtime} ;;
  }

  dimension: value__diff__earlycheckin__requestedtime {
    type: number
    sql: value.diff.earlycheckin.requestedtime ;;
    group_label: "Value Diff Earlycheckin"
    group_item_label: "Requestedtime"
  }

  dimension: value__diff__earlycheckin__requestnote {
    type: string
    sql: value.diff.earlycheckin.requestnote ;;
    group_label: "Value Diff Earlycheckin"
    group_item_label: "Requestnote"
  }

  dimension: value__diff__earlycheckin__status {
    type: string
    sql: value.diff.earlycheckin.status ;;
    group_label: "Value Diff Earlycheckin"
    group_item_label: "Status"
  }

  dimension: value__diff__earlycheckin_status {
    type: string
    sql: value.diff.earlycheckin_status ;;
    group_label: "Value Diff"
    group_item_label: "Earlycheckin Status"
  }

  dimension: value__diff__extension__extendedby {
    type: string
    sql: value.diff.extension.extendedby ;;
    group_label: "Value Diff Extension"
    group_item_label: "Extendedby"
  }

  dimension: value__diff__extension__extensionof {
    type: string
    sql: value.diff.extension.extensionof ;;
    group_label: "Value Diff Extension"
    group_item_label: "Extensionof"
  }

  dimension: value__diff__extension__inquiry {
    type: string
    sql: value.diff.extension.inquiry ;;
    group_label: "Value Diff Extension"
    group_item_label: "Inquiry"
  }

  dimension: value__diff__externalrefs__guesty_id {
    type: string
    sql: value.diff.externalrefs.guesty_id ;;
    group_label: "Value Diff Externalrefs"
    group_item_label: "Guesty ID"
  }

  dimension: value__diff__guest {
    type: string
    sql: value.diff.guest ;;
    group_label: "Value Diff"
    group_item_label: "Guest"
  }

  dimension: value__diff__guestscount {
    type: number
    sql: value.diff.guestscount ;;
    group_label: "Value Diff"
    group_item_label: "Guestscount"
  }

  dimension: value__diff__guesty__source {
    type: string
    sql: value.diff.guesty.source ;;
    group_label: "Value Diff Guesty"
    group_item_label: "Source"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: value__diff__kbc__submittedat {
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
    sql: value.diff.kbc.submittedat ;;
    group_label: "Value Diff Kbc"
    group_item_label: "Submittedat"
  }

  dimension: value__diff__latecheckout__approvedtime {
    type: number
    sql: value.diff.latecheckout.approvedtime ;;
    group_label: "Value Diff Latecheckout"
    group_item_label: "Approvedtime"
  }

  dimension: value__diff__latecheckout__requestedtime {
    type: number
    sql: value.diff.latecheckout.requestedtime ;;
    group_label: "Value Diff Latecheckout"
    group_item_label: "Requestedtime"
  }

  dimension: value__diff__latecheckout__status {
    type: string
    sql: value.diff.latecheckout.status ;;
    group_label: "Value Diff Latecheckout"
    group_item_label: "Status"
  }

  dimension: value__diff__licenseplate {
    type: string
    sql: value.diff.licenseplate ;;
    group_label: "Value Diff"
    group_item_label: "Licenseplate"
  }

  dimension: value__diff__notes {
    hidden: yes
    sql: value.diff.notes ;;
    group_label: "Value Diff"
    group_item_label: "Notes"
  }

  dimension: value__diff__numberofpets {
    type: number
    sql: value.diff.numberofpets ;;
    group_label: "Value Diff"
    group_item_label: "Numberofpets"
  }

  dimension: value__diff__parkingspaceneeded {
    type: yesno
    sql: value.diff.parkingspaceneeded ;;
    group_label: "Value Diff"
    group_item_label: "Parkingspaceneeded"
  }

  dimension: value__diff__petdescription {
    type: string
    sql: value.diff.petdescription ;;
    group_label: "Value Diff"
    group_item_label: "Petdescription"
  }

  dimension_group: value__diff__petfeescard__submittedat {
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
    sql: value.diff.petfeescard.submittedat ;;
    group_label: "Value Diff Petfeescard"
    group_item_label: "Submittedat"
  }

  dimension: value__diff__petfeescard__wasprovided {
    type: yesno
    sql: value.diff.petfeescard.wasprovided ;;
    group_label: "Value Diff Petfeescard"
    group_item_label: "Wasprovided"
  }

  dimension: value__diff__pettype {
    type: string
    sql: value.diff.pettype ;;
    group_label: "Value Diff"
    group_item_label: "Pettype"
  }

  dimension: value__diff__plannedarrival {
    type: string
    sql: value.diff.plannedarrival ;;
    group_label: "Value Diff"
    group_item_label: "Plannedarrival"
  }

  dimension: value__diff__planneddeparture {
    type: string
    sql: value.diff.planneddeparture ;;
    group_label: "Value Diff"
    group_item_label: "Planneddeparture"
  }

  dimension: value__diff__platform {
    type: string
    sql: value.diff.platform ;;
    group_label: "Value Diff"
    group_item_label: "Platform"
  }

  dimension: value__diff__property {
    type: string
    sql: value.diff.property ;;
    group_label: "Value Diff"
    group_item_label: "Property"
  }

  dimension: value__diff__reasonforstay {
    type: string
    sql: value.diff.reasonforstay ;;
    group_label: "Value Diff"
    group_item_label: "Reasonforstay"
  }

  dimension: value__diff__roomtype {
    type: string
    sql: value.diff.roomtype ;;
    group_label: "Value Diff"
    group_item_label: "Roomtype"
  }

  dimension: value__diff__securitydepositref {
    type: string
    sql: value.diff.securitydepositref ;;
    group_label: "Value Diff"
    group_item_label: "Securitydepositref"
  }

  dimension: value__diff__signeddoc {
    type: string
    sql: value.diff.signeddoc ;;
    group_label: "Value Diff"
    group_item_label: "Signeddoc"
  }

  dimension: value__diff__source {
    type: string
    sql: value.diff.source ;;
    group_label: "Value Diff"
    group_item_label: "Source"
  }

  dimension: value__diff__sourcedata__channel {
    type: string
    sql: value.diff.sourcedata.channel ;;
    group_label: "Value Diff Sourcedata"
    group_item_label: "Channel"
  }

  dimension: value__diff__sourcedata__channelmanager {
    type: string
    sql: value.diff.sourcedata.channelmanager ;;
    group_label: "Value Diff Sourcedata"
    group_item_label: "Channelmanager"
  }

  dimension: value__diff__sourcedetail {
    type: string
    sql: value.diff.sourcedetail ;;
    group_label: "Value Diff"
    group_item_label: "Sourcedetail"
  }

  dimension: value__diff__specialrequest {
    type: string
    sql: value.diff.specialrequest ;;
    group_label: "Value Diff"
    group_item_label: "Specialrequest"
  }

  dimension: value__diff__status {
    type: string
    sql: value.diff.status ;;
    group_label: "Value Diff"
    group_item_label: "Status"
  }

  dimension: value__diff__suspicious {
    type: yesno
    sql: value.diff.suspicious ;;
    group_label: "Value Diff"
    group_item_label: "Suspicious"
  }

  dimension: value__diff__termsaccepted {
    type: yesno
    sql: value.diff.termsaccepted ;;
    group_label: "Value Diff"
    group_item_label: "Termsaccepted"
  }

  dimension: value__diff__timezone {
    type: string
    sql: value.diff.timezone ;;
    group_label: "Value Diff"
    group_item_label: "Timezone"
  }

  dimension: value__diff__unit {
    type: string
    sql: value.diff.unit ;;
    group_label: "Value Diff"
    group_item_label: "Unit"
  }

  dimension_group: value__diff__updatedat {
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
    sql: value.diff.updatedat ;;
    group_label: "Value Diff"
    group_item_label: "Updatedat"
  }

  dimension_group: value__modifiedat {
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
    sql: value.modifiedat ;;
    group_label: "Value"
    group_item_label: "Modifiedat"
  }

  dimension: value__roomtype {
    type: string
    sql: value.roomtype ;;
    group_label: "Value"
    group_item_label: "Roomtype"
  }

  dimension: value__unit {
    type: string
    sql: value.unit ;;
    group_label: "Value"
    group_item_label: "Unit"
  }
}

# The name of this view in Looker is "Reservations V3 Fullname"
view: reservations_v3__fullname {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__fullname {
    type: string
    hidden: yes
    sql: reservations_v3__fullname ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Discounts"
view: reservations_v3__discounts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__discounts {
    type: string
    hidden: yes
    sql: reservations_v3__discounts ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__amountsaved {
    type: number
    sql: value.amountsaved ;;
    group_label: "Value"
    group_item_label: "Amountsaved"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__amountsaved {
    type: sum
    sql: ${value__amountsaved} ;;
  }

  measure: average_value__amountsaved {
    type: average
    sql: ${value__amountsaved} ;;
  }

  dimension: value__amountsaved__fl {
    type: number
    sql: value.amountsaved__fl ;;
    group_label: "Value Amountsaved"
    group_item_label: "Fl"
  }

  dimension: value__code {
    type: string
    sql: value.code ;;
    group_label: "Value"
    group_item_label: "Code"
  }

  dimension: value__percentoff {
    type: number
    sql: value.percentoff ;;
    group_label: "Value"
    group_item_label: "Percentoff"
  }
}

# The name of this view in Looker is "Reservations V3 Chargelogs"
view: reservations_v3__chargelogs {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__chargelogs {
    type: string
    hidden: yes
    sql: reservations_v3__chargelogs ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Bookingflags"
view: reservations_v3__bookingflags {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__bookingflags {
    type: string
    hidden: yes
    sql: reservations_v3__bookingflags ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Additionalguests"
view: reservations_v3__additionalguests {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: reservations_v3__additionalguests {
    type: string
    hidden: yes
    sql: reservations_v3__additionalguests ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__email {
    type: string
    sql: value.email ;;
    group_label: "Value"
    group_item_label: "Email"
  }

  dimension: value__name {
    type: string
    sql: value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }

  dimension: value__name_ {
    type: string
    sql: value.name_ ;;
    group_label: "Value"
    group_item_label: "Name"
  }
}

# The name of this view in Looker is "Reservations V3 Cards Value Usefor"
view: reservations_v3__cards__value__usefor {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Incidentreport Incidents"
view: reservations_v3__incidentreport__incidents {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Reservations V3 Infinitystones Auditlog"
view: reservations_v3__infinitystones__auditlog {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: ${TABLE}.value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__field {
    type: string
    sql: ${TABLE}.value.field ;;
    group_label: "Value"
    group_item_label: "Field"
  }

  dimension: value__reason {
    type: string
    sql: ${TABLE}.value.reason ;;
    group_label: "Value"
    group_item_label: "Reason"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: value__timestamp {
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
    sql: ${TABLE}.value.timestamp ;;
    group_label: "Value"
    group_item_label: "Timestamp"
  }

  dimension: value__updatedstatus {
    type: string
    sql: ${TABLE}.value.updatedstatus ;;
    group_label: "Value"
    group_item_label: "Updatedstatus"
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Cards"
view: reservations_v3__history__value__diff__cards {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: ${TABLE}.value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__card {
    type: string
    sql: ${TABLE}.value.card ;;
    group_label: "Value"
    group_item_label: "Card"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: value__usefor {
    hidden: yes
    sql: ${TABLE}.value.usefor ;;
    group_label: "Value"
    group_item_label: "Usefor"
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Notes"
view: reservations_v3__history__value__diff__notes {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value Kind" in Explore.

  dimension: value__kind {
    type: string
    sql: ${TABLE}.value.kind ;;
    group_label: "Value"
    group_item_label: "Kind"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Bookingflags"
view: reservations_v3__history__value__diff__bookingflags {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Discounts"
view: reservations_v3__history__value__diff__discounts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value Amountsaved" in Explore.

  dimension: value__amountsaved {
    type: number
    sql: ${TABLE}.value.amountsaved ;;
    group_label: "Value"
    group_item_label: "Amountsaved"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__amountsaved {
    type: sum
    sql: ${value__amountsaved} ;;
  }

  measure: average_value__amountsaved {
    type: average
    sql: ${value__amountsaved} ;;
  }

  dimension: value__code {
    type: string
    sql: ${TABLE}.value.code ;;
    group_label: "Value"
    group_item_label: "Code"
  }

  dimension: value__percentoff {
    type: number
    sql: ${TABLE}.value.percentoff ;;
    group_label: "Value"
    group_item_label: "Percentoff"
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Cards Value Usefor"
view: reservations_v3__history__value__diff__cards__value__usefor {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Reservations V3 History Value Diff Additionalguests"
view: reservations_v3__history__value__diff__additionalguests {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: ${TABLE}.value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__email {
    type: string
    sql: ${TABLE}.value.email ;;
    group_label: "Value"
    group_item_label: "Email"
  }

  dimension: value__name {
    type: string
    sql: ${TABLE}.value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }
}

# The name of this view in Looker is "Reservations V3 Reservationrisk Backgroundstatusaudit"
view: reservations_v3__reservationrisk__backgroundstatusaudit {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: ${TABLE}.value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__reason {
    type: string
    sql: ${TABLE}.value.reason ;;
    group_label: "Value"
    group_item_label: "Reason"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: value__timestamp {
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
    sql: ${TABLE}.value.timestamp ;;
    group_label: "Value"
    group_item_label: "Timestamp"
  }

  dimension: value__updatedstatus {
    type: string
    sql: ${TABLE}.value.updatedstatus ;;
    group_label: "Value"
    group_item_label: "Updatedstatus"
  }
}

# The name of this view in Looker is "Reservations V3 Reservationrisk Verificationstatusaudit"
view: reservations_v3__reservationrisk__verificationstatusaudit {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value___id {
    type: string
    sql: ${TABLE}.value._id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__reason {
    type: string
    sql: ${TABLE}.value.reason ;;
    group_label: "Value"
    group_item_label: "Reason"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: value__timestamp {
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
    sql: ${TABLE}.value.timestamp ;;
    group_label: "Value"
    group_item_label: "Timestamp"
  }

  dimension: value__updatedstatus {
    type: string
    sql: ${TABLE}.value.updatedstatus ;;
    group_label: "Value"
    group_item_label: "Updatedstatus"
  }

  dimension: value__updatedverificationstatus {
    type: string
    sql: ${TABLE}.value.updatedverificationstatus ;;
    group_label: "Value"
    group_item_label: "Updatedverificationstatus"
  }
}
