Program Ex1;
	var a, b, c, delta, x1, x2 : real;

Begin
	write('Digite o valor de a: ');
	readLn(a);
	write('Digite o valor de b: ');
	readLn(b);
	write('Digite o valor de c: ');
	readLn(c);
	
	delta := b * b - 4 * a * c;
	
	if(delta < 0) then
		writeLn('Não há raízes reais para os valores fornecidos.')
	else
		if(delta = 0) then begin
			x1 := (-b + sqrt(delta)) / (2 * a);
			writeLn('Raíz encontrada: ', x1:3:2);
		end
		else begin
			x1 := (-b + sqrt(delta)) / (2 * a);
			x2 := (-b - sqrt(delta)) / (2 * a);
			writeLn('Raízes encontradas: ', x1:3:2, ' e ', x2:3:2);
		end;
	
End.