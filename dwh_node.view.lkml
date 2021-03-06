view: dwh_node {
  derived_table: {
    sql:
    select n.*, f.name as fixture_fixturetype, es.fixtureid as es_fixtureid, g.groupid, g.groupname
    from   hive.{{ _user_attributes['platform'] }}.dwh_node n
    LEFT OUTER JOIN   hive.{{ _user_attributes['platform'] }}.dwh_nodegroups g ON n.nodeid = g.nodeid
    JOIN   hive.{{ _user_attributes['platform'] }}.dwh_energy_settings es ON n.nodeid = es.nodeid
    JOIN   hive.{{ _user_attributes['platform'] }}.dwh_fixture f ON f.fixtureid = es.fixtureid
    where  (g.grouptype = 'Lighting')
    ;;
    #sql_trigger_value: select date_format(current_timestamp,'%H') ;;
  }

  suggestions: yes

  dimension: abcd {
    type: string
    sql: ${TABLE}.abcd ;;
  }

  dimension: apn {
    type: string
    sql: ${TABLE}.apn ;;
  }

  dimension: auth {
    type: string
    sql: ${TABLE}.auth ;;
  }

  dimension: basestation {
    type: string
    sql: ${TABLE}.basestation ;;
  }

  dimension: bssid {
    type: string
    sql: ${TABLE}.bssid ;;
  }

  dimension: building {
    type: string
    sql: ${TABLE}.building ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: circuit {
    type: string
    sql: ${TABLE}.circuit ;;
  }

  dimension: configtoken {
    type: string
    sql: ${TABLE}.configtoken ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: firmwarelastupdated {
    type: string
    sql: ${TABLE}.firmwarelastupdated ;;
  }

  dimension: fixtureid {
    type: string
    sql: ${TABLE}.es_fixtureid ;;
  }

  dimension: fixturename {
    type: string
    sql: ${TABLE}.fixturename ;;
  }

  dimension: fixturetype {
    type: string
    sql: ${TABLE}.fixturetype ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: mac {
    type: string
    sql: ${TABLE}.mac ;;
  }

  dimension: meshid {
    type: string
    sql: ${TABLE}.meshid ;;
  }

  dimension: mfgdate {
    type: string
    sql: ${TABLE}.mfgdate ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.nodeid ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: pdprofileid {
    type: string
    sql: ${TABLE}.pdprofileid ;;
  }

  dimension: pdprofilename {
    type: string
    sql: ${TABLE}.pdprofilename ;;
  }

  dimension: publickey {
    type: string
    sql: ${TABLE}.publickey ;;
  }

  dimension: remotenetwork {
    type: string
    sql: ${TABLE}.remotenetwork ;;
  }

  dimension: scheduleid {
    type: string
    sql: ${TABLE}.groupid ;;
  }

  dimension: groupname {
    type: string
    sql: ${TABLE}.groupname ;;
  }

  dimension: serialnumber {
    type: string
    sql: ${TABLE}.serialnumber ;;
  }

  dimension: server {
    type: string
    sql: ${TABLE}.server ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: softwareversion {
    type: string
    sql: ${TABLE}.softwareversion ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: fixture_fixturetype {
    type: string
    sql: ${TABLE}.fixture_fixturetype ;;
  }

  measure: count {
    type: count
    drill_fields: [fixturename, name, pdprofilename]
  }
}
