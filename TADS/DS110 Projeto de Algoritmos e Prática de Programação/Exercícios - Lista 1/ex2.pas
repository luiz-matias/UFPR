Program ex2;

var preco: real;
var codigo: integer;

Begin
	write('Digite o preço do produto: ');
	readLn(preco);
	write('Digite o código de origem do produto: ');
	readLn(codigo);
	
	if(codigo = 1) then
		writeLn('O preço do produto é R$',preco:0:2, ', e sua precedência é do Sul')
	else if (codigo>1) and (codigo<5) then
		writeLn('O preço do produto é R$',preco:0:2, ', e sua precedência é do Norte')
	else if (codigo > 4) and (codigo < 10) then
		writeLn('O preço do produto é R$',preco:0:2, ', e sua precedência é do Sudeste')
	else if (codigo > 9) and (codigo < 14) then
		writeLn('O preço do produto é R$',preco:0:2, ', e sua precedência é do Norte.')
	else if (codigo > 14) then
		writeLn('O preço do produto é R$',preco:0:2, ', e sua precedência é de outra região.')
	else
		writeLn('O preço do produto é R$',preco:0:2, ', e o mesmo foi importado.');
End.