Program ex13;
var i: integer;
var num, media: real;

Begin
  for i:= 1 to 10 do begin
    write('Digite a ', i:0:0, '° nota: ');
    readLn(num);
    media := ((media * (i-1)) + num)/i;
  end;
  write('A média das notas inseridas é ', media:0:2);
End.