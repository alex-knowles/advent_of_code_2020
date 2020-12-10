package advent_of_code.day_10

import data.advent_of_code.day_10
import data.advent_of_code.input_data

solution_p1 = product {
  jolt_ratings := jolt_ratings_from_input(input_data.day_10.jolt_ratings_input)

  jolt_deltas := [jolt_delta |
    jolt_1 := jolt_ratings[i]
    jolt_2 := jolt_ratings[i + 1]
    i < count(jolt_ratings) - 1
    jolt_delta := jolt_2 - jolt_1
  ]

  delta_3_count := count_instances_of(jolt_deltas, 3)
  delta_1_count := count_instances_of(jolt_deltas, 1)

  product := delta_3_count * delta_1_count
}

jolt_ratings_from_input(jolt_ratings_input) = result {
  lines := split(jolt_ratings_input, "\n")

  jolt_ratings := [jolt_rating |
    line := lines[_]
    count(line) > 0
    jolt_rating := to_number(line)
  ]

  device_adapter_rating := max(jolt_ratings) + 3
  charging_outlet_rating := 0
  unsorted_ratings := array.concat(jolt_ratings, [charging_outlet_rating, device_adapter_rating])
  result := sort(unsorted_ratings)
}

count_instances_of(numbers, number) = result {
  instances := [instance |
    instance := numbers[_]
    instance == number
  ]

  result := count(instances)
}
