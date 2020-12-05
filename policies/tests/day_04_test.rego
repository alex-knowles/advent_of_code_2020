package advent_of_code.tests.day_04

import data.advent_of_code.day_04
import data.advent_of_code.input_data

batch_data := `
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
`

sample_input := {
  "batch_data": batch_data
}

passport := {
  "byr": "1937",
  "iyr": "2017",
  "eyr": "2020",
  "hgt": "183cm",
  "hcl": "#fffffd",
  "ecl": "gry",
  "pid": "860033327",
  "cid": "147"
}

test_passport_from_chunk {
  chunk := `ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm`

  expected_passport := passport
  day_04.passport_from_chunk(chunk) == expected_passport
}

test_passport_is_valid {
  valid_passport := passport
  day_04.passport_is_valid(valid_passport)
}

test_passport_is_invalid {
  invalid_passport := object.remove(passport, {"byr"})
  not day_04.passport_is_valid(invalid_passport)
}
