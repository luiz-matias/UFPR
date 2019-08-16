Program ex16;

var candA, candB, candC, branco, invalido, totalDeVotos: integer;
var voto: char;
Begin
  
  candA := 0;
  candB := 0;
  candC := 0;
  branco := 0;
  invalido := 0;
  totalDeVotos := 0;
  
  while(voto <> '*') do begin
    write('Digite seu voto: ');
    readLn(voto);
    if(voto <> '*') then begin
      if (voto = 'A') then candA := candA + 1
      else if (voto = 'B') then candB := candB + 1
      else if (voto = 'C') then candC := candC + 1
      else if (voto = ' ') then branco := branco + 1
      else invalido := invalido + 1;
      
      totalDeVotos := totalDeVotos + 1;
    end;
  end;
  
  //TODO Calcular porcentagens
  writeLn('Total de votos: ', totalDeVotos:0:0);
  writeLn('Votos para o candidato A: ', candA:0:0, ' (', 0, '%)');
  writeLn('Votos para o candidato B: ', candB:0:0, ' (', 0, '%)');
  writeLn('Votos para o candidato C: ', candC:0:0, ' (', 0, '%)');
  writeLn('Votos em branco: ', branco:0:0, ' (', 0, '%)');
  writeLn('Votos inválidos: ', invalido:0:0, ' (', 0, '%)');
  
End.