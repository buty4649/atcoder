split("\n")[:-1] as $input |
$input[0] | split(" ")[0] | tonumber as $n |

# Bをuniqすると弱い人一覧がでる
$input[1:] | map(split(" ") | map(tonumber)[1]) | sort | unique as $looser |
[range(1; $n+1)] | map(select(
  . as $i | $looser | contains([$i]) | not
)) as $winner |

if $winner | length == 1 then
  $winner[0]
else
  -1
end
