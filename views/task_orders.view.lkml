view: task_orders {
  sql_table_name: `retail-app-1ac4c.stm_public.task_orders`
    ;;
  drill_fields: [task_order_id]

  dimension: task_order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_order_id ;;
  }

  dimension: challenge_task_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.challenge_task_id ;;
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

  dimension: task_id_current {
    type: number
    value_format_name: id
    sql: ${TABLE}.task_id_current ;;
  }

  dimension: task_id_next {
    type: number
    value_format_name: id
    sql: ${TABLE}.task_id_next ;;
  }

  dimension: task_order_response {
    type: string
    sql: ${TABLE}.task_order_response ;;
  }

  measure: count {
    type: count
    drill_fields: [task_order_id, challenge_tasks.challenge_task_id]
  }
}
