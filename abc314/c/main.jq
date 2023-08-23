split("\n")[0:-1] as $input |
$input[1] | split("") as $S |
$input[2] | split(" ") | map(tonumber) as $C |

# 色ごとに出現位置と文字列をマッピングする
$C | unique | map(
    . as $color |
    # 色の出現位置
    $C | indices($color) as $indices |
    # 色の出現位置に対応する文字列
    $indices | map($S[.]) as $chars |

    # 出現位置と対応文字列を配列にする
    # 対応文字列は右巡回シフトする
    [range(0; $indices | length)] | map(
        . as $i |
        $chars | length as $len |
        [
            $indices[$i],
            $chars[($i - 1 + $len) % $len]
        ]
    ) | .[]
) |

# 出現位置でソート
sort_by(.[0]) |

# 文字列を結合
map(.[1]) | join("")
