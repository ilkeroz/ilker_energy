connection: "dwh_qastage2"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: dwh_aggregation_energy_savings_node {
  join: dwh_site {
    sql_on: ${dwh_aggregation_energy_savings_node.siteid}=${dwh_site.siteid} ;;
    relationship: many_to_one
  }
}

explore: dwh_site {}

explore: dwh_node {}
