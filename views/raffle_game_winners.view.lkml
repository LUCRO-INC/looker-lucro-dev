view: raffle_game_winners {
  sql_table_name: `retail-app-1ac4c.stm_public.raffle_game_winners`
    ;;
  drill_fields: [raffle_game_winner_id]

  dimension: raffle_game_winner_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.raffle_game_winner_id ;;
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

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: raffle_game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.raffle_game_id ;;
  }

  dimension: raffle_game_score_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.raffle_game_score_id ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
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
      raffle_game_winner_id,
      transaction.transaction_id,
      raffle_game_scores.raffle_game_score_id,
      raffle_game.raffle_game_id,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name
    ]
  }
}
