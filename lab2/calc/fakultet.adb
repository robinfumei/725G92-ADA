with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Text_IO;            use Ada.Text_IO;

function Fakultet(N : in Integer) return Integer is
   
   Counter : Integer := 1;
   Result  : Integer := N;
   
begin
   
   if (N = 0) or (N = 1) then
      return 1;
   end if; 
   
   loop
      
      if Counter = (N-1) then
	exit;
	
      end if;
      
	Result := (Result * (N - Counter));
	Counter := Counter + 1;
	
	
   end loop;
	
	return Result;
	
 end Fakultet;
	
