view: banners_groups {
  sql_table_name: `retail-app-1ac4c.stm_public.banners_groups`
    ;;

  dimension: banner_group_id {
    type: number
    sql: ${TABLE}.banner_group_id ;;
  }

  dimension: banner_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.banner_id ;;
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

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [groups.group_id, groups.name, banners.banner_id, banners.name]
  }
}
