Uses 
 Crt;
 
Const
 Magik = 20;
 DM = 2;
 ConstHP = 20;
Var
 Fight: Boolean;
 TextInt,I,Man,Dmg,Arm,Count,CountDNG,CountOther,HP,UR,Cl,CountOther2,CountOther3: Integer;
 Text, Name: String;
 MagikDMG: Array [1..Magik] of Integer;
 MagikNAM: Array [1..Magik] of String;
 MagikCST: Array [1..Magik] of Integer;
 VrHP: Array [1..100] of Integer;
  
Procedure Teleg(Text: String);
Var I: Integer;
Begin
While Length(Text)<>I do 
 Begin
  I:=I+1;
  TextColor(11);
  Write(Text[I]);
  Delay(50);
 End; 
End;  

Procedure Telegraf(Text: String);
Var I: Integer;
Begin
While Length(Text)<>I do
 Begin
  I:=I+1;
  TextColor(11);
  Write(Text[I]);
  Delay(50);
 End; 
 WriteLn;
End; 
  
Begin
 TextColor(6);
 While TextInt < 1  do
  Begin
   Telegraf ('1.������ ����� ����');
   Telegraf ('2.��������� ����');
   ReadLn (TextInt);
   ClrScr;
  End;
  If TextInt = 1 Then 
   Begin
    Telegraf('���� ��������!');
    ReadLn;
     TextInt:= 0;
     While CL = 0  do
      Begin
       ClrScr;
       Telegraf ('�������� ��� ���������');
       Telegraf ('1.��� (������� ���������� ����������)');
       Telegraf ('2.�������� (����� �������� � ���������� ����)');
       Telegraf ('3.���� (������� ���������� ���� � ����� ����� ��������)');
       ReadLn (Cl);
      End;
     ClrScr;
     Teleg ('�� ������� ����� ');
     Case Cl of
      1: Telegraf ('����.');
      2: Telegraf ('���������.');
      3: Telegraf ('�����.');
     End; 
     Telegraf ('������ ���������� ���� ���: ');
     ReadLn (Name);
     Telegraf ('�� ������ ������! ������� ����� ������� ��� �����������.');
     ReadLn;
     ClrScr;
     Telegraf ('�� ��� ����������� ����� ������!');
     Telegraf ('1.����������');
     Telegraf ('2.���������');
     ReadLn (TextInt);
     If TextInt = 1 then Inc(Arm)
     Else Inc (Dmg);
     HP:= ConstHP;
     CountDNG:= Random (5) + 1;
     While CountDNG <> 0 do
      Begin
       Inc (Count);
        Teleg ('     �����     '); WriteLn (Count);
       For CountOther:= 1 to CountDNG do
        Begin
         UR:= Random (DM);  
         HP:= HP - Random (DM);
         If UR = 0 Then WriteLn ('���� �������������!') 
          Else
           Begin 
           Teleg ('���� ������� '); Write (UR); Telegraf (' ������� �����.');
           Teleg ('� ��� ������� '); Write (HP); Telegraf (' HP')
           End;
         ReadLn;         
        End;
       For CountOther:= 1 to CountDNG do
        Begin
         Write (CountOther,'.'); Teleg ('��������� '); Write (CountOther); Telegraf ('-�� �����')
        End;
       ReadLn (TextInt);
       MagikNAM[1]:= '�������� ������';
       MagikCST[1]:= 5;
       MagikDMG[1]:= 5;
       ClrScr;
       Telegraf ('�������� ����� ���������� ������������');
       Write ('1. '); Teleg (MagikNAM[1]); Teleg (' ���������: '); Write (MagikCST[1]); Teleg (' ����, ����:'); WriteLn (MagikDMG[1]);
       ReadLn (CountOther2);
       If Man <= MagikCST[TextINT] then Begin Man:= Man - MagikCST[TextINT] End Else Begin Telegraf ('������������ ����'); ClrScr; End; 
       For CountOther:= 1 to CountDNG do
        VrHP[CountOther]:= 5;
        CountOther3:=Random(10) + 1;
       VrHP[TextInt]:= VrHP[TextInt] - Random(MagikDMG[CountOther2]) - CountOther3;
       If CountOther3 >= 10 then Telegraf ('����������� ����!');
       If VrHP[TextInt]  < 1 then Begin Telegraf ('���� ����!');  CountDNG:= CountDNG - 1;
      End;
    End;    
   End; 
End.  

  

  
 