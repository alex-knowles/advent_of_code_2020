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

sample_input = {
  "slope": {"x": 3, "y": 1},
  "map": sample_input_map
}

test_day_03_part_1 {
  day_03.solution == 7 with input as sample_input
}

sample_map := [
  [0, 0, 0, 0],
  [0, 1, 1, 1],
  [1, 1, 0, 0],
  [0, 1, 0, 0]
]

test_encounters_for_slope {
  slope := {"x": 3, "y": 1}

  expected_encounters = {
    {
      "position": {"x": 0, "y": 0},
      "tree": false
    },
    {
      "position": {"x": 3, "y": 1},
      "tree": true
    },
    {
      "position": {"x": 2, "y": 2},
      "tree": false
    },
    {
      "position": {"x": 1, "y": 3},
      "tree": true
    }
  }

  day_03.encounters_for_slope(sample_map, slope) == expected_encounters
}

test_positions_for_slope {
  slope := {"x": 1, "y": 3}

  expected_positions = {
    {"x": 0, "y": 0},
    {"x": 1, "y": 3}
  }

  day_03.positions_for_slope(sample_map, slope) == expected_positions
}
