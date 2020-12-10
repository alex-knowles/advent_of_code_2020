package advent_of_code.tests.day_09

import data.advent_of_code.day_09
import data.advent_of_code.input_data

sample_sequence_input := `
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
`

test_first_invalid_number {
  preamble_length := 5
  window_length := 5

  day_09.first_invalid_number(preamble_length, window_length) == 127 with input_data.day_09.sequence_input as sample_sequence_input
}

test_encryption_weakness {
  preamble_length := 5
  window_length := 5

  day_09.encryption_weakness(preamble_length, window_length) == 62 with input_data.day_09.sequence_input as sample_sequence_input
}
