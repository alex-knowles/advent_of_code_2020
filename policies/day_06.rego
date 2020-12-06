package advent_of_code.day_06

import data.advent_of_code.day_06
import data.advent_of_code.input_data

solution_p2 = sum_of_group_common_yesses {
  batch_data := input_data.day_06.batch_data
  groups := groups_from_batch_data(batch_data)

  group_totals := [group_total |
    group := groups[_]
    group_total := count(group.common_answers)
  ]

  sum_of_group_common_yesses := sum(group_totals)
}

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

  individual_answers := {individiual_answer_set |
    line := lines[_]
    count(line) > 0
    answers := split(line, "")
    individiual_answer_set := {answer | answer := answers[_]}
  }

  group_answers := {answer |
    answer := individual_answers[_][_]
  }

  common_answers := {common_answer |
    common_answer := individual_answers[_][_]
    all_answer_sets_include(individual_answers, common_answer)
  }

  group := {
    "individual_answers": individual_answers,
    "group_answers": group_answers,
    "common_answers": common_answers
  }
}

all_answer_sets_include(answer_sets, answer) = true {
  inclusive_sets := {inclusive_set |
    inclusive_set := answer_sets[_]
    inclusive_set[answer]
  }

  total_sets := count(answer_sets)
  total_sets_including_answer := count(inclusive_sets)
  total_sets_including_answer == total_sets
}
