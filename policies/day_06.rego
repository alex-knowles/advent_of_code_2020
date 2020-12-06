package advent_of_code.day_06

import data.advent_of_code.day_06
import data.advent_of_code.input_data

solution_p1 = sum_of_group_yesses {
  batch_data := input_data.day_06.batch_data
  groups := groups_from_batch_data(batch_data)

  group_totals := [group_total |
    group := groups[_]
    group_total := count(group.group_answers)
  ]

  sum_of_group_yesses := sum(group_totals)
}

groups = groups {
  batch_data := input_data.day_06.batch_data
  groups := groups_from_batch_data(batch_data)
}

groups_from_batch_data(batch_data) = groups {
  data_chunks := split(batch_data, "\n\n")

  groups := [group |
    data_chunk := data_chunks[_]
    group := group_from_input(data_chunk)
  ]
}

group_from_input(group_input) = group {
  lines := split(group_input, "\n")

  individual_answers := [individiual_answer_set |
    line := lines[_]
    count(line) > 0

    individiual_answer_set := split(line, "")
  ]

  group_answers := {answer |
    answer := individual_answers[_][_]
  }

  group := {
    "individual_answers": individual_answers,
    "group_answers": group_answers
  }
}
