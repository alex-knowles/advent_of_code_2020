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

ticket_fields_in_order = field_order {
  field_indices := numbers.range(0, count(valid_nearby_tickets[0]["values"]) - 1)

  field_order := [field_set_intersection |
    index := field_indices[_]

    field_super_set := {field_set |
      possible_fields := valid_nearby_tickets[_]["possible_fields"][index]
      field_set := possible_fields.fields
    }

    field_set_intersection := intersection(field_super_set)
  ]
}

valid_nearby_tickets = valid_tickets {
  nearby_tickets := tickets_from_input(input_data.day_16.nearby_tickets_input)

  valid_tickets := [valid_ticket |
    nearby_ticket := nearby_tickets[_]
    ticket_is_valid(nearby_ticket)

    valid_ticket := {
      "values": nearby_ticket,
      "possible_fields": possible_fields_for_ticket_values(nearby_ticket)
    }
  ]
}

ticket_is_valid(ticket) = true {
  invalid_values_from_tickets([ticket]) == []
}

possible_fields_for_ticket_values(ticket_values) = possible_fields {
  possible_fields = [{"value": value, "fields": fields} |
    value := ticket_values[_]
    
    fields := {field | 
      rules := ticket_rules[field]
      value_matches_rules(value, rules)
    }
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
    rules := ticket_rules[_]
    result := value_matches_rules(value, rules)
  ]

  any(results)
}

value_matches_rules(value, rules) = true {
  results := [result |
    [min, max] := rules[_]
    min <= value
    value <= max
    result := true
  ]

  any(results)
}
