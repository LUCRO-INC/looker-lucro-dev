view: user_states {
  sql_table_name: `retail-app-1ac4c.stm_public.user_states`
    ;;
  drill_fields: [user_state_id]

  dimension: user_state_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_state_id ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_state_id, name, users.count]
  }
}
