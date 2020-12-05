package advent_of_code.day_04

solution_p1 := 0

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
