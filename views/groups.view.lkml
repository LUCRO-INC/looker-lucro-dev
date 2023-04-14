view: groups {
  sql_table_name: `retail-app-1ac4c.stm_public.groups`
    ;;
  drill_fields: [group_id]

  dimension: group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.group_id ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: group_key {
    type: string
    sql: ${TABLE}.group_key ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

  measure: count {
    type: count
    drill_fields: [group_id, name, group_assignment.count, banners_groups.count, users_groups.count]
  }
}
