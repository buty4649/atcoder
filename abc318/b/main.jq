split("\n")[0:-1] as $input |
$input[0] as $n |
$input[1:] as $sheets |
100 as $width |

$sheets | map(
    split(" ") | map(tonumber) as $sheet |
    $sheet[0] as $a |
    $sheet[1] as $b |
    $sheet[2] as $c |
    $sheet[3] as $d |
)
