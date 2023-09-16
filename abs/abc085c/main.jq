split("\n")[0] | split(" ") | map(tonumber) as $input |
$input[0]as $n |
$input[1]as $y |
if 10000 * $n == $y then
  [$n, 0, 0]
elif 5000 * $n == $y then
  [0, $n, 0]
elif 1000 * $n == $y then
  [0, 0, $n]
else
  [range(0;[$n, $y / 10000 | floor] | min + 1)] | map(
    . as $i |
    if ($y - 10000 * $i) / 5000 > $n + 1 - $i then
      []
    else
      [range(0;[9, $n - $i, ($y - 10000 * $i) / 5000 | floor] | min + 1)] | map(
        . as $j |
        ($n - $i - $j) as $k |
        [10000 * $i + 5000 * $j + 1000 * $k, $i, $j, $k]
      )
    end
  ) | flatten(1) | map(select(.[0] == $y)) | .[0][1:] // [-1, -1, -1]
end | map(tostring) | join(" ")
