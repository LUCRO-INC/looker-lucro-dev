view: users_referred {
  sql_table_name: `retail-app-1ac4c.stm_public.users_referred`
    ;;

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

  dimension: referred_by {
    type: number
    sql: ${TABLE}.referred_by ;;
  }

  dimension: referred_id {
    type: number
    sql: ${TABLE}.referred_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: valid {
    type: yesno
    sql: ${TABLE}.valid ;;
  }

  measure: count {
    type: count
    drill_fields: [users.given_name, users.middle_name, users.user_id, users.family_name]
  }
}
