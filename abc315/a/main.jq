split("\n")[0] | split("") | to_entries | map(select(.value != "a" and .value != "e" and .value != "i" and .value != "o" and .value != "u")) | map(.value) | join("")
