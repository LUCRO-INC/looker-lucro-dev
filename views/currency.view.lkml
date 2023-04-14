view: currency {
  sql_table_name: `retail-app-1ac4c.stm_public.currency`
    ;;
  drill_fields: [currency_id]

  dimension: currency_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.currency_id ;;
  }

  dimension: currency_key {
    type: string
    sql: ${TABLE}.currency_key ;;
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

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      currency_id,
      name,
      challenge_rewards.count,
      currency_exchange.count,
      transaction.count,
      transaction_balance.count,
      withdraw.count
    ]
  }
}
