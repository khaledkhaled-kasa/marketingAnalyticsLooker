view: airbnb_reviews {
  sql_table_name: `data-warehouse-333815.reviews.dmReviews` ;;

  dimension: review_order {
    hidden: no
    type: number
    sql: ${TABLE}.airbnbReviewOrder ;;
  }

  dimension: last_30_reviews {
    hidden: yes
    type: yesno
    sql: ${review_order} <= 30 ;;
  }

  dimension: accuracy_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbAccuracyComment ;;
  }

  dimension: reviewdSource {
    label: "API VS Manual"
    type: string
    hidden: yes
    sql: ${TABLE}.airbnbReviewSource ;;
  }

  dimension: private_feedback {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbPrivateComment ;;
  }

  dimension: response_fg {
    label: "Response Flag"
    description: "When response flag = 1 then a responds has been loaded from the the Gsheet. If 0 then no response has been loaded."
    type: number
    sql: ${TABLE}.airbnbResponseFg ;;
  }

  dimension: checkin_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbCheckInComment ;;
  }

  dimension: cleanliness_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbCleanlinessComment ;;
  }

  dimension: communication_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbCommunicationComment ;;
  }

  dimension: location_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbLocationComment ;;
  }

  dimension: overall_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbPublicComment ;;
  }

  dimension: repuso_source {
    hidden: yes
    group_label: "Comments"
    type: string
    sql: ${TABLE}.repusoSource ;;
  }

  dimension: repuso_overall_comments {
    group_label: "Comments"
    type: string
    hidden: yes
    sql:  REPLACE(${TABLE}.repusoComment, '<br />', '. ') ;;
  }

  dimension: value_comments {
    group_label: "Comments"
    type: string
    sql: ${TABLE}.airbnbValueComment;;
  }

  dimension_group: reservation_checkin {
    type: time
    hidden: yes
    timeframes: [raw, time, date, week, month, year, quarter]
    label: "Reservation Check-In"
    sql: timestamp(${reservations_clean.checkindate_time}) ;;
    convert_tz: no
  }

  dimension_group: reservation_checkout {
    label: "Reservation Check-Out"
    type: time
    hidden: yes
    timeframes: [raw, time, date, week, month, year, quarter]
    sql: timestamp(${reservations_clean.checkoutdate_time}) ;;
    convert_tz: no
  }

  dimension_group: ds_checkin {
    hidden: yes
    type: time
    label: "Checkin"
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
    sql: ${TABLE}.checkInDate ;;
  }

  dimension_group: ds_checkout {
    hidden: yes
    type: time
    #group_label: "Airbnb Check-out Date"
    #view_label: "Date Dimensions"
    label: "Checkout"
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
    sql: ${TABLE}.checkOutDate ;;
  }

  dimension_group: response_dt {
    label: "Response"
    description: "Kasa response date to the customer"
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
    sql: ${TABLE}.airbnbResponseDt ;;
  }

  dimension: response_txt {
    label: "Response Text"
    description: "Kasa responses to the guest reviews"
    sql: ${TABLE}.airbnbResponseTxt ;;
  }

  dimension: listing_id {
    label: "Airbnb Listing ID"
    type: string
    sql: CAST(${TABLE}.airbnbListingId AS STRING) ;;
    hidden: no
  }

  dimension: overall_rating {
    group_label: "Ratings"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbOverallRating ;;
  }

  dimension: overall_rating_expedia {
    hidden: yes
    group_label: "Ratings"
    type: number
    value_format: "0.00"
    sql: CASE WHEN ${TABLE}.repusoSource = "Expedia" THEN ${TABLE}.repusoOverallRating ELSE NULL END ;;
  }

  dimension: overall_rating_vrbo {
    hidden: yes
    group_label: "Ratings"
    type: number
    value_format: "0.00"
    sql: CASE WHEN ${TABLE}.repusoSource = "Vrbo" THEN ${TABLE}.repusoOverallRating ELSE NULL END ;;
  }

  dimension: overall_rating_booking {
    group_label: "Ratings"
    hidden: yes
    type: number
    value_format: "0.00"
    sql: CASE WHEN ${TABLE}.repusoSource = "Booking.com" THEN ${TABLE}.repusoOverallRating ELSE NULL END ;;
  }

  dimension: overall_rating_google {
    group_label: "Ratings"
    hidden: yes
    type: number
    value_format: "0.00"
    sql: CASE WHEN ${TABLE}.repusoSource = "Google" THEN ${TABLE}.repusoOverallRating ELSE NULL END ;;
  }

  dimension: overall_rating_tripadvisor {
    hidden: yes
    group_label: "Ratings"
    type: number
    value_format: "0.00"
    sql: CASE WHEN ${TABLE}.repusoSource = "TripAdvisor" THEN ${TABLE}.repusoOverallRating ELSE NULL END ;;
  }

  dimension: accuracy_rating {
    group_label: "Ratings"
    label: "Accuracy Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbAccuracyRating ;;
  }

  dimension: value_rating {
    group_label: "Ratings"
    label: "Value Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbValueRating ;;
  }

  dimension: location_rating {
    group_label: "Ratings"
    label: "Location Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbLocationRating ;;
  }

  dimension: cleanliness_rating {
    group_label: "Ratings"
    label: "Cleanliness Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbCleanlinessRating ;;
  }

  dimension: checkin_rating {
    group_label: "Ratings"
    label: "Checkin Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbCheckInRating ;;
  }

  dimension: communication_rating {
    group_label: "Ratings"
    label: "Communication Rating"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.airbnbCommunicationRating ;;
  }

  dimension: reservation_code {
    hidden: yes
    type: string
    #hidden: yes
    sql: ${TABLE}.confirmationCd ;;
    primary_key: yes
  }

  dimension_group: review {
    label: "Airbnb Review"
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql:timestamp(${TABLE}.airbnbReviewDate) ;;
  }

  dimension: number_of_days {
    description: "Number of days it took to complete real-time checkin survey post check-in"
    hidden: yes
    type:  number
    sql:  ${TABLE}.airbnbCheckOutDateDiff ;;
  }

  dimension:  airbnb_review_flag {
    description: "Flag in the data mart to identify if the an airbnb review was completed. Based on Airbnb review date."
    hidden: yes
    type:  number
    sql:  ${TABLE}.airbnbReviewFlag ;;
  }

  dimension:  repuso_review_flag {
    description: "Flag in the data mart to identify if the an repuso review was completed. Based on repuso review date."
    hidden: yes
    type:  number
    sql:  ${TABLE}.repusoReviewFlag ;;
  }

  measure: number_of_days_median {
    description: "Median number of days it took to complete Airbnb Survey."
    label: "Median of Days to Complete Airbnb Survey"
    value_format: "0.0"
    type:  median_distinct
    sql_distinct_key: ${reservation_code} ;;
    sql: ${number_of_days};;
  }

  measure: avg_location_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Location Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbLocationRating ;;
  }

  measure: avg_overall_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Airbnb)"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbOverallRating ;;
  }

  measure: repuso_overall_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Repuso)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
  }

  measure: repuso_overall_rating_booking {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Booking.com)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
    filters: [repuso_source: "Booking.com"]
  }

  measure: repuso_overall_rating_expedia {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Expedia)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
    filters: [repuso_source: "Expedia"]
  }

  measure: repuso_overall_rating_google {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Google)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
    filters: [repuso_source: "Google"]
  }

  measure: repuso_overall_rating_vrbo {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (Vrbo)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
    filters: [repuso_source: "Vrbo"]
  }

  measure: repuso_overall_rating_tripadvisor {
    group_label: "Ratings (Aggregated)"
    label: "Avg Overall Rating (TripAdvisor)"
    hidden: yes
    type: average
    value_format: "0.00"
    sql: ${TABLE}.repusoOverallRating ;;
    filters: [repuso_source: "TripAdvisor"]
  }

  measure: avg_value_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Value Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbValueRating ;;
  }

  measure: avg_accuracy_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Accuracy Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbAccuracyRating ;;
  }

  measure: overall_quality_score {
    #view_label: "Metrics"
    #group_label: "OQS Metrics"
    label: "Airbnb OQS"
    hidden: yes
    type: number
    value_format: "0%"
    sql: (${avg_overall_rating} - 4.535)/(4.825 - 4.535) ;;
  }


  measure: avg_checkin_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Checkin Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbCheckInRating ;;
  }

  measure: avg_cleanliness_rating {
    group_label: "Ratings (Aggregated)"
    label: "Avg Cleanliness Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.airbnbCleanlinessRating ;;
    drill_fields: [review_date, ds_checkin_date, ds_checkout_date , units.internaltitle, cleanliness_rating, cleanliness_comments, value_comments, overall_comments]

  }

  measure: cleaning_rating_score {
    group_label: "POM Scorecard Metrics"
    hidden: yes
    type: number
    description: "POM Cleaning Rating Score"
    sql:  CASE WHEN ${avg_cleanliness_rating} > 4.73 THEN 1
              ELSE ${avg_cleanliness_rating}/NULLIF(4.73,0)
          END;;
    value_format: "0.00"
  }

  measure: count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "5"
    ]
  }

  measure: count_5_star_expedia {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall (Expedia)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_expedia: ">4"
    ]
  }

  measure: count_1_3_star_expedia {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 1-3 Star Overall (Expedia)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_expedia: "<=3"
    ]
  }

  measure: nqs_expedia {
    hidden: yes
    group_label: "NQS Metrics"
    label: "NQS (Expedia)"
    type: number
    value_format: "0.0"
    sql: 100*(${count_5_star_expedia} - ${count_1_3_star_expedia}) / nullif(${count_expedia},0) ;;
  }

  measure: count_5_star_booking {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall (Booking.com)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_booking: ">4"
    ]
  }

  measure: count_1_3_star_booking {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 1-3 Star Overall (Booking.com)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_booking: "<=3"
    ]
  }

  measure: nqs_booking {
    group_label: "NQS Metrics"
    hidden: yes
    label: "NQS (Booking.com)"
    type: number
    value_format: "0.0"
    sql: 100*(${count_5_star_booking} - ${count_1_3_star_booking}) / nullif(${count_booking},0) ;;
  }

  measure: count_5_star_google {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall (Google)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_google: ">4"
    ]
  }

  measure: count_1_3_star_google {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 1-3 Star Overall (Google)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_google: "<=3"
    ]
  }

  measure: nqs_google {
    group_label: "NQS Metrics"
    hidden: no
    label: "NQS (Google)"
    type: number
    value_format: "0.0"
    sql: 100*(${count_5_star_google} - ${count_1_3_star_google}) / nullif(${count_google},0) ;;
  }

  measure: count_5_star_tripadvisor {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall (TripAdvisor)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_tripadvisor: ">4"
    ]
  }

  measure: count_1_3_star_tripadvisor {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 1-3 Star Overall (TripAdvisor)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_tripadvisor: "<=3"
    ]
  }

  measure: nqs_tripadvisor {
    hidden: yes
    group_label: "NQS Metrics"
    label: "NQS (TripAdvisor)"
    type: number
    value_format: "0.0"
    sql: 100*(${count_5_star_tripadvisor} - ${count_1_3_star_tripadvisor}) / nullif(${count_tripadvisor},0) ;;
  }

  measure: count_5_star_vrbo {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 5 Star Overall (Vrbo)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_vrbo: ">4"
    ]
  }

  measure: count_1_3_star_vrbo {
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of 1-3 Star Overall (Vrbo)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating_vrbo: "<=3"
    ]
  }

  measure: nqs_vrbo {
    hidden: yes
    group_label: "NQS Metrics"
    label: "NQS (Vrbo)"
    type: number
    value_format: "0.0"
    sql: 100*(${count_5_star_vrbo} - ${count_1_3_star_vrbo}) / nullif(${count_vrbo},0) ;;
  }

  measure: count_promoter {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Perfect Stays (Promoters)"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "5"
    ]
  }


  measure: count_4_star {
    group_label: "Other Review Counts"
    label: "# of 4 Star Overall"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "4"
    ]
  }

  measure: count_3_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 3 Star Overall"
    type: count_distinct
    hidden: no
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "3"
    ]
  }

  measure: count_2_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 2 Star Overall"
    type: count_distinct
    hidden: no
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "2"
    ]
  }

  measure: count_1_star {
    #view_label: "Metrics"
    type: count_distinct
    group_label: "Other Review Counts"
    label: "# of 1 Star Overall"
    hidden: no
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      overall_rating: "1"
    ]
  }

  measure: count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Overall "
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      overall_rating: "<=3"
    ]
  }

  measure: count_detractor {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Bad Stays (Detractors)"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      overall_rating: "<=3"
    ]
  }


  measure: percent_5_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 5 Star Overall"
    type: number
    value_format: "0.0%"
    sql: ${count_5_star} / nullif(${count},0) ;;
  }


  measure: net_quality_score {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Overall)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_perfect_stay} - ${percent_bad_stay});;
    drill_fields: [airbnb_details*, complexes__address.title]
  }

  measure: net_quality_score_accuracy {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Accuracy)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_accuracy} - ${percent_less_than_4_star_accuracy});;
    drill_fields: [airbnb_details*,complexes__address.title,complexes__address.propcode_revised,accuracy_comments]
  }

  measure: net_quality_score_value{
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Value)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_value} - ${percent_less_than_4_star_value});;
  }

  measure: net_quality_score_location {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Location)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_location} - ${percent_less_than_4_star_location});;
  }

  measure: net_quality_score_checkin {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Checkin)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_checkin} - ${percent_less_than_4_star_checkin});;
  }

  measure: net_quality_score_clean {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Clean)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_clean} - ${percent_less_than_4_star_clean});;
    drill_fields: [airbnb_details*, reservation_code ,complexes__address.title,complexes__address.propcode_revised,review_date, cleanliness_comments, value_comments, overall_comments]
  }

  measure: net_quality_score_communication {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    label: "NQS (Communication)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_communication} - ${percent_less_than_4_star_communication});;
  }

  measure: percent_perfect_stay{
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    description: "This is the same as % 5 star (overall)"
    label: "% of Perfect Stays (Promoters)"
    type: number
    value_format: "0.0%"
    sql: ${count_5_star} / nullif(${count},0) ;;
  }


  measure: percent_bad_stay {
    #view_label: "Metrics"
    group_label: "NQS Metrics"
    description: "This is the same as % less than 4 star"
    label: "% of Bad Stays (Detractors)"
    type: number
    value_format: "0.0%"
    sql: ${count_less_than_4_star} / nullif(${count},0);;
    drill_fields: [airbnb_details*, review_date, cleanliness_comments, value_comments, overall_comments]
  }

  measure: percent_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star Overall"
    type: number
    value_format: "0.0%"
    sql: ${count_less_than_4_star} / nullif(${count},0);;
  }

  measure: percent_3_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 3 Star Overall"
    type: number
    value_format: "0.0%"
    sql: ${count_3_star} / nullif(${count},0);;
  }

  measure: percent_2_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 2 Star Overall"
    type: number
    value_format: "0.0%"
    sql: ${count_2_star} / nullif(${count},0);;
  }

  measure: percent_1_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 1 Star Overall"
    type: number
    value_format: "0.0%"
    sql: ${count_1_star} / nullif(${count},0);;
    drill_fields: [reservation_code, overall_comments]
  }

  measure: count {
    label: "# of Airbnb Reviews"
    description: "This will take the count of all reviews which had an overall rating (Higher than subcategory review count)"
    type: sum_distinct
    sql: ${airbnb_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    drill_fields: [airbnb_details*, reservation_code ,review_date, cleanliness_comments, value_comments, overall_comments,overall_rating]
  }

  measure: count_booking {
    label: "# of Booking.com Reviews"
    description: "This will take the count of all reviews from Repuso"
    hidden: yes
    type: sum_distinct
    sql: ${repuso_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    filters: [repuso_source: "Booking.com"]
  }

  measure: count_expedia {
    label: "# of Expedia Reviews"
    description: "This will take the count of all reviews from Repuso"
    type: sum_distinct
    hidden: yes
    sql: ${repuso_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    filters: [repuso_source: "Expedia"]
  }

  measure: count_google {
    label: "# of Google Reviews"
    description: "This will take the count of all reviews from Repuso"
    type: sum_distinct
    hidden: yes
    sql: ${repuso_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    filters: [repuso_source: "Google"]
  }

  measure: count_vrbo {
    label: "# of Vrbo Reviews"
    description: "This will take the count of all reviews from Repuso"
    hidden: yes
    type: sum_distinct
    sql: ${repuso_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    filters: [repuso_source: "Vrbo"]
  }

  measure: count_tripadvisor {
    label: "# of TripAdvisor Reviews"
    description: "This will take the count of all reviews from Repuso"
    hidden: yes
    type: sum_distinct
    sql: ${repuso_review_flag} ;;
    sql_distinct_key: ${reservation_code} ;;
    filters: [repuso_source: "TripAdvisor"]
  }

  measure: clean_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Clean"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      cleanliness_rating: "5"
    ]
  }

  measure: accuracy_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Accuracy"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      accuracy_rating: "5"
    ]
  }

  measure: accuracy_count_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 4 Star Accuracy"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      accuracy_rating: "4"
    ]
  }

  measure: value_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Value"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      value_rating: "5"
    ]
  }

  measure: location_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Location"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      location_rating: "5"
    ]
  }

  measure: communication_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Communication"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      communication_rating: "5"
    ]
  }

  measure: checkin_count_5_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Checkin"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      checkin_rating: "5"
    ]
  }

  measure: clean_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Clean"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      cleanliness_rating: "<=3"
    ]
  }

  measure: accuracy_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Accuracy"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      accuracy_rating: "<=3"
    ]
  }

  measure: value_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Value"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      value_rating: "<=3"
    ]
  }

  measure: location_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Location"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      location_rating: "<=3"
    ]
  }

  measure: communication_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Communication"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      communication_rating: "<=3"
    ]
  }

  measure: checkin_count_less_than_4_star {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Checkin"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [
      checkin_rating: "<=3"
    ]
  }

  measure: count_clean {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of Reviews (Clean Subcategory)"
    sql: ${reservation_code} ;;
    filters: [
      cleanliness_rating: "1,2,3,4,5"
    ]
  }

  measure: count_checkin {
    #view_label: "Metrics"
    hidden: yes
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of Reviews (Subcategories)"
    sql: ${reservation_code} ;;
    filters: [
      checkin_rating: "1,2,3,4,5"
    ]
  }

  measure: count_accuracy {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    type: count_distinct
    hidden: yes
    label: "# of Reviews (Subcategories)"
    sql: ${reservation_code} ;;
    filters: [
      accuracy_rating: "1,2,3,4,5"
    ]
  }

  measure: count_value {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    type: count_distinct
    hidden: yes
    label: "# of Reviews (Subcategories)"
    sql: ${reservation_code} ;;
    filters: [
      value_rating: "1,2,3,4,5"
    ]
  }

  measure: count_location {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    type: count_distinct
    hidden: yes
    label: "# of Reviews (Subcategories)"
    sql: ${reservation_code} ;;
    filters: [
      location_rating: "1,2,3,4,5"
    ]
  }

  measure: count_communication {
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    type: count_distinct
    hidden: yes
    label: "# of Reviews (Subcategories)"
    sql: ${reservation_code} ;;
    filters: [
      communication_rating: "1,2,3,4,5"
    ]
  }


  measure: percent_less_than_4_star_clean {
    group_label: "Review Percentages"
    type: number
    label: "% of Less than 4 star Clean"
    value_format: "0.0%"
    sql: ${clean_count_less_than_4_star} / nullif(${count_clean},0);;
  }

  measure: percent_less_than_4_star_accuracy {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less than 4 star Accuracy"
    type: number
    value_format: "0.0%"
    sql: ${accuracy_count_less_than_4_star} / nullif(${count_accuracy},0);;
  }

  measure: percent_less_than_4_star_location {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less than 4 star Location"
    type: number
    value_format: "0.0%"
    sql: ${location_count_less_than_4_star} / nullif(${count_location},0);;
  }

  measure: percent_less_than_4_star_value {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less than 4 star Value"
    type: number
    value_format: "0.0%"
    sql: ${value_count_less_than_4_star} / nullif(${count_value},0);;
  }

  measure: percent_less_than_4_star_communication {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less than 4 star Communication"
    type: number
    value_format: "0.0%"
    sql: ${communication_count_less_than_4_star} / nullif(${count_communication},0);;
  }

  measure: percent_less_than_4_star_checkin {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of Less than 4 star Checkin"
    type: number
    value_format: "0.0%"
    sql: ${checkin_count_less_than_4_star} / nullif(${count_checkin},0);;
  }

  measure: percent_5_star_clean {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 5 star Clean"
    type: number
    value_format: "0.0%"
    sql: ${clean_count_5_star} / nullif(${count_clean},0);;
  }

  measure: percent_5_star_value {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    type: number
    label: "% of 5 Star Value"
    value_format: "0.0%"
    sql: ${value_count_5_star} / nullif(${count_value},0);;
  }

  measure: percent_5_star_location {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    type: number
    label: "% of 5 Star Location"
    value_format: "0.0%"
    sql: ${location_count_5_star} / nullif(${count_location},0);;
  }

  measure: percent_5_star_communication {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    type: number
    value_format: "0.0%"
    label: "% of 5 Star Communication"
    sql: ${communication_count_5_star} / nullif(${count_communication},0);;
  }

  measure: percent_5_star_checkin {
    #view_label: "Metrics"
    label: "% of 5 Star Checkin"
    group_label: "Review Percentages"
    type: number
    value_format: "0.0%"
    sql: ${checkin_count_5_star} / nullif(${count_checkin},0);;
  }

  measure: percent_5_star_accuracy {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 5 Star Accuracy"
    type: number
    value_format: "0.0%"
    sql: ${accuracy_count_5_star} / nullif(${count_accuracy},0);;
  }

  measure: avg_communication_rating {
    #view_label: "Metrics"
    group_label: "Ratings (Aggregated)"
    label: "Avg Communication Rating"
    type: average
    value_format: "0.00"
    sql: ${communication_rating} ;;
  }

  measure: percent_4_star_clean {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 4 Star Clean"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_clean} + ${percent_less_than_4_star_clean});;
  }

  measure: percent_4_star_value {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 4 Star Value"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_value} + ${percent_less_than_4_star_value});;
  }

  measure: percent_4_star_location {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 4 Star Location"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_location} + ${percent_less_than_4_star_location});;
  }

  measure: percent_4_star_communication {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    type: number
    label: "% of 4 Star Communication"
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_communication} + ${percent_less_than_4_star_communication});;
  }

  measure: percent_4_star_checkin {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 4 Star Checkin"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_checkin} + ${percent_less_than_4_star_checkin});;
  }

  measure: percent_4_star_accuracy {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    type: number
    label: "% of 4 Star Accuracy"
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_accuracy} + ${percent_less_than_4_star_accuracy});;
  }

  measure: percent_4_star {
    #view_label: "Metrics"
    group_label: "Review Percentages"
    label: "% of 4 Star Overall"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star} + ${percent_less_than_4_star});;
  }

  measure: count_4_star_clean {
    group_label: "Other Review Counts"
    label: "# of 4 star Clean"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      cleanliness_rating: "4"
    ]
  }

  measure: count_4_star_value {
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of 4 star Value"
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      value_rating: "4"
    ]
  }

  measure: count_4_star_location {
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of 4 star Location"
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      location_rating: "4"
    ]
  }

  measure: count_4_star_communication {
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of 4 star Communication"
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      communication_rating: "4"
    ]
  }


  measure: count_4_star_checkin {
    group_label: "Other Review Counts"
    label: "# of 4 star Checkin"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [
      checkin_rating: "4"
    ]
  }

  ##### 90 Day Metrics

  measure: count_clean_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    type: count_distinct
    label: "# of Reviews (Clean) First 90 Days of Onboarding"
    sql: ${reservation_code} ;;
    filters: [cleanliness_rating: "1,2,3,4,5", hk_partners.first_3_months: "Yes"]
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: clean_count_5_star_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    label: "# of 5 Star Clean - First 90 Days"
    hidden: yes
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [cleanliness_rating: "5", hk_partners.first_3_months: "Yes"]
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: clean_count_less_than_4_star_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    label: "# of Less Than 4 Star Clean - First 90 Days"
    hidden: yes
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [cleanliness_rating: "<=3", hk_partners.first_3_months: "Yes"]
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: percent_5_star_clean_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    label: "% of Good Quality Stays- First 90 Days"
    description: "This refers to stays with 5 star ratings on cleanliness"
    type: number
    value_format: "0.0%"
    sql: ${clean_count_5_star} / nullif(${count_clean},0);;
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: percent_less_than_4_star_clean_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    label: "% of Bad Stays - First 90 Days"
    description: "This refers to stays with less than 4 star ratings on cleanliness"
    type: number
    value_format: "0.0%"
    sql: ${clean_count_less_than_4_star} / nullif(${count_clean},0);;
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: net_quality_score_clean_first90 {
    #view_label: "Metrics"
    group_label: "HK Onboarding Metrics (First 90 Days)"
    label: "NQS (Clean) - First 90 Days"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_clean} - ${percent_less_than_4_star_clean});;
    drill_fields: [reservation_code, reservation_checkin_date, reservation_checkout_date, cleanliness_rating, cleanliness_comments]

  }

  measure: net_quality_score_clean_last_30_reviews {
    group_label: "NQS Metrics"
    label: "NQS (Clean) - Last 30 Reviews"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_clean_last_30_reviews} - ${percent_less_than_4_star_clean_last_30_reviews});;
    drill_fields: [airbnb_details*, review_date, cleanliness_comments, value_comments, overall_comments]
  }

  measure: percent_5_star_clean_last_30_reviews {
    #view_label: "Metrics"
    hidden: yes
    group_label: "Review Percentages"
    type: number
    value_format: "0.0%"
    sql: ${clean_count_5_star_last_30_reviews} / nullif(${count_clean_last_30_reviews},0);;
  }

  measure: count_clean_last_30_reviews {
    #view_label: "Metrics"
    hidden: yes
    group_label: "Other Review Counts"
    type: count_distinct
    label: "# of Reviews (Subcategories) - Last 30 Reviews"
    sql: ${reservation_code} ;;
    filters: [cleanliness_rating: "1,2,3,4,5", last_30_reviews: "Yes"]
  }

  measure: clean_count_5_star_last_30_reviews {
    hidden: yes
    #view_label: "Metrics"
    group_label: "Other Review Counts"
    label: "# of 5 Star Clean (Last 30 Reviews)"
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.confirmationCd;;
    filters: [cleanliness_rating: "5", last_30_reviews: "Yes"]
  }

  measure: percent_less_than_4_star_clean_last_30_reviews {
    #view_label: "Metrics"
    hidden: yes
    group_label: "Review Percentages"
    type: number
    value_format: "0.0%"
    sql: ${clean_count_less_than_4_star_last_30_reviews} / nullif(${count_clean_last_30_reviews},0);;
  }

  measure: clean_count_less_than_4_star_last_30_reviews {
    #view_label: "Metrics"
    hidden: yes
    group_label: "Other Review Counts"
    label: "# of Less Than 4 Star Clean - Last 30 Reviews"
    type: count_distinct
    value_format: "0"
    sql: ${reservation_code};;
    filters: [cleanliness_rating: "<=3", last_30_reviews: "Yes"]
  }

  set:airbnb_details {
    fields: [complexes.title, count, net_quality_score, net_quality_score_accuracy, net_quality_score_checkin, net_quality_score_clean, net_quality_score_communication, net_quality_score_location, net_quality_score_value]
  }


}
