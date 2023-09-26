split("\n")[0] | split("") as $s |

def palindrome(s):
  s | length as $len |
  if $len < 2 then false
  else [range(0;$len / 2 | floor)] | map(s[.] == s[-1 - .]) | all end;

[range(0;$s | length-1)] | map(
  . as $start | $s[$start:] as $s2 |
  [range(2;$s2 | length + 1)] | map (
    . as $j |
    $s2[0:$j] as $s3 |
    if palindrome($s3) then $s3 | length else 1 end
  ) | max
) | max
