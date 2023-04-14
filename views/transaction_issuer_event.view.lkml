view: transaction_issuer_event {
  sql_table_name: `retail-app-1ac4c.stm_public.transaction_issuer_event`
    ;;
  drill_fields: [transaction_issuer_event_id]

  dimension: transaction_issuer_event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_issuer_event_id ;;
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

  dimension: issuer_table {
    type: string
    sql: ${TABLE}.issuer_table ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [transaction_issuer_event_id, name, transaction.count]
  }
}
