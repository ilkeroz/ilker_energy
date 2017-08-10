view: dwh_aggregation_energy_savings_node {
  derived_table: {
    sql:
    select siteid,nodeid,aggregation_type,starttime,actual_energy_consumption,enddt,endtime,led_energy_consumption,legacy_energy_consumption,
           savings_legacy_vs_actual,savings_legacy_vs_led,startdt,starthr,ts,startdt_utc,starthr_utc,enddt_utc,startday_utc,
           date(startday) as startday
    from   hive.{{ _user_attributes['energy_platform'] }}.dwh_aggregation_energy_savings_node
    --where  startday >= date_format(date_add('day',-30,current_date),'%Y-%m-%d')
    ;;
    sql_trigger_value: select date_format(current_timestamp,'%H') ;;
  }

  suggestions: yes

  dimension: actual_energy_consumption {
    type: number
    sql: ${TABLE}.actual_energy_consumption ;;
  }

  dimension: aggregation_type {
    type: string
    sql: ${TABLE}.aggregation_type ;;
  }

  dimension: enddt {
    type: string
    sql: ${TABLE}.enddt ;;
  }

  dimension: endtime {
    type: number
    sql: ${TABLE}.endtime ;;
  }

  dimension: led_energy_consumption {
    type: number
    sql: ${TABLE}.led_energy_consumption ;;
  }

  dimension: legacy_energy_consumption {
    type: number
    sql: ${TABLE}.legacy_energy_consumption ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.nodeid ;;
  }

  dimension: savings_legacy_vs_actual {
    type: number
    sql: ${TABLE}.savings_legacy_vs_actual ;;
  }

  dimension: savings_legacy_vs_led {
    type: number
    sql: ${TABLE}.savings_legacy_vs_led ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
    hidden: yes
  }

  dimension: startday {
    type: date
    sql: ${TABLE}.startday ;;
  }

  dimension: startdt {
    type: string
    sql: ${TABLE}.startdt ;;
  }

  dimension: starthr {
    type: string
    sql: ${TABLE}.starthr ;;
  }

  dimension: starttime {
    type: number
    sql: ${TABLE}.starttime ;;
  }

  dimension: ts {
    type: number
    sql: ${TABLE}.ts ;;
  }

  dimension_group: time_details {
    type: time
    timeframes: []
    label: "Period"
    sql: date_parse(${TABLE}.startdt,'%Y-%m-%d %H:%i:%s') ;;
  }

  measure: cons_legacy {
    type: sum
    sql: ${legacy_energy_consumption} ;;
  }

  measure: cons_led {
    type: sum
    sql: ${led_energy_consumption} ;;
  }

  measure: cons_actual {
    type: sum
    sql: ${actual_energy_consumption} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
