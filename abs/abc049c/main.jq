split("\n")[0] as $s |

if $s | test("^(dream(er)?|erase(r)?)+$")
then "YES"
else "NO"
end
