split("\n")[0:-1] as $input |
$input[1] | split(" ") | map(tonumber) as $numbers |

# 等差数列の和 - 実際の和
(($numbers | max) + ($numbers | min)) * ($numbers | length + 1) / 2 - ($numbers | add)
