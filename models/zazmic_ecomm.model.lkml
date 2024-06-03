connection: "looker-ecommerce"

include: "/views/**/*.view.lkml"


datagroup: zazmic_ecomm_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: zazmic_ecomm_default_datagroup


#explore: distribution_center {}

explore: orders {
  persist_for: "10 minutes"
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: order_items {
  persist_for: "10 minutes"
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: events {
    type: left_outer
    sql_on: ${events.user_id} = ${order_items.user_id};;
    relationship: many_to_one
  }
join: products {
  type: left_outer
  sql_on: ${products.id}= ${order_items.user_id} ;;
relationship: many_to_one
}

}

explore: inventory_items {
  persist_for: "10 minutes"
}
