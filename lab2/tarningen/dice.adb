with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Dice is
   
   -- Hur varje sida av tärningen ser ut
   procedure Face_1 is
   begin
      Put_Line("|     |");
      Put_Line("|  *  |");
   end Face_1;
   
   procedure Face_2 is
   begin
      Put_Line("| *   |");
      Put_Line("|   * |");
   end Face_2;
   
   procedure Face_3 is
   begin
      Put_Line("|*   *|");
      Put_Line("|  *  |");
   end Face_3;
   
   procedure Face_4 is
   begin
      Put_Line("| * * |");
      Put_Line("| * * |");
   end Face_4;
   
   procedure Face_5 is
   begin
      Put_Line("|* * *|");
      Put_Line("| * * |");
   end Face_5;
   
   procedure Face_6 is
   begin
      Put_Line("|* * *|");
      Put_Line("|* * *|");
   end Face_6;
   
   -- Hjälpprogram för att få fram rätt sida
   procedure Die_Side (Roll: in Integer) is
   begin
      if Roll = 1 then Face_1;
      elsif Roll = 2 then Face_2;
      elsif Roll = 3 then Face_3;
      elsif Roll = 4 then Face_4;
      elsif Roll = 5 then Face_5;
      elsif Roll = 6 then Face_6;
      end if;
   end Die_Side;
   
   -- Skriver ut över och undersidan av tärningen
   procedure Print_Die Is
   begin
      Put('+');
      for I in 1..5 loop
	 Put('-');
      end loop;
      Put('+');
      New_Line;
end Print_Die;

   
   -- Givet underprogram modifierat för att skriva ut tärningar
   procedure Rolldie(Total: out Integer) is
      
   subtype One_To_Six is
     Integer range 1..6;
   
   package My_Random_Package is
      new Ada.Numerics.Discrete_Random(One_To_Six);
   
   use My_Random_Package;
     
   G : Generator;
   N : Integer;
   
   begin
   Reset(G); -- Detta sätter slumptalsfröet som används för att
	     -- ta fram de slumpade talen, skall göras EN gång 
	     -- per programkörning (varken mer eller mindre).
   
   -- Ta in antalet slag från användaren
   Get(N);
   Total := 0;
   
   -- Loopar antalet slag
   for I in 1..N loop
      N := Random(G);
      Print_Die;
      Die_Side(N);
      Print_Die;
      New_Line;
      Total := Total + N;
   end loop;
   end Rolldie;

   Total: Integer;
 
begin
   Put("Mata in antal slag: ");
   Rolldie(Total);
   Put("Summan blev: ");
   Put(Total, 0);
end Dice;
