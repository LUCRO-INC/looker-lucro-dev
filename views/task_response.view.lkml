view: task_response {
  sql_table_name: `retail-app-1ac4c.stm_public.task_response`
    ;;
  drill_fields: [task_response_id]

  dimension: task_response_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_response_id ;;
  }

  dimension: challenge_task_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_task_id ;;
  }

  dimension: challenge_user_activity_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_user_activity_id ;;
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

  dimension: payload {
    type: string
    sql: ${TABLE}.payload ;;
  }

  dimension_group: response {
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
    sql: ${TABLE}.response_date ;;
  }

  dimension: response_lat {
    type: number
    sql: ${TABLE}.response_lat ;;
  }

  dimension: response_lon {
    type: number
    sql: ${TABLE}.response_lon ;;
  }

  dimension: task_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.task_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [task_response_id, task_types.task_type_id, task_types.name, challenge_user_activity.challenge_user_activity_id, challenge_tasks.challenge_task_id]
  }
}
