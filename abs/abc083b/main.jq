split("\n")[0:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $nab |
$nab[0] as $n | $nab[1] as $a | $nab[2] as $b |

[range(1;$n + 1)] | map(
  . as $i |
  $i | tostring | split("") | map(tonumber) | add as $sum |
  if $sum >= $a and $sum <= $b then $i
  else 0 end
) | add
