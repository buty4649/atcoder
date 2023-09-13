split("\n")[0] | tonumber as $input |
[range($input + 1)] | map(
  . as $i |
  [range(1;10)] | map([., $i * . % $input]) | map(select(.[1] == 0)) as $candidate |
  if $candidate | length == 0 then
    "-"
  else
    $candidate[0][0]
  end
) | join("")
