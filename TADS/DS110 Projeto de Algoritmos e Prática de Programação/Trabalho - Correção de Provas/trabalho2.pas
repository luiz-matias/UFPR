Program Pzim ;

var register: string[64];
var answers: string[60];
var option, answerLetter: char;
var i, counter, corrects, wrongs, blanks, score: integer;
var average: real;
var arq: text;

Begin
  repeat
    writeLn('Você deseja digitar as 60 questões do gabarito (opção 1) ou importá-las do arquivo gabarito.txt (opção 2)? (digite 1 ou 2)');
    readLn(option);
    if (NOT (option = '1') AND NOT (option = '2')) then begin
      writeLn('Opção inválida!');
    end;
  until (option = '1') OR (option = '2');
  
  if (option = '1') then begin
    for i := 0 to 59 do begin
      repeat
        write('Digite a resposta da ', i+1, '° questão: ');
        readLn(answerLetter);
        answerLetter := upcase(answerLetter);
          if (answerLetter < 'A') OR (answerLetter > 'E') then begin
            writeLn('Opção inválida!');
          end;
        until ((answerLetter >= 'A') AND (answerLetter <= 'E'));
        answers[i] := answerLetter;
      end;
      
    end else begin
      assign(arq, 'gabarito.txt');
      reset(arq);
      for i := 0 to 59 do begin
      	read(arq, answers[i]);
      end;
      close(arq);
    end;
    
    write('Gabarito: ');
    for i := 0 to 60 do begin
      write(answers[i]);
    end;
    writeLn();
    
    repeat
      writeLn('Quais provas você deseja corrigir? (digite 1 ou 2)');
      readLn(option);
      if (NOT (option = '1') AND NOT (option = '2')) then begin
        writeLn('Opção inválida!');
      end;
    until (option = '1') OR (option = '2');
    
    assign(arq, concat('prova', option, '.txt'));
    reset(arq);
    
    while(NOT EOF(arq)) do begin
      counter := counter + 1;
      readLn(arq, register);
      
      corrects := 0;
      wrongs := 0;
      blanks := 0;
      score := 0;
      
      for i := 0 to 59 do begin
        if(register[i+5] = answers[i]) then begin
          //acertou
          corrects := corrects + 1;
        end else if (register[i+5] >= 'A') AND (register[i+5] <= 'E') then begin
          //errou
          wrongs := wrongs + 1;
        end else begin
          //resposta em branco
          blanks := blanks + 1;
        end;
      end;
      score := corrects * 2;
      average := average + score;
      
      write('Prova ', register[1], register[2], register[3], register[4], ': ');
      writeLn(corrects:2:0, ' acertos, ', wrongs:2:0, ' erros, ', blanks:2:0, ' em branco. NOTA: ', score);
      
      if(counter mod 30 = 0) then begin
        readLn();
      end;
      
    end;
    close(arq);
    average := average / counter;
    
    writeLn('Total de candidatos: ', counter, '. Média de nota: ', average:3:3, '.');
    
  End.