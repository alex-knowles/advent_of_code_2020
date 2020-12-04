package advent_of_code.day_02

solution := valid_password_count

valid_password_count = result {
  result := count(valid_passwords)
}

valid_passwords = result {
  entries := entries_from_data(input.data)

  result := [valid_password |
    policy := entries[i].policy
    password := entries[i].password
    password_is_valid(password, policy.letter, {policy.position_1, policy.position_2})
    valid_password := {"policy": policy, "password": password}
  ]
}

entries = result {
  result := entries_from_data(input.data)
}

entries_from_data(input_data) = entries {
  entries := [entry |
    datum := input_data[_]
    entry := entry_from_datum(datum)
  ] 
}

# datum looks like "1-3 a: abcde"
entry_from_datum(datum) = entry {
  [raw_policy, raw_password] := split(datum, ":")

  password := trim_space(raw_password)
  [two_positions, letter] := split(raw_policy, " ")
  [position_1, position_2] := split(two_positions, "-")

  entry := {
    "password": password,
    "policy": {
      "letter": letter,
      "position_1": to_number(position_1),
      "position_2": to_number(position_2)
    }
  }
}

# positions is a Set of 1-based indices
password_is_valid(password, letter, positions) = true {
  matching_positions := letter_positions(password, letter)
  position_intersection := positions & matching_positions
  count(position_intersection) == 1
}

letter_positions(string, letter) = set {
  string_length := count(string)
  indices := numbers.range(0, string_length - 1)

  string_fragments := {string_fragment |
    fragment := substring(string, indices[offset], -1)
    string_fragment := {"offset": offset, "fragment": fragment}
  }

  set := {matching_position |
    fragment := string_fragments[index].fragment
    offset := string_fragments[index].offset
    matching_index := indexof(fragment, letter)
    matching_index >= 0
    matching_position := matching_index + 1 + offset
  }
}
