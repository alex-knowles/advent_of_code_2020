package advent_of_code.day_16

import data.advent_of_code.day_16
import data.advent_of_code.input_data

solution_p1 = scanning_error_rate {
  scanning_error_rate := 0
}

invalid_values_from_tickets(tickets, rules) = invalid_values {
  invalid_values := [invalid_value |
    invalid_value := tickets[_][_]
    not value_matches_any_rules(invalid_value, rules)
  ]
}

value_matches_any_rules(value, rules) = true {
  results := [result |
    [min, max] := rules[_][_]
    min <= value
    value <= max
    result := true
  ]

  any(results)
}
