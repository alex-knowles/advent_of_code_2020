package advent_of_code.tests.day_05

import data.advent_of_code.day_05
import data.advent_of_code.input_data

test_seat_id {
  code := "BFFFBBFRRR"
  day_05.seat_id_from_code(code) == 567
}

test_seat_id {
  code := "FFFBBBFRRR"
  day_05.seat_id_from_code(code) == 119
}

test_seat_id {
  code := "BBFFBBFRLL"
  day_05.seat_id_from_code(code) == 820
}

test_number_from_binary {
  day_05.number_from_binary("000") == 0
}

test_number_from_binary {
  day_05.number_from_binary("1") == 1
}

test_number_from_binary {
  day_05.number_from_binary("101") == 5
}

test_exp {
  day_05.exp(2, 7) == 128
}
