with Ada.Text_IO, Ada.Integer_Text_IO, String_Handling, Hero_Handling, Sorted_Hero_list;
use Ada.Text_IO, Ada.Integer_Text_IO, String_Handling, Hero_Handling, Sorted_Hero_List;

procedure Heroes_Test is
   
   List: List_Ptr;
   Hero: Hero_Type;
   Key: Integer;
   
begin
   Get(Hero);
   Insert(Hero, List);
   
   New_Line;
   
   Put(List);
   New_Line;
   
   Get(Hero);
   Insert(Hero, List);
   
   New_Line;
   
   Get(Hero);
   Insert(Hero, List);
   
   New_Line;
   
   Put(List);
   New_Line;
   
   Put("Listan har så här många element: ");
   Put(Length(List), 0);
   
   New_Line;
   
   Put("Skriv in en hjältes ålder för att ta bort den ur listan: ");
   Get(Key);
   Remove(Key, List);
   
   Put(List);
   
   New_Line;
   Put("Skriv in en hjältes ålder för att skriva ut den från listan: ");
   Get(Key);
   Put(Find(Key, List));
   
   New_Line;
   Put("Skriv in en hjältes ålder för att se om den finns med i listan: ");
   Get(Key);
   if Member(Key, List) = True then
      Put("Jadå");
   else
      Put("Naj");
   end if;
   
   New_Line;
   Put("Är listan tom? ");
   if Empty(List) = True then
      Put("Jaaa");
   else
      Put("Nae");
   end if;   
end Heroes_Test;
