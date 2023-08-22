split("\n") | map(select(. != "")) as $input |
$input[0] | tonumber as $N |
$input[1:] | map(split(" ") | map(tonumber)) as $FS |

# フレーバーごとに点数を集める
def group_by_flavors: group_by(.[0]) | map([.[][1]] | sort | reverse);
$FS | group_by_flavors as $flavors |

# 同じフレーバーで組み合わせたときの最大点数
$flavors | map(select(length > 1) | .[0] + .[1] / 2) | max as $same_score |

# 別のフレーバーで組み合わせたときの最大点数
$flavors | map(max) | sort | .[-2:] | add as $diff_score |

[$same_score, $diff_score] | max
