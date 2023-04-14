view: banks {
  sql_table_name: `retail-app-1ac4c.stm_public.banks`;;
  drill_fields: [bank_id]

  dimension: bank_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.bank_id ;;
  }

  dimension: bank_icon {
    type: string
    sql: ${TABLE}.bank_icon ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}.bank_name ;;
  }

  dimension: bank_name_system {
    type: string
    sql: ${TABLE}.bank_name_system ;;
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

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: min_amount {
    type: number
    sql: ${TABLE}.min_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_id, bank_name]
  }
}

view: banners {
  sql_table_name: `retail-app-1ac4c.stm_public.banners`
    ;;
  drill_fields: [banner_id]

  dimension: banner_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.banner_id ;;
  }

  dimension: configs {
    type: string
    sql: ${TABLE}.configs ;;
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

  dimension_group: finish {
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
    sql: ${TABLE}.finish_at ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_at ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [banner_id, name, banners_groups.count]
  }
}
