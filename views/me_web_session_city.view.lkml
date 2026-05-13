view: me_web_session_city {
  sql_table_name: `data-warehouse-333815`.marketing.kasaWebsiteSessionCity ;;

  dimension: session_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }

  # ---------- first-touch (where the user came from) ----------
  dimension: first_city_page_type {
    label: "First City Page Type"
    description: "Which URL pattern the FIRST city-page view was on: 'cities' = new /cities/<slug> pages (live since 2026-03), 'locations' = legacy /locations/<slug> pages. Filter to 'cities' to measure new-page launch performance."
    type: string
    sql: ${TABLE}.first_city_page_type ;;
  }
  dimension: first_city_slug {
    label: "First City Slug"
    description: "URL slug of the first city-page the user viewed in this session (e.g. 'chicago-il'). Use for joining; show first_city_name to users."
    type: string
    sql: ${TABLE}.first_city_slug ;;
  }
  dimension: first_city_name {
    label: "First City"
    description: "Friendly name of the first city page the user viewed in this session (e.g. 'Chicago, IL'). Filter / group on this for 'where did this session come from?'."
    type: string
    sql: ${TABLE}.first_city_name ;;
  }
  dimension_group: first_city_view {
    label: "First City View"
    description: "Timestamp of the first city-page view in the session."
    type: time
    timeframes: [raw, time, date, week, month]
    datatype: datetime
    sql: ${TABLE}.first_city_view_at ;;
  }

  # ---------- last-touch (where the user ended up focused) ----------
  dimension: last_city_page_type {
    label: "Last City Page Type"
    description: "Which URL pattern the LAST city-page view was on: 'cities' or 'locations'. A session could move between patterns (e.g., land on /locations/chicago-il, then click into a property)."
    type: string
    sql: ${TABLE}.last_city_page_type ;;
  }
  dimension: last_city_slug {
    label: "Last City Slug"
    description: "URL slug of the last city-page the user viewed in this session."
    type: string
    sql: ${TABLE}.last_city_slug ;;
  }
  dimension: last_city_name {
    label: "Last City"
    description: "Friendly name of the last city page the user viewed in this session. Filter / group on this for 'what city was the user focused on at session end?'."
    type: string
    sql: ${TABLE}.last_city_name ;;
  }
  dimension_group: last_city_view {
    label: "Last City View"
    description: "Timestamp of the last city-page view in the session."
    type: time
    timeframes: [raw, time, date, week, month]
    datatype: datetime
    sql: ${TABLE}.last_city_view_at ;;
  }

  # ---------- session-level rollups ----------
  dimension: num_city_views {
    label: "# of City Page Views (in session)"
    description: "Count of city-page views in this session (any pattern, counted with repeats)."
    type: number
    sql: ${TABLE}.num_city_views ;;
  }
  dimension: num_distinct_cities_viewed {
    label: "# of Distinct Cities Viewed (in session)"
    description: "Distinct cities viewed in this session."
    type: number
    sql: ${TABLE}.num_distinct_cities_viewed ;;
  }
  dimension: num_new_cities_views {
    label: "# of New (/cities/) Page Views (in session)"
    description: "Count of views in this session that landed on /cities/<slug> (the new URL pattern, live since 2026-03)."
    type: number
    sql: ${TABLE}.num_new_cities_views ;;
  }
  dimension: num_legacy_locations_views {
    label: "# of Legacy (/locations/) Page Views (in session)"
    description: "Count of views in this session that landed on /locations/<slug> (the legacy URL pattern)."
    type: number
    sql: ${TABLE}.num_legacy_locations_views ;;
  }

  # ---------- handy yes/no flags ----------
  dimension: session_touched_city_page {
    label: "Session Touched a City Page"
    description: "TRUE if the session viewed at least one city / location page (either /cities/ or /locations/)."
    type: yesno
    sql: ${TABLE}.first_city_slug is not null ;;
  }
  dimension: session_touched_new_cities_page {
    label: "Session Touched a New (/cities/) Page"
    description: "TRUE if the session viewed at least one /cities/<slug> page."
    type: yesno
    sql: ${TABLE}.num_new_cities_views > 0 ;;
  }
  dimension: session_touched_legacy_locations_page {
    label: "Session Touched a Legacy (/locations/) Page"
    description: "TRUE if the session viewed at least one /locations/<slug> page."
    type: yesno
    sql: ${TABLE}.num_legacy_locations_views > 0 ;;
  }

  measure: sessions_with_city_view {
    label: "# of Sessions (City Page Viewed)"
    description: "Sessions that viewed at least one city/location page (either URL pattern). Funnel stage 0 — comes before property view."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [session_touched_city_page: "Yes"]
  }
  measure: sessions_with_new_cities_view {
    label: "# of Sessions (New /cities/ Page Viewed)"
    description: "Sessions that viewed at least one /cities/<slug> page (the new URL pattern, live since 2026-03)."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [session_touched_new_cities_page: "Yes"]
  }
  measure: sessions_with_legacy_locations_view {
    label: "# of Sessions (Legacy /locations/ Page Viewed)"
    description: "Sessions that viewed at least one /locations/<slug> page (the legacy URL pattern)."
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    filters: [session_touched_legacy_locations_page: "Yes"]
  }
}
