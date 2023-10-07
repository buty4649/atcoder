split("\n")[:-1] as $input |
$input[0] | tonumber as $n |
$input[1:] | map(indices("o") | length) as $scores |
[range(0; $n)] | map([. + 1, $scores[.]]) | group_by(.[1]) |
map([.[][0]] | reverse) | flatten | reverse | join(" ")
