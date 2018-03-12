view: drivers {
  sql_table_name: formula1.drivers ;;

  dimension: driver_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.driverId ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: dob {
    type: string
    sql: ${TABLE}.dob ;;
  }

  dimension: driver_ref {
    hidden: yes
    type: string
    sql: ${TABLE}.driverRef ;;
  }

  dimension: name {
    type: string
    sql: concat (${TABLE}.forename, ' ', ${TABLE}.surname) ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.nationality ;;
  }

  dimension: number {
    hidden: yes
    type: number
    sql: ${TABLE}.number ;;
  }


  dimension: url {
    hidden: yes
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      driver_id,
      name,
      driver_standings.count,
      lap_times.count,
      pit_stops.count,
      qualifying.count,
      results.count
    ]
  }
}
