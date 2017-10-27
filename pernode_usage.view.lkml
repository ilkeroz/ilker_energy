view: pernode_usage {
  derived_table: {
    sql:
    select siteid,nodeid,aggregation_type,
          sum(
          case
                when aggregation_type = '15min' then 0.25 * actual_energy_consumption/1000
                when aggregation_type = '1hr'   then 1.0  * actual_energy_consumption/1000
                when aggregation_type = '1day'  then 24.0 * actual_energy_consumption/1000
           end
           ) as actual_node_day_usage,
           date(startday) as startday
    from   hive.{{ _user_attributes['platform'] }}.dwh_aggregation_energy_savings_node
    group  by siteid, nodeid, aggregation_type, startday
    ;;
    # sql_trigger_value: select date_format(current_timestamp,'%H') ;;
    }

    suggestions: yes

    dimension: nodeid {
      type: string
      sql: ${TABLE}.nodeid ;;
    }

    dimension: siteid {
      type: string
      sql: ${TABLE}.siteid ;;
      hidden: yes
    }

    dimension: aggregation_type {
      type: string
      sql: ${TABLE}.aggregation_type ;;
    }

    dimension: actual_node_day_usage {
      type: number
      sql: ${TABLE}.actual_node_day_usage ;;
    }

    dimension: startday {
      type: date
      sql: ${TABLE}.startday ;;
    }

    measure: avg_node_day {
      type: average
      sql: ${actual_node_day_usage} ;;
    }

  }
