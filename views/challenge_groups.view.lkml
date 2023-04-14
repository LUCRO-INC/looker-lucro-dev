view: challenge_groups {
  sql_table_name: `retail-app-1ac4c.stm_public.challenge_groups`
    ;;
  drill_fields: [challenge_group_id]

  dimension: challenge_group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_group_id ;;
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

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    drill_fields: [challenge_group_id, challenges.challenge_uid, challenges.name, groups.group_id, groups.name]
  }
}
