connection: "lucroapp_replication_bigquery"

include: "/views/**/users.view"
include: "/views/**/banks.view"
include: "/views/**/group_gender.view"
include: "/views/**/users_for_bank.view"
include: "/views/**/transacciones_por_tipo.view"
include: "/views/**/total_challenges_by_user.view"


datagroup: lucro_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lucro_default_datagroup


explore: users {}
explore: banks {}
explore: group_gender {}
explore: users_for_bank {}
explore: transacciones_por_tipo {}
explore: total_challenges_by_user {}
