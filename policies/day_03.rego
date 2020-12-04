package advent_of_code.day_03

solution := 0

map := []

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
