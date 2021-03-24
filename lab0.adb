with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure lab0 is
   
   
   I : Integer;
   S : String(1..100);
   F : Float;
   C : Character;
   
begin
   Put("Skriv in ett heltal: ");
   Get(I);

   Put("Du skrev in talet: ");
   Put(I, Width=>1);
   
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in ett flyttal: ");
   Get(F);
   Put("Du skrev in flyttalet: ");
   -- Fore = Blanksteg till vänster
   -- Aft = Antal decimaler
   -- Exp = exponent (* 10^exp)
   Put(F, Fore => 1, Aft => 3, Exp => 0);
   
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Du skrev in heltalet: ");
   Put(I);
   New_Line;
   Put("Du skrev in flyttalet: ");
   Put(F, Fore => 3, Aft => 6, Exp => 0);
   
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in ett tecken: ");
   Get(C);
   Put("Du skrev in tecknet: ");
   Put(C);
   
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in en sträng med 5 tecken: ");
   Get(S(1..5));
   Put("Du skrev in strängen: ");
   Put(S(1..5));
   
   Skip_Line;
   New_Line(2);
   
   Put("Skriv in en sträng med 3 tecken: ");
   Get(S(1..3));
   Put("Du skrev in strängen: ");
   Put(S(1..3));
   
   Skip_Line;
   New_Line(2);
     
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(I);
   Get(S(1..6));
   Put("Du skrev in talet |");
   Put(I, Width=>1);
   Put("| och strängen |");
   Put(S(2..6));
   Put("|.");
   
end lab0;
