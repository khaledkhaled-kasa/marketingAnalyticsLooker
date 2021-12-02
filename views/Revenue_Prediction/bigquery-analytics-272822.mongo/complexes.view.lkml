
view: complexes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-analytics-272822.mongo.complexes`
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

  dimension: additionalcontacts {
    hidden: yes
    sql: ${TABLE}.additionalcontacts ;;
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

  dimension: advancenoticecutofftime {
    type: string
    sql: ${TABLE}.advancenoticecutofftime ;;
  }

  dimension: advancenoticedays {
    type: number
    sql: ${TABLE}.advancenoticedays ;;
  }

  dimension: advancenoticedays__it {
    type: number
    sql: ${TABLE}.advancenoticedays__it ;;
  }

  dimension: contacts {
    hidden: yes
    sql: ${TABLE}.contacts ;;
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

  dimension: defaultcheckintime {
    type: string
    sql: ${TABLE}.defaultcheckintime ;;
  }

  dimension: defaultcheckouttime {
    type: string
    sql: ${TABLE}.defaultcheckouttime ;;
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

  dimension: features__sendcheckinreport__enabled {
    type: yesno
    sql: ${TABLE}.features.sendcheckinreport.enabled ;;
    group_label: "Features Sendcheckinreport"
    group_item_label: "Enabled"
  }

  dimension: features__sendcheckinreport__recipients {
    hidden: yes
    sql: ${TABLE}.features.sendcheckinreport.recipients ;;
    group_label: "Features Sendcheckinreport"
    group_item_label: "Recipients"
  }

  dimension: flags {
    hidden: yes
    sql: ${TABLE}.flags ;;
  }

  dimension: friendlynames {
    hidden: yes
    sql: ${TABLE}.friendlynames ;;
  }

  dimension: internaltitle {
    type: string
    sql: ${TABLE}.internaltitle ;;
  }

  dimension: isearlycheckinavailable {
    type: yesno
    sql: ${TABLE}.isearlycheckinavailable ;;
  }

  dimension: ishighrisk {
    type: yesno
    sql: ${TABLE}.ishighrisk ;;
  }

  dimension: islatecheckoutavailable {
    type: yesno
    sql: ${TABLE}.islatecheckoutavailable ;;
  }

  dimension: leasingoffice___id {
    type: string
    sql: ${TABLE}.leasingoffice._id ;;
    group_label: "Leasingoffice"
    group_item_label: "ID"
  }

  dimension: leasingoffice__contact__emails {
    hidden: yes
    sql: ${TABLE}.leasingoffice.contact.emails ;;
    group_label: "Leasingoffice Contact"
    group_item_label: "Emails"
  }

  dimension: leasingoffice__contact__phones {
    hidden: yes
    sql: ${TABLE}.leasingoffice.contact.phones ;;
    group_label: "Leasingoffice Contact"
    group_item_label: "Phones"
  }

  dimension: leasingoffice__openhours__fri__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.fri.`end` ;;
    group_label: "Leasingoffice Openhours Fri"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__fri__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.fri.isclosed ;;
    group_label: "Leasingoffice Openhours Fri"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__fri__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.fri.start ;;
    group_label: "Leasingoffice Openhours Fri"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__mon__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.mon.`end` ;;
    group_label: "Leasingoffice Openhours Mon"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__mon__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.mon.isclosed ;;
    group_label: "Leasingoffice Openhours Mon"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__mon__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.mon.start ;;
    group_label: "Leasingoffice Openhours Mon"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__sat__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.sat.`end` ;;
    group_label: "Leasingoffice Openhours Sat"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__sat__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.sat.isclosed ;;
    group_label: "Leasingoffice Openhours Sat"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__sat__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.sat.start ;;
    group_label: "Leasingoffice Openhours Sat"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__sun__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.sun.`end` ;;
    group_label: "Leasingoffice Openhours Sun"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__sun__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.sun.isclosed ;;
    group_label: "Leasingoffice Openhours Sun"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__sun__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.sun.start ;;
    group_label: "Leasingoffice Openhours Sun"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__thu__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.thu.`end` ;;
    group_label: "Leasingoffice Openhours Thu"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__thu__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.thu.isclosed ;;
    group_label: "Leasingoffice Openhours Thu"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__thu__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.thu.start ;;
    group_label: "Leasingoffice Openhours Thu"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__tue__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.tue.`end` ;;
    group_label: "Leasingoffice Openhours Tue"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__tue__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.tue.isclosed ;;
    group_label: "Leasingoffice Openhours Tue"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__tue__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.tue.start ;;
    group_label: "Leasingoffice Openhours Tue"
    group_item_label: "Start"
  }

  dimension: leasingoffice__openhours__wed__end {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.wed.`end` ;;
    group_label: "Leasingoffice Openhours Wed"
    group_item_label: "End"
  }

  dimension: leasingoffice__openhours__wed__isclosed {
    type: yesno
    sql: ${TABLE}.leasingoffice.openhours.wed.isclosed ;;
    group_label: "Leasingoffice Openhours Wed"
    group_item_label: "Isclosed"
  }

  dimension: leasingoffice__openhours__wed__start {
    type: string
    sql: ${TABLE}.leasingoffice.openhours.wed.start ;;
    group_label: "Leasingoffice Openhours Wed"
    group_item_label: "Start"
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: opsguideurl {
    type: string
    sql: ${TABLE}.opsguideurl ;;
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

  dimension: propertymanager {
    type: string
    sql: ${TABLE}.propertymanager ;;
  }

  dimension: propertynotes {
    type: string
    sql: ${TABLE}.propertynotes ;;
  }

  dimension: propertyowner {
    type: string
    sql: ${TABLE}.propertyowner ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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
    drill_fields: []
  }
}

# The name of this view in Looker is "Complexes Flags"
view: complexes__flags {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: complexes__flags {
    type: string
    hidden: yes
    sql: complexes__flags ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Complexes Contacts"
view: complexes__contacts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: complexes__contacts {
    type: string
    hidden: yes
    sql: complexes__contacts ;;
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

  dimension: value__emails {
    hidden: yes
    sql: value.emails ;;
    group_label: "Value"
    group_item_label: "Emails"
  }

  dimension: value__name {
    type: string
    sql: value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }

  dimension: value__phones {
    hidden: yes
    sql: value.phones ;;
    group_label: "Value"
    group_item_label: "Phones"
  }

  dimension: value__reports {
    hidden: yes
    sql: value.reports ;;
    group_label: "Value"
    group_item_label: "Reports"
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Complexes Facilities"
view: complexes__facilities {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: complexes__facilities {
    type: string
    hidden: yes
    sql: complexes__facilities ;;
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

  dimension: value__description {
    type: string
    sql: value.description ;;
    group_label: "Value"
    group_item_label: "Description"
  }

  dimension: value__howtoaddress {
    type: string
    sql: value.howtoaddress ;;
    group_label: "Value"
    group_item_label: "Howtoaddress"
  }

  dimension: value__location {
    type: string
    sql: value.location ;;
    group_label: "Value"
    group_item_label: "Location"
  }

  dimension: value__openinghours__fri__end {
    type: string
    sql: value.openinghours.fri.`end` ;;
    group_label: "Value Openinghours Fri"
    group_item_label: "End"
  }

  dimension: value__openinghours__fri__isclosed {
    type: yesno
    sql: value.openinghours.fri.isclosed ;;
    group_label: "Value Openinghours Fri"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__fri__start {
    type: string
    sql: value.openinghours.fri.start ;;
    group_label: "Value Openinghours Fri"
    group_item_label: "Start"
  }

  dimension: value__openinghours__mon__end {
    type: string
    sql: value.openinghours.mon.`end` ;;
    group_label: "Value Openinghours Mon"
    group_item_label: "End"
  }

  dimension: value__openinghours__mon__isclosed {
    type: yesno
    sql: value.openinghours.mon.isclosed ;;
    group_label: "Value Openinghours Mon"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__mon__start {
    type: string
    sql: value.openinghours.mon.start ;;
    group_label: "Value Openinghours Mon"
    group_item_label: "Start"
  }

  dimension: value__openinghours__sat__end {
    type: string
    sql: value.openinghours.sat.`end` ;;
    group_label: "Value Openinghours Sat"
    group_item_label: "End"
  }

  dimension: value__openinghours__sat__isclosed {
    type: yesno
    sql: value.openinghours.sat.isclosed ;;
    group_label: "Value Openinghours Sat"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__sat__start {
    type: string
    sql: value.openinghours.sat.start ;;
    group_label: "Value Openinghours Sat"
    group_item_label: "Start"
  }

  dimension: value__openinghours__sun__end {
    type: string
    sql: value.openinghours.sun.`end` ;;
    group_label: "Value Openinghours Sun"
    group_item_label: "End"
  }

  dimension: value__openinghours__sun__isclosed {
    type: yesno
    sql: value.openinghours.sun.isclosed ;;
    group_label: "Value Openinghours Sun"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__sun__start {
    type: string
    sql: value.openinghours.sun.start ;;
    group_label: "Value Openinghours Sun"
    group_item_label: "Start"
  }

  dimension: value__openinghours__thu__end {
    type: string
    sql: value.openinghours.thu.`end` ;;
    group_label: "Value Openinghours Thu"
    group_item_label: "End"
  }

  dimension: value__openinghours__thu__isclosed {
    type: yesno
    sql: value.openinghours.thu.isclosed ;;
    group_label: "Value Openinghours Thu"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__thu__start {
    type: string
    sql: value.openinghours.thu.start ;;
    group_label: "Value Openinghours Thu"
    group_item_label: "Start"
  }

  dimension: value__openinghours__tue__end {
    type: string
    sql: value.openinghours.tue.`end` ;;
    group_label: "Value Openinghours Tue"
    group_item_label: "End"
  }

  dimension: value__openinghours__tue__isclosed {
    type: yesno
    sql: value.openinghours.tue.isclosed ;;
    group_label: "Value Openinghours Tue"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__tue__start {
    type: string
    sql: value.openinghours.tue.start ;;
    group_label: "Value Openinghours Tue"
    group_item_label: "Start"
  }

  dimension: value__openinghours__wed__end {
    type: string
    sql: value.openinghours.wed.`end` ;;
    group_label: "Value Openinghours Wed"
    group_item_label: "End"
  }

  dimension: value__openinghours__wed__isclosed {
    type: yesno
    sql: value.openinghours.wed.isclosed ;;
    group_label: "Value Openinghours Wed"
    group_item_label: "Isclosed"
  }

  dimension: value__openinghours__wed__start {
    type: string
    sql: value.openinghours.wed.start ;;
    group_label: "Value Openinghours Wed"
    group_item_label: "Start"
  }

  dimension: value__rules {
    type: string
    sql: value.rules ;;
    group_label: "Value"
    group_item_label: "Rules"
  }

  dimension: value__specialinstructions {
    type: string
    sql: value.specialinstructions ;;
    group_label: "Value"
    group_item_label: "Specialinstructions"
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Complexes Friendlynames"
view: complexes__friendlynames {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: complexes__friendlynames {
    type: string
    hidden: yes
    sql: complexes__friendlynames ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Value" in Explore.

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Complexes Additionalcontacts"
view: complexes__additionalcontacts {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: complexes__additionalcontacts {
    type: string
    hidden: yes
    sql: complexes__additionalcontacts ;;
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

  dimension: value__emails {
    hidden: yes
    sql: value.emails ;;
    group_label: "Value"
    group_item_label: "Emails"
  }

  dimension: value__firstname {
    type: string
    sql: value.firstname ;;
    group_label: "Value"
    group_item_label: "Firstname"
  }

  dimension: value__lastname {
    type: string
    sql: value.lastname ;;
    group_label: "Value"
    group_item_label: "Lastname"
  }

  dimension: value__phones {
    hidden: yes
    sql: value.phones ;;
    group_label: "Value"
    group_item_label: "Phones"
  }

  dimension: value__type {
    type: string
    sql: value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}

# The name of this view in Looker is "Complexes Contacts Value Emails"
view: complexes__contacts__value__emails {
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

# The name of this view in Looker is "Complexes Contacts Value Phones"
view: complexes__contacts__value__phones {
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

# The name of this view in Looker is "Complexes Contacts Value Reports"
view: complexes__contacts__value__reports {
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

# The name of this view in Looker is "Complexes Leasingoffice Contact Emails"
view: complexes__leasingoffice__contact__emails {
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

  dimension: value__isprimary {
    type: yesno
    sql: ${TABLE}.value.isprimary ;;
    group_label: "Value"
    group_item_label: "Isprimary"
  }
}

# The name of this view in Looker is "Complexes Leasingoffice Contact Phones"
view: complexes__leasingoffice__contact__phones {
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

  dimension: value__isprimary {
    type: yesno
    sql: ${TABLE}.value.isprimary ;;
    group_label: "Value"
    group_item_label: "Isprimary"
  }

  dimension: value__phone {
    type: string
    sql: ${TABLE}.value.phone ;;
    group_label: "Value"
    group_item_label: "Phone"
  }
}

# The name of this view in Looker is "Complexes Additionalcontacts Value Emails"
view: complexes__additionalcontacts__value__emails {
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

  dimension: value__isprimary {
    type: yesno
    sql: ${TABLE}.value.isprimary ;;
    group_label: "Value"
    group_item_label: "Isprimary"
  }
}

# The name of this view in Looker is "Complexes Additionalcontacts Value Phones"
view: complexes__additionalcontacts__value__phones {
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

  dimension: value__isprimary {
    type: yesno
    sql: ${TABLE}.value.isprimary ;;
    group_label: "Value"
    group_item_label: "Isprimary"
  }

  dimension: value__phone {
    type: string
    sql: ${TABLE}.value.phone ;;
    group_label: "Value"
    group_item_label: "Phone"
  }
}

# The name of this view in Looker is "Complexes Features Sendcheckinreport Recipients"
view: complexes__features__sendcheckinreport__recipients {
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
