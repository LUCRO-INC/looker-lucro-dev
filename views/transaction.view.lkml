view: transaction {
  sql_table_name: `retail-app-1ac4c.stm_public.transaction`
    ;;
  drill_fields: [transaction_id]

  dimension: transaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
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
    sql: ${TABLE}.create_date ;;
  }

  dimension: create_user {
    type: number
    sql: ${TABLE}.create_user ;;
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

  dimension_group: delete {
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
    sql: ${TABLE}.delete_date ;;
  }

  dimension: delete_user {
    type: number
    sql: ${TABLE}.delete_user ;;
  }

  dimension: issuer_event_id {
    type: string
    sql: ${TABLE}.issuer_event_id ;;
  }

  dimension: transaction_issuer_event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_issuer_event_id ;;
  }

  dimension: transaction_status_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_status_id ;;
  }

  dimension: transaction_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_type_id ;;
  }

  dimension_group: update {
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
    sql: ${TABLE}.update_date ;;
  }

  dimension: update_user {
    type: number
    sql: ${TABLE}.update_user ;;
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
      transaction_id,
      transaction_types.transaction_type_id,
      transaction_types.name,
      transaction_issuer_event.transaction_issuer_event_id,
      transaction_issuer_event.name,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      transaction_status.transaction_status_id,
      currency.name,
      currency.currency_id,
      challenge_user_activity.count,
      raffle_game_winners.count
    ]
  }
}
