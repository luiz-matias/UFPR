Program ex14;
var i: integer;
var num, media: real;

Begin

	while (num >= 0) do begin
		i := i + 1;
		write('Digite a ', i:0:0, '� nota: ');
    readLn(num);
    if(num >=0) then
	    media := ((media * (i-1)) + num)/i
	  else
	  	i:= i -1;
	end;
	writeLn('Voc� digitou ', i:0:0, ' n�meros.');
  write('A m�dia das notas inseridas � ', media:0:2);
End.