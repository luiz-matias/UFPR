Program ex15;

var numeroAleatorio, numeroChutado, tentativas: integer;
Begin
	numeroAleatorio := random(100);
	numeroChutado := -1;
	tentativas := 0;	
	
	while(numeroAleatorio <> numeroChutado) do begin
		tentativas := tentativas + 1;
		write('Digite um n�mero: ');
		readLn(numeroChutado);
		if(numeroChutado = numeroAleatorio) then
			writeLn('Voc� acertou o n�mero!')
		else if(numeroChutado > numeroAleatorio) then
			writeLn('O n�mero � menor.')
		else
			writeLn('O n�mero � maior.');
	end;
	
	writeLn('Voc� precisou de ', tentativas:0:0, ' tentativas para acertar o n�mero!');
	
End.