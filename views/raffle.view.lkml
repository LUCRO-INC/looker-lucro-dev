view: raffle {
  sql_table_name: `retail-app-1ac4c.stm_public.raffle`
    ;;
  drill_fields: [raffle_id]

  dimension: raffle_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.raffle_id ;;
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

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: image_context {
    type: string
    sql: ${TABLE}.image_context ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [raffle_id, name, raffle_game.count]
  }
}
