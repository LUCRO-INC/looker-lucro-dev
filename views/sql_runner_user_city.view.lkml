view: sql_runner_user_city {
  derived_table: {
    sql: SELECT u.email, ul.city
      FROM users u
      INNER JOIN users_location ul ON u.user_id = ul.user_id
      WHERE u.is_active = true
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  set: detail {
    fields: [email, city]
  }
}
