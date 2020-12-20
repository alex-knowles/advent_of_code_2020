package advent_of_code.tests.day_16

import data.advent_of_code.day_16
import data.advent_of_code.input_data

sample_input := {
  "ticket_rules": {
    "class": "1-3 or 5-7",
    "row": "6-11 or 33-44",
    "seat": "13-40 or 45-50"
  }
}

sample_your_ticket_input := "7,1,14"

sample_rules := {
  "class": [[1, 3], [5, 7]],
  "row": [[6, 11], [33, 34]],
  "seat": [[13, 40], [45, 50]]
}

sample_nearby_tickets_input := `
7,3,47
40,4,50
55,2,20
38,6,12
`

test_solution_p1 {
  day_16.solution_p1 == 71 with input as sample_input with input_data.day_16.nearby_tickets_input as sample_nearby_tickets_input
}

test_invalid_values_from_tickets {
  tickets := [
    [7, 3, 47],
    [40, 4, 50],
    [55, 2, 20],
    [38, 6, 12]
  ]
  
  expected_values := [4, 55, 12]

  day_16.invalid_values_from_tickets(tickets) == expected_values with day_16.ticket_rules as sample_rules
}
