package advent_of_code.day_16

import data.advent_of_code.day_16
import data.advent_of_code.input_data

solution_p1 = scanning_error_rate {
  nearby_tickets := tickets_from_input(input_data.day_16.nearby_tickets_input)

  invalid_values := invalid_values_from_tickets(nearby_tickets)
  scanning_error_rate := sum(invalid_values)
}

ticket_rules[field] = rules {
  ticket_rules_input := input.ticket_rules
  text := ticket_rules_input[field]
  chunks := split(text, " or ")

  rules := [rule |
    min_and_max := chunks[_]
    [min, max] := split(min_and_max, "-")
    rule := [to_number(min), to_number(max)]
  ]
}

tickets_from_input(tickets_input) = tickets {
  lines := split(tickets_input, "\n")

  tickets := [ticket |
    line := lines[_]
    count(line) > 0
    chunks := split(line, ",")
    ticket := [value| value := to_number(chunks[_])]
  ]
}

invalid_values_from_tickets(tickets) = invalid_values {
  invalid_values := [invalid_value |
    invalid_value := tickets[_][_]
    not value_matches_any_rules(invalid_value)
  ]
}

value_matches_any_rules(value) = true {
  results := [result |
    [min, max] := ticket_rules[_][_]
    min <= value
    value <= max
    result := true
  ]

  any(results)
}
