package advent_of_code.day_04

import data.advent_of_code.day_04
import data.advent_of_code.input_data

solution_p2 = valid_passports {
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

  byr_is_valid(passport.byr)
  iyr_is_valid(passport.iyr)
  eyr_is_valid(passport.eyr)
  hgt_is_valid(passport.hgt)
  hcl_is_valid(passport.hcl)
  ecl_is_valid(passport.ecl)
  pid_is_valid(passport.pid)
}

byr_is_valid(string) = true {
  byr := to_number(string)
  1920 <= byr
  byr <= 2002
}

iyr_is_valid(string) = true {
  iyr := to_number(string)
  2010 <= iyr
  iyr <= 2020
}

eyr_is_valid(string) = true {
  eyr := to_number(string)
  2020 <= eyr
  eyr <= 2030
}

hgt_is_valid(string) = true {
  endswith(string, "cm")
  height_string := substring(string, 0, count(string) - 2)
  height_cm := to_number(height_string)
  150 <= height_cm
  height_cm <= 193
}

hgt_is_valid(string) = true {
  endswith(string, "in")
  height_string := substring(string, 0, count(string) - 2)
  height_in := to_number(height_string)
  59 <= height_in
  height_in <= 76
}

hcl_is_valid(string) = true {
  hcl_pattern := `\A#[0-9A-Za-z]{6}$`
  regex.match(hcl_pattern, string)
}

ecl_is_valid("amb") = true
ecl_is_valid("blu") = true
ecl_is_valid("brn") = true
ecl_is_valid("gry") = true
ecl_is_valid("grn") = true
ecl_is_valid("hzl") = true
ecl_is_valid("oth") = true

pid_is_valid(string) = true {
  pid_pattern := `\A[0-9]{9}$`
  regex.match(pid_pattern, string)
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
