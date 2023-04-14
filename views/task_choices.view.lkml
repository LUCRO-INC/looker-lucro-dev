view: task_choices {
  sql_table_name: `retail-app-1ac4c.stm_public.task_choices`
    ;;
  drill_fields: [task_choice_id]

  dimension: task_choice_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_choice_id ;;
  }

  dimension: choice_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.choice_id ;;
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
    drill_fields: [task_choice_id, tasks.task_id, choices.choice_id]
  }
}
