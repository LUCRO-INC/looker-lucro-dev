view: raffle_game_scores {
  sql_table_name: `retail-app-1ac4c.stm_public.raffle_game_scores`
    ;;
  drill_fields: [raffle_game_score_id]

  dimension: raffle_game_score_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.raffle_game_score_id ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_at ;;
  }

  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }

  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }

  dimension: game_session_id {
    type: number
    sql: ${TABLE}.game_session_id ;;
  }

  dimension: is_valid {
    type: yesno
    sql: ${TABLE}.is_valid ;;
  }

  dimension: raffle_game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.raffle_game_id ;;
  }

  dimension: sgt1 {
    type: number
    sql: ${TABLE}.sgt1 ;;
  }

  dimension: sgt2 {
    type: number
    sql: ${TABLE}.sgt2 ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      raffle_game_score_id,
      raffle_game.raffle_game_id,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      raffle_game_winners.count
    ]
  }
}
