program ideone;

var
    a,b,c:array [1..100] of integer;
    i,n: integer;
begin
    readln(n);
    for i:= 1 to n do
        read(a[i],b[i],c[i]);
    for i:= 1 to n do
    begin
        if (a[i]>b[i]+c[i]) or (b[i]>a[i]+c[i]) or (c[i]>a[i]+b[i]) then
            write(0,' ')
        else
            write(1,' ');
    end
end.
    

    
