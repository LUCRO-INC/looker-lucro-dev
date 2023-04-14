view: challenge_user_activity {
  sql_table_name: `retail-app-1ac4c.stm_public.challenge_user_activity`
    ;;
  drill_fields: [challenge_user_activity_id]

  dimension: challenge_user_activity_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_user_activity_id ;;
  }

  dimension: challenge_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: complete {
    type: yesno
    sql: ${TABLE}.complete ;;
  }

  dimension_group: complete {
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
    sql: ${TABLE}.complete_date ;;
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

  dimension: system_dispatcher_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.system_dispatcher_id ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
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

  dimension: valid {
    type: yesno
    sql: ${TABLE}.valid ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      challenge_user_activity_id,
      transaction.transaction_id,
      challenges.challenge_uid,
      challenges.name,
      system_dispatcher.name,
      system_dispatcher.system_dispatcher_id,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      task_response.count
    ]
  }
}
