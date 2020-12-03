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
    password_is_valid(password, policy.letter, policy.min, policy.max)
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
  [min_and_max, letter] := split(raw_policy, " ")
  [min, max] := split(min_and_max, "-")

  entry := {
    "password": password,
    "policy": {
      "letter": letter,
      "min": to_number(min),
      "max": to_number(max)
    }
  }
}

password_is_valid(password, letter, min, max) = true {
  count := letter_count(password, letter)
  min <= count
  count <= max
}

letter_count(string, letter) = result {
  pattern := {letter: ""}
  string_minus_letter = strings.replace_n(pattern, string)
  result := count(string) - count(string_minus_letter)
}
