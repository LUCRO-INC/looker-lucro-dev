connection: "lucroapp_replication_bigquery"

include: "/views/*.view.lkml"


datagroup: lucro_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lucro_default_datagroup

explore: challenge_tasks {
  join: tasks {
    type: left_outer
    sql_on: ${challenge_tasks.task_id} = ${tasks.task_id} ;;
    relationship: many_to_one
  }
  join: task_types {
    type: left_outer
    sql_on: ${tasks.task_type_id} = ${task_types.task_type_id} ;;
    relationship: many_to_one
  }
}

explore: challenge_user_activity {

  join: users {
    type: left_outer
    sql_on: ${challenge_user_activity.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
  join: users_location {
    type: left_outer
    sql_on: ${users_location.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
  join: challenges {
    type: left_outer
    sql_on: ${challenge_user_activity.challenge_id} = ${challenges.challenge_id} ;;
    relationship: many_to_one
  }
  join: task_response {
    type: left_outer
    sql_on: ${challenge_user_activity.challenge_user_activity_id} = ${task_response.challenge_user_activity_id} ;;
    relationship: one_to_many
  }
  join: task_types {
    type: left_outer
    sql_on: ${task_response.task_type_id} = ${task_types.task_type_id} ;;
    relationship: many_to_one
  }
  join: challenge_tasks {
    type: left_outer
    sql_on: ${task_response.task_type_id} = ${challenge_tasks.challenge_task_id} ;;
    relationship: many_to_one
  }
  join: tasks {
    type: left_outer
    sql_on: ${challenge_tasks.task_id} = ${tasks.task_id} ;;
    relationship: many_to_one
  }
  join: task_choices {
    type: left_outer
    sql_on: ${task_choices.task_id} = ${tasks.task_id} ;;
    relationship: one_to_many
  }
  join: choices {
    type: left_outer
    sql_on: ${task_choices.choice_id} = ${choices.choice_id} ;;
    relationship: many_to_one
  }

}

explore: banks {}
explore: banners {}
explore: banners_groups {}
explore: challenge_calendar {}
explore: challenge_groups {}
explore: challenge_rewards {}

explore: challenge_types {}

explore: challenge_users {}
explore: challenges {}
explore: choices {}
explore: clients {}
explore: currency {}
explore: currency_exchange  {}
explore: game_prices_products {}
explore: games {}
explore: games_sessions {}
explore: group_assignment {}
explore: group_gender {}
explore: groups {}
explore: raffle {}
explore: raffle_game {}
explore: raffle_game_groups {}
explore: raffle_game_scores {}
explore: raffle_game_winners {}
explore: system_dispatcher {}
explore: task_choices {}
explore: task_orders {}
explore: task_response {}
explore: total_challenges_by_user {}
explore: transacciones_por_tipo {}
explore: transaction {}
explore: transaction_balance {}
explore: transaction_issuer_event {}
explore: transaction_status {}
explore: transaction_types {}
explore: user_banks {}
explore: user_states {}
explore: users {}
explore: users_groups {}
explore: users_location {}
explore: users_referred {}
explore:withdraw  {}
explore: withdraw_response {}
explore: withdraw_status {}

explore: sql_runner_user_city {}
