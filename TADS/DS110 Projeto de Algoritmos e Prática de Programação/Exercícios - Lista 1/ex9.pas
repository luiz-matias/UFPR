Program ex9;

var num: real;
var i: integer;
Begin
	write('Digite um n�mero maior que 0 e menor que 11: ');
	readLn(num);
	while (num <= 0) or (num >= 11) do begin
		write('O n�mero digitado n�o � v�lido. Por favor, digite novamente: ');
		readLn(num);
	end;
	
	for i:= 1 to 10 do writeLn(num*i:3:1);
	readLn();
End.