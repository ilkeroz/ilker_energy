connection: "scale"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: dwh_aggregation_energy_savings_node {
  join: dwh_site {
    sql_on: ${dwh_aggregation_energy_savings_node.siteid}=${dwh_site.siteid} ;;
    relationship: many_to_one
  }

  join: dwh_node {
    sql_on: ${dwh_aggregation_energy_savings_node.nodeid}=${dwh_node.nodeid} ;;
    relationship: many_to_one
  }
}

explore: pernode_usage {
  join: dwh_site {
    sql_on: ${pernode_usage.siteid}=${dwh_site.siteid} ;;
    relationship: many_to_one
  }
  join: dwh_node {
    sql_on: ${pernode_usage.nodeid}=${dwh_node.nodeid} ;;
    relationship: many_to_one
  }
}

explore: dwh_site {}

explore: dwh_node {
  join: dwh_site {
    sql_on: ${dwh_node.siteid} = ${dwh_site.siteid} ;;
    relationship: many_to_one
  }
}
