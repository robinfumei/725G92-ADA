with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;

function K(S2, T2 : in integer) return Float is
   
   Float_S2, Float_T2 : Float;
   
begin
   
   Float_S2 := Float(S2);
   Float_T2 := Float(T2);
   
   return Float_T2/Float_S2;
   
end K;
