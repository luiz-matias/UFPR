Program ex6;

var num1, num2, resultado: real;
var operador: char;
Begin
  write('Digite o primeiro n�mero: ');
  readLn(num1);
  write('Digite o operador(+, -, * ou /): ');
  readLn(operador);
  write('Digite o segundo n�mero: ');
  readLn(num2);
  
  if(operador = '+') or (operador = '-') or (operador = '*') or (operador = '/') then begin    
    if(operador = '+') then begin
      resultado := num1 + num2;
    end else if (operador = '-') then begin
      resultado := num1 - num2;
    end else if (operador = '*') then begin
      resultado := num1 * num2;
    end else if (operador = '/') then begin
    	if(num2 = 0) then begin
				writeLn('N�o � poss�vel dividir por zero!');
				resultado := 0;
			end else resultado := num1 / num2;
    end;
    writeLn('O resultado de ', num1:0:2,' ', operador,' ', num2:0:2, ' � ', resultado:0:2);
  end else
  	writeLn('Operador inv�lido! Os �nicos operadores aceitos s�o: +, -, * ou /');
  
End.