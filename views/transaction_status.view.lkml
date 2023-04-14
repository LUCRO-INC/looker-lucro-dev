view: transaction_status {
  sql_table_name: `retail-app-1ac4c.stm_public.transaction_status`
    ;;
  drill_fields: [transaction_status_id]

  dimension: transaction_status_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_status_id ;;
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

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: [transaction_status_id, transaction.count]
  }
}
