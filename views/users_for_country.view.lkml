view: users_for_country {
  derived_table: {
    sql: SELECT
          users_location.country  AS users_location_country,
          COUNT(*) AS pais
      FROM `retail-app-1ac4c.stm_public.users`
           AS info_user
      LEFT JOIN `retail-app-1ac4c.stm_public.users_location`
           AS users_location ON info_user.user_id = users_location.user_id
      GROUP BY
          1
      ORDER BY
          2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_location_country {
    type: string
    sql: ${TABLE}.users_location_country ;;
  }

  dimension: pais {
    type: number
    sql: ${TABLE}.pais ;;
  }

  set: detail {
    fields: [users_location_country, pais]
  }
}
