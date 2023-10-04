split("\n")[:-1] as $input |
$input[1] as $s | $input[2] as $t |

if ($t | startswith($s)) and ($t | endswith($s)) then 0
elif $t | startswith($s) then 1
elif $t | endswith($s) then 2
else 3 end
