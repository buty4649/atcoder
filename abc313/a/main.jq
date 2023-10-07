split("\n")[:-1] as $input |
$input[1] | split(" ") | map(tonumber) as $p |
$p[0] as $p1 |
$p[1:] | max as $pmax |
if $p1 > $pmax then
  0
else
  $pmax - $p1 + 1
end
