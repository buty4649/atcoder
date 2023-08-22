split("\n") | map(select(. != "")) as $input |
$input[0] | tonumber as $N |

# 解説の別解を参考 https://atcoder.jp/contests/abc315/editorial/6995
[range(0;$N)] | map(
    [.] + ($input[.+1] | split(" ") | map(tonumber))
) as $items |
$items | max_by(.[2]) as $max |
$items | map(
    if .[0] == $max[0] then 0
    elif .[1] == $max[1] then .[2] / 2 + $max[2]
    else .[2] + $max[2]
    end
) | max
