with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure codeabbey97 is
    max_girls, pigs, girl_legs, pig_legs : Integer := 1;
    solution                             : Natural := 0;
    count, legs, breasts, girls          : Positive := 1;

    function is_solution (pigs : Integer; girls, legs, breasts : Positive ) return Boolean is
        girl_breasts : Positive := girls * 2;
        pig_breasts  : Integer := breasts - girl_breasts;
        all_breasts  : Integer := girl_breasts + pig_breasts;
        girl_legs    : Integer := girl_breasts;
        pic_legs     : Integer := pigs * 4;
        all_legs     : Integer := girl_legs + pic_legs;
    begin
        if pigs < 1 then
            return False;
        elsif all_legs - legs /= 0 then
            return False;
        elsif all_breasts - breasts /= 0 then
            return False;
        elsif pig_breasts mod pigs /= 0 then
            return False;
        elsif (pig_breasts / pigs) mod 2 /= 0 then
            return False;
        elsif pig_breasts < 2 then
            return False;
        else
            return True;
        end if;
    end is_solution;
    
begin
    Ada.Integer_Text_IO.Get(count);
    Ada.Text_IO.Skip_Line;
    for i in 1..count loop
        Ada.Integer_Text_IO.Get(legs);
        Ada.Integer_Text_IO.Get(breasts);
        Ada.Text_IO.Skip_Line;
        max_girls := legs / 2;
        solution := 0;
        for girls in 1..max_girls loop
            girl_legs := girls * 2;
            pigs := (legs - girl_legs) / 4;
            if is_solution(pigs, girls, legs, breasts) then
                solution := solution + 1;
            end if;
        end loop;
        Ada.Integer_Text_IO.Put(solution);
    end loop;
    Ada.Text_IO.Put_Line("");
end codeabbey97;
