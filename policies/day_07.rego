package advent_of_code.day_07

import data.advent_of_code.day_07
import data.advent_of_code.input_data

containers_for(bag_color) = containers {
  bag_rules[bag_color]
  
  containers := {container |
    must_contain[container][_] == bag_color
  }
}

must_contain[bag_color] = must_contain {
  bag_rules[bag_color]

  reachable := graph.reachable(bag_rules_graph, {bag_color})

  must_contain := {containee |
    containee := reachable[_]
    containee != bag_color
  }
}

bag_rules = rules {
  rules := {}
}

bag_rules_graph[bag_color] = edges {
  bag_rules[bag_color]

  edges := {neighbor |
    bag_rules[neighbor]
    bag_rules[bag_color][_].color == neighbor
  }
}
