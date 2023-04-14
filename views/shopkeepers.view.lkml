view: shopkeepers {
  sql_table_name: `retail-app-1ac4c.stm_public.shopkeepers`
    ;;
  drill_fields: [shopkeeper_id]

  dimension: shopkeeper_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.shopkeeper_id ;;
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

  dimension: shop_name {
    type: string
    sql: ${TABLE}.shop_name ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      shopkeeper_id,
      shop_name,
      users.given_name,
      users.middle_name,
      users.user_id,
      users.family_name
    ]
  }
}
