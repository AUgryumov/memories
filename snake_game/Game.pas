uses GraphABC, ABCObjects;

var
  count2: boolean;
  count, c, kol, i, a, d, Na: integer;
  snake: array [1..64] of circleABC;   
  x: array [1..64] of integer;
  y: array [1..64] of integer;
  eatx: array [1..8] of integer;
  eaty: array [1..8] of integer;
  eat: circleABC;

procedure keydown(key: integer);
begin
  case Key of
    Vk_Left: NA := 1;
    
    VK_Right: Na := 2;
    
    VK_Up: Na := 3;
    
    VK_Down: Na := 4;
  End;
end;

begin
  kol := 1;
  x[1] := 80;
  y[1] := 80;
  eatx[1] := 80;
  eaty[1] := 80;
  SetWindowTitle('Змейка');
  SetWindowSize(640, 640);
  a := 640 div 80;
  for i := 2 to a do
  begin
    x[i] := x[i - 1] + 80;
    y[i] := y[i - 1] + 80;
    eatx[i] := eatx[i - 1] + 80;
    eaty[i] := eaty[i - 1] + 80;
  end;
  c := Random(1, 7);
  d := Random(1, 7);
  eat := CircleABC.Create(eatx[c] + 40, eaty[d] + 40, 40, clYellow);
  snake[1] := CircleABC.Create(x[1] + 40, y[1] + 40, 40, clRed);
  for i := 2 to 64 do snake[i] := CircleABC.Create(720, 720, 40, clTransparent);
  repeat
    Sleep(500);
    OnKeyDown := keydown;
    case Na of
      1:
        begin
          for i := kol downto 1 do
          begin
            if i = 1 then
            begin
              x[1] := x[1] - 80;
              snake[1].MoveTo(x[1], y[1]);
            end
            else
            begin
              x[i] := x[i - 1];
              y[i] := y[i - 1];
              snake[i].MoveTo(x[i], y[i]);
            end
          end
        end;
      2:
        begin
          for i := kol downto 1 do
          begin
            if i = 1 then
            begin
              x[1] := x[1] + 80;
              snake[1].MoveTo(x[1], y[1]);
            end
            else
            begin
              x[i] := x[i - 1];
              y[i] := y[i - 1];
              snake[i].MoveTo(x[i], y[i]);
            end
          end
        end;
      3:
        begin
          for i := kol downto 1 do
          begin
            if i = 1 then
            begin
              y[1] := y[1] - 80;
              snake[1].MoveTo(x[1], y[1]);
            end
            else
            begin
              x[i] := x[i - 1];
              y[i] := y[i - 1];
              snake[i].MoveTo(x[i], y[i]);
            end
          end
        end;
      4:
        begin
          for i := kol downto 1 do
          begin
            if i = 1 then
            begin
              y[1] := y[1] + 80;
              snake[1].MoveTo(x[1], y[1]);
            end
            else
            begin
              x[i] := x[i - 1];
              y[i] := y[i - 1];
              snake[i].MoveTo(x[i], y[i]);
            end
          end
        end;
    end; 
    if (x[1] = eatx[c]) and (y[1] = eaty[d]) then
    begin
      Count := 0;
      Count2 := False;
      while Count2 = False do
      begin
        c := Random(1, 7);
        d := Random(1, 7);
        for i := 1 to kol do
          if (x[i] = c) and (y[i] = d) then Inc(Count);
        if Count = 0 then Count2 := true;
      end; 
      eat.MoveTo(eatx[c], eaty[d]);
      kol := kol + 1;
    end;
    if (x[1] > 640) or (y[1] > 640) or (x[1] < 0) or (y[1] < 0) then halt; 
    for i := 2 to kol  do
    begin
      if (x[1] = x[i]) and (y[1] = y[i]) then halt;
    end;
  until False;
end.
