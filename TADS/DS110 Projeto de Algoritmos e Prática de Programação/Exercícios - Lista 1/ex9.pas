Program ex9;

var num: real;
var i: integer;
Begin
	write('Digite um número maior que 0 e menor que 11: ');
	readLn(num);
	while (num <= 0) or (num >= 11) do begin
		write('O número digitado não é válido. Por favor, digite novamente: ');
		readLn(num);
	end;
	
	for i:= 1 to 10 do writeLn(num*i:3:1);
	readLn();
End.