if split("\n")[1]|test("^(?<a>\\d+)( \\k<a>)+$") then "Yes" else "No" end
