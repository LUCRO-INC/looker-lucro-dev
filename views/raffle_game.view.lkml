view: raffle_game {
  sql_table_name: `retail-app-1ac4c.stm_public.raffle_game`
    ;;
  drill_fields: [raffle_game_id]

  dimension: raffle_game_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.raffle_game_id ;;
  }

  dimension: coins {
    type: number
    sql: ${TABLE}.coins ;;
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

  dimension_group: expire {
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
    sql: ${TABLE}.expire_at ;;
  }

  dimension_group: finish {
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
    sql: ${TABLE}.finish_at ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: max_winners {
    type: number
    sql: ${TABLE}.max_winners ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: price_user {
    type: number
    sql: ${TABLE}.price_user ;;
  }

  dimension: raffle_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.raffle_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      raffle_game_id,
      raffle.raffle_id,
      raffle.name,
      games.name,
      games.game_id,
      raffle_game_groups.count,
      raffle_game_scores.count,
      raffle_game_winners.count
    ]
  }
}
