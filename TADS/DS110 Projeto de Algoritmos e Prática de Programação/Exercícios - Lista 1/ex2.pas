Program ex2;

var preco: real;
var codigo: integer;

Begin
	write('Digite o pre�o do produto: ');
	readLn(preco);
	write('Digite o c�digo de origem do produto: ');
	readLn(codigo);
	
	if(codigo = 1) then
		writeLn('O pre�o do produto � R$',preco:0:2, ', e sua preced�ncia � do Sul')
	else if (codigo>1) and (codigo<5) then
		writeLn('O pre�o do produto � R$',preco:0:2, ', e sua preced�ncia � do Norte')
	else if (codigo > 4) and (codigo < 10) then
		writeLn('O pre�o do produto � R$',preco:0:2, ', e sua preced�ncia � do Sudeste')
	else if (codigo > 9) and (codigo < 14) then
		writeLn('O pre�o do produto � R$',preco:0:2, ', e sua preced�ncia � do Norte.')
	else if (codigo > 14) then
		writeLn('O pre�o do produto � R$',preco:0:2, ', e sua preced�ncia � de outra regi�o.')
	else
		writeLn('O pre�o do produto � R$',preco:0:2, ', e o mesmo foi importado.');
End.