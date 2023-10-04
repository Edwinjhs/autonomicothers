let listToString = (~sep=" ", elements: list(string)): string =>
  String.concat(sep, elements);

let rec readData = (~result=[], limit: int): list(string) =>
  switch (limit) {
  | 0 => result
  | _ => readData(~result=result @ [read_line()], limit - 1)
  };

let readWords = (_: int): option(string) =>
  try(Some(input_line(stdin))) {
  | End_of_file => None
  };

let readDictionary = (count: int): list(string) =>
  Stream.from(readWords) |> Stream.npeek(count);

let wordPermutation = (word: string): string =>
  String.to_seq(word)
  |> List.of_seq
  |> List.sort(Stdlib.compare)
  |> List.map(c => String.make(1, c))
  |> listToString(~sep="");

let countAnagramsOf = (word: string, dictionary: list(string)): int =>
  List.filter(w => w == word, dictionary) |> List.length;

let countAnagrams = (data: list(string)): list(int) => {
  let dictionary = readDictionary(Int.max_int) |> List.map(wordPermutation);
  List.map(
    word => countAnagramsOf(wordPermutation(word), dictionary) - 1,
    data,
  );
};

let main = () =>
  read_int()
  |> readData
  |> countAnagrams
  |> List.map(string_of_int)
  |> listToString
  |> print_endline;

main();
