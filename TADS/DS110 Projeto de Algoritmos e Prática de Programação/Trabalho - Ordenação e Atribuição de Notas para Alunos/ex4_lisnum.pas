program LISNUM;
type regis = record
  num:integer;
  nome:string[35];
  cpf:string[11];
  data:string[8];
  car:integer;
  notas:array[1..6] of integer;
  som,cla_ger,cla_car,car_cla:integer
end;

type cc=record
  pf:integer;
  c_chave:string[37];
end;

Vetor = array[1..2000] of cc;

var reg2:regis;
var NO:STRING[15];
var VV:Vetor;
var arq2:file of regis;
var CAR:STRING[2];
var a,b,c,p,e,OO,ant:integer;
var t, t2: integer;
var OOA:STRING[1];
var TOTC:ARRAY[0..12] OF INTEGER;
var option: char;
var aux: string;

procedure ordem(var vet:vetor; t:integer);
var aux:cc;
var tot,a,jt:integer;
var tro:boolean;
begin
  tot:=t;
  jt:=1;
  repeat
    tro:=true;
    tot:=tot-jt;
    for a:=1 to tot do
    if(vet[a].c_chave>vet[a+1].c_chave) then //<<=========
    begin
      aux:=vet[a];
      vet[a]:=vet[a+1];
      vet[a+1]:=aux;
      tro:=false;
      jt:=1;
    end
    else
    jt:=jt+1;
  until tro;
end;

begin
  //Seleciona a ordenação
  REPEAT
    writeLn('Pelo que você deseja ordenar?');
    writeLn('1 - Inscrição');
    writeLn('2 - Nome (Ordem alfabética)');
    writeLn('3 - CPF');
    writeLn('4 - Cargo + Nome (Ordem alfabética)');
    readLn(option);
    
    if (option <= '0') OR (option >= '5') then begin
      writeLn('Opção inválida!');
    end;
  UNTIL (option > '0') and (option < '5');
  
  clrscr;
  assign(arq2,'CAND.IND');
  reset(arq2);
  T := 0;
  
  REPEAT
    READ(ARQ2,REG2);
    writeLn('somando ao valor de T (', T, ') mais um, resultando em:', T+1);
    T:= T + 1;
    VV[T].Pf := T;
    if (option = '1') then begin
      STR(REG2.NUM:4,VV[T].C_CHAVE);
    end;
    if (option = '2') then begin
      VV[T].C_CHAVE := REG2.NOME;
    end;
    if (option = '3') then begin
      VV[T].C_CHAVE := REG2.CPF;
    end;
    if (option = '4') then begin
      STR(REG2.CAR:2, AUX);
      VV[T].C_CHAVE := AUX + REG2.NOME;
    end;
    //se op=1 c_chave=nome,se op=2 c_chave=cpf e se op=3 c_chave car+nome
  UNTIL EOF(ARQ2);
  
  
  WRITE('ORDENANDO...');
  ORDEM(VV,T);
  WRITELN('     ...FIM DA ORDENACAO.');
  
  
  FOR A:=1 TO T DO
  begin
    SEEK(ARQ2,VV[A].Pf-1);
    read(arq2,reg2);
    TOTC[REG2.CAR]:=TOTC[REG2.CAR]+1;
    begin
      if(B MOD 35 = 0)  THEN
      BEGIN
        write('enter para continuar');
        readln;
        clrscr;
        write('  NUM N O M E                             CPF         NASCIMENTO CS  N1');
        WRITELN('  N2  N3  N4  N5  N6  SO   CG  CC CV');
      end;
      B:=B+1;
      write(reg2.num:5,' ',reg2.nome,' ',REG2.CPF,' ',copy(reg2.data,7,2),'/',copy(reg2
      .data,5,2),'/',copy(reg2.data,1,4),reg2.car:3);
      FOR E:=1 TO 6 DO
      WRITE(REG2.NOTAS[E]:4);
      WRITELN(reg2.soM:4,reg2.clA_gER:5,reg2.clA_cAR:4,reg2.cAR_clA:3);
    END;
  end;
  close(arq2);
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
  CLRSCR;
  OO:=0;
  FOR B:=1 TO 12 DO
  BEGIN
    writeln('CARGO =',B:2,' --> lidos=',TOTC[B]:5);
    OO:=OO+TOTC[B];
  END;
  WRITELN('TOTAL--->>>>',OO:5,' LIDOS          ENTER PARA ENCERRAR');
  readln;
end.