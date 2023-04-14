view: transaction_balance {
  sql_table_name: `retail-app-1ac4c.stm_public.transaction_balance`
    ;;
  drill_fields: [transaction_balance_id]

  dimension: transaction_balance_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_balance_id ;;
  }

  dimension: currency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.currency_id ;;
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

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      transaction_balance_id,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      currency.name,
      currency.currency_id
    ]
  }
}
