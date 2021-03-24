with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Sorted_List; use Sorted_List;
with Sorted_Hero_List; use Sorted_Hero_List;
with Hero_Handling; use Hero_Handling;

procedure Lab5 is
   List: List_Ptr;
   Key: Integer;
   Hero: Hero_Type;
   
begin
   loop
      begin
	 Put("Mata in några element till listan: ");
	 loop
	    Get_Hero(Hero);
	    Insert(Hero, List);
	    if End_Of_Line then exit; end if;
	 end loop;
   
      --Put(List);
      New_Line(2);
      
      exit;
      
      exception
	 when Null_Error =>
	    Put_Line("Talet finns inte i listan.");
      end;
   end loop;
end Lab5;
