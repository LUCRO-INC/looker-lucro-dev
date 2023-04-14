view: challenge_tasks {
  sql_table_name: `retail-app-1ac4c.stm_public.challenge_tasks`
    ;;
  drill_fields: [challenge_task_id]

  dimension: challenge_task_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.challenge_task_id ;;
  }

  dimension: challenge_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: configs_back {
    type: string
    sql: ${TABLE}.configs_back ;;
  }

  dimension: configs_front {
    type: string
    sql: ${TABLE}.configs_front ;;
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

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: task_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.task_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      challenge_task_id,
      challenges.challenge_uid,
      challenges.name,
      tasks.task_id,
      task_response.count,
      task_orders.count
    ]
  }
}
