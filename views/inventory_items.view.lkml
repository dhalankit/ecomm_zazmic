view: inventory_items {
  sql_table_name: `boostr-396507.zazmic_ecomm.inventory_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    label: "Inventory Item ID"
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension_group: created {
    type: time
    label: "Created"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.created_at AS TIMESTAMP);;
  }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }
  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }
  dimension: product_id {
    type: number
    label: "Product ID(ON Inventory Items)"
    #hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }
  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  dimension_group: sold {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sold_at ;;
  }

  dimension: is_sold {
    label: "Is Sold"
    type: yesno
    sql: ${sold_raw} is not NULL ;;
  }

  dimension: days_in_inventory {
    label: "Days in Inventory"
    description: "Days between created and sold date"
    sql: TIMESTAMP_DIFF(coalesce(${sold_raw}, CURRENT_TIMESTAMP()),${created_raw},DAY) ;;
  }


  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;
    label: "Average Cost"
  }

  measure: total_cost {
    type: sum
    sql: coalesce(${cost},0) ;;
    label: "Total Cost"
  }
}
