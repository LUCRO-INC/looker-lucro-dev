view: game_prices_products {
  sql_table_name: `retail-app-1ac4c.stm_public.game_prices_products`
    ;;

  dimension: aggregator {
    type: string
    sql: ${TABLE}.aggregator ;;
  }

  dimension: altimage {
    type: string
    sql: ${TABLE}.altimage ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: datastream_metadata__is_deleted {
    type: yesno
    sql: ${TABLE}.datastream_metadata.is_deleted ;;
    group_label: "Datastream Metadata"
    group_item_label: "Is Deleted"
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

  dimension: ean {
    type: string
    sql: ${TABLE}.ean ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: retailer {
    type: string
    sql: ${TABLE}.retailer ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
