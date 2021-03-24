with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab3a is
   type Ten_Ints_Array_Type is
     array (1 .. 10) of Integer;
   
   procedure Get_Numbers (Field: in out Ten_Ints_Array_Type) is
   begin
      for I in 1 .. 10 loop
	 Get(Field(I));
      end loop;	
   end Get_Numbers;
     
   procedure Put_Numbers (Field: in Ten_Ints_Array_Type) is
   begin
      for I in 1 .. 10 loop
	 Put(Field(I), 0);
	 Put(" ");
	 end loop;
   end Put_Numbers;
   
   procedure Find_Maximum (Field: in Ten_Ints_Array_Type; Max, Index: out Integer) is
    
      
   begin
      Max := Field(1);
      Index := 1;
      for I in 2 .. 10 loop
	 if (Field(I) > Max) then
	    Max := Field(I);
	    Index := I;
	 end if;
      end loop;
      
      
   end Find_Maximum;
   
   procedure My_Reverse (Field: in out Ten_Ints_Array_Type) is
      Temp: Ten_Ints_Array_Type;
      Count: Integer := 1;
   begin
      for I in reverse 1..10 loop
	 Temp(Count) := Field(I);
	 Count := Count +1;
      end loop;
      Field := Temp;
   end My_Reverse;
 
   Field: Ten_Ints_Array_Type;
   Max, Index: Integer;
   
begin
   Put("Ange 10 heltal: ");
   Get_Numbers(Field);
   
   Put("Du skrev in heltalen: ");
   Put_Numbers(Field);
   
   Find_Maximum(Field, Max, Index);  
   New_Line;
   Put("Det största talet var: ");
   Put(Max, 0);
   Put(" på plats: ");
   Put(Index, 0);
    
   
   My_Reverse(Field);
   New_Line;
   Put("Dina tal i omvänd ordning: ");
   Put_Numbers(Field);
end Lab3a;
  
