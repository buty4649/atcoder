split("\n")[0:-1] as $input |
$input[0] | tonumber as $N |
$input[-1] | tonumber as $X |

[range(1; $N*2+1) | select(. % 2 == 0)] |
map([
    . / 2,
    (
        $input[.] | split(" ") | map(tonumber) as $row |
        if $row | any(. == $X) then$row | length
        else 999
        end
    )
]) as $items |
$items | min_by(.[1]) | .[1] as $min |
if $min == 999 then "0\n"
else
    $items | map(select(.[1] == $min)) |
    [
        (. | length | tostring),
        (map(.[0] | tostring) | join(" "))
    ] | join("\n")
end
