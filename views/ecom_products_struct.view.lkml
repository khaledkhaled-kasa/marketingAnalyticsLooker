view: ecom_products_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ECOM_products_struct`
    ;;
  label: "Products"
  dimension: product_brand_name {
    type: string
    sql: ${TABLE}.product_brand_name ;;
    hidden: yes
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    label: "Buidling City"
    drill_fields: [product_name]
  }

  dimension: product_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.product_id ;;
    label: "Building ID"
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    label: "Building Name"
  }

  dimension: product_picture_url {
    type: string
    sql: ${TABLE}.product_picture_url ;;
  }

  dimension: product_state {
    type: string
    sql: ${TABLE}.product_state ;;
    label: "Building State"
    drill_fields: [product_category, product_name]
  }

  dimension_group: product_updated {
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
    sql: ${TABLE}.product_updated_at ;;
    hidden: yes
  }

  dimension: product_variants {
    hidden: yes
    sql: ${TABLE}.product_variants ;;
  }

  dimension: product_zip {
    type: string
    sql: ${TABLE}.product_zip ;;
    label: "Building Postal Code"
  }

  measure: count {
    type: count
    drill_fields: [product_brand_name, product_name]
  }
}

view: ecom_products_struct__product_variants {
  label: "Product Variants"
  dimension: product_variant_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.product_variant_id ;;
    label: "Apartment ID"
  }

  dimension: product_variant_bedroom {
    type: number
    sql: ${TABLE}.product_variant_bedroom ;;
    label: "Number of Bedrooms in Apartment"
  }

  dimension: product_variant_name {
    type: string
    sql: ${TABLE}.product_variant_name ;;
    label: "Apartment Name"
  }

  dimension: product_variant_pets {
    type: yesno
    sql: ${TABLE}.product_variant_pets ;;
    label: "Is Apartment with Pets"
  }

  dimension: guesty_id {
    type: string
    sql: ${TABLE}.product_variant_guesty_id ;;
  }

  dimension: product_variant_short_name {
    type: string
    sql: ${TABLE}.product_variant_short_name ;;
    label: "Apartment Short Name"
  }

  dimension: product_variant_sku {
    type: string
    sql: ${TABLE}.product_variant_sku ;;
    label: "Apartment SKU"
  }

  dimension_group: product_variant_updated {
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
    sql: ${TABLE}.product_variant_updated_at ;;
    hidden: yes
  }
}