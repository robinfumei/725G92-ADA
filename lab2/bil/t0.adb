with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;

function T0(S1, S2, T1, T2 : in integer) return Float is
   
  Float_S1, Float_S2, Float_T1, Float_T2 : Float;
   
begin
   
   Float_S1 := Float(S1);
   Float_S2 := Float(S2);
   Float_T1 := Float(T1);
   Float_T2 := Float(T2);
   
   return Float_T1 - ((Float_S1 * Float_T2)/Float_S2);
   
end T0;
