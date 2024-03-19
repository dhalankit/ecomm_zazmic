view: products {
  sql_table_name: `boostr-396507.zazmic_ecomm.products` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }
  dimension: name {
    description: "Product Name"
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    description: "Product SKU"
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    label: "Count distinct Product"
    type: count
    drill_fields: [id, name, order_items.count, inventory_items.count]
  }
}
