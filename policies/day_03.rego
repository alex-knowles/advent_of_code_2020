package advent_of_code.day_03

solution_p1 = tree_count {
  slope := input.slope
  tree_count := trees_hit_for_slope(parsed_map, slope)
}

solution_p2 = solution {
  slopes := input.slopes

  tree_counts := [tree_count |
    slope := slopes[_]
    tree_count := trees_hit_for_slope(parsed_map, slope)
  ]

  solution := product(tree_counts)
}

trees_hit_for_slope(map, slope) = tree_count {
  encounters := encounters_for_slope(map, slope)

  tree_encounters := {tree |
    encounter := encounters[_]
    encounter.tree == true
    tree := encounter
  }

  tree_count := count(tree_encounters)
}

parsed_map := parse_input_map(input.map)

parse_input_map(input_map) = map {
  input_rows := [input_row |
    input_row := split(input_map, "\n")[_]
    count(input_row) > 0
  ]

  map := [row | row := parse_row(input_rows[_])]
}

parse_row(input_row) = row {
  input_cols := split(input_row, "")
  row := [col | col := parse_col(input_cols[_])]
}

parse_col(".") = 0
parse_col("#") = 1

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

position_new(x, y) = position {
  position := {"x": x, "y": y}
}
