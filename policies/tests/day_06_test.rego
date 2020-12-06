package advent_of_code.tests.day_06

import data.advent_of_code.day_06
import data.advent_of_code.input_data


batch_data := `
abc

a
b
c

ab
ac

a
a
a
a

b
`

test_day_06_p1 {
  day_06.solution_p1 == 11 with input_data.day_06.batch_data as batch_data
}

test_day_06_p2 {
  day_06.solution_p2 == 6 with input_data.day_06.batch_data as batch_data
}

sample_group := `
abcx
abcy
abcz
`

test_group_answers_from_input {
  group_data := sample_group
  group := day_06.group_from_input(group_data)
  expected_answers := {"a", "b", "c", "x", "y", "z"}

  group.group_answers == expected_answers
}
