view: games_sessions {
  sql_table_name: `retail-app-1ac4c.stm_public.games_sessions`
    ;;

  dimension_group: client_time_finish {
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
    sql: ${TABLE}.client_time_finish ;;
  }

  dimension_group: client_time_start {
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
    sql: ${TABLE}.client_time_start ;;
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

  dimension: error {
    type: string
    sql: ${TABLE}.error ;;
  }

  dimension: finish {
    type: yesno
    sql: ${TABLE}.finish ;;
  }

  dimension: game_session_id {
    type: number
    sql: ${TABLE}.game_session_id ;;
  }

  dimension: log {
    type: string
    sql: ${TABLE}.log ;;
  }

  dimension_group: server_time_finish {
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
    sql: ${TABLE}.server_time_finish ;;
  }

  dimension_group: server_time_start {
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
    sql: ${TABLE}.server_time_start ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
