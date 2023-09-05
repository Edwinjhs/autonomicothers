type
  fibNums = array of BigInteger;

const
  MAX_FIBS = 4000;

function createFibs(): fibNums;
begin
  setLength(result, MAX_FIBS);
  
  result[0] := 0;
  result[1] := 1;
  
  for var i := 2 to MAX_FIBS - 1 do
    result[i] := result[i - 1] + result[i - 2];
end;

begin
  var fibTable: fibNums := createFibs();
  var inp, out: text;
  
  assign(inp, 'input.txt');
  assign(out, 'output.txt');
  
  reset(inp);
  rewrite(out);
  
  var N, curentDiv: integer;
  
  read(inp, N);
  for var i := 0 to N - 1 do
  begin
    read(inp, curentDiv);
    
    for var j := 1 to MAX_FIBS - 1 do
      if fibTable[j] mod curentDiv = 0 then
      begin
        write(out, j, ' ');
        break;
      end;
  end;
  
  close(out);
end.
