view: challenge_rewards {
  sql_table_name: `retail-app-1ac4c.stm_public.challenge_rewards`
    ;;
  drill_fields: [challenge_reward_id]

  dimension: challenge_reward_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_reward_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: challenge_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: currency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.currency_id ;;
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

  dimension: referred_amount {
    type: number
    sql: ${TABLE}.referred_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [challenge_reward_id, challenges.challenge_uid, challenges.name, currency.name, currency.currency_id]
  }
}
