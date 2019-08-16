Program ex3;

var a, b, c: integer;
Begin
	write('Digite o valor do 1° número: ');
	readLn(a);
	write('Digite o valor do 2° número: ');
	readLn(b);
	write('Digite o valor do 3° número: ');
	readLn(c);
	writeLn();
	writeLn('Segue os números digitados em ordem decrescente: ');
	
	//OBS: Estou ciente que poderia ter utilizado um algoritmo de
	//ordenação aqui, mas como o exercício pedia apenas 3 números
	//e estamos no início do semestre, resolvi utilizar vários
	//IF's para simplificar a explicação para alguns amigos
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