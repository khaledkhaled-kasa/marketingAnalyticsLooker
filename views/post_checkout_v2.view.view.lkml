view: post_checkout_v2{
  label: "Post Checkout Surveys V2"
  sql_table_name:`data-warehouse-333815`.reviews.dmReviews;;

  dimension: aggregated_comments {
    label: "Aggregated Communication Comments"
    view_label: "Aggregated Reviews"
    description: "This will aggregate all communication related comments from different review channels (airbnb, Postcheckout, Postcheckout V2) into one block which was utilized for the Over-Communication Analysis."
    type: string
    sql: ${TABLE}.aggregatedCommunicationComments ;;
  }

# Over Communication Analysis
  dimension: contains_buzzword {
    view_label: "Aggregated Reviews"
    label: "Contains Buzz Word (Communication)"
    description: "This field has been created to display all aggregated comments from different review channels (airbnb, Postcheckout, Postcheckout V2) which contain one of the defined buzzwords pertinent to overcommunication such as communication, text, email, etc."
    type: yesno
    sql: ${TABLE}.communicationBuzzwordFlag ;;
  }

  dimension: aggregated_comments_all_clean {
    label: "Aggregated Comments (All)"
    view_label: "Aggregated Reviews"
    hidden: no
    description: "This will aggregate all review comments from different review channels (airbnb, Postcheckout, Postcheckout V2) into one block."
    type: string
    sql: ${TABLE}.aggregatedComments ;;
  }

  dimension: overall__how_would_you_rate_your_kasa_stay_ {
    label: "Overall Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaOverallRating ;;
    drill_fields: [submitted_at_date, reservations_clean.checkindate_date, reservations_clean.checkoutdate_date , units.internaltitle, _cleanliness___how_clean_was_the_kasa_when_you_arrived_, how_did_we_miss_the_mark_on_cleanliness_, what_would_have_made_your_stay_feel_like_a_better_value_,overall__how_would_you_rate_your_kasa_stay_,aggregated_comments]

  }

  dimension: _cleanliness___how_clean_was_the_kasa_when_you_arrived_ {
    label: "Cleanliness Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaCleanlinessRating  ;;
  }


  dimension: how_did_we_miss_the_mark_on_cleanliness_ {
    group_label: "Comments"
    label: "Cleanliness Comments"
    type: string
    sql: ${TABLE}.kasaCleanlinessComment  ;;
  }

  dimension: _accuracy___how_did_the_kasa_compare_to_what_you_expected_ {
    label: "Accuracy Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaAccuracyRating ;;
  }

  dimension: what_aspects_were_different_from_you_expected_ {
    group_label: "Comments"
    label: "Accuracy Comments"
    type: string
    sql: ${TABLE}.kasaAccuracyComment ;;
  }

  dimension: _communications___how_were_your_interactions_with_the_kasa_team_ {
    label: "Communication Rating"
    group_label: "Ratings"
    type: number
    sql:${TABLE}.kasaCommunicationRating  ;;
  }

  dimension: pillow_comfort_rating {
    label: "Pillow Comfort Rating"
    group_label: "Comfort Questions"
    type: string
    sql:${TABLE}.pillowComfortRating  ;;
  }

  dimension: towel_quality_rating {
    label: "Towel Comfort Rating"
    group_label: "Comfort Questions"
    type: string
    sql:${TABLE}.towelQualityRating  ;;
  }

  dimension: bed_linen_quality_rating {
    label: "Bed Linen Quality Rating"
    group_label: "Comfort Questions"
    type: string
    sql:${TABLE}.bedLinenQualityRating  ;;
  }

  dimension: pillow_sheets_decision_to_stay_indicator {
    label: "Would the quality of the pillows and sheets influences decision to stay"
    group_label: "Comfort Questions"
    type: string
    sql:${TABLE}.pillowSheetsDecisionToStayIndicator  ;;
  }

  dimension: linens_and_towels_additional_comments {
    label: "Linens and Towels Additional Comments"
    group_label: "Comfort Questions"
    type: string
    sql:${TABLE}.linensAndTowelsAdditionalComments  ;;
  }

  dimension: what_aspects_of_communications_fell_short_ {
    group_label: "Comments"
    label: "Communication Comments"
    type: string
    sql: ${TABLE}.kasaCommunicationComment ;;
  }

  dimension: _location___how_would_you_rate_the_surrounding_neighborhood_and_nearby_offerings_ {
    label: "Location Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaLocationRating ;;
  }

  dimension: how_did_the_property_location_fall_short_ {
    group_label: "Comments"
    label: "Location Comments"
    type: string
    sql: ${TABLE}.kasaLocationComment ;;
  }

  dimension: _check_in___how_smooth_was_your_check_in_and_arrival_process_ {
    label: "Checkin Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaCheckInRating ;;
  }

  dimension: how_did_the_the_check_in_experience_miss_the_mark_ {
    group_label: "Comments"
    label: "Checkin Comments"
    type: string
    sql: ${TABLE}.kasaCheckInComment ;;
  }

  dimension: _value___was_your_stay_a_good_value_for_the_price_ {
    label: "Value Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaValueRating ;;
  }

  dimension: what_would_have_made_your_stay_feel_like_a_better_value_ {
    group_label: "Comments"
    label: "Value Comments"
    type: string
    sql: ${TABLE}.kasaValueComment ;;
  }

  dimension: how_likely_are_you_to_recommend_kasa_to_someone_else_ {
    label: "NPS Rating"
    group_label: "Ratings"
    type: number
    sql: ${TABLE}.kasaNpsRating ;;
  }

  dimension: how_would_you_feel_if_you_could_no_longer_stay_at_any_kasa_locations_ {
    group_label: "Questions"
    type: string
    sql: ${TABLE}.kasaNoLongerStayFeedback ;;
  }

  # dimension: thanks_for_giving_us_your_feedback___your_insights_will_directly_improve_the_kasa_experience__coming_up_next_are_a_few_more_questions_about_your_trip_ {
  #   group_label: "Questions"
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.Thanks_for_giving_us_your_feedback___your_insights_will_directly_improve_the_Kasa_experience__Coming_up_next_are_a_few_more_questions_about_your_trip_ ;;
  # }

  dimension: what_was_the_primary_purpose_of_your_trip_ {
    label: "Trip Purpose"
    type: string
    sql: ${TABLE}.kasaTripPurpose ;;
  }

  dimension: what_best_describes_your_travel_party_ {
    label: "Travel Party"
    type: string
    sql: ${TABLE}.kasaTravelParty ;;
  }

  dimension: how_often_do_you_plan_to_return_to_this_destination_ {
    group_label: "Questions"
    type: string
    sql: ${TABLE}.kasaHowOftenPlanToReturnToDestination ;;
  }

  dimension: why_did_you_choose_to_stay_at_this_particular_property_ {
    group_label: "Questions"
    type: string
    sql: ${TABLE}.kasaReasonOfStay ;;
  }

  dimension: what_was_your_favorite_aspect_of_the_kasa_experience_ {
    group_label: "Questions"
    type: string
    sql: ${TABLE}.kasaFavoriteAspectOfKasaExperience ;;
  }

  dimension: what_else_could_kasa_have_done_to_improve_your_stay_ {
    group_label: "Questions"
    type: string
    sql: ${TABLE}.kasaImproveStayComment ;;
  }

  # dimension: email {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.email ;;
  # }

  dimension: platform {
    hidden: yes
    type: string
    sql: ${TABLE}.kasaPlatform ;;
  }

  # dimension: userid {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.userid ;;
  # }
  # dimension: source {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.source ;;
  # }

  dimension: nps {
    label: "NPS"
    hidden: yes
    type: string
    sql:  ${TABLE}.kasaNps;;
  }

  dimension: confirmationcode {
    label: "PSS_v2 Confirmation Code"
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.confirmationCd;;

  }

  dimension: review_Source {
    description: "Review Source (Typeform,SMS, Email Click,Repuso)"
    type: string
    sql:${TABLE}.kasaReviewSource  ;;
  }

  dimension_group: submitted_at {
    type: time
    timeframes: [
      raw,
      time,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.kasaReviewDttm;;
    convert_tz: no
  }

  dimension:isAutopopulated{
    label: "Is Auto-populated (Yes/No)"
    description: "Yes if subcategory Auto-populated with 5s"
    type:yesno
    sql: ${TABLE}.autoPopulationFlag ;;
  }

  dimension:kasa_review_flag{
    hidden: yes
    type:number
    sql: ${TABLE}.kasaReviewFlag ;;
  }

  measure: number_of_days_median {
    description: "Median number of days it took to complete Post-checkout Survey."
    label: "Median # of Days to Complete Post-checkout Survey"
    value_format: "0.0"
    type:  median_distinct
    sql_distinct_key: ${confirmationcode} ;;
    filters: [review_Source: "-Repuso"]
    sql: ${TABLE}.kasaCheckOutDateDiff;;
  }

  measure: count {
    label: "# of Review"
    type: sum_distinct
    sql: ${kasa_review_flag} ;;
    sql_distinct_key: ${confirmationcode} ;;
    filters: [review_Source: "-Repuso" ]
    drill_fields: [submitted_at_date, reservations_clean.checkindate_date, reservations_clean.checkoutdate_date , units.internaltitle, _cleanliness___how_clean_was_the_kasa_when_you_arrived_, how_did_we_miss_the_mark_on_cleanliness_, what_would_have_made_your_stay_feel_like_a_better_value_,overall__how_would_you_rate_your_kasa_stay_,aggregated_comments]
  }

  measure: count_clean {
    type: count_distinct
    label: "# of Clean Reviews"
    sql: ${confirmationcode} ;;
    filters: [
      _cleanliness___how_clean_was_the_kasa_when_you_arrived_: "1,2,3,4,5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_measure {
    label: "Avg Overall Rating (Kasa)"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${overall__how_would_you_rate_your_kasa_stay_} ;;
  }

  measure: overall_rating_combined {
    label: "Avg Overall Rating"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "The average combined overall rating for Airbnb and Kasa Surveys"
    group_label: "Ratings (Aggregated)"
    type: number
    value_format: "0.00"
    sql: (
        ifnull(sum(${overall__how_would_you_rate_your_kasa_stay_}),0)+ifnull(sum(${airbnb_reviews.overall_rating}),0)
      )/nullif(ifnull(count(${overall__how_would_you_rate_your_kasa_stay_}),0)+ifnull(count(${airbnb_reviews.overall_rating}),0),0) ;;
  }

  measure: overall_cleanliness_rating_combined {
    label: "Avg Cleanliness Overall Rating"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "The average combined cleanliness overall rating for Airbnb and Kasa Surveys"
    group_label: "Ratings (Aggregated)"
    type: number
    value_format: "0.00"
    sql: (
        ifnull(sum(${_cleanliness___how_clean_was_the_kasa_when_you_arrived_}),0)+ifnull(sum(${airbnb_reviews.cleanliness_rating}),0)
      )/nullif(ifnull(count(${_cleanliness___how_clean_was_the_kasa_when_you_arrived_}),0)+ifnull(count(${airbnb_reviews.cleanliness_rating}),0),0) ;;
  }

  measure: overall_check_in_rating_combined {
    label: "Avg Check-in Overall Rating"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "The average combined check-in overall rating for Airbnb and Kasa Surveys"
    group_label: "Ratings (Aggregated)"
    type: number
    value_format: "0.00"
    sql: (
        ifnull(sum(${_check_in___how_smooth_was_your_check_in_and_arrival_process_}),0)+ifnull(sum(${airbnb_reviews.checkin_rating}),0)
      )/nullif(ifnull(count(${_check_in___how_smooth_was_your_check_in_and_arrival_process_}),0)+ifnull(count(${airbnb_reviews.checkin_rating}),0),0) ;;
  }

  measure: communications_rating_combined{
    hidden: yes
    label: "Avg Communications Rating"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "The average combined communication rating for Airbnb and Kasa Surveys"
    group_label: "Ratings (Aggregated)"
    type: number
    value_format: "0.00"
    sql: (
      ifnull(sum(${_communications___how_were_your_interactions_with_the_kasa_team_}),0)+ifnull(sum(${airbnb_reviews.communication_rating}),0)
    )/nullif(ifnull(count(${_communications___how_were_your_interactions_with_the_kasa_team_}),0)+ifnull(count(${airbnb_reviews.communication_rating}),0),0) ;;
    drill_fields: [confirmationcode,reservations_clean.checkindate_date,reservations_clean.checkoutdate_date,_communications___how_were_your_interactions_with_the_kasa_team_,what_aspects_of_communications_fell_short_,airbnb_reviews.communication_rating,aggregated_comments]
  }


  measure: cleanliness_measure {
    label: "Avg Cleanliness Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_cleanliness___how_clean_was_the_kasa_when_you_arrived_} ;;
    drill_fields: [submitted_at_date, reservations_clean.checkindate_date, reservations_clean.checkoutdate_date , units.internaltitle, _cleanliness___how_clean_was_the_kasa_when_you_arrived_, how_did_we_miss_the_mark_on_cleanliness_, what_would_have_made_your_stay_feel_like_a_better_value_]
  }

  measure: accuracy_measure {
    label: "Avg Accuracy Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_accuracy___how_did_the_kasa_compare_to_what_you_expected_} ;;
  }

  measure: communication_measure {
    label: "Avg Communication Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_communications___how_were_your_interactions_with_the_kasa_team_} ;;
  }

  measure: location_measure {
    label: "Avg Location Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_location___how_would_you_rate_the_surrounding_neighborhood_and_nearby_offerings_} ;;
  }

  measure: checkin_measure {
    label: "Avg Checkin Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_check_in___how_smooth_was_your_check_in_and_arrival_process_} ;;
  }

  measure: value_measure {
    label: "Avg Value Rating"
    group_label: "Ratings (Aggregated)"
    type: average
    value_format: "0.00"
    sql: ${_value___was_your_stay_a_good_value_for_the_price_} ;;
  }

  measure: promotor_count {
    label: "# of Promoter"
    type: count
    value_format: "0"
    filters: [
      nps: "Promoter"
    ]
  }

  measure: detractor_count {
    label: "# of Detractor"
    type: count
    value_format: "0"
    filters: [
      nps: "Detractor"
    ]
  }

  measure: nps_measure {
    label: "NPS Rating"
    type: number
    value_format: "0.0"
    sql: 100*((${promotor_count}-${detractor_count})/ NULLIF(count(${nps}),0));;
  }

  measure: overall_count_5_star {
    label: "# of 5 Star (Overall)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_count_3_star {
    label: "# of 3 Star (Overall)"
    hidden: yes
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_count_2_star {
    label: "# of 2 Star (Overall)"
    hidden: yes
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "2"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_count_1_star {
    label: "# of 1 Star (Overall)"
    hidden: yes
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "1"
      ,review_Source: "-Repuso"
    ]
  }

  measure: cleanliness_5_star {
    label: "# of 5 Star (Cleanliness)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_cleanliness___how_clean_was_the_kasa_when_you_arrived_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: accuracy_5_star {
    label: "# of 5 Star (Accuracy)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_accuracy___how_did_the_kasa_compare_to_what_you_expected_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: communication_5_star {
    label: "# of 5 Star (Communication)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_communications___how_were_your_interactions_with_the_kasa_team_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: location_5_star {
    label: "# of 5 Star (Location)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_location___how_would_you_rate_the_surrounding_neighborhood_and_nearby_offerings_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: checkin_5_star {
    label: "# of 5 Star (Checkin)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_check_in___how_smooth_was_your_check_in_and_arrival_process_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: value_5_star {
    label: "# of 5 Star (Value)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_value___was_your_stay_a_good_value_for_the_price_: "5"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_combined_count_5_star {
    label: "# of 5 Star (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_5_star} + ${airbnb_reviews.count_5_star};;
  }

  measure: overall_combined_count_4_star {
    label: "# of 4 Star (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_4_star} + ${airbnb_reviews.count_4_star} ;;
  }

  measure: overall_combined_count_3_star_less {
    label: "# of 3 Star or Less (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_less_than_4_star} + ${airbnb_reviews.count_less_than_4_star} ;;
  }

  measure: overall_combined_count_3_star {
    label: "# of 3 Star (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_3_star} + ${airbnb_reviews.count_3_star} ;;
  }

  measure: overall_combined_count_2_star {
    label: "# of 2 Star (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_2_star} + ${airbnb_reviews.count_2_star} ;;
  }

  measure: overall_combined_count_1_star {
    label: "# of 1 Star (Overall)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: ${overall_count_1_star} + ${airbnb_reviews.count_1_star} ;;
  }

  measure: combined_percent_5_star_overall {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Overall)"
    description: "% of 5 star reviews"
    type: number
    value_format: "0.0%"
    sql: ${overall_combined_count_5_star} / nullif(${combined_count_overall},0);;
    drill_fields: [confirmationcode, aggregated_comments,complexes__address.title,complexes__address.propcode_revised, post_checkout_v2.combined_count_overall, combined_nqs_overall]

  }

  measure: combined_percent_4_star_overall {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Overall)"
    description: "% of 4 star reviews"
    type: number
    value_format: "0.0%"
    sql: ${overall_combined_count_4_star} / nullif(${combined_count_overall},0) ;;
  }

  measure: combined_percent_3_star_less_overall {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less"
    label: "% of Bad Stays (Overall)"
    type: number
    value_format: "0.0%"
    sql: ${overall_combined_count_3_star_less} / nullif(${combined_count_overall},0) ;;
    drill_fields: [confirmationcode, aggregated_comments,complexes__address.title,complexes__address.propcode_revised, post_checkout_v2.combined_count_overall, combined_nqs_overall]

  }

  measure: accuracy_combined_count_5_star {
    label: "# of 5 Star (Accuracy)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${accuracy_5_star} + ${airbnb_reviews.accuracy_count_5_star};;
  }

  measure: accuracy_combined_count_4_star {
    label: "# of 4 Star (Accuracy)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${accuracy_4_star} + ${airbnb_reviews.accuracy_count_4_star} ;;
  }

  measure: accuracy_combined_count_3_star_less {
    label: "# of 3 Star or Less (Accuracy)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${accuracy_less_than_4_star} + ${airbnb_reviews.accuracy_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_accuracy {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Accuracy)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${accuracy_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_accuracy {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Accuracy)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${accuracy_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_accuracy {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Accuracy)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${accuracy_combined_count_3_star_less} / nullif(${combined_count_overall},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, what_aspects_were_different_from_you_expected_, airbnb_reviews.accuracy_comments, combined_percent_3_star_less_accuracy]
  }

  measure: checkin_combined_count_5_star {
    label: "# of 5 Star (Checkin)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${checkin_5_star} + ${airbnb_reviews.checkin_count_5_star};;
  }

  measure: checkin_combined_count_4_star {
    label: "# of 4 Star (Checkin)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${checkin_4_star} + ${airbnb_reviews.count_4_star_checkin} ;;
  }

  measure: checkin_combined_count_3_star_less {
    label: "# of 3 Star or Less (Checkin)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${checkin_less_than_4_star} + ${airbnb_reviews.checkin_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_checkin {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Checkin)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${checkin_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_checkin {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Checkin)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${checkin_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_checkin {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Checkin)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${checkin_combined_count_3_star_less} / nullif(${combined_count_overall},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, how_did_the_the_check_in_experience_miss_the_mark_, airbnb_reviews.checkin_comments, combined_percent_3_star_less_checkin]
  }

  measure: clean_combined_count_5_star {
    label: "# of 5 Star (Clean)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${cleanliness_5_star} + ${airbnb_reviews.clean_count_5_star};;
  }

  measure: clean_combined_count_4_star {
    label: "# of 4 Star (Clean)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${cleanliness_4_star} + ${airbnb_reviews.count_4_star_clean} ;;
  }

  measure: clean_combined_count_3_star_less {
    label: "# of 3 Star or Less (Clean)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${cleanliness_less_than_4_star} + ${airbnb_reviews.clean_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_clean {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Clean)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${clean_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_clean {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Clean)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${clean_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_clean {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Clean)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${clean_combined_count_3_star_less} / nullif(${combined_count_overall},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, how_did_we_miss_the_mark_on_cleanliness_, airbnb_reviews.cleanliness_comments, combined_percent_3_star_less_clean]
  }

  measure: communication_combined_count_5_star {
    label: "# of 5 Star (Communication)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${communication_5_star} + ${airbnb_reviews.communication_count_5_star};;
  }

  measure: communication_combined_count_4_star {
    label: "# of 4 Star (Communication)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${communication_4_star} + ${airbnb_reviews.count_4_star_communication} ;;
  }

  measure: communication_combined_count_3_star_less {
    label: "# of 3 Star or Less (Communication)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${communication_less_than_4_star} + ${airbnb_reviews.communication_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_communication {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Communication)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${communication_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_communication {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Communication)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${communication_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_communication {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Communication)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${communication_combined_count_3_star_less} / nullif(${combined_count_clean},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, what_aspects_of_communications_fell_short_, airbnb_reviews.communication_comments, combined_percent_3_star_less_communication]
  }

  measure: location_combined_count_5_star {
    label: "# of 5 Star (Location)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${location_5_star} + ${airbnb_reviews.location_count_5_star};;
  }

  measure: location_combined_count_4_star {
    label: "# of 4 Star (Location)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${location_4_star} + ${airbnb_reviews.count_4_star_location} ;;
  }

  measure: location_combined_count_3_star_less {
    label: "# of 3 Star or Less (Location)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${location_less_than_4_star} + ${airbnb_reviews.location_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_location {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Location)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${location_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_location {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Location)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${location_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_location {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Location)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${location_combined_count_3_star_less} / nullif(${combined_count_clean},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, how_did_the_property_location_fall_short_, airbnb_reviews.location_comments, combined_percent_3_star_less_location]
  }

  measure: value_combined_count_5_star {
    label: "# of 5 Star (Value)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${value_5_star} + ${airbnb_reviews.value_count_5_star};;
  }

  measure: value_combined_count_4_star {
    label: "# of 4 Star (Value)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0"
    sql: ${value_4_star} + ${airbnb_reviews.count_4_star_value} ;;
  }

  measure: value_combined_count_3_star_less {
    label: "# of 3 Star or Less (Value)"
    group_label: "Combined Review Count Metrics"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: ${value_less_than_4_star} + ${airbnb_reviews.value_count_less_than_4_star} ;;
  }

  measure: combined_percent_5_star_value {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Good Stays (Value)"
    description: "% of 5 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${value_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_4_star_value {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    label: "% of Neutral Stays (Value)"
    description: "% of 4 star reviews"
    type: number
    hidden: yes
    value_format: "0.0%"
    sql: ${value_combined_count_4_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: combined_percent_3_star_less_value {
    group_label: "% of Good / Neutral / Bad Stays"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    description: "% of 3 star reviews or less. This will take into account the % of Bad Stays from the entire overall count and not just the subcategory count."
    label: "% of Bad Stays (Value)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${value_combined_count_3_star_less} / nullif(${combined_count_overall},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, what_would_have_made_your_stay_feel_like_a_better_value_, airbnb_reviews.value_comments, combined_percent_3_star_less_value]
  }

  measure: overall_count_4_star {
    label: "# of 4 Star (Overall)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: cleanliness_4_star {
    label: "# of 4 Star (Cleanliness)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_cleanliness___how_clean_was_the_kasa_when_you_arrived_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: accuracy_4_star {
    label: "# of 4 Star (Accuracy)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_accuracy___how_did_the_kasa_compare_to_what_you_expected_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: communication_4_star {
    label: "# of 4 Star (Communication)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_communications___how_were_your_interactions_with_the_kasa_team_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: location_4_star {
    label: "# of 4 Star (Location)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_location___how_would_you_rate_the_surrounding_neighborhood_and_nearby_offerings_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: checkin_4_star {
    label: "# of 4 Star (Checkin)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_check_in___how_smooth_was_your_check_in_and_arrival_process_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: value_4_star {
    label: "# of 4 Star (Value)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_value___was_your_stay_a_good_value_for_the_price_: "4"
      ,review_Source: "-Repuso"
    ]
  }

  measure: overall_count_less_than_4_star {
    label: "# of Less Than 4 Star (Overall)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [overall__how_would_you_rate_your_kasa_stay_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: cleanliness_less_than_4_star {
    label: "# of Less Than 4 Star (Cleanliness)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_cleanliness___how_clean_was_the_kasa_when_you_arrived_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: accuracy_less_than_4_star {
    label: "# of Less Than 4 Star (Accuracy)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_accuracy___how_did_the_kasa_compare_to_what_you_expected_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: communication_less_than_4_star {
    label: "# of Less Than 4 Star (Communication)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_communications___how_were_your_interactions_with_the_kasa_team_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: location_less_than_4_star {
    label: "# of Less Than 4 Star (Location)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_location___how_would_you_rate_the_surrounding_neighborhood_and_nearby_offerings_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: checkin_less_than_4_star {
    label: "# of Less Than 4 Star (Checkin)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_check_in___how_smooth_was_your_check_in_and_arrival_process_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: value_less_than_4_star {
    label: "# of Less Than 4 Star (Value)"
    group_label: "Other Review Counts"
    type: count_distinct
    value_format: "0"
    sql: ${confirmationcode} ;;
    filters: [_value___was_your_stay_a_good_value_for_the_price_: "<=3"
      ,review_Source: "-Repuso"
    ]
  }

  measure: percent_5_star_overall {
    group_label: "Review Percentages"
    label: "% of 5 Star (Overall)"
    type: number
    value_format: "0.0%"
    sql: ${overall_count_5_star} / nullif(${count},0) ;;
  }

  measure: percent_5_star_cleanliness {
    group_label: "Review Percentages"
    label: "% of 5 Star (Cleanliness)"
    type: number
    value_format: "0.0%"
    sql: ${cleanliness_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_5_star_accuracy {
    group_label: "Review Percentages"
    label: "% of 5 Star (Accuracy)"
    type: number
    value_format: "0.0%"
    sql: ${accuracy_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_5_star_checkin {
    group_label: "Review Percentages"
    label: "% of 5 Star (Checkin)"
    type: number
    value_format: "0.0%"
    sql: ${checkin_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_5_star_communication {
    group_label: "Review Percentages"
    label: "% of 5 Star (Communication)"
    type: number
    value_format: "0.0%"
    sql: ${communication_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_5_star_location {
    group_label: "Review Percentages"
    label: "% of 5 Star (Location)"
    type: number
    value_format: "0.0%"
    sql: ${location_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_5_star_value {
    group_label: "Review Percentages"
    label: "% of 5 Star (Value)"
    type: number
    value_format: "0.0%"
    sql: ${value_5_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_overall {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Overall)"
    type: number
    value_format: "0.0%"
    sql: ${overall_count_less_than_4_star} / nullif(${count},0) ;;
  }

  measure: percent_less_than_4_star_cleanliness {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Cleanliness)"
    type: number
    value_format: "0.0%"
    sql: ${cleanliness_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_accuracy {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Accuracy)"
    type: number
    value_format: "0.0%"
    sql: ${accuracy_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_checkin {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Checkin)"
    type: number
    value_format: "0.0%"
    sql: ${checkin_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_communication {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Communication)"
    type: number
    value_format: "0.0%"
    sql: ${communication_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_location {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Location)"
    type: number
    value_format: "0.0%"
    sql: ${location_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: percent_less_than_4_star_value {
    group_label: "Review Percentages"
    label: "% of Less Than 4 Star (Value)"
    type: number
    value_format: "0.0%"
    sql: ${value_less_than_4_star} / nullif(${count_clean},0) ;;
  }

  measure: net_quality_score_overall {
    group_label: "NQS Metrics"
    label: "NQS (Overall)"
    type: number
    value_format: "0.0"
    # sql:${TABLE}.overallNqs ;;
    sql: 100*(${percent_5_star_overall} - ${percent_less_than_4_star_overall});;
  }

  measure: combined_nqs_overall {
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    group_label: "Combined NQS Metrics"
    label: "Combined NQS (Overall)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_overall}*${count},0))+(COALESCE(${airbnb_reviews.net_quality_score}*${airbnb_reviews.count},0)))/nullif((${count}+${airbnb_reviews.count}),0) ;;
    # drill_fields: [complexes__address.title,complexes__address.propcode_revised, post_checkout_v2.combined_count_overall, combined_nqs_overall]
    # drill_fields: [reservations_clean.confirmationcode, reservations_clean.checkindate_date, reservations_clean.checkoutdate_date , units.internaltitle, aggregated_comments_all_clean, post_checkout_v2.combined_count_overall, combined_nqs_overall]
    link: {
      label: "Drill by Reservation"
      url: "{{ drill_fields_by_reservation._link }}&sorts=reservations_clean.checkoutdate_date+desc &filter_expression=NOT%28is_null%28%24%7Bairbnb_reviews.review_date%7D%29+AND+is_null%28%24%7Bpost_checkout_v2.submitted_at_date%7D%29%29"
    }
  }

  measure: combined_nqs_overall_perf_dashboard {
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    group_label: "Combined NQS Metrics"
    label: "Combined NQS (Overall)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: yes
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_overall}*${count},0))+(COALESCE(${airbnb_reviews.net_quality_score}*${airbnb_reviews.count},0)))/nullif((${count}+${airbnb_reviews.count}),0) ;;
    link: {
      label: "More customized drill-downs"
      url: "https://kasaliving.looker.com/dashboards/1269?Checkout+Date=6+Month&Portfolio=&Property+Code=&Trend+By+Parm=units.property%5E_type&Checkout+Date+Parm=checkoutdate%5E_month"
    }
  }

  measure: combined_nqs_clean {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Clean)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_cleanliness}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_clean}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_nqs_accuracy {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Accuracy)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_accuracy}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_accuracy}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_nqs_checkin {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Checkin)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_checkin}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_checkin}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_nqs_communication {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Communication)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_communication}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_communication}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_nqs_location {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Location)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_location}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_location}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_nqs_value {
    group_label: "Combined NQS Metrics"
    description: "This measure will include the combined weighted NQS from Airbnb and Postcheckout"
    label: "Combined NQS (Value)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0"
    sql: ((COALESCE(${net_quality_score_value}*${count_clean},0))+(COALESCE(${airbnb_reviews.net_quality_score_value}*${airbnb_reviews.count_clean},0)))/nullif((${count_clean}+${airbnb_reviews.count_clean}),0) ;;
  }

  measure: combined_count_overall {
    group_label: "Combined Review Count Metrics"
    label: "# of Combined Review (Overall)"
    description: "This measure calculates the sum of the airbnb and postcheckout reviews"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    value_format: "0"
    sql: COALESCE(${count}+${airbnb_reviews.count},0) ;;
    drill_fields: [reservations_clean.confirmationcode, units.internaltitle, post_checkout_v2.aggregated_comments_all_clean, post_checkout_v2.combined_count_overall, post_checkout_v2.combined_nqs_overall]
  }

  measure: combined_count_clean {
    group_label: "Combined Review Count Metrics"
    label: "# of Combined Review (Subcategories)"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0"
    sql: COALESCE(${count_clean}+${airbnb_reviews.count_clean},0) ;;
  }

  measure: percent_of_perfect_cleans {
    group_label: "Combined Review Count Metrics"
    label: "% of Perfect Cleans"
    view_label: "Combined Scores (Airbnb & Kasa Surveys)"
    type: number
    hidden: no
    value_format: "0.0%"
    sql: ${clean_combined_count_5_star} / nullif(${combined_count_clean},0) ;;
  }

  measure: net_quality_score_accuracy {
    group_label: "NQS Metrics"
    label: "NQS (Accuracy)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_accuracy} - ${percent_less_than_4_star_accuracy});;
  }

  measure: net_quality_score_checkin {
    group_label: "NQS Metrics"
    label: "NQS (Checkin)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_checkin} - ${percent_less_than_4_star_checkin});;
  }

  measure: net_quality_score_cleanliness {
    group_label: "NQS Metrics"
    label: "NQS (Cleanliness)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_cleanliness} - ${percent_less_than_4_star_cleanliness});;
  }

  measure: net_quality_score_communication {
    group_label: "NQS Metrics"
    label: "NQS (Communication)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_communication} - ${percent_less_than_4_star_communication});;
  }

  measure: net_quality_score_location {
    group_label: "NQS Metrics"
    label: "NQS (Location)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_location} - ${percent_less_than_4_star_location});;
  }

  measure: net_quality_score_value {
    group_label: "NQS Metrics"
    label: "NQS (Value)"
    type: number
    value_format: "0.0"
    sql: 100*(${percent_5_star_value} - ${percent_less_than_4_star_value});;
  }

  measure: percent_4_star_overall {
    group_label: "Review Percentages"
    label: "% of 4 Star (Overall)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_overall} + ${percent_less_than_4_star_overall});;
  }

  measure: percent_4_star_cleanliness {
    group_label: "Review Percentages"
    label: "% of 4 Star (Cleanliness)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_cleanliness} + ${percent_less_than_4_star_cleanliness});;
  }

  measure: percent_4_star_checkin {
    group_label: "Review Percentages"
    label: "% of 4 Star (Checkin)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_checkin} + ${percent_less_than_4_star_checkin});;
  }

  measure: percent_4_star_communication {
    group_label: "Review Percentages"
    label: "% of 4 Star (Communication)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_communication} + ${percent_less_than_4_star_communication});;
  }

  measure: percent_4_star_location {
    group_label: "Review Percentages"
    label: "% of 4 Star (Location)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_location} + ${percent_less_than_4_star_location});;
  }

  measure: percent_4_star_value {
    group_label: "Review Percentages"
    label: "% of 4 Star (Value)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_value} + ${percent_less_than_4_star_value});;
  }

  measure: percent_4_star_accuracy {
    group_label: "Review Percentages"
    label: "% of 4 Star (Accuracy)"
    type: number
    value_format: "0.0%"
    sql: 1 - (${percent_5_star_accuracy} + ${percent_less_than_4_star_accuracy});;
  }

  measure: disappointed_percentage {
    label: "Disappointed Score"
    type: number
    value_format: "0.0"
    sql: 100*(sum(if(${how_would_you_feel_if_you_could_no_longer_stay_at_any_kasa_locations_} = "Very disappointed",1,0)) /
      NULLIF(count(${how_would_you_feel_if_you_could_no_longer_stay_at_any_kasa_locations_}),0));;
  }

  measure: drill_fields_by_reservation {
    hidden: yes
    type: sum
    sql: 0 ;;
    drill_fields: [reservations_clean.confirmationcode, reservations_clean.checkindate_date, reservations_clean.checkoutdate_date , units.internaltitle, aggregated_comments_all_clean, airbnb_reviews.avg_overall_rating, post_checkout_v2.overall_measure, vfd_reviews.checkin_avg_rating]
  }


  set: detail {
    fields: [
      submitted_at_date,
      reservations_clean.checkindate_date,
      reservations_clean.checkoutdate_date ,
      units.internaltitle,
      _cleanliness___how_clean_was_the_kasa_when_you_arrived_,
      how_did_we_miss_the_mark_on_cleanliness_,
      what_would_have_made_your_stay_feel_like_a_better_value_

    ]
  }
}
