split("\n") | map(select(. != "")) as $input |
$input[0] | tonumber as $M |
$input[1] | split(" ") | map(tonumber) as $D |

def prefix_sum(input):
    [range(0; input | length + 1)] | map(
        input[0:.] | add // 0 # null to 0
    );
prefix_sum($D) as $sums |

# 関数にしておかないとcannot be subtracedになる
def middleday(a): (a[-1] + 1) /2;
middleday($sums) as $middleday |
[range(0;$sums | length)] | map(select($sums[.] >= $middleday))[0] |
[., $middleday - $sums[. - 1]] | map(tostring) | join(" ")
