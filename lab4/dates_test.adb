with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Date_F_Handling; use Date_F_Handling;

procedure Dates_Test is
   
   Date1, Date2, Date_New: Date_Type;
   Count: Integer := 1;
   
begin
   loop
      begin
	 Put("Mata in dagens datum: ");
	 Get_Date(Date1);
	 Put("Mata in ett annat datum: ");
	 Get_Date(Date2);
	 
	 if Date1 = Date2 then
	    Put("Datumen är lika!");
	    exit;
	 end if;
	 
	 if Date1 < Date2 then
	    Date_New := Date2;
	    
	    loop
	       Date_New := Prev_Date(Date_New);
	       if Date_New = Date1 then
		  exit;
	       end if;
	       Count := Count+1;
	    end loop;
	    
	    Put("Det andra datumet är ");
	    Put(Count, 0);
	    Put(" dagar efter det första.");
	 end if;
	 
	 if Date1 > Date2 then
	    Date_New := Date2;
	    
	    loop
	       Date_New := Next_Date(Date_New);
	       if Date_New = Date1 then
		  exit;
	       end if;
	       Count := Count+1;
	    end loop;
	    
	    Put("Det andra datumet är ");
	    Put(Count, 0);
	    Put(" dagar innan det första.");
	 end if;
	    
	 exit;
	 
      exception
	 when Year_Error => 
	    Put_Line("Fel! Skriv in årtalet med 4 siffror, mellan 0 och 9999!");
	    Skip_Line;
	 when Month_Error =>
	    Put_Line("Fel! Skriv in månaden med 2 siffror, mellan 1 och 12!");
	    Skip_Line;
	 when Day_Error =>
	    Put_Line("Fel! Skriv in korrekt antal dagar för den månad du angett!");
	    Skip_Line;
      end;
   end loop;
end Dates_Test;
