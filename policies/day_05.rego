package advent_of_code.day_05

import data.advent_of_code.day_05
import data.advent_of_code.input_data

solution_p1 := highest_seat_id {
  raw_data := input_data.day_05.boarding_pass_codes
  boarding_pass_codes := split(raw_data, "\n")

  codes := [code |
    code := boarding_pass_codes[_]
    count(code) > 0
  ]

  seat_ids := [seat_id |
    seat_id := seat_id_from_code(codes[_])
  ]

  highest_seat_id := max(seat_ids)
}

seat_id_from_code(code) = seat_id {
  {"row": row, "col": col} := boarding_pass_from_code(code)
  seat_id := 8 * row + col
}

boarding_pass_from_code(code) = boarding_pass {
  row_code := substring(code, 0, 7)
  row := row_from_code(row_code)

  col_code := substring(code, 7, 3)
  col := col_from_code(col_code)

  boarding_pass := {
    "row": row,
    "col": col
  }
}

row_from_code(code) = row {
  binary_code := strings.replace_n({"F": "0", "B": "1"}, code)
  row := number_from_binary(binary_code)
}

col_from_code(code) = col {
  binary_code := strings.replace_n({"L": "0", "R": "1"}, code)
  col := number_from_binary(binary_code)
}

number_from_binary(binary_code) = number {
  binary_array := split(binary_code, "")
  length := count(binary_code)

  addends := [addend |
    one_or_zero := to_number(binary_array[i])
    exponent := length - i - 1
    addend := one_or_zero * exp(2, exponent)
  ]

  number := sum(addends)
}

exp(base, 0) = result {
  result := 1
}

exp(base, exponent) = result {
  exponent > 0
  indices = numbers.range(1, exponent)

  factors := [factor |
    indices[_]
    factor := base
  ]

  result := product(factors)
}
