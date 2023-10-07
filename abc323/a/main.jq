split("\n")[0] | split("") as $input |
if [1, 3, 5, 7, 9, 11, 13, 15] | map($input[.] == "0") | all then
  "Yes"
else
  "No"
end
