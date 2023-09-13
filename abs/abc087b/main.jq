split("\n")[0:-1] as $input |
$input[0] | tonumber as $a |
$input[1] | tonumber as $b |
$input[2] | tonumber as $c |
$input[3] | tonumber as $x |

[range(0;($a+1))] | map(
  . as $i |
  [range(0;($b+1))] | map(
    . as $j |
    [range(0;($c+1))] | map(
      . as $k |
      $i * 500 + $j * 100 + $k * 50
    )
  )
) | flatten | map(select(. == $x)) | length
