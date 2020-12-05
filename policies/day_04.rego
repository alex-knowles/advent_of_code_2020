package advent_of_code.day_04

import data.advent_of_code.day_04
import data.advent_of_code.input_data

solution_p1 = valid_passports {
  batch_data := input_data.day_04.batch_data
  valid_passports := count_valid_passports_from_batch_data(batch_data)
}

count_valid_passports_from_batch_data(batch_data) = result {
  passports := passports_from_batch_data(batch_data)

  valid_passports := [valid_passport |
    valid_passport := passports[_]
    passport_is_valid(valid_passport)
  ]

  result := count(valid_passports)
}

passports = result {
  batch_data := input_data.day_04.batch_data
  result := passports_from_batch_data(batch_data)
}

passports_from_batch_data(batch_data) = passports {
  passports := [passport |
    chunks := split(batch_data, "\n\n")
    chunk := chunks[_]
    count(chunk) > 0
    passport := passport_from_chunk(chunk)
  ]
}

passport_from_chunk(chunk) = passport {
  one_line_chunk := replace(chunk, "\n", " ")
  key_value_pairs := split(one_line_chunk, " ")

  passport := {key: value | 
    [key, value] := split(key_value_pairs[_], ":")
  }
}

passport_is_valid(passport) = true {
  passport_fields := fields_from_passport(passport)
  intersection_set := passport_fields & required_fields
  intersection_set == required_fields
}

fields_from_passport(passport) = fields {
  fields := {field | passport[field]}
}

required_fields := {
  "byr",
  "iyr",
  "eyr",
  "hgt",
  "hcl",
  "ecl",
  "pid"
}
