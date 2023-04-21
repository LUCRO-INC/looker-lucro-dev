view: chalenge_user_query {
  derived_table: {
    sql: SELECT
        cua.challenge_user_activity_id,
        cua.challenge_id,
        cua.user_id,
        cua.system_dispatcher_id,
        cua.valid,
        cua.complete,
        cua.complete_date,
        cua.create_date,
        cua.create_user,
        cua.update_date,
        cua.update_user,
        cua.transaction_id,
        tr.task_response_id,
        tr.challenge_task_id,
        tr.task_type_id,
        tr.response_lat,
        tr.response_lon,
        tr.response_date,
        u.uid,
        u.is_active,
        u.email,
        u.shared_code,
        u.photo_url,
        u.given_name,
        u.middle_name,
        u.family_name,
        u.birthdate,
        u.gender,
        u.role_id,
        u.user_state_id,
        u.create_date AS user_create_date,
        u.create_user AS user_create_user,
        u.update_date AS user_update_date,
        u.update_user AS user_update_user,
        u.delete_date,
        u.delete_user
      FROM `retail-app-1ac4c.stm_public.challenge_user_activity` cua
      JOIN `retail-app-1ac4c.stm_public.task_response` tr
        ON cua.challenge_user_activity_id = tr.challenge_user_activity_id
      JOIN `retail-app-1ac4c.stm_public.users` u
        ON cua.user_id = u.user_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: challenge_user_activity_id {
    type: number
    sql: ${TABLE}.challenge_user_activity_id ;;
  }

  dimension: challenge_id {
    type: number
    sql: ${TABLE}.challenge_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: system_dispatcher_id {
    type: number
    sql: ${TABLE}.system_dispatcher_id ;;
  }

  dimension: valid {
    type: yesno
    sql: ${TABLE}.valid ;;
  }

  dimension: complete {
    type: yesno
    sql: ${TABLE}.complete ;;
  }

  dimension_group: complete_date {
    type: time
    sql: ${TABLE}.complete_date ;;
  }

  dimension_group: create_date {
    type: time
    sql: ${TABLE}.create_date ;;
  }

  dimension: create_user {
    type: number
    sql: ${TABLE}.create_user ;;
  }

  dimension_group: update_date {
    type: time
    sql: ${TABLE}.update_date ;;
  }

  dimension: update_user {
    type: number
    sql: ${TABLE}.update_user ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: task_response_id {
    type: number
    sql: ${TABLE}.task_response_id ;;
  }

  dimension: challenge_task_id {
    type: number
    sql: ${TABLE}.challenge_task_id ;;
  }

  dimension: task_type_id {
    type: number
    sql: ${TABLE}.task_type_id ;;
  }

  dimension: response_lat {
    type: number
    sql: ${TABLE}.response_lat ;;
  }

  dimension: response_lon {
    type: number
    sql: ${TABLE}.response_lon ;;
  }

  dimension_group: response_date {
    type: time
    sql: ${TABLE}.response_date ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: shared_code {
    type: string
    sql: ${TABLE}.shared_code ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: given_name {
    type: string
    sql: ${TABLE}.given_name ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
  }

  dimension_group: birthdate {
    type: time
    sql: ${TABLE}.birthdate ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
  }

  dimension: user_state_id {
    type: number
    sql: ${TABLE}.user_state_id ;;
  }

  dimension_group: user_create_date {
    type: time
    sql: ${TABLE}.user_create_date ;;
  }

  dimension: user_create_user {
    type: number
    sql: ${TABLE}.user_create_user ;;
  }

  dimension_group: user_update_date {
    type: time
    sql: ${TABLE}.user_update_date ;;
  }

  dimension: user_update_user {
    type: number
    sql: ${TABLE}.user_update_user ;;
  }

  dimension_group: delete_date {
    type: time
    sql: ${TABLE}.delete_date ;;
  }

  dimension: delete_user {
    type: number
    sql: ${TABLE}.delete_user ;;
  }

  set: detail {
    fields: [
      challenge_user_activity_id,
      challenge_id,
      user_id,
      system_dispatcher_id,
      valid,
      complete,
      complete_date_time,
      create_date_time,
      create_user,
      update_date_time,
      update_user,
      transaction_id,
      task_response_id,
      challenge_task_id,
      task_type_id,
      response_lat,
      response_lon,
      response_date_time,
      uid,
      is_active,
      email,
      shared_code,
      photo_url,
      given_name,
      middle_name,
      family_name,
      birthdate_time,
      gender,
      role_id,
      user_state_id,
      user_create_date_time,
      user_create_user,
      user_update_date_time,
      user_update_user,
      delete_date_time,
      delete_user
    ]
  }
}
