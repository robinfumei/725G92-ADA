package body Date_Handling is
   
   procedure Get_Date(Date: out Date_Type) is
   C: Character;   
   begin      
      Get(Date.Y);
      if Date.Y < 0 or Date.Y > 9999 then
	 raise Year_Error;
      end if;
      Get(C);
      Get(Date.M);
      if Date.M < 0 or Date.M > 12 then
	 raise Month_Error;
      end if;
      Get(C);
      Get(Date.D);
      case Date.M is
	 when 02 => 
	   if Date.D < 0 or Date.D > 28 then
	      raise Day_Error;
	   end if;
	 when 01|03|05|07|08|10|12 =>
	    if Date.D < 0 or Date.D > 31 then
	       raise Day_Error;
	    end if;
	 when 04|06|09|11 =>
	    if Date.D < 0 or Date.D > 30 then
	       raise Day_Error;
	    end if;
	 when others => Put("Error");
      end case;
   end Get_Date;

   procedure Put_Date(Date: in Date_Type) is
   begin
      Put(Date.Y, 0);
      Put('-');
      if Date.M < 10 then
	 Put(0, 0);
      end if;
      Put(Date.M, 0);
      Put('-');
      if Date.D < 10 then
	 Put(0, 0);
      end if;
      Put(Date.D, 0);
   end Put_Date;
   
   function Prev_Date(Date: in Date_Type) return Date_Type is
      Prev : Date_Type := Date;   
   begin
      Prev.D := Date.D - 1;
      case Prev.M is
	 when 01 =>
	    if Prev.D = 00 then
	       Prev.Y := Prev.Y - 1;
	       Prev.M := 12;
	       Prev.D := 31;
	    end if;
	 when 03 => 
	    if Prev.D = 00 then
	       Prev.M := Prev.M - 1;
	       Prev.D := 28;
	    end if;
	 when 02|04|06|08|09|11 => 
	    if Prev.D = 00 then
	       Prev.M := Prev.M - 1;
	       Prev.D := 31;
	    end if;
	 when 05|07|10|12 => 
	    if Prev.D = 00 then
	       Prev.M := Prev.M -1;
	       Prev.D := 30;
	    end if;
	 when others => 
	    Put("Error");
      end case;
      
      return Prev;	    
   end Prev_Date;
   
   function Next_Date(Date: in Date_Type) return Date_Type is
      Next: Date_Type := Date;
   begin
      Next.D := Next.D + 1;
      
      case Next.M is
	 when 12 => 
	    if Next.D = 32 then
	       Next.Y := Next.Y + 1;
	       Next.M := 01;
	       Next.D := 01;
	    end if;
	 when 02 => 
	    if Next.D = 29 then
	       Next.M := Next.M + 1;
	       Next.D := 01;
	    end if;
	 when 04|06|09|11 => 
	    if Next.D = 31 then
	       Next.M := Next.M + 1;
	       Next.D := 01;
	    end if;
	 when 01|03|05|07|08|10 =>
	    if Next.D = 32 then
	       Next.M := Next.M + 1;
	       Next.D := 01;
	    end if;
	 when others =>
	    Put("Error");
      end case;
      
      return Next;
   end Next_Date;
   
   function "<" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1.Y < D2.Y then
	 return True;
      elsif D1.Y = D2.Y and D1.M < D2.M then
	 return True;
      elsif D1.Y = D2.Y and D1.M = D2.M and D1.D < D2.D then
	 return True;
      else
	 return False;
      end if;
   end "<";
   
   function ">" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1.Y > D2.Y then
	 return True;
      elsif D1.Y = D2.Y and D1.M > D2.M then
	 return True;
      elsif D1.Y = D2.Y and D1.M = D2.M and D1.D > D2.D then
	 return True;
      else
	 return False;
      end if;
   end ">";
   
   function "=" (D1, D2: in Date_Type) return Boolean is
   begin
      if D1.Y = D2.Y and D1.M = D2.M and D1.D = D2.D then
	 return True;
      else
	 return False;
      end if;
   end "=";
   
end Date_Handling;
