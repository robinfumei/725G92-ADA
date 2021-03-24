with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab3b is
   type Char_Type is array(1..256) of Character;
   type String_Type is
      record
	 Char_Array: Char_Type;
	 Length: Integer := 0;
      end record;
   
   procedure Get_Char (Field: in out String_Type) is
   begin
      for I in 1 .. 256 loop
	 Get(Field.Char_Array(I));
	 Field.Length := Field.Length + 1;
	 exit when End_Of_Line;
      end loop;     
   end Get_Char;
   
   procedure Put_Char (Field: in String_Type) is
   begin
      for I in 1 ..Field.Length loop
	 Put(Field.Char_Array(I));
      end loop;
   end Put_Char;
   
   function "=" (Field, Field2: in String_Type) return Boolean is
   begin
      if Field.Length /= Field2.Length then
	 return False;
	 
      else
	 for I in 1..Field.Length loop
	    if Field.Char_Array(I) /= Field2.Char_Array(I) then
	       return False;
	    end if;
	 end loop;
      end if;
      
      return True;
   end "=";
   
   Field: String_Type;
   Field2: String_Type;
begin
   Put("Ange upp till 256 karaktärer, eller avsluta tidigt med Enter: ");
   Get_Char(Field);
   Put("Du skrev in: ");
   Put_Char(Field);
   New_Line;
   Put("Gör det igen: ");
   Get_Char(Field2);
   Put("Du skrev in: ");
   Put_Char(Field2);
   
   New_Line;
   
   Put("Dina strängar är ");
   if Field = Field2 then
      Put("likadana!");
   else
      Put("inte likadana!");
   end if;
end Lab3b;
