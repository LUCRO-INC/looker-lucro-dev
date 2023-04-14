view: task_types {
  sql_table_name: `retail-app-1ac4c.stm_public.task_types`
    ;;
  drill_fields: [task_type_id]

  dimension: task_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_type_id ;;
  }

  dimension: configs {
    type: string
    sql: ${TABLE}.configs ;;
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

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: render {
    type: string
    sql: ${TABLE}.render ;;
  }

  dimension: task_response_type_id {
    type: number
    sql: ${TABLE}.task_response_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [task_type_id, name, task_response.count, tasks.count, tasks_.count]
  }
}
