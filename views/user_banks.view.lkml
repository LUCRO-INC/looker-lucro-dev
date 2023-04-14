view: user_banks {
  sql_table_name: `retail-app-1ac4c.stm_public.user_banks`
    ;;
  drill_fields: [user_bank_id]

  dimension: user_bank_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_bank_id ;;
  }

  dimension: bank_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.bank_id ;;
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

  dimension_group: delete {
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
    sql: ${TABLE}.delete_date ;;
  }

  dimension: delete_user {
    type: number
    sql: ${TABLE}.delete_user ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_user_bank_certified {
    type: yesno
    sql: ${TABLE}.is_user_bank_certified ;;
  }

  dimension: is_verified_user_bank_number {
    type: yesno
    sql: ${TABLE}.is_verified_user_bank_number ;;
  }

  dimension: is_verified_user_document {
    type: yesno
    sql: ${TABLE}.is_verified_user_document ;;
  }

  dimension: is_verified_user_name {
    type: yesno
    sql: ${TABLE}.is_verified_user_name ;;
  }

  dimension: is_verified_user_phone {
    type: yesno
    sql: ${TABLE}.is_verified_user_phone ;;
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

  dimension: user_bank_number {
    type: string
    sql: ${TABLE}.user_bank_number ;;
  }

  dimension: user_document_type {
    type: string
    sql: ${TABLE}.user_document_type ;;
  }

  dimension: user_document_value {
    type: string
    sql: ${TABLE}.user_document_value ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_name_search {
    type: string
    sql: ${TABLE}.user_name_search ;;
  }

  dimension: user_phone_number {
    type: string
    sql: ${TABLE}.user_phone_number ;;
  }

  dimension: user_phone_prefix {
    type: string
    sql: ${TABLE}.user_phone_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      user_bank_id,
      user_name,
      is_verified_user_name,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name,
      banks.bank_id,
      banks.bank_name,
      withdraw.count
    ]
  }
}
