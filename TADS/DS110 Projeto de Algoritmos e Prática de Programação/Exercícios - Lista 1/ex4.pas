Program ex3;

var a, b, c: string[30];
Begin
	write('Digite o valor do 1� nome (m�x. 30 caracteres): ');
	readLn(a);
	write('Digite o valor do 2� nome (m�x. 30 caracteres): ');
	readLn(b);
	write('Digite o valor do 3� nome (m�x. 30 caracteres): ');
	readLn(c);
	writeLn();
	writeLn('Segue os nomes digitados em ordem alfab�tica: ');
	writeLn('OBS, o algoritmo tamb�m considera ordena��o de letras mai�sculas e min�sculas baseado na tabela ASCII!');
  writeLn();

	//OBS: Estou ciente que poderia ter utilizado um algoritmo de
	//ordena��o aqui, mas como o exerc�cio pedia apenas 3 n�meros
	//e estamos no in�cio do semestre, resolvi utilizar v�rios
	//IF's para simplificar a explica��o para alguns amigos
	//que estou ajudando
	
	if(a > b) and (b > c) then begin
		//a > b > c
		writeLn(c);
		writeLn(b);
		writeLn(a);
	end else if(a > c) and (c > b) then begin
		//a > c > b
		writeLn(b);
		writeLn(c);
		writeLn(a);	
	end else if(b > a) and (a > c) then begin
		//b > a > c
		writeLn(c);
		writeLn(a);
		writeLn(b);			
	end else if(b > c) and (c > a) then begin
		//b > c > a
		writeLn(a);
		writeLn(c);
		writeLn(b);	
	end else if(c > a) and (a > b) then begin
		//c > a > b
		writeLn(b);
		writeLn(a);
		writeLn(c);	
	end else if(c > b) and (b > a) then begin
		//c > b > a
		writeLn(a);
		writeLn(b);
		writeLn(c);
	end
End.