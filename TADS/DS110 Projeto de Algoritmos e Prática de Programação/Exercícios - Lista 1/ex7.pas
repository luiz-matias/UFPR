Program ex7;

var altura, peso, imc: real;
Begin
  write('Digite sua altura (em m): ');
  readLn(altura);
  write('Digite seu peso (em kg): ');
  readLn(peso);
  
  imc := peso/(altura*altura);
  
  if(imc < 18.5) then
  	writeLn('Voc� est� abaixo do peso!')
  else if (imc > 18.5) and (imc <= 25) then
  	writeLn('Voc� est� no peso ideal!')
  else if (imc > 25) and (imc <= 30) then
  	writeLn('Voc� est� acima do peso!')
  else if (imc > 30) then
  	writeLn('Voc� est� obeso!')
		  
End.