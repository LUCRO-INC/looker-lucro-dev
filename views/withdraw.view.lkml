view: withdraw {
  sql_table_name: `retail-app-1ac4c.stm_public.withdraw`
    ;;
  drill_fields: [withdraw_id]

  dimension: withdraw_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.withdraw_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: approval {
    type: string
    sql: ${TABLE}.approval ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_date ;;
  }

  dimension: create_user {
    type: number
    sql: ${TABLE}.create_user ;;
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

  dimension: pay_amount {
    type: number
    sql: ${TABLE}.pay_amount ;;
  }

  dimension_group: pay {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pay_date ;;
  }

  dimension_group: update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.update_date ;;
  }

  dimension: update_user {
    type: number
    sql: ${TABLE}.update_user ;;
  }

  dimension: user_bank_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_bank_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: withdraw_lat {
    type: number
    sql: ${TABLE}.withdraw_lat ;;
  }

  dimension: withdraw_lon {
    type: number
    sql: ${TABLE}.withdraw_lon ;;
  }

  dimension: withdraw_status_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.withdraw_status_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      withdraw_id,
      user_banks.user_name,
      user_banks.user_bank_id,
      user_banks.is_verified_user_name,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      withdraw_status.name,
      withdraw_status.withdraw_status_id,
      currency.name,
      currency.currency_id
    ]
  }
}
