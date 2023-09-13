split("\n")[0:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $ab |
if ($ab[0] * $ab[1]) % 2 == 0 then
  "Even"
else
  "Odd"
end
