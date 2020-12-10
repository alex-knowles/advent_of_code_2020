package advent_of_code.day_09

import data.advent_of_code.day_09
import data.advent_of_code.input_data

solution_p1 = result {
  result := first_invalid_number(25, 25)
}

first_invalid_number(preamble_length, window_length) = invalid_number {
  invalid_numbers := {index: invalid_number |
    invalid_number := sequence[index]
    index >= preamble_length
    window := array.slice(sequence, index - window_length, index)
    not can_sum_to(window, invalid_number)
  }

  indices := [index | invalid_numbers[index]]
  lowest_index := min(indices)
  invalid_number := invalid_numbers[lowest_index]
}

sequence = sequence {
  sequence := sequence_from_input(input_data.day_09.sequence_input)
}

sequence_from_input(sequence_input) = sequence {
  lines := split(sequence_input, "\n")

  sequence := [number |
    line := lines[_]
    count(line) > 0
    number := to_number(line)
  ]
}

can_sum_to(numbers, sum) = true {
  addend_1 := numbers[x]
  addend_2 := numbers[y]
  x != y
  addend_1 + addend_2 == sum
}
