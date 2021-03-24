package body Date_F_Handling is
   
   procedure Get_Date(Date: out Date_Type) is
   C: Character;   
   begin      
	 Get(Date(1));
	 if Date(1) < 0 or Date(1) > 9999 then
	    raise Year_Error;
	 end if;
	 Get(C);
	 Get(Date(2));
	 if Date(2) < 1 or Date(2) > 12 then
	    raise Month_Error;
	 end if;
	 Get(C);
	 Get(Date(3));
	 case Date(2) is
	    when 02 => 
	       if Date(3) < 1 or Date(3) > 28 then
		  raise Day_Error;
	       end if;
	    when 01|03|05|07|08|10|12 =>
	       if Date(3) < 1 or Date(3) > 31 then
		  raise Day_Error;
	       end if;
	    when 04|06|09|11 =>
	       if Date(3) < 1 or Date(3) > 30 then
		  raise Day_Error;
	       end if;
	    when others => raise Constraint_Error;
	 end case;
   end Get_Date;

   procedure Put_Date(Date: in Date_Type) is
   begin
      Put(Date(1), 0);
      Put('-');
      if Date(2) < 10 then
	 Put(0, 0);
      end if;
      Put(Date(2), 0);
      Put('-');
      if Date(3) < 10 then
	 Put(0, 0);
      end if;
      Put(Date(3), 0);
   end Put_Date;
   
   function Prev_Date(Date: in Date_Type) return Date_Type is
      Prev : Date_Type := Date;   
   begin
      Prev(3) := Date(3) - 1;
      case Prev(2) is
	 when 01 =>
	    if Prev(3) = 00 then
	       Prev(1) := Prev(1) - 1;
	       Prev(2) := 12;
	       Prev(3) := 31;
	    end if;
	 when 03 => 
	    if Prev(3) = 00 then
	       Prev(2) := Prev(2) - 1;
	       Prev(3) := 28;
	    end if;
	 when 02|04|06|08|09|11 => 
	    if Prev(3) = 00 then
	       Prev(2) := Prev(2) - 1;
	       Prev(3) := 31;
	    end if;
	 when 05|07|10|12 => 
	    if Prev(3) = 00 then
	       Prev(2) := Prev(2) -1;
	       Prev(3) := 30;
	    end if;
	 when others => 
	    Put("Error");
      end case;
      
      return Prev;	    
   end Prev_Date;
   
   function Next_Date(Date: in Date_Type) return Date_Type is
      Next: Date_Type := Date;
   begin
      Next(3) := Next(3) + 1;
      
      case Next(2) is
	 when 12 => 
	    if Next(3) = 32 then
	       Next(1) := Next(1) + 1;
	       Next(2) := 01;
	       Next(3) := 01;
	    end if;
	 when 02 => 
	    if Next(3) = 29 then
	       Next(2) := Next(2) + 1;
	       Next(3) := 01;
	    end if;
	 when 04|06|09|11 => 
	    if Next(3) = 31 then
	       Next(2) := Next(2) + 1;
	       Next(3) := 01;
	    end if;
	 when 01|03|05|07|08|10 =>
	    if Next(3) = 32 then
	       Next(2) := Next(2) + 1;
	       Next(3) := 01;
	    end if;
	 when others =>
	    Put("Error");
      end case;
      
      return Next;
   end Next_Date;
   
   function "<" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1(1) < D2(1) then
	 return True;
      elsif D1(1) = D2(1) and D1(2) < D2(2) then
	 return True;
      elsif D1(1) = D2(1) and D1(2) = D2(2) and D1(3) < D2(3) then
	 return True;
      else
	 return False;
      end if;
   end "<";
   
   function ">" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1(1) > D2(1) then
	 return True;
      elsif D1(1) = D2(1) and D1(2) > D2(2) then
	 return True;
      elsif D1(1) = D2(1) and D1(2) = D2(2) and D1(3) > D2(3) then
	 return True;
      else
	 return False;
      end if;
   end ">";
   
   function "=" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1(1) = D2(1) and D1(2) = D2(2) and D1(3) = D2(3) then
	 return True;
      else
	 return False;
      end if;
   end "=";
   
end Date_F_Handling;
