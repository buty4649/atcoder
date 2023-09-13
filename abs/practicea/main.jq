split("\n")[0:-1] as $input |
$input[0] | tonumber as $a |
$input[1] | split(" ") | map(tonumber) as $bc |
$input[2] as $c |
"\($a + ($bc | add)) \($c)"
