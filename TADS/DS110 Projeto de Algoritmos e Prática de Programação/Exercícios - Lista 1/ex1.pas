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
		writeLn('N�o h� ra�zes reais para os valores fornecidos.')
	else
		if(delta = 0) then begin
			x1 := (-b + sqrt(delta)) / (2 * a);
			writeLn('Ra�z encontrada: ', x1:3:2);
		end
		else begin
			x1 := (-b + sqrt(delta)) / (2 * a);
			x2 := (-b - sqrt(delta)) / (2 * a);
			writeLn('Ra�zes encontradas: ', x1:3:2, ' e ', x2:3:2);
		end;
	
End.