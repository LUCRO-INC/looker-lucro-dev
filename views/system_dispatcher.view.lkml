view: system_dispatcher {
  sql_table_name: `retail-app-1ac4c.stm_public.system_dispatcher`
    ;;
  drill_fields: [system_dispatcher_id]

  dimension: system_dispatcher_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.system_dispatcher_id ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      system_dispatcher_id,
      name,
      challenge_user_activity.count,
      challenge_users.count,
      challenges.count,
      challenges_.count
    ]
  }
}
