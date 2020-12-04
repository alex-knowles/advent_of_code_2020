package advent_of_code.day_03

solution := 0

map := []

trees_for_slope(map, slope) {
  true
}

positions_for_slope(map, slope) = result {
  result := positions_for_slope_3(map, slope, [])
}

positions_for_slope_3(map, slope, []) = result {
  start_position := position_new(0, 0)
  result := positions_for_slope_3(map, slope, [start_position])
}

positions_for_slope_3(map, slope, positions) = result {
  last_position := positions[0]
  next_position := get_next_position(map, last_position, slope)
  next_position.y <= max_y(map)
  new_positions := array.concat([next_position], positions)
  result := positions_for_slope_3(map, slope, new_positions)
}

positions_for_slope_3(map, slope, positions) = result {
  last_position := positions[0]
  next_position := get_next_position(map, last_position, slope)
  next_position.y > max_y(map)
  result := positions
}

max_y(map) { count(map) }

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
