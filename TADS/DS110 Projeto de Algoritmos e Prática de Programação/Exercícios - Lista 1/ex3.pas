Program ex3;

var a, b, c: integer;
Begin
	write('Digite o valor do 1� n�mero: ');
	readLn(a);
	write('Digite o valor do 2� n�mero: ');
	readLn(b);
	write('Digite o valor do 3� n�mero: ');
	readLn(c);
	writeLn();
	writeLn('Segue os n�meros digitados em ordem decrescente: ');
	
	//OBS: Estou ciente que poderia ter utilizado um algoritmo de
	//ordena��o aqui, mas como o exerc�cio pedia apenas 3 n�meros
	//e estamos no in�cio do semestre, resolvi utilizar v�rios
	//IF's para simplificar a explica��o para alguns amigos
	//que estou ajudando
	
	if(a > b) and (b > c) then begin
		//a > b > c
		writeLn(a:2:0);
		writeLn(b:2:0);
		writeLn(c:2:0);
	end else if(a > c) and (c > b) then begin
		//a > c > b
		writeLn(a:2:0);
		writeLn(c:2:0);
		writeLn(b:2:0);	
	end else if(b > a) and (a > c) then begin
		//b > a > c
		writeLn(b:2:0);
		writeLn(a:2:0);
		writeLn(c:2:0);			
	end else if(b > c) and (c > a) then begin
		//b > c > a
		writeLn(b:2:0);
		writeLn(c:2:0);
		writeLn(a:2:0);	
	end else if(c > a) and (a > b) then begin
		//c > a > b
		writeLn(c:2:0);
		writeLn(a:2:0);
		writeLn(b:2:0);	
	end else if(c > b) and (b > a) then begin
		//c > b > a
		writeLn(c:2:0);
		writeLn(b:2:0);
		writeLn(a:2:0);
	end
End.