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
   Telegraf ('1.Начать новую игру');
   Telegraf ('2.Загрузить игру');
   ReadLn (TextInt);
   ClrScr;
  End;
  If TextInt = 1 Then 
   Begin
    Telegraf('Игра началась!');
    ReadLn;
     TextInt:= 0;
     While CL = 0  do
      Begin
       ClrScr;
       Telegraf ('Выберите тип персонажа');
       Telegraf ('1.Маг (Сильные магические заклинания)');
       Telegraf ('2.Палладин (Много здоровья и физический урон)');
       Telegraf ('3.Воин (Большой физический урон и очень много здоровья)');
       ReadLn (Cl);
      End;
     ClrScr;
     Teleg ('Вы выбрали класс ');
     Case Cl of
      1: Telegraf ('мага.');
      2: Telegraf ('палладина.');
      3: Telegraf ('воина.');
     End; 
     Telegraf ('Теперь придумайте себе имя: ');
     ReadLn (Name);
     Telegraf ('Мы готовы начать! Нажмите любую клавишу для продолжения.');
     ReadLn;
     ClrScr;
     Telegraf ('На вас надвигается отряд врагов!');
     Telegraf ('1.Защищаться');
     Telegraf ('2.Атаковать');
     ReadLn (TextInt);
     If TextInt = 1 then Inc(Arm)
     Else Inc (Dmg);
     HP:= ConstHP;
     CountDNG:= Random (5) + 1;
     While CountDNG <> 0 do
      Begin
       Inc (Count);
        Teleg ('     Раунд     '); WriteLn (Count);
       For CountOther:= 1 to CountDNG do
        Begin
         UR:= Random (DM);  
         HP:= HP - Random (DM);
         If UR = 0 Then WriteLn ('Враг промахивается!') 
          Else
           Begin 
           Teleg ('Враг наносит '); Write (UR); Telegraf (' еденицы урона.');
           Teleg ('У вас остаётся '); Write (HP); Telegraf (' HP')
           End;
         ReadLn;         
        End;
       For CountOther:= 1 to CountDNG do
        Begin
         Write (CountOther,'.'); Teleg ('Атаковать '); Write (CountOther); Telegraf ('-го врага')
        End;
       ReadLn (TextInt);
       MagikNAM[1]:= 'Огненная стрела';
       MagikCST[1]:= 5;
       MagikDMG[1]:= 5;
       ClrScr;
       Telegraf ('Выберите какое заклинание использовать');
       Write ('1. '); Teleg (MagikNAM[1]); Teleg (' стоимость: '); Write (MagikCST[1]); Teleg (' маны, урон:'); WriteLn (MagikDMG[1]);
       ReadLn (CountOther2);
       If Man <= MagikCST[TextINT] then Begin Man:= Man - MagikCST[TextINT] End Else Begin Telegraf ('Недостаточно маны'); ClrScr; End; 
       For CountOther:= 1 to CountDNG do
        VrHP[CountOther]:= 5;
        CountOther3:=Random(10) + 1;
       VrHP[TextInt]:= VrHP[TextInt] - Random(MagikDMG[CountOther2]) - CountOther3;
       If CountOther3 >= 10 then Telegraf ('Критический урон!');
       If VrHP[TextInt]  < 1 then Begin Telegraf ('Враг убит!');  CountDNG:= CountDNG - 1;
      End;
    End;    
   End; 
End.  

  

  
 