split("\n")[:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $npq |
$input[1] | split(" ") | map(tonumber) | min as $d |
[
  $npq[1],
  $npq[2]+$d
] | min
