split("\n")[0] | split("") | map(tonumber) | reverse as $input |

def is_321_like_number(input):
  input | length as $len |
  if $len == 1 then true
  else [range(1;$len)] | all(input[. - 1] < input[.])
  end;

if is_321_like_number($input) then "Yes" else "No" end
