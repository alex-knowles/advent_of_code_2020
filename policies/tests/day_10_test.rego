package advent_of_code.tests.day_10

import data.advent_of_code.day_10
import data.advent_of_code.input_data

sample_jolt_ratings_input := `
16
10
15
5
1
11
7
19
6
12
4
`

test_solution_p1 {
  day_10.solution_p1 == 35 with input_data.day_10.jolt_ratings_input as sample_jolt_ratings_input
}
