# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: tasks {
  hidden: yes

  join: tasks__tags {
    view_label: "Tasks: Tags"
    sql: LEFT JOIN UNNEST(${tasks.tags}) as tasks__tags ;;
    relationship: one_to_many
  }
}

view: tasks {
  sql_table_name: `retail-app-1ac4c.stm_public.tasks`
    ;;
  drill_fields: [task_id]

  dimension: task_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: configs {
    type: string
    sql: ${TABLE}.configs ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }

  dimension: content_value {
    type: string
    sql: ${TABLE}.content_value ;;
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

  dimension: homologation_text {
    type: string
    sql: ${TABLE}.homologation_text ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: task_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.task_type_id ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      task_id,
      task_types.task_type_id,
      task_types.name,
      challenge_tasks.count,
      task_choices.count,
      tasks_.count
    ]
  }
}

view: tasks__tags {
  dimension: tasks__tags {
    type: string
    sql: tasks__tags ;;
  }
}
