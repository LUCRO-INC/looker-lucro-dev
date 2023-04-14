view: games {
  sql_table_name: `retail-app-1ac4c.stm_public.games`
    ;;
  drill_fields: [game_id]

  dimension: game_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.game_id ;;
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

  dimension: game_uid {
    type: string
    sql: ${TABLE}.game_uid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [game_id, name, raffle_game.count]
  }
}
