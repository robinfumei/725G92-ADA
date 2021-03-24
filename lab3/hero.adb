with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Hero is 
   type Char_Type is array(1..256) of Character;
   type String_Type is
      record
	 Char_Array: Char_Type;
	 Length: Integer := 0;
      end record;
   
   type Hero_Type is
      record
	 Name: String_Type;
	 Age: Integer;
	 Gender: String_Type;
	 Weight: Float;
	 Hair_Color: String_Type;
	 -- Species: ;
	 -- Eye_Color: ;
      end record;
   
   procedure Get_String (Hero: in out Hero_Type; Field: in String) is
   begin
      for I in 1 .. 256 loop
	 if (Field = "name") then
	    Get(Hero.Name.Char_Array(I));
	    Hero.Name.Length := Hero.Name.Length + 1;
	 elsif (Field = "color") then
	    Get(Hero.Hair_Color.Char_Array(I));
	    Hero.Hair_Color.Length := Hero.Hair_Color.Length + 1;
	 elsif (Field = "gender") then
	    Get(Hero.Gender.Char_Array(I));
	    Hero.Gender.Length := Hero.Gender.Length + 1;
	 end if;
	 exit when End_Of_Line;
      end loop;     
   end Get_String;
   
   procedure Get_Hero(Hero: in out Hero_Type) is
   begin
      Put("Ange ett namn: ");
      Get_String(Hero, "name");
      
      Put("Ange en ålder: ");
      Get(Hero.Age);	 
      
      Put("Ange kön: ");
      Get_String(Hero, "gender");	 
      
      Put("Ange vikt: ");
      Get(Hero.Weight);
      
      Put("Ange en hårfärg: ");
      Get_String(Hero, "color");
   end Get_Hero;
   
   procedure Put_String (Hero: in Hero_Type; Field: in String) is
   begin
      if (Field = "name") then      
	 for I in 1 ..Hero.Name.Length loop
	    Put(Hero.Name.Char_Array(I));
	 end loop;
      elsif (Field = "color") then
	 for I in 1 ..Hero.Hair_Color.Length loop
	    Put(Hero.Hair_Color.Char_Array(I));
	 end loop;
      elsif (Field = "gender") then
	 for I in 1 ..Hero.Gender.Length loop
	    Put(Hero.Gender.Char_Array(I));
	 end loop;
      end if;
      end Put_String;

   procedure Put_Hero(Hero: in Hero_Type) is
   begin
      Put("Namn: ");
      Put_String(Hero, "name");
      New_Line;
      Put("Ålder: ");
      Put(Hero.Age, 0);
      New_Line;
      Put("Kön: ");
      Put_String(Hero, "gender");
      New_Line;
      Put("Vikt: ");
      Put(Hero.Weight, Fore => 0, Aft => 2, Exp => 0);
      New_Line;
      Put("Hårfärg: ");
      Put_String(Hero, "color");
   end Put_Hero;
   
   Hero: Hero_Type;
   
begin
   Get_Hero(Hero);
   Put_Hero(Hero);
end Hero;

   
   
   
