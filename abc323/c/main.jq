split("\n")[:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $nm |
$input[1] | split(" ") | map(tonumber) as $scores |
[range(0; $nm[0])] | map(
  . as $i |
  $input[2 + $i] | split("") | map(. == "o") as $answers |
  [
    [range(0; $nm[1])] | map(if $answers[.] then $scores[.] else 0 end) | add + $i + 1,
    $answers
  ]
) as $answers |
$answers | map(.[0]) | max as $max_score |
$answers | map(
  .[0] as $score | .[1] as $answers |
  [range(0; $nm[1])] | map(if $answers[.] then 0 else $scores[.] end) | map(select(. > 0)) | sort | reverse as $p |
  [range(0; $p | length + 1)] | map(if . == 0 then 0 else $p[0:.] | add end) |
  map(select($score + . < $max_score)) | length
) | join("\n")
