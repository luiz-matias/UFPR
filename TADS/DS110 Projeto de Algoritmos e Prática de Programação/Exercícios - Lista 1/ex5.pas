Program ex5;

var anoNascimento, anoAtual, mesAtual, diaAtual, diaSemanaAtual, idade: integer;
Begin
  getdate(anoAtual, mesAtual, diaAtual, diaSemanaAtual);
  
  write('Digite seu ano de nascimento: ');
  readLn(anoNascimento);
  
  idade := anoAtual - anoNascimento;
  
  writeLn('Voc� tem ', idade:0:0, ' anos');
  
  if(idade >= 16) then
	  writeLn('Voc� j� pode votar!')
  else
		writeLn('Voc� n�o pode votar!');
  if(idade >= 18) then
	  writeLn('Voc� j� pode dirigir!')
  else
		writeLn('Voc� n�o pode dirigir!');
  
End.