jq -n -f matches.jq 

def find_winner_k($quantity_of_matches; $maximum_k; $mode):
  if $mode == "n" then
    ($quantity_of_matches % ($maximum_k + 1))
  else
    if ($quantity_of_matches % ($maximum_k + 1)) == 0 then $maximum_k
    else ($quantity_of_matches % ($maximum_k + 1) - 1)
    end
  end;

def main:
  .[1:]
  | split("\n")
  | .[1:]
  | map(split(" "))
  | map({
    "quantity_of_matches": .[0] | tonumber,
    "maximum_k": .[1] | tonumber,
    "mode": .[2]
  })
  | map({
    "quantity_of_matches": .quantity_of_matches,
    "maximum_k": .maximum_k,
    "mode": .mode,
    "winner": find_winner_k(.quantity_of_matches; .maximum_k; .mode)
  })
  | map("\(.winner)")
  | join(" ");

main
