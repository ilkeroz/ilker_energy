view: dwh_site {
  derived_table: {
    sql:
    select distinct s.* from dwh_site s
    JOIN   dwh_aggregation_energy_savings_node n ON n.siteid = s.siteid
    where  n.startday >= date_format(date_add('day',-2,current_date),'%Y-%m-%d')
    and    s.name = 'KCMO'
    ;;
  }

  suggestions: yes

  dimension: altitude {
    type: string
    sql: ${TABLE}.altitude ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: created {
    type: string
    sql: ${TABLE}.created ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: orgid {
    type: string
    sql: ${TABLE}.orgid ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: region_code {
    type: string
    sql: ${TABLE}.region_code ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street1 {
    type: string
    sql: ${TABLE}.street1 ;;
  }

  dimension: street2 {
    type: string
    sql: ${TABLE}.street2 ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
