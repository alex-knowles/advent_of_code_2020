package advent_of_code.day_04

solution_p1 := 0

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
