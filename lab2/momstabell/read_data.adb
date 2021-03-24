with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Read_Data(Text: in String; X: out Float; Fel: in String; Under, Over: in Float) is
   
   
begin
   
   -- Läser in data från användare 
   
   Put(Text);
   Get(X);
   
   if (Text = "Steg: ") or (Text = "Momsprocent: ") then
      
      while (Over < X or X < Under) loop
      Put(Fel);
      New_Line;
      Put(Text);
      Get(X);
      end loop;
      
   elsif (Text = "Första pris: ") or (Text = "Sista pris: ") then
	 
      while (X <= Under) loop
	 
	 Put(Fel);
	 New_Line;
	 Put(Text);
	 Get(X);
      
      end loop;
      
   end if;
     
   
   
end Read_Data;
