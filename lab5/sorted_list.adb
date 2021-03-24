package body Sorted_List is
   procedure Free_Mem is new Ada.Unchecked_Deallocation(List_Type, List_Ptr);
   
   function Empty(List: in List_Ptr ) return Boolean is
   begin
      if List = null then
	 return True;
      else 
	 return False;
      end if;
   end Empty;
   
   procedure Insert(Item: in Integer; List: in out List_Ptr) is
   begin
      if Empty(List) then
	 List := new List_Type'(Item=>Item, Next_Ptr=>null);
      elsif List.Item > Item then
	 List := new List_Type'(Item=>Item, Next_Ptr=>List);
      elsif List.Item < Item then
	 Insert(Item, List.Next_Ptr);
      end if;
   end Insert;
   
   procedure Put(List: in List_Ptr) is
   begin
      if Empty(List) then
	 Put(" ");
      else
	 Put(List.Item, 0);
	 Put(" ");
	 Put(List.Next_Ptr);
      end if;
   end Put;
   
   function Member(Item: in Integer; List: in List_Ptr) return Boolean is
   begin
      if Item = List.Item then
	 return True;
      else return Member(Item, List.Next_Ptr);
      end if;
   end Member;
   
   procedure Remove(Item: in Integer; List: in out List_Ptr) is
   Temp_Ptr: List_Ptr;   
   begin
      if List = null then
	 raise Null_Error;      
      elsif Item = List.all.Item then
	 Temp_Ptr := List.all.Next_Ptr;
	 Free_Mem(List);
	 List := Temp_Ptr;
      else
	 Remove(Item, List.Next_Ptr);
      end if;
   end Remove;
   
   procedure Delete(List: in out List_Ptr) is
      Temp_Ptr: List_Ptr;   
   begin
      if Empty(List) then
	 return;
      else --if not Empty...
	 Temp_Ptr := List.Next_Ptr;
	 Free_Mem(List);
	 List := Temp_Ptr;
	 Delete(List);
      end if;
   end Delete;
   
   function Find(Item: in Integer; List: in List_Ptr) return Integer is
   begin
      if Empty(List) then
	 raise Null_Error;
      elsif Item = List.Item then
	 return Item;
      else
	 return Find(Item, List.Next_Ptr);
      end if;
   end Find;
   
   procedure Find(Item: in Integer; List: in List_Ptr; Result: out Integer) is
   begin
      Result := Find(Item, List);
   end Find;
   
   function Length(List: in List_Ptr) return Integer is
   begin
      if Empty(List) then
	 return 0;
      else
	 return 1 + Length(List.Next_Ptr);
      end if;
   end Length;
end Sorted_List;
