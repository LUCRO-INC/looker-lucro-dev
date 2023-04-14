view: users_location {
  sql_table_name: `retail-app-1ac4c.stm_public.users_location`
    ;;

  dimension: administrative_area_level_1 {
    type: string
    sql: ${TABLE}.administrative_area_level_1 ;;
  }

  dimension: administrative_area_level_2 {
    type: string
    sql: ${TABLE}.administrative_area_level_2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: formatted_address {
    type: string
    sql: ${TABLE}.formatted_address ;;
  }

  dimension: geohash {
    type: string
    sql: ${TABLE}.geohash ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: locality {
    type: string
    sql: ${TABLE}.locality ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}.neighborhood ;;
  }

  dimension: place_id {
    type: string
    sql: ${TABLE}.place_id ;;
  }

  dimension: plus_code {
    type: string
    sql: ${TABLE}.plus_code ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: sublocality {
    type: string
    sql: ${TABLE}.sublocality ;;
  }

  dimension: sublocality_level_1 {
    type: string
    sql: ${TABLE}.sublocality_level_1 ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [users.given_name, users.middle_name, users.user_id, users.family_name]
  }
}
