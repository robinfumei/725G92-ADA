with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;
with Ada.Text_IO;               use Ada.Text_IO;
with K;
with T0;
with S3;

procedure Bil is
   
   S1, S2, T1, T2 : Integer; 
   
begin
   
   Put("Först kör vi sträckan S1 (i mil): ");
   Get(S1);
   Put("Vi tankar nu full tank, T1 (i liter): ");
   Get(T1);
   Put("Nu kör vi sträckan S2 (i mil): ");
   Get(S2);
   Put("Vi tankar nu full tank igen, T2 (i liter): ");
   Get(T2);
   
   New_Line;
  
   Put("Bilen drar ");
   Put(K(S2, T2), Fore => 1, Aft => 2, Exp => 0);
   Put(" liter / mil.");
   
   New_Line;
   
   Put("Ur tanken saknades det från början ");
   Put(T0(S1, S2, T1, T2), Fore => 1, Aft => 2, Exp =>0);
   Put(" liter.");
   
   New_Line;
   
   Put("Vi kör sedan exakt ");
   Put(S3(S1, S2, T1, T2), Fore => 1, Aft => 2, Exp => 0);
   Put(" mil och lämnar bilen där!");
   
   -- Vi väljer funktioner eftersom att de används för en matematisk beräkning
   -- i syfte att returnera ett värde, något som procedurer inte kan göra.
   
end Bil;
   
