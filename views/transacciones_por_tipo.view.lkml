view: transacciones_por_tipo {
  derived_table: {
    sql: SELECT tt.transaction_type_id, tt.name AS transaction_type_name,
       COUNT(t.transaction_id) AS num_transactions,
       (COUNT(t.transaction_id) * 100 / subquery.total_transactions) AS percentage
FROM transaction t
LEFT JOIN transaction_types tt ON t.transaction_type_id = tt.transaction_type_id
CROSS JOIN (SELECT COUNT(*) AS total_transactions FROM transaction) AS subquery
GROUP BY tt.transaction_type_id, tt.name, subquery.total_transactions
ORDER BY percentage DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: transaction_type_id {
    type: number
    sql: ${TABLE}.transaction_type_id ;;
  }

  dimension: transaction_type_name {
    type: string
    sql: ${TABLE}.transaction_type_name ;;
  }

  dimension: num_transactions {
    type: number
    sql: ${TABLE}.num_transactions ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  set: detail {
    fields: [transaction_type_id, transaction_type_name, num_transactions, percentage]
  }
}
