split("\n")[0:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $ndp |
$ndp[0] as $n | $ndp[1] as $d | $ndp[2] as $p |
$input[1] | split(" ") | map(tonumber) | sort | reverse as $f |

# dの数で$fをまとめる
[foreach range(0; $n / $d | ceil) as $i (
  [];
  [
    $f[$i * $d:($i + 1) * $d] | add,
    $p
  ] | min;
  .
)] | add
