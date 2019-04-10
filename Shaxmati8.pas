program shaxmati;

uses
  Crt, GRAPH;

const
  n = 8;

var
  cr:char;
  ch,  s,  r: string;
  j, l, e, k, i, g, h, c, x1, x2, y1, y2, x, y, b, f, x3, y3, q, z: integer;
  m, p, v: char;

begin
  writeln('Выберите фигуру  из списка , предложенного ниже , путем ввода одного символа.');
  writeln('Убедитесь , что вводите символ на латинском языке:');
  writeln('P - Пешка');
  writeln('T - Король');
  writeln('S - Слон');
  writeln('L - Ладья');
  writeln('F - Ферзь');
  writeln('K - Конь');
  repeat
   readln(cr);
   cr:= Upcase(cr);
  until cr In['P','S','F','K','T','L'];
  writeln;
  writeln('Введите координаты начального положения фигуры на доске.');
  writeln('В диапозоне: от а до h и от 1 до 8');
  writeln('(Например , a4 , h7 , b3 , e4 и т.д.)');
  repeat
   readln(ch);
  until (ch[1]>='a') and (ch[1]<='h') and (ch[2]>='1') and (ch[2]<='8');
  g := detect;
  initgraph(g, h, '');
  setfillstyle(solidfill, 8);
  floodfill(1, 1, 8);
  c := 15;
  for k := 1 to n do
  begin
    for i := 1 to n do
    begin
      for y := 95 to 160 do
        for x := 410 to 475 do
          putpixel(10 + x + 65 * (i - 1), 10 + y + 65 * (k - 1), c);
      if c = 0 then c := 15 else c := 0;
    end;
    if n mod 2 = 0 then
      if c = 0 then c := 15
      else c := 0;
  end;
  SetTextStyle(0, 0, 3);
  outtextXY(20,45 , 'Spravka:');
  setTextStyle(0,0,1);
  outtextXY(5,90,'1) Delete - dvigenie figyri po diagonali ');
  outtextXY(5,110,'   vniz i vlevo.');
  outtextXY(5,130,'   (Dlia Konia - vniz i vlevo bykvoi G).');
  outtextXY(5,150,'2) Pgdn - dvigenie figyri po diagonali ');
  outtextXY(5,170,'   vniz i vpravo.');
  outtextXY(5,190,'   (Dlia Konia - vniz i vpravo bykvoi G).');
  outtextXY(5,210,'3) Home - dvigenie figyri po diagonali');
  outtextXY(5,230,'   vverx i vlevo.');
  outtextXY(5,250,'   (Dlia Konia - vverx i vlevo bykvoi G).');
  outtextXY(5,270,'4) Pgup - dvigenie figyri po diagonali ');
  outtextXY(5,290,'   vverx i vpravo.');
  outtextXY(5,310,'   (Dlia Konia - vverx i vpravo bykvoi G).');
  outtextXY(5,330,'5) Strelka vlevo - dvigenie figyri vlevo.');
  outtextXY(5,350,'   (Dlia Konia - vniz i vlevo bykvoi G).');
  outtextXY(5,370,'6) Strelka vniz - dvigenie figyri vniz.');
  outtextXY(5,390,'   (Dlia Konia - vniz i vpravo bykvoi G).');
  outtextXY(5,410,'7) Strelka vpravo - dvigenie figyri vpravo.');
  outtextXY(5,430,'   (Dlia Konia - vverx i vpravo bykvoi G).');
  outtextXY(5,450,'8) Strelka vverx - dvigenie figyri vverx.');
  outtextXY(5,470,'   (Dlia Konia - vverx i vlevo bykvoi G).');
  outtextXY(5,490,'9) Backspace - mnognovenno perenosit figyry ');
  outtextXY(5,510,'   na stolko kletok skolko bilo nashato.');
  outtextXY(5,530,'   (Rabotaet tolko s Ferzem , Ladiei ');
  outtextXY(5,550,'   i so Slonom).');
  outtextXY(5,570,'10) End - perevodit iz obichnogo sostoiania ');
  outtextXY(5,590,'    v specialnoe.');
  outtextXY(5,610,'   (Rabotaet tolko s Peshkoi , Koniem ');
  outtextXY(5,630,'   i so Slonom).');
  outtextXY(5,650,'   (Dvigenie figyri ypravliaetsia s ');
  outtextXY(5,670,'   pomoshiy strelochek).');
  outtextXY(5,690,'11) Esc - vixodit iz programi.Esli vkliychen spcialni reshim , to vozvashaet v obichni.');
  SetTextStyle(0, 0, 4);
  setcolor(15);
  r := '87654321';
  s := 'abcdefgh';
  y1 := 126;
  x1 := 389;
  for i := 1 to length(r) do
  begin
    outtextXY(x1, y1, Copy(r, i, 1));
    y1 := y1 + 65;
  end;
  x1 := x1 + 50;
  y1 := y1 - 15;
  for i := 1 to length(s) do
  begin
    outtextXY(x1, y1, Copy(s, i, 1));
    x1 := x1 + 65;
  end;
  setcolor(4);
  x1 := 440;
  y1 := 125;
  j := 1;
  l := 1;
  b := 15;
  for k := 1 to n do
  begin
    for i := 1 to n do
    begin
      if s[j] + r[l] = ch then
      begin
        outtextXY(x1, y1, Copy(cr, 1, length(cr)));
        x2 := x1;
        y2 := y1;
        f := b;
      end;
      x1 := x1 + 65;
      J := j + 1;
      if b = 15 then b := 0
      else b := 15;
    end;
    j := 1;
    x1 := 440;
    y1 := y1 + 65;
    l := l + 1;
    if b = 15 then b := 0
    else b := 15;
  end;
  x3 := x2 + 10;
  y3 := y2 + 10;
  if cr = 'P' then
    repeat
      setcolor(1);
      setfillstyle(1, 1);
      if y3 + 65 < 610 then
      begin
        circle(x3, y3 + 65, 4);
        floodfill(x3, y3 + 65, 1);
      end;
      if y3 - 65 > 90 then
      begin
        circle(x3, y3 - 65, 4);
        floodfill(x3, y3 - 65, 1);
      end;
      m := readkey;
      if m = #80 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
        end;
        if y2 + 65 < 610 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65;
          y3 := y3 + 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #72 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
        end;
        if y2 - 65 > 90 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65;
          y3 := y3 - 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #79 then
        repeat
          setcolor(1);
          setfillstyle(1, 1);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 1);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 1);
          end;
          v := readkey;
          if v = #80  then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 0);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 15);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 15);
              end;
            end;
            if y2 + 65 < 610 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 + 65;
              y3 := y3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #72  then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 0);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 15);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 15);
              end;
            end;
            if y2 - 65 > 90 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 - 65;
              y3 := y3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #75 then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 0);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 15);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 15);
              end;
            end;
            if x2 - 65 > 410 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 - 65;
              x3 := x3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #77 then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 0);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if y3 + 65 < 610 then
              begin
                circle(x3, y3 + 65, 4);
                floodfill(x3, y3 + 65, 15);
              end;
              if y3 - 65 > 90 then
              begin
                circle(x3, y3 - 65, 4);
                floodfill(x3, y3 - 65, 15);
              end;
            end;
            if x2 + 65 < 930 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 + 65;
              x3 := x3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
        until  v = #27;
    until  m = #27;
  if cr = 'T' then
    repeat
      setcolor(1);
      setfillstyle(1, 1);
      if y3 + 65 < 610 then
      begin
        circle(x3, y3 + 65, 4);
        floodfill(x3, y3 + 65, 1);
      end;
      if y3 - 65 > 90 then
      begin
        circle(x3, y3 - 65, 4);
        floodfill(x3, y3 - 65, 1);
      end;
      if x3 + 65 < 930 then
      begin
        circle(x3 + 65, y3, 4);
        floodfill(x3 + 65, y3, 1);
      end;
      if x3 - 65 > 410 then
      begin
        circle(x3 - 65, y3, 4);
        floodfill(x3 - 65, y3, 1);
      end;
      if (x3 - 65 > 410)  and (y3 - 65 > 90) then
      begin
        circle(x3 - 65, y3 - 65, 4);
        floodfill(x3 - 65, y3 - 65, 1);
      end;
      if (x3 + 65 < 930) and (y3 - 65 > 90) then
      begin
        circle(x3 + 65, y3 - 65, 4);
        floodfill(x3 + 65, y3 - 65, 1);
      end;
      if (x3 + 65 < 930) and (y3 + 65 < 610) then
      begin
        circle(x3 + 65, y3 + 65, 4);
        floodfill(x3 + 65, y3 + 65, 1);
      end;
      if (x3 - 65 > 410) and (y3 + 65 < 610) then
      begin
        circle(x3 - 65, y3 + 65, 4);
        floodfill(x3 - 65, y3 + 65, 1);
      end;
      m := readkey;
      if m = #80  then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if y2 + 65 < 610 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65;
          y3 := y3 + 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #72  then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if y2 - 65 > 90 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65;
          y3 := y3 - 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #75 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if x2 - 65 > 410 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65;
          x3 := x3 - 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #81 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if (x2 + 65 < 930) and (y2 + 65 < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65;
          x3 := x3 + 65;
          y2 := y2 + 65;
          y3 := y3 + 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
        end;
      end;
      if m = #77 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if x2 + 65 < 930 then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65;
          x3 := x3 + 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #83 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if (x2 - 65 > 410) and (y2 + 65 < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65;
          x3 := x3 - 65;
          y2 := y2 + 65;
          y3 := y3 + 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
        end;
      end;
      if m = #71 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if (x2 - 65 > 410) and (y2 - 65 > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65;
          x3 := x3 - 65;
          y2 := y2 - 65;
          y3 := y3 - 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
        end;
      end;
      if m = #73 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 0);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 0);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 0);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if y3 + 65 < 610 then
          begin
            circle(x3, y3 + 65, 4);
            floodfill(x3, y3 + 65, 15);
          end;
          if y3 - 65 > 90 then
          begin
            circle(x3, y3 - 65, 4);
            floodfill(x3, y3 - 65, 15);
          end;
          if x3 - 65 > 410 then
          begin
            circle(x3 - 65, y3, 4);
            floodfill(x3 - 65, y3, 15);
          end;
          if x3 + 65 < 930 then
          begin
            circle(x3 + 65, y3, 4);
            floodfill(x3 + 65, y3, 15);
          end;
        end;
        setcolor(f);
        setfillstyle(1, f);
        if (x3 - 65 > 410)  and (y3 - 65 > 90) then
        begin
          circle(x3 - 65, y3 - 65, 4);
          floodfill(x3 - 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 - 65 > 90) then
        begin
          circle(x3 + 65, y3 - 65, 4);
          floodfill(x3 + 65, y3 - 65, f);
        end;
        if (x3 + 65 < 930) and (y3 + 65 < 610) then
        begin
          circle(x3 + 65, y3 + 65, 4);
          floodfill(x3 + 65, y3 + 65, f);
        end;
        if (x3 - 65 > 410) and (y3 + 65 < 610) then
        begin
          circle(x3 - 65, y3 + 65, 4);
          floodfill(x3 - 65, y3 + 65, f);
        end;
        if (x2 + 65 < 930) and (y2 - 65 > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65;
          x3 := x3 + 65;
          y2 := y2 - 65;
          y3 := y3 - 65;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
        end;
      end;
    until m = #27;
  z := 1;
  if cr = 'S' then
    repeat
      q := 1;
      setcolor(1);
      setfillstyle(1, 1);
      while q <= 8 do
      begin
        if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
        begin
          circle(x3 - 65 * q, y3 - 65 * q, 4);
          floodfill(x3 - 65 * q, y3 - 65 * q, 1);
        end;
        if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
        begin
          circle(x3 + 65 * q, y3 + 65 * q, 4);
          floodfill(x3 + 65 * q, y3 + 65 * q, 1);
        end;
        if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
        begin
          circle(x3 - 65 * q, y3 + 65 * q, 4);
          floodfill(x3 - 65 * q, y3 + 65 * q, 1);
        end;
        if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
        begin
          circle(x3 + 65 * q, y3 - 65 * q, 4);
          floodfill(x3 + 65 * q, y3 - 65 * q, 1);
        end;
        q := q + 1;
      end;
      m := readkey;
      if m = #32  then if z <= 8 then z := z + 1;
      if m = #81 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
        end;
        if (x2 + 65 * z < 930) and (y3 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #83 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
        end;
        if (x2 - 65 * z > 410) and (y2 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #71 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
        end;
        if (x2 - 65 * z > 410) and (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #73 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
        end;
        if (x2 + 65 * z < 930) and (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #79 then
        repeat
          q := 1;
          setcolor(1);
          setfillstyle(1, 1);
          while q <= 8 do
          begin
            if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
            begin
              circle(x3 - 65 * q, y3 - 65 * q, 4);
              floodfill(x3 - 65 * q, y3 - 65 * q, 1);
            end;
            if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
            begin
              circle(x3 + 65 * q, y3 + 65 * q, 4);
              floodfill(x3 + 65 * q, y3 + 65 * q, 1);
            end;
            if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
            begin
              circle(x3 - 65 * q, y3 + 65 * q, 4);
              floodfill(x3 - 65 * q, y3 + 65 * q, 1);
            end;
            if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
            begin
              circle(x3 + 65 * q, y3 - 65 * q, 4);
              floodfill(x3 + 65 * q, y3 - 65 * q, 1);
            end;
            q := q + 1;
          end;
          v := readkey;
          if v = #80  then
          begin
            for q := 1 to 8 do
            begin
              setcolor(f);
              setfillstyle(1, f);
              if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
              begin
                circle(x3 - 65 * q, y3 - 65 * q, 4);
                floodfill(x3 - 65 * q, y3 - 65 * q, f);
              end;
              if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 + 65 * q, y3 + 65 * q, 4);
                floodfill(x3 + 65 * q, y3 + 65 * q, f);
              end;
              if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 - 65 * q, y3 + 65 * q, 4);
                floodfill(x3 - 65 * q, y3 + 65 * q, f);
              end;
              if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
              begin
                circle(x3 + 65 * q, y3 - 65 * q, 4);
                floodfill(x3 + 65 * q, y3 - 65 * q, f);
              end;
            end;
            if y2 + 65 < 610 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 + 65;
              y3 := y3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #72  then
          begin
            for q := 1 to 8 do
            begin
              setcolor(f);
              setfillstyle(1, f);
              if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
              begin
                circle(x3 - 65 * q, y3 - 65 * q, 4);
                floodfill(x3 - 65 * q, y3 - 65 * q, f);
              end;
              if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 + 65 * q, y3 + 65 * q, 4);
                floodfill(x3 + 65 * q, y3 + 65 * q, f);
              end;
              if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 - 65 * q, y3 + 65 * q, 4);
                floodfill(x3 - 65 * q, y3 + 65 * q, f);
              end;
              if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
              begin
                circle(x3 + 65 * q, y3 - 65 * q, 4);
                floodfill(x3 + 65 * q, y3 - 65 * q, f);
              end;
            end;
            if y2 - 65 > 90 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 - 65;
              y3 := y3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #75 then
          begin
            for q := 1 to 8 do
            begin
              setcolor(f);
              setfillstyle(1, f);
              if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
              begin
                circle(x3 - 65 * q, y3 - 65 * q, 4);
                floodfill(x3 - 65 * q, y3 - 65 * q, f);
              end;
              if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 + 65 * q, y3 + 65 * q, 4);
                floodfill(x3 + 65 * q, y3 + 65 * q, f);
              end;
              if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 - 65 * q, y3 + 65 * q, 4);
                floodfill(x3 - 65 * q, y3 + 65 * q, f);
              end;
              if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
              begin
                circle(x3 + 65 * q, y3 - 65 * q, 4);
                floodfill(x3 + 65 * q, y3 - 65 * q, f);
              end;
            end;
            if x2 - 65 > 410 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 - 65;
              x3 := x3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #77 then
          begin
            for q := 1 to 8 do
            begin
              setcolor(f);
              setfillstyle(1, f);
              if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
              begin
                circle(x3 - 65 * q, y3 - 65 * q, 4);
                floodfill(x3 - 65 * q, y3 - 65 * q, f);
              end;
              if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 + 65 * q, y3 + 65 * q, 4);
                floodfill(x3 + 65 * q, y3 + 65 * q, f);
              end;
              if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
              begin
                circle(x3 - 65 * q, y3 + 65 * q, 4);
                floodfill(x3 - 65 * q, y3 + 65 * q, f);
              end;
              if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
              begin
                circle(x3 + 65 * q, y3 - 65 * q, 4);
                floodfill(x3 + 65 * q, y3 - 65 * q, f);
              end;
            end;
            if x2 + 65 < 930 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 + 65;
              x3 := x3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
        until  v = #27;
    until m = #27;
  if cr = 'L' then
    repeat
      b := f;
      q := 1;
      setcolor(1);
      setfillstyle(1, 1);
      while q <= 8 do
      begin
        if y3 + 65 * q < 610 then
        begin
          circle(x3, y3 + 65 * q, 4);
          floodfill(x3, y3 + 65 * q, 1);
        end;
        if y3 - 65 * q > 90 then
        begin
          circle(x3, y3 - 65 * q, 4);
          floodfill(x3, y3 - 65 * q, 1);
        end;
        if x3 + 65 * q < 930 then
        begin
          circle(x3 + 65 * q, y3, 4);
          floodfill(x3 + 65 * q, y3, 1);
        end;
        if x3 - 65 * q > 410 then
        begin
          circle(x3 - 65 * q, y3, 4);
          floodfill(x3 - 65 * q, y3, 1);
        end;
        q := q + 1;
      end;
      m := readkey;
      if m = #32  then if z <= 8 then z := z + 1;
      if m = #77 then
      begin
        for q := 1 to 8 do
        begin
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 + 65 * z < 930) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #75 then
      begin
        for q := 1 to 8 do
        begin
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 - 65 * z > 410)  then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #72 then
      begin
        for q := 1 to 8 do
        begin
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if  (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #80 then
      begin
        for q := 1 to 8 do
        begin
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if  (y2 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
    until m = #27;
  if cr = 'F' then
    repeat
      b := f;
      q := 1;
      setcolor(1);
      setfillstyle(1, 1);
      while q <= 8 do
      begin
        if y3 + 65 * q < 610 then
        begin
          circle(x3, y3 + 65 * q, 4);
          floodfill(x3, y3 + 65 * q, 1);
        end;
        if y3 - 65 * q > 90 then
        begin
          circle(x3, y3 - 65 * q, 4);
          floodfill(x3, y3 - 65 * q, 1);
        end;
        if x3 + 65 * q < 930 then
        begin
          circle(x3 + 65 * q, y3, 4);
          floodfill(x3 + 65 * q, y3, 1);
        end;
        if x3 - 65 * q > 410 then
        begin
          circle(x3 - 65 * q, y3, 4);
          floodfill(x3 - 65 * q, y3, 1);
        end;
        if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
        begin
          circle(x3 - 65 * q, y3 - 65 * q, 4);
          floodfill(x3 - 65 * q, y3 - 65 * q, 1);
        end;
        if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
        begin
          circle(x3 + 65 * q, y3 + 65 * q, 4);
          floodfill(x3 + 65 * q, y3 + 65 * q, 1);
        end;
        if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
        begin
          circle(x3 - 65 * q, y3 + 65 * q, 4);
          floodfill(x3 - 65 * q, y3 + 65 * q, 1);
        end;
        if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
        begin
          circle(x3 + 65 * q, y3 - 65 * q, 4);
          floodfill(x3 + 65 * q, y3 - 65 * q, 1);
        end;
        q := q + 1;
      end;
      m := readkey;
      if m = #32  then if z <= 8 then z := z + 1;
      if m = #77 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 + 65 * z < 930) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #75 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 - 65 * z > 410)  then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #72 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if  (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #80 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if  (y2 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if ((z mod 2) = 1) and (f = 15) then f := 0
          else if ((z mod 2) = 1) and (f = 0) then f := 15;
          z := 1;
        end
        else z := 1;
      end;
      if m = #81 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 + 65 * z < 930) and (y3 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #83 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 - 65 * z > 410) and (y2 + 65 * z < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          y2 := y2 + 65 * z;
          y3 := y3 + 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #71 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 - 65 * z > 410) and (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65 * z;
          x3 := x3 - 65 * z;
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
      if m = #73 then
      begin
        for q := 1 to 8 do
        begin
          setcolor(f);
          setfillstyle(1, f);
          if   (x3 - 65 * q > 410) and (y3 - 65 * q > 90) then
          begin
            circle(x3 - 65 * q, y3 - 65 * q, 4);
            floodfill(x3 - 65 * q, y3 - 65 * q, f);
          end;
          if  (x3 + 65 * q < 930) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 + 65 * q, y3 + 65 * q, 4);
            floodfill(x3 + 65 * q, y3 + 65 * q, f);
          end;
          if   (x3 - 65 * q > 410) and   (y3 + 65 * q < 610) then
          begin
            circle(x3 - 65 * q, y3 + 65 * q, 4);
            floodfill(x3 - 65 * q, y3 + 65 * q, f);
          end;
          if (x3 + 65 * q < 930)  and (y3 - 65 * q > 90) then
          begin
            circle(x3 + 65 * q, y3 - 65 * q, 4);
            floodfill(x3 + 65 * q, y3 - 65 * q, f);
          end;
          if b = 15 then
          begin
            setcolor(0);
            setfillstyle(1, 0);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 0);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 0);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 0);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 0);
            end;
          end;
          if b = 0 then
          begin
            setcolor(15);
            setfillstyle(1, 15);
            if y3 + 65 * q < 610 then
            begin
              circle(x3, y3 + 65 * q, 4);
              floodfill(x3, y3 + 65 * q, 15);
            end;
            if y3 - 65 * q > 90 then
            begin
              circle(x3, y3 - 65 * q, 4);
              floodfill(x3, y3 - 65 * q, 15);
            end;
            if x3 - 65 * q > 410 then
            begin
              circle(x3 - 65 * q, y3, 4);
              floodfill(x3 - 65 * q, y3, 15);
            end;
            if x3 + 65 * q < 930 then
            begin
              circle(x3 + 65 * q, y3, 4);
              floodfill(x3 + 65 * q, y3, 15);
            end;
          end;
          if b = 15 then b := 0
          else b := 15;
        end;
        if (x2 + 65 * z < 930) and (y2 - 65 * z > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65 * z;
          x3 := x3 + 65 * z;
          y2 := y2 - 65 * z;
          y3 := y3 - 65 * z;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          z := 1;
        end
        else z := 1;
      end;
    until m = #27;
  if cr = 'K' then
    repeat
      setcolor(1);
      setfillstyle(1, 1);
      if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
      begin
        circle(x3 - 65, y3 + 65 * 2, 4);
        floodfill(x3 - 65, y3 + 65 * 2, 1);
      end;
      if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
      begin
        circle(x3 + 65, y3 + 65 * 2, 4);
        floodfill(x3 + 65, y3 + 65 * 2, 1);
      end;
      if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
      begin
        circle(x3 + 65, y3 - 65 * 2, 4);
        floodfill(x3 + 65, y3 - 65 * 2, 1);
      end;
      if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
      begin
        circle(x3 - 65, y3 - 65 * 2, 4);
        floodfill(x3 - 65, y3 - 65 * 2, 1);
      end;
      if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
      begin
        circle(x3 - 65 * 2, y3 - 65, 4);
        floodfill(x3 - 65 * 2, y3 - 65, 1);
      end;
      if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
      begin
        circle(x3 + 65 * 2, y3 - 65, 4);
        floodfill(x3 + 65 * 2, y3 - 65, 1);
      end;
      if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
      begin
        circle(x3 + 65 * 2, y3 + 65, 4);
        floodfill(x3 + 65 * 2, y3 + 65, 1);
      end;
      if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
      begin
        circle(x3 - 65 * 2, y3 + 65, 4);
        floodfill(x3 - 65 * 2, y3 + 65, 1);
      end;
      m := readkey;
      if m = #80  then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (y2 + 65 < 610) and (x2 + 65 * 2 < 930) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65;
          y3 := y3 + 65;
          x2 := x2 + 65 * 2;
          x3 := x3 + 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #72  then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (y2 - 65 > 90) and (x2 - 65 * 2 > 410) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65;
          y3 := y3 - 65;
          x2 := x2 - 65 * 2;
          x3 := x3 - 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #75 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 - 65 * 2 > 410) and (y2 + 65 < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 + 65;
          y3 := y3 + 65;
          x2 := x2 - 65 * 2;
          x3 := x3 - 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #81 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 + 65 < 930) and (y2 + 65 * 2 < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65;
          x3 := x3 + 65;
          y2 := y2 + 65 * 2;
          y3 := y3 + 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #77 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 + 65 * 2 < 930) and (y2 - 65 > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          y2 := y2 - 65;
          y3 := y3 - 65;
          x2 := x2 + 65 * 2;
          x3 := x3 + 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #83 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 - 65 > 410) and (y2 + 65 * 2 < 610) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65;
          x3 := x3 - 65;
          y2 := y2 + 65 * 2;
          y3 := y3 + 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #71 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 - 65 > 410) and (y2 - 65 > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 - 65;
          x3 := x3 - 65;
          y2 := y2 - 65 * 2;
          y3 := y3 - 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #73 then
      begin
        if f = 15 then
        begin
          setcolor(0);
          setfillstyle(1, 0);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 0);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 0);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 0);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 0);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 0);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 0);
          end;
        end;
        if f = 0 then
        begin
          setcolor(15);
          setfillstyle(1, 15);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 15);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 15);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 15);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 15);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 15);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 15);
          end;
        end;
        if (x2 + 65 < 930) and (y2 - 65 * 2 > 90) then
        begin
          setcolor(f);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          x2 := x2 + 65;
          x3 := x3 + 65;
          y2 := y2 - 65 * 2;
          y3 := y3 - 65 * 2;
          setcolor(4);
          outtextXY(x2, y2, Copy(cr, 1, 1));
          if f = 15 then f := 0
          else f := 15;
        end;
      end;
      if m = #79 then
        repeat
          setcolor(1);
          setfillstyle(1, 1);
          if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
          begin
            circle(x3 - 65, y3 + 65 * 2, 4);
            floodfill(x3 - 65, y3 + 65 * 2, 1);
          end;
          if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
          begin
            circle(x3 + 65, y3 + 65 * 2, 4);
            floodfill(x3 + 65, y3 + 65 * 2, 1);
          end;
          if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 + 65, y3 - 65 * 2, 4);
            floodfill(x3 + 65, y3 - 65 * 2, 1);
          end;
          if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
          begin
            circle(x3 - 65, y3 - 65 * 2, 4);
            floodfill(x3 - 65, y3 - 65 * 2, 1);
          end;
          if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
          begin
            circle(x3 - 65 * 2, y3 - 65, 4);
            floodfill(x3 - 65 * 2, y3 - 65, 1);
          end;
          if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
          begin
            circle(x3 + 65 * 2, y3 - 65, 4);
            floodfill(x3 + 65 * 2, y3 - 65, 1);
          end;
          if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
          begin
            circle(x3 + 65 * 2, y3 + 65, 4);
            floodfill(x3 + 65 * 2, y3 + 65, 1);
          end;
          if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
          begin
            circle(x3 - 65 * 2, y3 + 65, 4);
            floodfill(x3 - 65 * 2, y3 + 65, 1);
          end;
          v := readkey;
          if v = #80  then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 0);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 0);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 0);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 15);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 15);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 15);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 15);
              end;
            end;
            if y2 + 65 < 610 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 + 65;
              y3 := y3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #72  then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 0);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 0);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 0);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 15);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 15);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 15);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 15);
              end;
            end;
            if y2 - 65 > 90 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              y2 := y2 - 65;
              y3 := y3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #75 then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 0);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 0);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 0);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 15);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 15);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 15);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 15);
              end;
            end;
            if x2 - 65 > 410 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 - 65;
              x3 := x3 - 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
          if v = #77 then
          begin
            if f = 15 then
            begin
              setcolor(0);
              setfillstyle(1, 0);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 0);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 0);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 0);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 0);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 0);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 0);
              end;
            end;
            if f = 0 then
            begin
              setcolor(15);
              setfillstyle(1, 15);
              if (y3 + 65 * 2 < 610) and (x3 - 65 > 410) then
              begin
                circle(x3 - 65, y3 + 65 * 2, 4);
                floodfill(x3 - 65, y3 + 65 * 2, 15);
              end;
              if (y3 + 65 * 2 < 610) and (x3 + 65 < 930) then
              begin
                circle(x3 + 65, y3 + 65 * 2, 4);
                floodfill(x3 + 65, y3 + 65 * 2, 15);
              end;
              if (x3 + 65 < 930) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 + 65, y3 - 65 * 2, 4);
                floodfill(x3 + 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 > 410) and (y3 - 65 * 2 > 90) then
              begin
                circle(x3 - 65, y3 - 65 * 2, 4);
                floodfill(x3 - 65, y3 - 65 * 2, 15);
              end;
              if (x3 - 65 * 2 > 410)  and (y3 - 65 > 90) then
              begin
                circle(x3 - 65 * 2, y3 - 65, 4);
                floodfill(x3 - 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 - 65 > 90) then
              begin
                circle(x3 + 65 * 2, y3 - 65, 4);
                floodfill(x3 + 65 * 2, y3 - 65, 15);
              end;
              if (x3 + 65 * 2 < 930) and (y3 + 65 < 610) then
              begin
                circle(x3 + 65 * 2, y3 + 65, 4);
                floodfill(x3 + 65 * 2, y3 + 65, 15);
              end;
              if (x3 - 65 * 2 > 410) and (y3 + 65 < 610) then
              begin
                circle(x3 - 65 * 2, y3 + 65, 4);
                floodfill(x3 - 65 * 2, y3 + 65, 15);
              end;
            end;
            if x2 + 65 < 930 then
            begin
              setcolor(f);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              x2 := x2 + 65;
              x3 := x3 + 65;
              setcolor(4);
              outtextXY(x2, y2, Copy(cr, 1, 1));
              if f = 15 then f := 0
              else f := 15;
            end;
          end;
        until  v = #27;
    until m = #27;
end.
