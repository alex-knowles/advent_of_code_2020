## Description

I have been playing around with Prolog and Rego lately, so I'm going to try doing [Advent of Code](https://adventofcode.com/2020) in Open Policy Agent.

It's kind of unconventional, but I think it will be fun!


## How to run

With Docker installed, you can run an Open Policy Agent server with:

```
docker run \
  -p 20201:8181 \
  -v $OPA_AOC_HOME:/policies \
  openpolicyagent/opa:0.23.2 run --server --log-level debug /policies
```

Here's an example cURL command for querying the result for Day 01:

```json
curl --location --request POST 'http://localhost:20201/v1/data/advent_of_code/day_01' \
--header 'Content-Type: application/json' \
--data-raw '{
  "input": {
    "expenses": [
        1721,
        979,
        366,
        299,
        675,
        1456
    ]
  }
}'
```

The `data-raw` argument can be substituted for a `request.json` document found in the `/data` directory.

## Convert puzzle input to JSON input

The puzzle for Day 2 included 1000 lines of input data. I used some Elixir to massage the data into a JSON blob that I could POST to OPA:

```elixir
data = """
<paste raw puzzle data into this heredoc>
"""

lines = String.split(data, "\n", trim: true)
output = Poison.encode_to_iodata!(lines, pretty: true)
{:ok, file} = File.open("input.json", [:write])
IO.binwrite(file, output)
File.close(file)
```
