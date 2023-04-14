view: total_challenges_by_user {
  derived_table: {
    sql: SELECT COUNT(challenge_user_activity_ref.challenge_id) AS `Total desafios`,
      user_ref.user_id AS `ID Usuario`,
      user_ref.given_name AS `Nombre`,
      user_ref.create_date AS `Fecha creación usuario`
FROM users user_ref
JOIN challenge_user_activity challenge_user_activity_ref
ON user_ref.user_id = challenge_user_activity_ref.user_id
GROUP BY user_ref.user_id, user_ref.given_name, user_ref.create_date
ORDER BY `Total desafios` DESC LIMIT 5000
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_desafios {
    type: number
    label: "Total desafios"
    sql: ${TABLE}.`Total desafios` ;;
  }

  dimension: id_usuario {
    type: number
    label: "ID Usuario"
    sql: ${TABLE}.`ID Usuario` ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension_group: fecha_creacin_usuario {
    type: time
    label: "Fecha creación usuario"
    sql: ${TABLE}.`Fecha creación usuario` ;;
  }

  set: detail {
    fields: [total_desafios, id_usuario, nombre, fecha_creacin_usuario_time]
  }
}
