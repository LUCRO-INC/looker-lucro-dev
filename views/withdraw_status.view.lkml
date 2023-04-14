view: withdraw_status {
  sql_table_name: `retail-app-1ac4c.stm_public.withdraw_status`
    ;;
  drill_fields: [withdraw_status_id]

  dimension: withdraw_status_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.withdraw_status_id ;;
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

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: waiting_time {
    type: number
    sql: ${TABLE}.waiting_time ;;
  }

  dimension: withdraw_status_key {
    type: string
    sql: ${TABLE}.withdraw_status_key ;;
  }

  measure: count {
    type: count
    drill_fields: [withdraw_status_id, name, withdraw.count]
  }
}
