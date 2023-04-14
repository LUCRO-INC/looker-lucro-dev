view: withdraw_response {
  sql_table_name: `retail-app-1ac4c.stm_public.withdraw_response`
    ;;
  drill_fields: [withdraw_response_id]

  dimension: withdraw_response_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.withdraw_response_id ;;
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

  measure: count {
    type: count
    drill_fields: [withdraw_response_id]
  }
}
