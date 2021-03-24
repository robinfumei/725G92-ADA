with Ada.Text_IO; use  Ada.Text_IO;

package body String_Handling is
   
   procedure Get(item: out String_Type) is
   begin
      for I in Item.Char_Array'Range loop
	 Get(Item.Char_Array(I));
	 Item.Length := I;
	 exit when End_Of_Line;
      end loop;
   end Get;
   
   procedure Put(Item: in String_Type) is
   begin
      for I in 1..Item.Length loop
	 Put(Item.Char_Array(I));
      end loop;
   end Put;
end String_Handling;
