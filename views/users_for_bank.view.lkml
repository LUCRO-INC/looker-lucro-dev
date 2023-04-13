view: users_for_bank {
  derived_table: {
    sql: SELECT b.bank_name_system as banco, COUNT(DISTINCT u.user_id) AS total_cuentas
      FROM users AS u
      JOIN user_banks AS ub ON u.user_id = ub.user_id
      JOIN banks AS b ON b.bank_id = ub.bank_id
      GROUP BY b.bank_name_system
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: banco {
    type: string
    sql: ${TABLE}.banco ;;
  }

  dimension: total_cuentas {
    type: number
    sql: ${TABLE}.total_cuentas ;;
  }

  set: detail {
    fields: [banco, total_cuentas]
  }
}
