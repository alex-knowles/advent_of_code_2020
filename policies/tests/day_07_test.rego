package advent_of_code.tests.day_07

import data.advent_of_code.day_07
import data.advent_of_code.input_data

bag_rules_input :=`
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
`

bag_rules := {
  "light_red": [
      {
          "color": "bright_white",
          "amount": 1
      },
      {
          "color": "muted_yellow",
          "amount": 2
      }
  ],
  "dark_orange": [
      {
          "color": "bright_white",
          "amount": 3
      },
      {
          "color": "muted_yellow",
          "amount": 4
      }
  ],
  "bright_white": [
      {
          "amount": 1,
          "color": "shiny_gold"
      }
  ],
  "muted_yellow": [
      {
          "amount": 2,
          "color": "shiny_gold"
      },
      {
          "amount": 9,
          "color": "faded_blue"
      }
  ],
  "shiny_gold": [
      {
          "amount": 1,
          "color": "dark_olive"
      },
      {
          "amount": 2,
          "color": "vibrant_plum"
      }
  ],
  "faded_blue": [],
  "dotted_black": [],
  "vibrant_plum": [
      {
          "color": "faded_blue",
          "amount": 5
      },
      {
          "color": "dotted_black",
          "amount": 6
      }
  ],
  "dark_olive": [
      {
          "color": "faded_blue",
          "amount": 3
      },
      {
          "color": "dotted_black",
          "amount": 4
      }
  ]
}

test_solution_p1 {
  day_07.solution_p1 == 4 with input_data.day_07.bag_rules_input as bag_rules_input
}

test_containers_for_shiny_gold {
  expected_bag_colors := {
    "dark_orange",
    "bright_white",
    "light_red",
    "muted_yellow"
  }

  day_07.containers_for("shiny_gold") == expected_bag_colors with day_07.bag_rules as bag_rules
}

test_bag_rules {
  day_07.bag_rules == bag_rules with input_data.day_07.bag_rules_input as bag_rules_input
}
