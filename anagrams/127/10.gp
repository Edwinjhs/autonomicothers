read("/archiv/prg/prg/pari/include/_all00.gp")

default(parisize,1024M);
\\default(parisize,8000M);
default(primelimit,4294965247);
\\default(primelimit,18446744073709549567);

\\p 100
global(ldic4 = Map());

a(s) = {
   return(mapget(ldic4,strsort(Str(s))));
}

data = {"players
recants
reward
crapes
artiste
carpels
grenade
parties";}

ldic1 = file2list("data.txt");
ldic2 = vector(#ldic1);
for(i=1,#ldic1,ldic2[i]=strsort(ldic1[i]));
ldic3 = vecsort(ldic2);
s = ldic3[1]
z = 0;
for(i=2,#ldic3,{
   if(s==ldic3[i],
      z++
   ,
      mapput(ldic4,s,z);
      s=ldic3[i];
      z = 0;
   );
});

inp = codeabbey_list(data);
print();

for(i=1,#inp,{
   print1(a(inp[i][1])," ")
});
print();
print();
quit;
