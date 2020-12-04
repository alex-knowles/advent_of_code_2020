package advent_of_code.day_03

solution := 0

map := []

encounters_for_slope(map, slope) = encounters {
  positions := positions_for_slope(map, slope)

  encounters := {encounter |
    position := positions[i]
    x := position.x % count(map[0])
    y := position.y

    encounter := {
      "position": position_new(x, y),
      "tree": map[y][x] == 1
    }
  }
}

positions_for_slope(map, slope) = positions {
  # precompute y_values
  possible_y_values := numbers.range(0, max_y(map))

  y_values := [y |
    y := possible_y_values[_]
    y % slope.y == 0
  ]

  indices := numbers.range(0, count(y_values) - 1)
  position_0 := position_new(0, 0)

  positions := {position |
    i := indices[_]
    x := i * slope.x + position_0.x
    y := i * slope.y + position_0.y
    position := position_new(x, y)
  }
}

max_y(map) = y { y := count(map) - 1 }

hit_at_position(map, {"x": x, "y": y}) = true {
  position := map[y][x]
  position == 1
}

get_next_position(map, position, slope) = next_position {
  next_x := position.x + slope.x
  next_y := position.y + slope.y
  next_position = position_new(next_x, next_y)
}

position_new(x, y) = position {
  position := {"x": x, "y": y}
}
