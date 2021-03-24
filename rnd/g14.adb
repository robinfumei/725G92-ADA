with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings;

procedure G14 is
   
   N : String(1..4); 
   Rep_num : Integer := 4; --Gör en loop som tar in karaktärer för en sträng och räknar upp antalet då
   
begin
   Put("Mata in N: ");
   Get(N);
   
   for I in reverse 1..4 loop 
      --Put(I);
      if N(I) /= '0' then
	 if I = Rep_num then
	    N(I) := '0';
	    Rep_num := Rep_num - 1;
--	 else 
--	    if I > 1 then
	  --     N(I+1) := N(I);
--	    end if;
	 end if;
      end if;
   end loop;
   
   Put(N);
   
	 
	 
   
   Put(N);
end G14;
