view: dwh_aggregation_energy_savings_node {
  derived_table: {
    sql:
    select siteid,nodeid,aggregation_type,starttime,actual_energy_consumption,enddt,endtime,led_energy_consumption,legacy_energy_consumption,
           savings_legacy_vs_actual,savings_legacy_vs_led,startdt,starthr,ts,startdt_utc,starthr_utc,enddt_utc,startday_utc,
           case
                when aggregation_type = '15min' then 0.25 * actual_energy_consumption/1000
                when aggregation_type = '1hr'   then 1.0  * actual_energy_consumption/1000
                when aggregation_type = '1day'  then 24.0 * actual_energy_consumption/1000
           end as actual_usage,
           case
                when aggregation_type = '15min' then 0.25 * led_energy_consumption/1000
                when aggregation_type = '1hr'   then 1.0  * led_energy_consumption/1000
                when aggregation_type = '1day'  then 24.0 * led_energy_consumption/1000
           end as led_usage,
           case
                when aggregation_type = '15min' then 0.25 * legacy_energy_consumption/1000
                when aggregation_type = '1hr'   then 1.0  * legacy_energy_consumption/1000
                when aggregation_type = '1day'  then 24.0 * legacy_energy_consumption/1000
           end as legacy_usage,
           date(startday) as startday
    from   hive.{{ _user_attributes['platform'] }}.dwh_aggregation_energy_savings_node
    --where  startday >= date_format(date_add('day',-30,current_date),'%Y-%m-%d')
    ;;
    ##sql_trigger_value: select date_format(current_timestamp,'%H') ;;
  }

  suggestions: yes

  dimension: actual_usage {
    type: number
    sql: ${TABLE}.actual_usage ;;
  }

  dimension: led_usage {
    type: number
    sql: ${TABLE}.led_usage ;;
  }

  dimension: legacy_usage {
    type: number
    sql: ${TABLE}.legacy_usage ;;
  }

  dimension: actual_energy_consumption {
    type: number
    sql: ${TABLE}.actual_energy_consumption/1000 ;;
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
    sql: ${TABLE}.led_energy_consumption/1000 ;;
  }

  dimension: legacy_energy_consumption {
    type: number
    sql: ${TABLE}.legacy_energy_consumption/1000 ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.nodeid ;;
  }

  dimension: savings_legacy_vs_actual {
    type: number
    sql: ${TABLE}.savings_legacy_vs_actual/1000 ;;
  }

  dimension: savings_legacy_vs_led {
    type: number
    sql: ${TABLE}.savings_legacy_vs_led/1000 ;;
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

  dimension: myts {
    type: string
    sql: concat(substr( ${startdt} ,6,2), '/', substr(${startdt},9,2), ' ', substr(${startdt},11,6) )     ;;
    label: "Timestamp"
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

  measure: savings_by_MaxLED_vs_legacy {
    type: sum
    sql: ${savings_legacy_vs_led} ;;
  }

  measure: savings_by_actual_vs_MaxLED {
    type: sum
    sql: ${savings_legacy_vs_actual} - ${savings_legacy_vs_led} ;;
  }

  measure: savings_total {
    type: sum
    sql: ${savings_legacy_vs_actual} ;;
  }

  measure: sum_actual_usage {
    type: sum
    sql: greatest(${actual_usage},0) ;;
    value_format: "#####0.## \" kWh\""
  }

  measure: sum_led_usage {
    type: sum
    sql: greatest(${led_usage} - ${actual_usage},0) ;;
  }

  measure: sum_legacy_usage {
    type: sum
    sql: greatest(${legacy_usage} - ${actual_usage} - (${led_usage} - ${actual_usage}),0) ;;
  }

}
