view: order_items {
  sql_table_name: `boostr-396507.zazmic_ecomm.order_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: is_returned_or_cancelled {
    type: string
    sql: CASE
              WHEN ${status} IN ('Returned','Cancelled') THEN 'Returned Or Cancelled'
              ELSE 'In Progress or Completed'
              END;;
  }


dimension: validation_status {
  group_label: "Status Fields"
  drill_fields: [status]
  case: {
    when: { sql:${status} in ('Cancelled','Returned');; label:"Invalid" }
    when: { sql:${status} in ('Shipped','Complete','Processing');; label:"Valid" }
    else: "Unknown"
  }
}
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: sale_price_tier {
    type: bin
    bins: [10,20,50,100]
    style: relational
    sql: ${sale_price} ;;
  }


  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_sale_price {
    type: sum
    sql: coalesce(${sale_price},0) ;; ##actual SQL to be aggregated. Here sale_price will be wrapped in SUM() function.
    value_format_name: usd
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

}
