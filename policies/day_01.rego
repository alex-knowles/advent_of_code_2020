package advent_of_code.day_01

import input.expenses

sum_to(sum) = {x, y, z} {
  x := expenses[_]
  y := expenses[_]
  z := expenses[_]
  x + y + z == sum
}

sum_to_2020 = set {set := sum_to(2020)}

solution = solution {
  solution := product(sum_to_2020)
}
