{
$fpc -vw elverytr.pas
Free Pascal Compiler version 3.0.4+dfsg-23 [2019/11/25] for x86_64
Copyright (c) 1993-2017 by Florian Klaempfl and others
Target OS: Linux for x86-64
Compiling elverytr.pas
Linking elverytr
88
}
program elverytr;

uses Classes;

var vector: array[1..14] of string;
{Extracts the data from DATA.lst and returns it to a AnsiString}
function getData(): AnsiString;
function solution(index: integer; res: AnsiString): AnsiString;
var
  indata: TStringList;
begin
  indata := TStringList.Create;
  indata.LoadFromFile('DATA.lst');
  if index < indata.count then
    solution := solution(index + 1,res + indata[index] + ' ')
  else
  solution := res;
  indata.Free;
end;
begin
  getData := solution(0, '');
end;

{It receives a PChar and returns an array with its data}
procedure generateVector(index, countfill: integer; indata: AnsiString);
var text: AnsiString;
begin
  text := indata;
  if text[index] <> ' ' then
    vector[countfill] := vector[countfill] + text[index];
  if(index < length(text)) and (text[index]  <> ' ')
    then generateVector(index + 1, countfill, indata);
  if(index < length(text)) and (text[index] = ' ')
    then generateVector(index + 1, countfill + 1, indata);
end;

{converts data from string to longint}
function tolongint(indata: string):longint;
var
  outdata: longint;
begin
  val(indata, outdata);
  tolongint := outdata;
end;

{Calcs a number factorial}
function factorial(index,num,res:extended):extended;
begin
  if index <= num
    then factorial := factorial(index + 1,num , res * index)
    else factorial := res;
end;

{Calculate the combination of a pair of numbers}
function calc_combination(N,K:integer):double;
begin
  calc_combination := factorial(1,N,1)/(factorial(1,K,1)*factorial(1,N-K,1));
end;

procedure main(index: integer);
var N,K:integer;
begin
  N := tolongint(vector[index]);
  K := tolongint(vector[index + 1]);
  output(calc_combination(N,K):1:0, ' ');
  if index < length(vector) then
    main(index + 2);
end;

begin
  generateVector(0, 1, getData());
  main(2);
end.

{
  $ cat DATA.lst | ./elverytr
  3477216600 12565671261 35641470150 36227890512 59487568920 43595145594 64276915527
}
