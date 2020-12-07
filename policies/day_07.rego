package advent_of_code.day_07

import data.advent_of_code.day_07
import data.advent_of_code.input_data

solution_p1 = shiny_gold_container_count {
  containers := containers_for("shiny_gold")
  shiny_gold_container_count := count(containers)
}

containers_for(bag_color) = containers {
  bag_rules[bag_color]
  reachable := graph.reachable(bag_rules_graph_inverted, {bag_color})

  containers := {container |
    container := reachable[_]
    container != bag_color
  }
}

bag_rules = rules {
  bag_rules_input := input_data.day_07.bag_rules_input
  lines := split(bag_rules_input, "\n")

  rules := {color: requirements |
    line := lines[_]
    count(line) > 0
    [color, requirements] := parse_input_line(line)
  }
}

parse_input_line(input_line) = [color, requirements] {
  endswith(input_line, "contain no other bags.")

  requirements := []
  words := split(input_line, " ")
  color := color_from_words(words[0], words[1])
}

parse_input_line(input_line) = [color, requirements] {
  not endswith(input_line, "contain no other bags.")

  words := split(input_line, " ")
  color := color_from_words(words[0], words[1])

  requirements_input := regex.find_n(`[\d]+ [\w]+ [\w]+ bag[s]?`, input_line, -1)

  requirements := [requirement |
    input := requirements_input[_]
    words := split(input, " ")
    amount := to_number(words[0])
    color := color_from_words(words[1], words[2])
    requirement := requirement_new(color, amount)
  ]
}

color_from_words(word_1, word_2) = color {
  color := sprintf("%s_%s", [word_1, word_2])
}

requirement_new(color, amount) = requirement {
  requirement := {
    "color": color,
    "amount": amount
  }
}

bag_rules_graph[bag_color] = edges {
  bag_rules[bag_color]

  edges := {neighbor |
    bag_rules[neighbor]
    bag_rules[bag_color][_].color == neighbor
  }
}

bag_rules_graph_inverted[bag_color] = inverted_edges {
  bag_rules_graph[bag_color]

  inverted_edges := {neighbor |
    bag_rules_graph[neighbor][_] == bag_color
  }
}
