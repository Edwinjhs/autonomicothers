--  gprbuild jusanchezme.adb
--  gnatprove -P\\wsl$\Ubuntu-20.04\home\juan\codeabbey\184\jusanchezme.gpr
--  -j0 --output=oneline --ide-progress-bar -u jusanchezme.adb --level=4
--  Phase 1 of 2: generation of Global contracts ...
--  Phase 2 of 2: flow analysis and proof ...
--  Summary logged in \\wsl$\Ubuntu-20.04\home\juan\codeabbey\184\gnatprove\
--  gnatprove.out [2022-09-08 17:36:25] process terminated successfully,
--  elapsed time: 25.10s


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure jusanchezme with
   SPARK_Mode => ON
is
   subtype Matches_Range is Integer range 1 .. 999;

   subtype Pick_Range is Integer range 0 .. 98;

   subtype Integer_Range is Integer range -((2 ** 7) - 1) .. +((2 ** 7) - 1);

   subtype T_Range is Integer range 1 .. +((2 ** 31) - 1);

   T : Integer;

   procedure ReadIn (T : Integer);

   function DecreaseInt (T : in Integer) return Integer with
      Pre  => T > (Positive'First),
      Post => DecreaseInt'Result = T - 1;

   function DecreaseInt (T : in Integer) return Integer is
   begin
      return T - 1;
   end DecreaseInt;

   procedure PrintResult (Data : Integer);

   procedure PrintResult (Data : Integer) is
      Result : constant String :=
         Ada.Strings.Fixed.Trim (Integer'Image (Data), Ada.Strings.Left);
   begin
      Put (Item => Result);
   end PrintResult;

   function PickMatches (Matches : Matches_Range;
      Picks : Pick_Range; Game : Character) return Integer;

   function PickMatches (Matches : Matches_Range;
      Picks : Pick_Range; Game : Character) return Integer
   is
      Modulus : Integer := (Matches mod (Picks + 1));
   begin
      if Game = 'n' then
         return Modulus;
      elsif Modulus = 0 then
         return Picks;
      else
         return Modulus - 1;
      end if;
   end PickMatches;

   procedure ReadIn (T : Integer) is
      NewT, M, K : Integer;
      Matches : Matches_Range;
      Picks : Pick_Range;
      N : Character;
      isMinRange, isKinRange : Boolean;
      WhiteSpace : Character;
   begin
      Get (M);
      Get (K);
      Get_Immediate (WhiteSpace);
      Get_Immediate (N);
      isMinRange := M in Matches_Range;
      isKinRange := K in Pick_Range;
      if isMinRange and isKinRange then
         Matches := M;
         Picks := K;
         PrintResult (PickMatches (Matches, Picks, N));
      end if;
      if T in Integer_Range and T > 1 then
         Put (WhiteSpace);
         NewT := DecreaseInt (T);
         ReadIn (NewT);
      end if;
   end ReadIn;

   procedure main;

   procedure main is
   begin
      Get (T);
      if T in T_Range then
         if T > 0 then
            ReadIn (T);
         end if;
      end if;
   end main;
begin
   main;
end jusanchezme;

--  cat DATA.lst | ./jusanchezme
--  7 1 0 2 6 2 4 8 2 2 2 3 6 1 3 1 4 0 1 8 14 4 5 2 16 8 3
