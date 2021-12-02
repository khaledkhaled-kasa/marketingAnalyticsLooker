# The name of this view in Looker is "Bigqueryanalytics272822 Dbt Units"
view: bigqueryanalytics272822_dbt_units {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-analytics-272822.dbt.units`
    ;;
  drill_fields: [externalrefs__guestyparentunitid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: externalrefs__guestyparentunitid {
    primary_key: yes
    type: string
    sql: ${TABLE}.externalrefs.guestyparentunitid ;;
    group_label: "Externalrefs"
    group_item_label: "Guestyparentunitid"
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " V" in Explore.

  dimension: __v {
    type: number
    sql: ${TABLE}.__v ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total___v {
    type: sum
    sql: ${__v} ;;
  }

  measure: average___v {
    type: average
    sql: ${__v} ;;
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

  dimension: accessitems {
    hidden: yes
    sql: ${TABLE}.accessitems ;;
  }

  dimension: accomodates {
    type: number
    sql: ${TABLE}.accomodates ;;
  }

  dimension: address___id {
    type: string
    sql: ${TABLE}.address._id ;;
    group_label: "Address"
    group_item_label: "ID"
  }

  dimension: address__city {
    type: string
    sql: ${TABLE}.address.city ;;
    group_label: "Address"
    group_item_label: "City"
  }

  dimension: address__country {
    type: string
    sql: ${TABLE}.address.country ;;
    group_label: "Address"
    group_item_label: "Country"
  }

  dimension: address__lat {
    type: number
    sql: ${TABLE}.address.lat ;;
    group_label: "Address"
    group_item_label: "Lat"
  }

  dimension: address__lon {
    type: number
    sql: ${TABLE}.address.lon ;;
    group_label: "Address"
    group_item_label: "Lon"
  }

  dimension: address__long {
    type: number
    sql: ${TABLE}.address.long ;;
    group_label: "Address"
    group_item_label: "Long"
  }

  dimension: address__state {
    type: string
    sql: ${TABLE}.address.state ;;
    group_label: "Address"
    group_item_label: "State"
  }

  dimension: address__street {
    type: string
    sql: ${TABLE}.address.street ;;
    group_label: "Address"
    group_item_label: "Street"
  }

  dimension: address__zip {
    type: string
    sql: ${TABLE}.address.zip ;;
    group_label: "Address"
    group_item_label: "Zip"
  }

  dimension: amenities {
    hidden: yes
    sql: ${TABLE}.amenities ;;
  }

  dimension: askadditionalguests {
    type: yesno
    sql: ${TABLE}.askadditionalguests ;;
  }

  dimension: availability__enddate {
    type: string
    sql: ${TABLE}.availability.enddate ;;
    group_label: "Availability"
    group_item_label: "Enddate"
  }

  dimension: availability__startdate {
    type: string
    sql: ${TABLE}.availability.startdate ;;
    group_label: "Availability"
    group_item_label: "Startdate"
  }

  dimension: availabilty__enddate {
    type: string
    sql: ${TABLE}.availabilty.enddate ;;
    group_label: "Availabilty"
    group_item_label: "Enddate"
  }

  dimension: availabilty__startdate {
    type: string
    sql: ${TABLE}.availabilty.startdate ;;
    group_label: "Availabilty"
    group_item_label: "Startdate"
  }

  dimension: backupsmartlockcodes {
    hidden: yes
    sql: ${TABLE}.backupsmartlockcodes ;;
  }

  dimension: baseprice {
    type: number
    sql: ${TABLE}.baseprice ;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}.bathrooms ;;
  }

  dimension: bathrooms__fl {
    type: number
    sql: ${TABLE}.bathrooms__fl ;;
  }

  dimension: bedrooms {
    type: number
    sql: ${TABLE}.bedrooms ;;
  }

  dimension: bookingwindowdays {
    type: number
    sql: ${TABLE}.bookingwindowdays ;;
  }

  dimension: bookingwindowdays__it {
    type: number
    sql: ${TABLE}.bookingwindowdays__it ;;
  }

  dimension: building {
    type: string
    sql: ${TABLE}.building ;;
  }

  dimension: buildingexternaltitle {
    type: string
    sql: ${TABLE}.buildingexternaltitle ;;
  }

  dimension: buildinginternaltitle {
    type: string
    sql: ${TABLE}.buildinginternaltitle ;;
  }

  dimension: callbox {
    hidden: yes
    sql: ${TABLE}.callbox ;;
  }

  dimension: checkindetails___id {
    type: string
    sql: ${TABLE}.checkindetails._id ;;
    group_label: "Checkindetails"
    group_item_label: "ID"
  }

  dimension: checkindetails__buildingcode {
    type: number
    sql: ${TABLE}.checkindetails.buildingcode ;;
    group_label: "Checkindetails"
    group_item_label: "Buildingcode"
  }

  dimension: checkindetails__buildingcode__st {
    type: string
    sql: ${TABLE}.checkindetails.buildingcode__st ;;
    group_label: "Checkindetails Buildingcode"
    group_item_label: "St"
  }

  dimension: checkindetails__garagecode {
    type: string
    sql: ${TABLE}.checkindetails.garagecode ;;
    group_label: "Checkindetails"
    group_item_label: "Garagecode"
  }

  dimension: checkindetails__isremote {
    type: yesno
    sql: ${TABLE}.checkindetails.isremote ;;
    group_label: "Checkindetails"
    group_item_label: "Isremote"
  }

  dimension: checkindetails__lockboxcode {
    type: string
    sql: ${TABLE}.checkindetails.lockboxcode ;;
    group_label: "Checkindetails"
    group_item_label: "Lockboxcode"
  }

  dimension: checkindetails__lockboxcode__it {
    type: number
    sql: ${TABLE}.checkindetails.lockboxcode__it ;;
    group_label: "Checkindetails Lockboxcode"
    group_item_label: "It"
  }

  dimension: checkindetails__lockboxnumber {
    type: string
    sql: ${TABLE}.checkindetails.lockboxnumber ;;
    group_label: "Checkindetails"
    group_item_label: "Lockboxnumber"
  }

  dimension: checkindetails__lockboxnumber__it {
    type: number
    sql: ${TABLE}.checkindetails.lockboxnumber__it ;;
    group_label: "Checkindetails Lockboxnumber"
    group_item_label: "It"
  }

  dimension: checkindetails__mailboxnumber {
    type: string
    sql: ${TABLE}.checkindetails.mailboxnumber ;;
    group_label: "Checkindetails"
    group_item_label: "Mailboxnumber"
  }

  dimension: checkindetails__parkingdetails {
    type: string
    sql: ${TABLE}.checkindetails.parkingdetails ;;
    group_label: "Checkindetails"
    group_item_label: "Parkingdetails"
  }

  dimension: checkindetails__parkingnumber {
    type: string
    sql: ${TABLE}.checkindetails.parkingnumber ;;
    group_label: "Checkindetails"
    group_item_label: "Parkingnumber"
  }

  dimension: checkindetails__parkingspot {
    type: string
    sql: ${TABLE}.checkindetails.parkingspot ;;
    group_label: "Checkindetails"
    group_item_label: "Parkingspot"
  }

  dimension: checkindetails__parkingtagnumber {
    type: string
    sql: ${TABLE}.checkindetails.parkingtagnumber ;;
    group_label: "Checkindetails"
    group_item_label: "Parkingtagnumber"
  }

  dimension: checkindetails__wifipassword {
    type: string
    sql: ${TABLE}.checkindetails.wifipassword ;;
    group_label: "Checkindetails"
    group_item_label: "Wifipassword"
  }

  dimension: checkindetails__wifiusername {
    type: string
    sql: ${TABLE}.checkindetails.wifiusername ;;
    group_label: "Checkindetails"
    group_item_label: "Wifiusername"
  }

  dimension: cleaningstatus {
    type: string
    sql: ${TABLE}.cleaningstatus ;;
  }

  dimension: complex {
    type: string
    sql: ${TABLE}.complex ;;
  }

  dimension: contract_signed_date {
    type: string
    sql: ${TABLE}.ContractSignedDate ;;
  }

  dimension: contract_type {
    type: string
    sql: ${TABLE}.ContractType ;;
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

  dimension: current_contract_start_date {
    type: string
    sql: ${TABLE}.CurrentContractStartDate ;;
  }

  dimension: deactivated_date {
    type: string
    sql: ${TABLE}.DeactivatedDate ;;
  }

  dimension: defaultcheckin {
    type: string
    sql: ${TABLE}.defaultcheckin ;;
  }

  dimension: defaultcheckintime {
    type: string
    sql: ${TABLE}.defaultcheckintime ;;
  }

  dimension: defaultcheckout {
    type: string
    sql: ${TABLE}.defaultcheckout ;;
  }

  dimension: defaultcheckouttime {
    type: string
    sql: ${TABLE}.defaultcheckouttime ;;
  }

  dimension: door {
    type: string
    sql: ${TABLE}.door ;;
  }

  dimension: externalrefs__airbnbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.externalrefs.airbnbid ;;
    group_label: "Externalrefs"
    group_item_label: "Airbnbid"
  }

  dimension: externalrefs__breezewayid {
    type: string
    sql: ${TABLE}.externalrefs.breezewayid ;;
    group_label: "Externalrefs"
    group_item_label: "Breezewayid"
  }

  dimension: externalrefs__freshairdeviceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.externalrefs.freshairdeviceid ;;
    group_label: "Externalrefs"
    group_item_label: "Freshairdeviceid"
  }

  dimension: externalrefs__guesty_id {
    type: string
    sql: ${TABLE}.externalrefs.guesty_id ;;
    group_label: "Externalrefs"
    group_item_label: "Guesty ID"
  }

  dimension: externalrefs__lmbuildingid {
    type: string
    sql: ${TABLE}.externalrefs.lmbuildingid ;;
    group_label: "Externalrefs"
    group_item_label: "Lmbuildingid"
  }

  dimension: externalrefs__lmpropertyid {
    type: string
    sql: ${TABLE}.externalrefs.lmpropertyid ;;
    group_label: "Externalrefs"
    group_item_label: "Lmpropertyid"
  }

  dimension: externalrefs__lmunitid {
    type: string
    sql: ${TABLE}.externalrefs.lmunitid ;;
    group_label: "Externalrefs"
    group_item_label: "Lmunitid"
  }

  dimension: externalrefs__minuthomeid {
    type: string
    sql: ${TABLE}.externalrefs.minuthomeid ;;
    group_label: "Externalrefs"
    group_item_label: "Minuthomeid"
  }

  dimension: externalrefs__netsuiteid {
    type: string
    sql: ${TABLE}.externalrefs.netsuiteid ;;
    group_label: "Externalrefs"
    group_item_label: "Netsuiteid"
  }

  dimension: externalrefs__nexiaaccountname {
    type: string
    sql: ${TABLE}.externalrefs.nexiaaccountname ;;
    group_label: "Externalrefs"
    group_item_label: "Nexiaaccountname"
  }

  dimension: externalrefs__nexiaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.externalrefs.nexiaid ;;
    group_label: "Externalrefs"
    group_item_label: "Nexiaid"
  }

  dimension: externalrefs__nexiaid__st {
    type: string
    sql: ${TABLE}.externalrefs.nexiaid__st ;;
    group_label: "Externalrefs Nexiaid"
    group_item_label: "St"
  }

  dimension: externalrefs__rentalsunitedid {
    type: number
    value_format_name: id
    sql: ${TABLE}.externalrefs.rentalsunitedid ;;
    group_label: "Externalrefs"
    group_item_label: "Rentalsunitedid"
  }

  dimension: externalrefs__smartthingsaccountname {
    type: string
    sql: ${TABLE}.externalrefs.smartthingsaccountname ;;
    group_label: "Externalrefs"
    group_item_label: "Smartthingsaccountname"
  }

  dimension: externalrefs__smartthingslockname {
    type: string
    sql: ${TABLE}.externalrefs.smartthingslockname ;;
    group_label: "Externalrefs"
    group_item_label: "Smartthingslockname"
  }

  dimension: externalrefs__stripepayoutaccountid {
    type: string
    sql: ${TABLE}.externalrefs.stripepayoutaccountid ;;
    group_label: "Externalrefs"
    group_item_label: "Stripepayoutaccountid"
  }

  dimension: externaltitle__airbnb {
    type: string
    sql: ${TABLE}.externaltitle.airbnb ;;
    group_label: "Externaltitle"
    group_item_label: "Airbnb"
  }

  dimension: externaltitle__bookingcom {
    type: string
    sql: ${TABLE}.externaltitle.bookingcom ;;
    group_label: "Externaltitle"
    group_item_label: "Bookingcom"
  }

  dimension: externaltitle__breezewayid {
    type: string
    sql: ${TABLE}.externaltitle.breezewayid ;;
    group_label: "Externaltitle"
    group_item_label: "Breezewayid"
  }

  dimension: externaltitle__default {
    type: string
    sql: ${TABLE}.externaltitle.`default` ;;
    group_label: "Externaltitle"
    group_item_label: "Default"
  }

  dimension: externaltitle__expedia {
    type: string
    sql: ${TABLE}.externaltitle.expedia ;;
    group_label: "Externaltitle"
    group_item_label: "Expedia"
  }

  dimension: externaltitle__homeaway {
    type: string
    sql: ${TABLE}.externaltitle.homeaway ;;
    group_label: "Externaltitle"
    group_item_label: "Homeaway"
  }

  dimension: externaltitle__hotelcom {
    type: string
    sql: ${TABLE}.externaltitle.hotelcom ;;
    group_label: "Externaltitle"
    group_item_label: "Hotelcom"
  }

  dimension: externaltitle__website {
    type: string
    sql: ${TABLE}.externaltitle.website ;;
    group_label: "Externaltitle"
    group_item_label: "Website"
  }

  dimension: facilities {
    hidden: yes
    sql: ${TABLE}.facilities ;;
  }

  dimension: first_available_date {
    type: string
    sql: ${TABLE}.FirstAvailableDate ;;
  }

  dimension: floor {
    type: string
    sql: ${TABLE}.floor ;;
  }

  dimension: floor__it {
    type: number
    sql: ${TABLE}.floor__it ;;
  }

  dimension: hashighriskneighbor {
    type: yesno
    sql: ${TABLE}.hashighriskneighbor ;;
  }

  dimension: hassmartlock {
    type: yesno
    sql: ${TABLE}.hassmartlock ;;
  }

  dimension: housekeepers {
    hidden: yes
    sql: ${TABLE}.housekeepers ;;
  }

  dimension: initial_contract {
    type: string
    sql: ${TABLE}.InitialContract ;;
  }

  dimension: internalpropertymanager {
    type: string
    sql: ${TABLE}.internalpropertymanager ;;
  }

  dimension: internaltitle {
    type: string
    sql: ${TABLE}.internaltitle ;;
  }

  dimension: islisted {
    type: yesno
    sql: ${TABLE}.islisted ;;
  }

  dimension: keycafe__active {
    type: yesno
    sql: ${TABLE}.keycafe.active ;;
    group_label: "Keycafe"
    group_item_label: "Active"
  }

  dimension: keycafe__id {
    type: string
    sql: ${TABLE}.keycafe.id ;;
    group_label: "Keycafe"
    group_item_label: "ID"
  }

  dimension: latch__keys {
    hidden: yes
    sql: ${TABLE}.latch.keys ;;
    group_label: "Latch"
    group_item_label: "Keys"
  }

  dimension: lock_id {
    type: string
    sql: ${TABLE}.lock_id ;;
  }

  dimension: lockmodel {
    type: string
    sql: ${TABLE}.lockmodel ;;
  }

  dimension: maps__buildingmap___id {
    type: string
    sql: ${TABLE}.maps.buildingmap._id ;;
    group_label: "Maps Buildingmap"
    group_item_label: "ID"
  }

  dimension: maps__facilitymap___id {
    type: string
    sql: ${TABLE}.maps.facilitymap._id ;;
    group_label: "Maps Facilitymap"
    group_item_label: "ID"
  }

  dimension: maps__facilitymap__bytes {
    type: number
    sql: ${TABLE}.maps.facilitymap.bytes ;;
    group_label: "Maps Facilitymap"
    group_item_label: "Bytes"
  }

  dimension: maps__facilitymap__height {
    type: number
    sql: ${TABLE}.maps.facilitymap.height ;;
    group_label: "Maps Facilitymap"
    group_item_label: "Height"
  }

  dimension: maps__facilitymap__publicid {
    type: string
    sql: ${TABLE}.maps.facilitymap.publicid ;;
    group_label: "Maps Facilitymap"
    group_item_label: "Publicid"
  }

  dimension: maps__facilitymap__url {
    type: string
    sql: ${TABLE}.maps.facilitymap.url ;;
    group_label: "Maps Facilitymap"
    group_item_label: "URL"
  }

  dimension: maps__facilitymap__version {
    type: string
    sql: ${TABLE}.maps.facilitymap.version ;;
    group_label: "Maps Facilitymap"
    group_item_label: "Version"
  }

  dimension: maps__facilitymap__width {
    type: number
    sql: ${TABLE}.maps.facilitymap.width ;;
    group_label: "Maps Facilitymap"
    group_item_label: "Width"
  }

  dimension: maps__pathtounitmap___id {
    type: string
    sql: ${TABLE}.maps.pathtounitmap._id ;;
    group_label: "Maps Pathtounitmap"
    group_item_label: "ID"
  }

  dimension: maps__propertymap___id {
    type: string
    sql: ${TABLE}.maps.propertymap._id ;;
    group_label: "Maps Propertymap"
    group_item_label: "ID"
  }

  dimension: maps__propertymap__bytes {
    type: number
    sql: ${TABLE}.maps.propertymap.bytes ;;
    group_label: "Maps Propertymap"
    group_item_label: "Bytes"
  }

  dimension: maps__propertymap__height {
    type: number
    sql: ${TABLE}.maps.propertymap.height ;;
    group_label: "Maps Propertymap"
    group_item_label: "Height"
  }

  dimension: maps__propertymap__publicid {
    type: string
    sql: ${TABLE}.maps.propertymap.publicid ;;
    group_label: "Maps Propertymap"
    group_item_label: "Publicid"
  }

  dimension: maps__propertymap__url {
    type: string
    sql: ${TABLE}.maps.propertymap.url ;;
    group_label: "Maps Propertymap"
    group_item_label: "URL"
  }

  dimension: maps__propertymap__version {
    type: string
    sql: ${TABLE}.maps.propertymap.version ;;
    group_label: "Maps Propertymap"
    group_item_label: "Version"
  }

  dimension: maps__propertymap__width {
    type: number
    sql: ${TABLE}.maps.propertymap.width ;;
    group_label: "Maps Propertymap"
    group_item_label: "Width"
  }

  dimension: maps__unitmap___id {
    type: string
    sql: ${TABLE}.maps.unitmap._id ;;
    group_label: "Maps Unitmap"
    group_item_label: "ID"
  }

  dimension: maxnumberofparkingspots {
    type: number
    sql: ${TABLE}.maxnumberofparkingspots ;;
  }

  dimension: new_building {
    type: string
    sql: ${TABLE}.NewBuilding ;;
  }

  dimension: new_partner {
    type: string
    sql: ${TABLE}.NewPartner ;;
  }

  dimension: nexiaid {
    type: string
    sql: ${TABLE}.nexiaid ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: parkingfee {
    type: number
    sql: ${TABLE}.parkingfee ;;
  }

  dimension: parkingtype {
    type: string
    sql: ${TABLE}.parkingtype ;;
  }

  dimension: petsallowed {
    type: yesno
    sql: ${TABLE}.petsallowed ;;
  }

  dimension: photos {
    hidden: yes
    sql: ${TABLE}.photos ;;
  }

  dimension: propertyexternaltitle {
    type: string
    sql: ${TABLE}.propertyexternaltitle ;;
  }

  dimension: propertyheroimage___id {
    type: string
    sql: ${TABLE}.propertyheroimage._id ;;
    group_label: "Propertyheroimage"
    group_item_label: "ID"
  }

  dimension: propertyheroimage__bytes {
    type: number
    sql: ${TABLE}.propertyheroimage.bytes ;;
    group_label: "Propertyheroimage"
    group_item_label: "Bytes"
  }

  dimension: propertyheroimage__height {
    type: number
    sql: ${TABLE}.propertyheroimage.height ;;
    group_label: "Propertyheroimage"
    group_item_label: "Height"
  }

  dimension: propertyheroimage__publicid {
    type: string
    sql: ${TABLE}.propertyheroimage.publicid ;;
    group_label: "Propertyheroimage"
    group_item_label: "Publicid"
  }

  dimension: propertyheroimage__url {
    type: string
    sql: ${TABLE}.propertyheroimage.url ;;
    group_label: "Propertyheroimage"
    group_item_label: "URL"
  }

  dimension: propertyheroimage__version {
    type: string
    sql: ${TABLE}.propertyheroimage.version ;;
    group_label: "Propertyheroimage"
    group_item_label: "Version"
  }

  dimension: propertyheroimage__width {
    type: number
    sql: ${TABLE}.propertyheroimage.width ;;
    group_label: "Propertyheroimage"
    group_item_label: "Width"
  }

  dimension: propertyinternaltitle {
    type: string
    sql: ${TABLE}.propertyinternaltitle ;;
  }

  dimension: propertymanager {
    type: string
    sql: ${TABLE}.propertymanager ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: remotelock__accessibles {
    hidden: yes
    sql: ${TABLE}.remotelock.accessibles ;;
    group_label: "Remotelock"
    group_item_label: "Accessibles"
  }

  dimension: remotelock__account {
    type: string
    sql: ${TABLE}.remotelock.account ;;
    group_label: "Remotelock"
    group_item_label: "Account"
  }

  dimension: rooms {
    hidden: yes
    sql: ${TABLE}.rooms ;;
  }

  dimension: roomtype__bathroomcount {
    type: number
    sql: ${TABLE}.roomtype.bathroomcount ;;
    group_label: "Roomtype"
    group_item_label: "Bathroomcount"
  }

  dimension: roomtype__bedroomcount {
    type: number
    sql: ${TABLE}.roomtype.bedroomcount ;;
    group_label: "Roomtype"
    group_item_label: "Bedroomcount"
  }

  dimension: roomtype__externaltitle {
    type: string
    sql: ${TABLE}.roomtype.externaltitle ;;
    group_label: "Roomtype"
    group_item_label: "Externaltitle"
  }

  dimension: roomtype__internaltitle {
    type: string
    sql: ${TABLE}.roomtype.internaltitle ;;
    group_label: "Roomtype"
    group_item_label: "Internaltitle"
  }

  dimension: roomtype__ref {
    type: string
    sql: ${TABLE}.roomtype.ref ;;
    group_label: "Roomtype"
    group_item_label: "Ref"
  }

  dimension: smartlockcode {
    type: string
    sql: ${TABLE}.smartlockcode ;;
  }

  dimension: smartlockcodeisset {
    type: yesno
    sql: ${TABLE}.smartlockcodeisset ;;
  }

  dimension: smartlocktype {
    type: string
    sql: ${TABLE}.smartlocktype ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: statuskpo {
    type: string
    sql: ${TABLE}.statuskpo ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: trustandsafety__corelogicaccount {
    type: string
    sql: ${TABLE}.trustandsafety.corelogicaccount ;;
    group_label: "Trustandsafety"
    group_item_label: "Corelogicaccount"
  }

  dimension: trustandsafety__corelogicaccounts {
    type: string
    sql: ${TABLE}.trustandsafety.corelogicaccounts ;;
    group_label: "Trustandsafety"
    group_item_label: "Corelogicaccounts"
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.UID ;;
  }

  dimension_group: unit_availability_enddate {
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
    sql: ${TABLE}.unit_availability_enddate ;;
  }

  dimension_group: unit_availability_startdate {
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
    sql: ${TABLE}.unit_availability_startdate ;;
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

  dimension: wifi__password {
    type: string
    sql: ${TABLE}.wifi.password ;;
    group_label: "Wifi"
    group_item_label: "Password"
  }

  dimension: wifi__ssid {
    type: string
    sql: ${TABLE}.wifi.ssid ;;
    group_label: "Wifi"
    group_item_label: "Ssid"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      externalrefs__guestyparentunitid,
      nickname,
      checkindetails__wifiusername,
      externalrefs__nexiaaccountname,
      externalrefs__smartthingslockname,
      externalrefs__smartthingsaccountname
    ]
  }
}

# The name of this view in Looker is "Units Tags"
view: units__tags {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__tags {
    type: string
    hidden: yes
    sql: units__tags ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Units Rooms"
view: units__rooms {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__rooms {
    type: string
    hidden: yes
    sql: units__rooms ;;
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

  dimension: value__beds {
    hidden: yes
    sql: value.beds ;;
    group_label: "Value"
    group_item_label: "Beds"
  }

  dimension: value__id {
    type: number
    sql: value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__roomnumber {
    type: number
    sql: value.roomnumber ;;
    group_label: "Value"
    group_item_label: "Roomnumber"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__roomnumber {
    type: sum
    sql: ${value__roomnumber} ;;
  }

  measure: average_value__roomnumber {
    type: average
    sql: ${value__roomnumber} ;;
  }
}

# The name of this view in Looker is "Units Photos"
view: units__photos {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__photos {
    type: string
    hidden: yes
    sql: units__photos ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Units Callbox"
view: units__callbox {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__callbox {
    type: string
    hidden: yes
    sql: units__callbox ;;
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

  dimension: value__code {
    type: string
    sql: value.code ;;
    group_label: "Value"
    group_item_label: "Code"
  }

  dimension: value__enabled {
    type: yesno
    sql: value.enabled ;;
    group_label: "Value"
    group_item_label: "Enabled"
  }

  dimension: value__entry {
    type: string
    sql: value.entry ;;
    group_label: "Value"
    group_item_label: "Entry"
  }

  dimension: value__phonenumber {
    type: string
    sql: value.phonenumber ;;
    group_label: "Value"
    group_item_label: "Phonenumber"
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Units Amenities"
view: units__amenities {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__amenities {
    type: string
    hidden: yes
    sql: units__amenities ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Units Facilities"
view: units__facilities {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__facilities {
    type: string
    hidden: yes
    sql: units__facilities ;;
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

  dimension: value__ref {
    type: string
    sql: value.ref ;;
    group_label: "Value"
    group_item_label: "Ref"
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Units Accessitems"
view: units__accessitems {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__accessitems {
    type: string
    hidden: yes
    sql: units__accessitems ;;
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

  dimension: value__quantity {
    type: number
    sql: value.quantity ;;
    group_label: "Value"
    group_item_label: "Quantity"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__quantity {
    type: sum
    sql: ${value__quantity} ;;
  }

  measure: average_value__quantity {
    type: average
    sql: ${value__quantity} ;;
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Units Housekeepers"
view: units__housekeepers {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__housekeepers {
    type: string
    hidden: yes
    sql: units__housekeepers ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Units Latch Keys"
view: units__latch__keys {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: value__re__key {
    type: string
    sql: ${TABLE}.value__re.key ;;
    group_label: "Value Re"
    group_item_label: "Key"
  }
}

# The name of this view in Looker is "Units Backupsmartlockcodes"
view: units__backupsmartlockcodes {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: units__backupsmartlockcodes {
    type: string
    hidden: yes
    sql: units__backupsmartlockcodes ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Units Rooms Value Beds"
view: units__rooms__value__beds {
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

  dimension: value__quantity {
    type: number
    sql: ${TABLE}.value.quantity ;;
    group_label: "Value"
    group_item_label: "Quantity"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__quantity {
    type: sum
    sql: ${value__quantity} ;;
  }

  measure: average_value__quantity {
    type: average
    sql: ${value__quantity} ;;
  }

  dimension: value__type {
    type: string
    sql: ${TABLE}.value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Units Remotelock Accessibles"
view: units__remotelock__accessibles {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value ID" in Explore.

  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__name {
    type: string
    sql: ${TABLE}.value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }

  dimension: value__type {
    type: string
    sql: ${TABLE}.value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}
