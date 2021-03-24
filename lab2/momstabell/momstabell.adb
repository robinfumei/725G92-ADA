with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;      use Ada.Float_Text_IO;
with Read_Data;
with Table;

procedure Momstabell is
   
   -- Första pris, sista pris, steg och moms i procent
   
   Fpris, Spris, Steg, Pmoms : Float;
   
begin
   
   -- Ledtext, och anrop till underprogram som läser in data från användare
   
   
   Read_Data("Första pris: ", Fpris, "Första pris måste vara positivt, försök igen: ", 0.0, 0.0);
   
   Read_Data("Sista pris: ", Spris, "Sista pris måste vara större än första pris", Fpris, 0.0);
   
   Read_Data("Steg: ", Steg, "Steg måste vara positivt och mindre än sista minus första pris: ", 0.0, (Spris - Fpris));
   
   Read_Data("Momsprocent: ", Pmoms, "Moms måste vara mellan 0 och 100", 0.0, 100.0);
   
   Table(Fpris, Spris, Steg, Pmoms);
   
end Momstabell;
