split("\n")[0:-1] as $input |
$input[0] | tonumber as $n |
$input[1:] | map(split(" ") | map(tonumber)) as $records |

def abs(x): [x, -x] | max;
def delta_t(i): $records[i][0] - if i == 0 then 0 else $records[i-1][0] end;
def delta_x(i): $records[i][1] - if i == 0 then 0 else $records[i-1][1] end;
def delta_y(i): $records[i][2] - if i == 0 then 0 else $records[i-1][2] end;

def resolv:
  [range(0;$n)] | map(
    delta_t(.) - (abs(delta_x(.)) + abs(delta_y(.)))
  ) | all(. >=0 and . % 2 == 0);

if resolv then "Yes" else "No" end
