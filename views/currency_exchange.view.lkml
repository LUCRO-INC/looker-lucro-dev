view: currency_exchange {
  sql_table_name: `retail-app-1ac4c.stm_public.currency_exchange`
    ;;
  drill_fields: [currency_exchange_id]

  dimension: currency_exchange_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.currency_exchange_id ;;
  }

  dimension: currency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.currency_id ;;
  }

  dimension: currency_value {
    type: number
    sql: ${TABLE}.currency_value ;;
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

  dimension: to_currency_id {
    type: number
    sql: ${TABLE}.to_currency_id ;;
  }

  dimension: to_currency_value {
    type: number
    sql: ${TABLE}.to_currency_value ;;
  }

  measure: count {
    type: count
    drill_fields: [currency_exchange_id, currency.name, currency.currency_id]
  }
}
