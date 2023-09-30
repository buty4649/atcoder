split("\n")[:-1] as $input |
$input[0] | split(" ")[1] | tonumber as $x |
$input[1] | split(" ") | map(tonumber) as $a |

def calc: . | sort[1:-1] | add;

[range(0; 101)] | map(select($a + [.] | calc >= $x)) | min // -1
