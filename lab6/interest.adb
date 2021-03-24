with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Sequential_IO;

procedure Interest is
   type Interest_Type is array(1..10) of Integer;
   type Person_Type is
      record
	 First_Name: String(1..20);
	 Last_Name: String(1..20);
	 Adress: String(1..20);
	 City: String(1..20);
	 Num_Interests: Integer;
	 Interests: Interest_Type;
      end record;
   
   package Person_IO is new Ada.Sequential_IO(Person_Type);
   use Person_IO;
   
   procedure Clear_File(Item: in out Interest_Type) is
   begin   
      for I in 1..10 loop
	 Item(I) := 0;
      end loop;
   end Clear_File;
   
   function Exists(Item: in Interest_Type; X: in Integer) return Boolean is
   begin
      for I in 1..Item'Length loop
	 if X = Item(I) then
	    return True;
	 end if;
      end loop;
      return False;
   end Exists;
   
   procedure Get(Interests: in out Interest_Type; Count: out Integer) is
   Input: Integer;   
   begin
      Clear_File(Interests);
      Put("Ange en följd av intressen 1 till 15, max 10 st. Avsluta med 0: ");
      Count := 0;
      
      loop
	 Get(Input);
	 exit when Input = 0;
	 exit when Count = 10;
	 if Input > 0 and Input < 16 then
	    if Exists(Interests, Input) then null; 	    
	    else
	       Count := Count + 1;
	       Interests(Count) := Input;
	    end if;
	 end if;
      end loop;
   end Get;

   procedure Put(Interests: in Interest_Type; Count: in Integer) is
   begin
      for I in 1..Count loop
	 Put(Interests(I), 0);
      end loop;
   end Put;
   
   function Compare_Person(Interests: in Interest_Type; Person: in Person_Type) return Person_Type is
      Count: Integer := 0;
      Correct_Person: Person_Type;
   begin
      Correct_Person := Person;
      for I in 1..Person.Num_Interests loop
	 for J in 1..10 loop
	    if Interests(J) = Person.Interests(I) then
	       Count := Count +1;
	       Correct_Person.Interests(Count) := Person.Interests(I);
	    end if;
	 end loop;
      end loop;
      Correct_Person.Num_Interests := Count;
      return Correct_Person;
   end Compare_Person;
   
   function Remove_Spaces(S: in String) return String is
   begin
      for I in reverse S'First..S'Last loop
	 if S(I) = ' ' then
	    return S(S'First..I);
	 end if;
      end loop;
      return S;
   end Remove_Spaces;
   
   procedure Write_File(Copy_File: in Ada.Text_IO.File_Type; Person: in Person_Type) is
   begin
      New_Line(Copy_File);
      
      Put(Copy_File, Remove_Spaces(Person.First_Name));
      Put(Copy_File, " ");
      Put(Copy_File, Remove_Spaces(Person.Last_Name));
      Put(Copy_File, " ");
      Put(Copy_File, Remove_Spaces(Person.Adress));
      Put(Copy_File, " ");
      Put(Copy_File, Remove_Spaces(Person.City));
      
      for I in 1..Person.Num_Interests loop
	 Put(Copy_File, Person.Interests(I), 3);
      end loop;
      New_Line(Copy_File);
   end Write_File;
   
   Count: Integer;
   Original_File: Person_IO.File_Type;
   Copy_File: Ada.Text_IO.File_Type;
   Correct_Person: Person_Type;
   Person: Person_Type;
   Interests: Interest_Type;
   
begin
   Get(Interests, Count);
   Put("KLART! Resultat på filen RESULT.TXT");
   Create(Copy_File, Out_File, "RESULT.TXT");
   Open(Original_File, In_File, "REG.BIN");
   while not End_Of_File(Original_File) loop
      Read(Original_File, Person);
      Correct_Person := Compare_Person(Interests, Person);
      if Correct_Person.Num_Interests > 0 then
	 Write_File(Copy_File, Correct_Person);
      end if;
   end loop;
   Close(Copy_File);
   Close(Original_File);
end Interest;
   

