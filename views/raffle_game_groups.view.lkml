view: raffle_game_groups {
  sql_table_name: `retail-app-1ac4c.stm_public.raffle_game_groups`
    ;;
  drill_fields: [raffle_game_group_id]

  dimension: raffle_game_group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.raffle_game_group_id ;;
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

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: raffle_game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.raffle_game_id ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [raffle_game_group_id, raffle_game.raffle_game_id, groups.group_id, groups.name]
  }
}
