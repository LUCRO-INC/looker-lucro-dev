view: users {
  sql_table_name: `retail-app-1ac4c.stm_public.users`
    ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}.birthdate ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: given_name {
    type: string
    sql: ${TABLE}.given_name ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
  }

  dimension: shared_code {
    type: string
    sql: ${TABLE}.shared_code ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
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

  dimension: user_state_id {
    type: number
    sql: ${TABLE}.user_state_id ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, given_name, middle_name, family_name]
  }
}
