view: orders {
  sql_table_name: `boostr-396507.zazmic_ecomm.orders` ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: delivered_at {
    type: string
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: gender {
    type: yesno
    sql: ${TABLE}.gender ;;
  }
  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }
  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }
  dimension: shipped_at {
    type: string
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
    drill_fields: [order_id]
  }

}
