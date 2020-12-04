package advent_of_code.tests.day_03

import data.advent_of_code.day_03

sample_input_map := `
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
`

sample_map := [
  [0, 0, 0, 0],
  [0, 1, 1, 1],
  [1, 1, 0, 0],
  [0, 1, 0, 0]
]

sample_input = {
  "data": {
    "slope": {
      "x": 3,
      "y": 1
    },
    "map": sample_input_map
  }
}

test_day_03_part_1 {
  day_03.solution == 7 with input as sample_input with data.map as sample_map
}

test_miss_at_position_0_0 {
  position := {"x": 0, "y": 0}
  not day_03.hit_at_position(sample_map, position)
}

test_hit_at_position_0_2 {
  position := {"x": 0, "y": 2}
  day_03.hit_at_position(sample_map, position)
}

test_get_next_position {
  position := {"x": 0, "y": 2}
  slope := {"x": 3, "y": 1}
  expected_result := {"x": 3, "y": 3}
  day_03.get_next_position(sample_map, position, slope) == expected_result
}



