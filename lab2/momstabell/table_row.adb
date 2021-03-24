with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Table_row(Pumoms, Moms, Pmmoms: in Float) is
   
begin
   
   -- Utskrifter av parametrar
   
   Put(Pumoms, Fore=>6, Aft=>2, Exp=>0);
   Put(Moms, Fore=>7, Aft=>2, Exp=>0);
   Put(Pmmoms, Fore=>7, Aft=>2, Exp=>0);
      
   New_Line;
   
end Table_Row;
