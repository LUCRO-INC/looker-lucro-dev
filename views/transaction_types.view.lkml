view: transaction_types {
  sql_table_name: `retail-app-1ac4c.stm_public.transaction_types`
    ;;
  drill_fields: [transaction_type_id]

  dimension: transaction_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_type_id ;;
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

  dimension: operand {
    type: string
    sql: ${TABLE}.operand ;;
  }

  dimension: transaction_code {
    type: string
    sql: ${TABLE}.transaction_code ;;
  }

  measure: count {
    type: count
    drill_fields: [transaction_type_id, name, transaction.count]
  }
}
