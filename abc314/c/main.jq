split("\n")[0:-1] as $input |
$input[1] | split("") as $S |
$input[2] | split(" ") as $C |

# 色ごとに出現位置と文字列をマッピングする
$C | unique | map(
    . as $color |
    # 色の出現位置
    $C | indices($color) as $indices |
    # 色の出現位置に対応する文字列
    $indices | map($S[.]) as $chars |

    {
        key: $color,
        value: {
            indices: $indices,
            chars: ([$chars[-1]] + $chars[0:-1])
        }
    }
) | from_entries as $color_map |

# 文字列を生成する
[range(0; $S | length)] | map(
    . as $i |
    $C[$i] as $color |

    # 今の位置の色の出現位置を検索
    $color_map[$color].indices | index($i) as $index |

    # 右巡回シフトした文字を出力
    $color_map[$color].chars[$index]
) | join("")
