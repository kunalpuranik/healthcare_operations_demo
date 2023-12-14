include: "/simplified_views/*"
# include: "/demo_vitals/*"

view: realtime_observations {
  sql_table_name: `looker-private-demo.healthcare_demo_live.realtime_observation` ;;
  extends: [observation_vitals]
}
