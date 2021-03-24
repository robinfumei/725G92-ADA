with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;
with Table_Row;

procedure Table(Fpris, Spris, Steg, Pmoms: in Float) is
   
   Dif, Stegcounter     : Float;
   Pumoms, Moms, Pmmoms : Float;
   
begin
   
   -- Tabellens utseende
   
   Put("=== Momstabell ===");
   New_Line;
   Put("Pris utan moms Moms Pris med moms");
   New_Line;
   
   -- Används för att bestämma hur många tabellrader som ska skrivas ut
   
   StegCounter := 0.0;
   Dif         := (Spris - Fpris);
   
   -- Loopar över
   
   loop
      
      -- Beräknar indata till underprogrammet som ska skriva ut raderna
      
      Pumoms := (Fpris + Stegcounter);
      Moms   := ((Pmoms / 100.0) * Pumoms);
      Pmmoms := (Moms + Fpris + Stegcounter);
      
      -- Skickar beräknade värden till underprogram
      
      Table_Row(Pumoms, Moms, Pmmoms);
      
      -- Räknaren ökar och kollar om vi är färdiga med loopen eller ej
      
      Stegcounter := Stegcounter + Steg;
      if (StegCounter > Dif) then
	 exit;
      end if;
   end loop;
end Table;
