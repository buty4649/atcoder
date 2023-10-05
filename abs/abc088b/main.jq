split("\n")[0:-1] as $input |
$input[0] | tonumber as $n |

$input[1] | split(" ") | map(tonumber) | sort | reverse as $a |
[range(0;$n;2)] | map($a[.] - ($a[. + 1] // 0)) | add
