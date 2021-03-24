with Ada.Text_IO, Ada.Integer_Text_IO, String_Handling, Hero_Handling;
use Ada.Text_IO, Ada.Integer_Text_IO, String_Handling, Hero_Handling;

package body Sorted_Hero_List is
   procedure Free_Mem is new Ada.Unchecked_Deallocation(List_Type, List_Ptr);
   
   function Empty(List: in List_Ptr ) return Boolean is
   begin
      if List = null then
	 return True;
      else 
	 return False;
      end if;
   end Empty;
   
   procedure Insert(Hero: in Hero_Type; List: in out List_Ptr) is
   Temp: List_Ptr;   
   begin
      if Empty(List) then
	 List := new List_Type;
	 List.Item := Hero;
	 List.Next_Ptr := null;
      elsif Hero_Age(Hero) < Hero_Age(List.Item) then
	 Temp := new List_Type;
	 Temp.Item := Hero;
	 Temp.Next_Ptr := List;
	 List := Temp;
      elsif Hero_Age(Hero) > Hero_Age(List.Item) then
	 Insert(Hero, List.Next_Ptr);
      end if;
   end Insert;
   
   procedure Put(List: in List_Ptr) is
   begin
      if Empty(List) then
	 Put(" ");
      else
	 Put(List.Item);
	 New_Line(2);
	 Put(List.Next_Ptr);
      end if;
   end Put;
   
   function Member(Key: in Integer; List: in List_Ptr) return Boolean is
   begin
      --kolla null
      if Hero_Age(List.Item) = Key then
	 return True;
      else return Member(Key, List.Next_Ptr);
      end if;
   end Member;
   
   procedure Remove(Key: in Integer; List: in out List_Ptr) is
   Temp_Ptr: List_Ptr;   
   begin
      if not Empty(List) then
	 if Hero_Age(List.Item) = Key then
	    Temp_Ptr := List.Next_Ptr;
	    Free_Mem(List);
	    List := Temp_Ptr;
	 else
	    Remove(Key, List.Next_Ptr);
	 end if;
      else
	 raise Constraint_Error;
      end if;
   end Remove;
   
   procedure Delete(List: in out List_Ptr) is
      Temp_Ptr: List_Ptr;   
   begin
      if Empty(List) then
	 return;
      else
	 Temp_Ptr := List.Next_Ptr;
	 Free_Mem(List);
	 List := Temp_Ptr;
	 Delete(List);
      end if;
   end Delete;
   
   function Find(Key: in Integer; List: in List_Ptr) return Hero_Type is
   begin
      if not Empty(List) then
	 if Hero_Age(List.Item) = Key then
	    return List.Item;
	 end if;
	 
	 return Find(Key, List.Next_Ptr);
      end if;
      raise Constraint_Error;
   end Find;
   
   procedure Find(Key: in Integer; List: in List_Ptr; Result: out Hero_Type) is
   begin
      Result := Find(Key, List);
   end Find;
   
   function Length(List: in List_Ptr) return Integer is
   begin
      if Empty(List) then
	 return 0;
      else
	 return 1 + Length(List.Next_Ptr);
      end if;
   end Length;
end Sorted_Hero_List;
