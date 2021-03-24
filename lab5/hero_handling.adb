with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with String_Handling; use String_Handling;

package body Hero_Handling is   
   procedure Get(Hero: out Hero_Type) is
   begin
      Put("Ange ett namn: ");
      Get(Hero.Name);
      
      Put("Ange en ålder: ");
      Get(Hero.Age);	
      
     -- Put("Ange ras (Human, Elf, Orc, Halfling, Ogre, Lizardman): ");
      --Get(Hero.Race);
      --Skip_Line;
      
      --Put("Ange ögonfärg (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy): ");
      --Get(Hero.Eye_Color);
     -- Skip_Line;
      
      --Put("Ange kön (M/F): ");
      --Get(Hero.Gender);
      --Skip_Line;
      
     -- Put("Ange vikt: ");
      --Get(Hero.Weight);
      
      --Put("Ange en hårfärg: ");
      --Get(Hero.Hair_Color);
   end Get;
   
   procedure Put(Hero: in Hero_Type) is
   begin
      Put("Namn: ");
      Put(Hero.Name);
      New_Line;
      Put("Ålder: ");
      Put(Hero.Age, 0);
      New_Line;
      Put("Kön: ");
      Put(Hero.Gender);
      New_Line;
      Put("Vikt: ");
      Put(Hero.Weight, Fore => 0, Aft => 2, Exp => 0);
      New_Line;
      Put("Hårfärg: ");
      Put(Hero.Hair_Color);
   end Put;
   
   function Hero_Age(Hero: in Hero_Type) return Integer is
   begin
      return Hero.Age;
   end Hero_Age;
end Hero_Handling;
