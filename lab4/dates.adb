with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Date_Handling; use Date_Handling;

procedure Dates is     
      
   Date1: Date_Type;
   Date2: Date_Type;
   
begin
   loop
      begin
	 Put("Ange ett datum (på formen ÅÅÅÅ-MM-DD): ");
	 Get_Date(Date1);
	 Put("Ditt datum: ");
	 Put_Date(Date1);
   
	 New_Line(2);
   
	 Put("Föregående datum är: ");
	 Put_Date(Prev_Date(Date1));
	 New_Line;
	 Put("Nästa datum är: ");
	 Put_Date(Next_Date(Date1));
   
	 New_Line(2);
   
	 Put("Ange ett till datum: ");
	 Get_Date(Date2);
	 New_Line;
   
	 if Date1 > Date2 then
	    Put("Ditt första datum är störst!");
	 elsif Date1 < Date2 then
	    Put("Ditt andra datum är minst!");
	 elsif Date1 = Date2 then
	    Put("Dina datum är exakt samma!");
	 end if;
	 
	 exit;   
	 
      exception
	 when Year_Error => 
	    Put_Line("Fel! Skriv in årtalet med 4 siffror, mellan 0 och 9999!");
	 when Month_Error =>
	    Put_Line("Fel! Skriv in månaden med 2 siffror, mellan 1 och 12!");
	 when Day_Error =>
	    Put_Line("Fel! Skriv in korrekt antal dagar för den månad du angett!");
      end;
   end loop;
end Dates;
