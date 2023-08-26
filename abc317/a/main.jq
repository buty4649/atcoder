split("\n")[0:-1] as $input |
$input[0] | split(" ") | map(tonumber) as $nhx |
$nhx[1] as $h | $nhx[2] as $x |
$input[1] | split(" ") | map(tonumber) as $points |

($x - $h) as $t |
$points | keys | map(select($points[.] >= $t))[0] + 1
