package advent_of_code.tests.day_02

import data.advent_of_code.day_02

sample_input = {
  "data": [
    "1-3 a: abcde",
    "1-3 b: cdefg",
    "2-9 c: ccccccccc"
  ]
}

test_day_02_part_1 {
  day_02.valid_password_count == 2 with input as sample_input
}
