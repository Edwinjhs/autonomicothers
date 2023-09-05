
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure dmquinter
  with SPARK_Mode => ON
is

   function FibonacciDivision (Num : Positive; A : Integer; B : Integer) return Integer;
   function FibonacciDivision (Num : Positive; A : Integer; B : Integer) return Integer is
   begin
      pragma Assume (Num < 10000000);
      pragma Assume (A < Integer'Last - 1);
      if (A + B) mod Num = 0 then
         return 2;
      else
         return 1 + FibonacciDivision (Num, B, (A + B) mod Num);
      end if;
   end FibonacciDivision;

   procedure CalculateLoops (Quantity : in Integer;
                        Results : in out Unbounded_String) with
      Pre => (Quantity >= 1 and Quantity <= 500)
               and then Length (Results) < Integer'Last - 30 * Quantity;
   procedure calculateLoops (Quantity : in Integer;
                        Results : in out Unbounded_String) is
      Number, Res : Integer;
   begin
      Get (Number);
      pragma Assume (Number > 0);
      Res := FibonacciDivision (Number, 0, 1);
      if Quantity = 1 then
         Results := Results & Integer'Image (Res);
         pragma Assert (Length (Results) < Integer'Last - 30 * (Quantity - 1));
      else
         Results := Results & Integer'Image (Res);
         pragma Assert (Length (Results) < Integer'Last - 30 * (Quantity - 1));
         calculateLoops (Quantity - 1, Results);
      end if;
   end CalculateLoops;

   procedure Main;
   procedure Main is
      Quantity : Integer;
      Results : Unbounded_String := To_Unbounded_String ("");
   begin
      Get (Quantity);
      Skip_Line;
      pragma Assume (Quantity > 0);
      pragma Assume (Quantity < 500);
      calculateLoops (Quantity, Results);
      Trim (Results, Left);
      Put_Line (To_String (Results));
   end Main;

begin
   Main;
end dmquinter;
