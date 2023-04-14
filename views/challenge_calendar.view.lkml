view: challenge_calendar {
  sql_table_name: `retail-app-1ac4c.stm_public.challenge_calendar`
    ;;
  drill_fields: [challenge_calendar_id]

  dimension: challenge_calendar_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_calendar_id ;;
  }

  dimension: challenge_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_id ;;
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

  dimension: frequency_time {
    type: number
    sql: ${TABLE}.frequency_time ;;
  }

  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
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

  measure: count {
    type: count
    drill_fields: [challenge_calendar_id, challenges.challenge_uid, challenges.name]
  }
}
