Program ex15;

var numeroAleatorio, numeroChutado, tentativas: integer;
Begin
	numeroAleatorio := random(100);
	numeroChutado := -1;
	tentativas := 0;	
	
	while(numeroAleatorio <> numeroChutado) do begin
		tentativas := tentativas + 1;
		write('Digite um número: ');
		readLn(numeroChutado);
		if(numeroChutado = numeroAleatorio) then
			writeLn('Você acertou o número!')
		else if(numeroChutado > numeroAleatorio) then
			writeLn('O número é menor.')
		else
			writeLn('O número é maior.');
	end;
	
	writeLn('Você precisou de ', tentativas:0:0, ' tentativas para acertar o número!');
	
End.