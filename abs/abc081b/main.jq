split("\n")[0:-1] as $input |
$input[0] as $n |
$input[1] | split(" ") | map(tonumber) |
[while(. | map(select(. % 2 == 1)) | length == 0; map(. / 2))] | length
