view: users {
  sql_table_name: `boostr-396507.zazmic_ecomm.users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: countryflag {
    type: string
    sql: ${country};;
    html:
    {% if country._value == "United States" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg" height="170" width="255">
    {% elsif country._value == "Spain" %}
    <img src="https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg" height="170" width="255">
    {% elsif country._value == "China" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg" height="170" width="255">
    {% elsif country._value == "Brasil"%}
    <img src="https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg" height="170" width="255">
    {% elsif country._value == "Germany"%}
    <img src="https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg" height="170" width="255">
    {% elsif country._value == "Columbia"%}
    <img src="https://upload.wikimedia.org/wikipedia/en/4/40/Flag_of_Columbia_County%2C_New_York.svg" height="170" width="255">
    {% elsif country._value == "Australia"%}
    <img src="https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Australia_%28converted%29.svg" height="170" width="255">
    {% elsif country._value == "Japan"%}
    <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg" height="170" width="255">
    {% elsif country._value == "France"%}
    <img src="https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg" height="170" width="255">
    {% else %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
    {% endif %} ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }

}
