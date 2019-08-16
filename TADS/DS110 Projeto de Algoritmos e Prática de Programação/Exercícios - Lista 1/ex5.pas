Program ex5;

var anoNascimento, anoAtual, mesAtual, diaAtual, diaSemanaAtual, idade: integer;
Begin
  getdate(anoAtual, mesAtual, diaAtual, diaSemanaAtual);
  
  write('Digite seu ano de nascimento: ');
  readLn(anoNascimento);
  
  idade := anoAtual - anoNascimento;
  
  writeLn('Você tem ', idade:0:0, ' anos');
  
  if(idade >= 16) then
	  writeLn('Você já pode votar!')
  else
		writeLn('Você não pode votar!');
  if(idade >= 18) then
	  writeLn('Você já pode dirigir!')
  else
		writeLn('Você não pode dirigir!');
  
End.