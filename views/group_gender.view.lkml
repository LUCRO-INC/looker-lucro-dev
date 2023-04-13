view: group_gender {
  derived_table: {
    sql: SELECT COUNT(user_id) AS numero, COUNT(user_id) * 100 / SUM(COUNT(user_id)) OVER () AS porcentaje, gender as genero,
      FROM users
      GROUP BY gender
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: numero {
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: porcentaje {
    type: number
    sql: ${TABLE}.porcentaje ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.genero ;;
  }

  set: detail {
    fields: [numero, porcentaje, genero]
  }
}
