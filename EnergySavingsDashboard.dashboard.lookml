- dashboard: energy_savings_new
  title: EnergySavingsNEW
  layout: newspaper
  elements:
  - name: Total Actual Usage
    title: Total Actual Usage
    model: energyDashboardModel
    explore: dwh_aggregation_energy_savings_node
    type: single_value
    fields:
    - dwh_aggregation_energy_savings_node.sum_actual_usage
    column_limit: 50
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: "######.#"
    single_value_title: Actual Usage
    listen:
      Site: dwh_site.name
      Days: dwh_aggregation_energy_savings_node.startday
      Node: dwh_node.nodeid
      Fixture: dwh_node.fixture_fixturetype
      Schedule: dwh_node.groupname
      Resolution: dwh_aggregation_energy_savings_node.aggregation_type
    row: 2
    col: 0
    width: 5
    height: 2
  - name: Total Energy Savings
    title: Total Energy Savings
    model: energyDashboardModel
    explore: dwh_aggregation_energy_savings_node
    type: single_value
    fields:
    - dwh_aggregation_energy_savings_node.savings_total
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: normal
    show_value_labels: false
    label_density: 15
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: step-after
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    series_labels:
      dwh_aggregation_energy_savings_node.cons_legacy: Legacy Consumption
      dwh_aggregation_energy_savings_node.cons_led: Max Led Consumption
      dwh_aggregation_energy_savings_node.cons_actual: Actual Consumption
    colors:
    - "#709a5a"
    - "#e77bdf"
    - "#2343d8"
    series_colors: {}
    y_axis_min: []
    y_axis_max: []
    y_axis_labels:
    - W
    y_axes:
    - label: kWh
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: dwh_aggregation_energy_savings_node.savings_by_actual_vs_MaxLED
        name: Savings By Actual Vs Maxled
      - id: dwh_aggregation_energy_savings_node.savings_by_MaxLED_vs_legacy
        name: Savings By Maxled Vs Legacy
    column_spacing_ratio:
    x_axis_label: Time Period
    single_value_title: Savings
    value_format: "######.#"
    listen:
      Site: dwh_site.name
      Days: dwh_aggregation_energy_savings_node.startday
      Node: dwh_node.nodeid
      Fixture: dwh_node.fixture_fixturetype
      Schedule: dwh_node.groupname
      Resolution: dwh_aggregation_energy_savings_node.aggregation_type
    row: 2
    col: 5
    width: 4
    height: 2
  - name: Total Per Node Day
    title: Total Per Node Day
    model: energyDashboardModel
    explore: pernode_usage
    type: single_value
    fields:
    - pernode_usage.avg_node_day
    column_limit: 50
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    value_format: "######.#"
    single_value_title: Per Node - Selected in Filters
    listen:
      Site: dwh_site.name
      Days: pernode_usage.startday
      Node: dwh_node.nodeid
      Fixture: dwh_node.fixture_fixturetype
      Schedule: dwh_node.groupname
      Resolution: pernode_usage.aggregation_type
    row: 2
    col: 14
    width: 5
    height: 2
  - name: Total Sensor Savings
    title: Total Sensor Savings
    model: energyDashboardModel
    explore: dwh_aggregation_energy_savings_node
    type: single_value
    fields:
    - dwh_aggregation_energy_savings_node.savings_by_actual_vs_MaxLED
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#cf32c7"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: "######.#"
    single_value_title: Sensor Savings
    listen:
      Site: dwh_site.name
      Days: dwh_aggregation_energy_savings_node.startday
      Node: dwh_node.nodeid
      Fixture: dwh_node.fixture_fixturetype
      Schedule: dwh_node.groupname
      Resolution: dwh_aggregation_energy_savings_node.aggregation_type
    row: 2
    col: 9
    width: 5
    height: 2
  - name: Total All Node Day
    title: Total All Node Day
    model: energyDashboardModel
    explore: pernode_usage
    type: single_value
    fields:
    - pernode_usage.avg_node_day
    column_limit: 50
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    value_format: "######.#"
    single_value_title: Per Node - All Nodes of Site
    listen:
      Site: dwh_site.name
      Days: pernode_usage.startday
      Resolution: pernode_usage.aggregation_type
    row: 2
    col: 19
    width: 5
    height: 2
  - name: Total Energy Usage
    title: Total Energy Usage
    model: energyDashboardModel
    explore: dwh_aggregation_energy_savings_node
    type: looker_column
    fields:
    - dwh_aggregation_energy_savings_node.time_details_time
    - dwh_aggregation_energy_savings_node.sum_actual_usage
    - dwh_aggregation_energy_savings_node.sum_led_usage
    - dwh_aggregation_energy_savings_node.sum_legacy_usage
    sorts:
    - dwh_aggregation_energy_savings_node.time_details_time
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 15
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: step-after
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    series_labels:
      dwh_aggregation_energy_savings_node.cons_legacy: Legacy Consumption
      dwh_aggregation_energy_savings_node.cons_led: Max Led Consumption
      dwh_aggregation_energy_savings_node.cons_actual: Actual Consumption
      dwh_aggregation_energy_savings_node.savings_by_actual_vs_MaxLED: Savings by
        Actual
      dwh_aggregation_energy_savings_node.savings_by_MaxLED_vs_legacy: Savings by
        LED
      dwh_aggregation_energy_savings_node.sum_actual_usage: Actual Usage
      dwh_aggregation_energy_savings_node.sum_led_usage: Sensor Savings
      dwh_aggregation_energy_savings_node.sum_legacy_usage: LED Savings
    colors:
    - "#709a5a"
    - "#e77bdf"
    - "#2343d8"
    series_colors:
      dwh_aggregation_energy_savings_node.savings_by_actual_vs_MaxLED: "#2bcf1b"
      dwh_aggregation_energy_savings_node.savings_by_MaxLED_vs_legacy: "#679884"
    y_axis_min: []
    y_axis_max: []
    y_axis_labels:
    - W
    y_axes:
    - label: kWh
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: dwh_aggregation_energy_savings_node.savings_by_actual_vs_MaxLED
        name: Savings By Actual Vs Maxled
      - id: dwh_aggregation_energy_savings_node.savings_by_MaxLED_vs_legacy
        name: Savings By Maxled Vs Legacy
    x_axis_label: Time Period
    listen:
      Site: dwh_site.name
      Days: dwh_aggregation_energy_savings_node.startday
      Node: dwh_node.nodeid
      Fixture: dwh_node.fixture_fixturetype
      Schedule: dwh_node.groupname
      Resolution: dwh_aggregation_energy_savings_node.aggregation_type
    row: 4
    col: 0
    width: 24
    height: 11
  - name: Average Actual Daily Energy Usage (kWh)
    type: text
    title_text: Average Actual Daily Energy Usage (kWh)
    row: 0
    col: 14
    width: 10
    height: 2
  - name: Total Energy Savings (kWh)
    type: text
    title_text: Total Energy Savings (kWh)
    row: 0
    col: 0
    width: 14
    height: 2
  filters:
  - name: Node
    title: Node
    type: field_filter
    default_value: ''
    model: energy2
    explore: dwh_node
    field: dwh_node.nodeid
    listens_to_filters:
    - Site
    allow_multiple_values: true
  - name: Fixture
    title: Fixture
    type: field_filter
    default_value: ''
    model: energy2
    explore: dwh_node
    field: dwh_node.fixture_fixturetype
    listens_to_filters:
    - Site
    allow_multiple_values: true
  - name: Schedule
    title: Schedule
    type: field_filter
    default_value: ''
    model: energy2
    explore: dwh_node
    field: dwh_node.groupname
    listens_to_filters:
    - Site
    allow_multiple_values: true
  - name: Site
    title: Site
    type: field_filter
    default_value: Select
    model: energy2
    explore: dwh_site
    field: dwh_site.name
    listens_to_filters: []
    allow_multiple_values: true
  - name: Days
    title: Days
    type: field_filter
    default_value: 2 days
    model: energy2
    explore: dwh_aggregation_energy_savings_node
    field: dwh_aggregation_energy_savings_node.startday
    listens_to_filters: []
    allow_multiple_values: true
  - name: Resolution
    title: Resolution
    type: field_filter
    default_value: 1hr
    model: energy2
    explore: dwh_aggregation_energy_savings_node
    field: dwh_aggregation_energy_savings_node.aggregation_type
    listens_to_filters: []
    allow_multiple_values: true
