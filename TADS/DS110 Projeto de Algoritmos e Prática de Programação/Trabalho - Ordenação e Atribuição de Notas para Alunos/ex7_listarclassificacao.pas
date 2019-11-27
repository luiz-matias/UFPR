program LISNUM;
type Aluno = record
  num:integer;
  nome:string[35];
  cpf:string[11];
  data:string[8];
  car:integer;
  notas:array[1..6] of integer;
  som,cla_ger,cla_car,car_cla:integer
end;

type Cargo = record
  nome:string[26];
  vagas:integer;
end;
var cargos: array[0..12] of Cargo;
var code: integer;
var register: string[32];
var e: integer;

type cc=record
  pf:integer;
  c_chave:string[37];
end;

Vetor = array[1..2000] of cc;

var alunoData:Aluno;
var VV:Vetor;
var arq2: file of Aluno;
var i, t: integer;
var cargoAnterior : integer;
var option: char;
var aux: string;
var arq: text;

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
    writeLn('O que você deseja listar?');
    writeLn('1 - Candidatos classificados nas vagas (Ordem alfabética)');
    writeLn('2 - Classificação por cargo');
    writeLn('3 - Classificação geral');
    readLn(option);
    
    if (option <= '0') OR (option >= '4') then begin
      writeLn('Opção inválida!');
    end;
  UNTIL (option > '0') and (option < '4');
  
  clrscr;
  assign(arq2, 'CAND.IND');
  reset(arq2);
  T := 0;
  
  REPEAT
    READ(arq2, alunoData);
    T:= T + 1;
    VV[T].Pf := T;
    if (option = '1') then begin
      STR(alunoData.car_cla:2, AUX);
      VV[T].C_CHAVE := AUX + alunoData.NOME;
    end;
    if (option = '2') then begin
      STR(alunoData.car:2, VV[T].C_CHAVE);
      STR(alunoData.cla_car:3, AUX);
      VV[T].C_CHAVE := VV[T].C_CHAVE + AUX;
    end;
    if (option = '3') then begin
      STR(alunoData.cla_ger:4,VV[T].C_CHAVE);
    end;
    //se op=1 c_chave=nome,se op=2 c_chave=cpf e se op=3 c_chave car+nome
  UNTIL EOF(ARQ2);
  
  
  writeLn('Ordenando resultados...');
  ORDEM(VV,T);
  writeLn('Resultados ordenados! Aperte enter para continuar.');
  readLn();
  clrscr();
  
  assign(arq, 'vagas.txt');
  reset(arq);
  i := 0;
  while(NOT EOF(arq)) do begin
    readLn(arq, register);
    val(copy(register, 1, 2), code, e);
    cargos[code].nome := copy(register, 3, 26);
    val(copy(register, 30, 2), cargos[code].vagas, e);
    i := i + 1;
  end;
  close(arq);
  
  
  for i := 1 to T do begin
    seek(arq2, VV[i].pf-1);
    read(arq2, alunoData);
    
    if (option = '1') then begin
      
      if (alunoData.car_cla <> 0) AND (alunoData.car <> cargoAnterior) then begin
        if (cargoAnterior <> 0) then begin
          writeLn('Aperte Enter para continuar');
          readLn();
          clrscr();
        end;
        cargoAnterior := alunoData.car;
        writeLn('CARGO: ', alunoData.car:2, ' ', cargos[alunoData.car].nome);
        writeLn();
        writeLn(' ORD INSC NOME                                SOM  N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVAÇÃO');
      end;
      
      if (alunoData.car_cla <> 0) then begin
        write(i:4, ' ', alunoData.num:4, ' ', alunoData.nome, ' ');
        write(alunoData.som:3,' ', alunoData.notas[4]:3, ' ', alunoData.notas[5]:3, ' ', alunoData.notas[3]:3, ' ', alunoData.notas[2]:3, ' ', alunoData.notas[6]:3, ' ', alunoData.notas[1]:3, ' ');
        write(copy(alunoData.data,7,2), '/', copy(alunoData.data,5,2), '/', copy(alunoData.data,1,4), ' ');
        write(alunoData.car:3, ' ');
        writeLn('CLAS CAR=', alunoData.car_cla);
      end;
    end;
    
    if (option = '2') then begin
      
      if (alunoData.car <> cargoAnterior) then begin
        if (cargoAnterior <> 0) then begin
          writeLn('Aperte Enter para continuar');
          readLn();
          clrscr();
        end;
        cargoAnterior := alunoData.car;
        writeLn('CARGO: ', alunoData.car:2, ' ', cargos[alunoData.car].nome);
        writeLn();
        writeLn(' ORD INSC NOME                                SOM  N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVAÇÃO');
      end;
      
      write(alunoData.cla_car:4, ' ', alunoData.num:4, ' ', alunoData.nome, ' ');
      write(alunoData.som:3,' ', alunoData.notas[4]:3, ' ', alunoData.notas[5]:3, ' ', alunoData.notas[3]:3, ' ', alunoData.notas[2]:3, ' ', alunoData.notas[6]:3, ' ', alunoData.notas[1]:3, ' ');
      write(copy(alunoData.data,7,2), '/', copy(alunoData.data,5,2), '/', copy(alunoData.data,1,4), ' ');
      write(alunoData.car:3, ' ');
      
      if (alunoData.car_cla <> 0) then begin
        write('CLAS CAR=', alunoData.car_cla);
      end;
      writeLn();
      
    end;
    
    if (option = '3') then begin
      
      if (i = 1) OR (i MOD 35 = 0) then begin
        if (i <> 1) then begin
          writeLn('Aperte Enter para continuar');
          readLn();
          clrscr();
        end;
        writeLn(' ORD INSC NOME                                SOM  N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVAÇÃO');
      end;
      
      write(i:4, ' ', alunoData.num:4, ' ', alunoData.nome, ' ');
      write(alunoData.som:3,' ', alunoData.notas[4]:3, ' ', alunoData.notas[5]:3, ' ', alunoData.notas[3]:3, ' ', alunoData.notas[2]:3, ' ', alunoData.notas[6]:3, ' ', alunoData.notas[1]:3, ' ');
      write(copy(alunoData.data,7,2), '/', copy(alunoData.data,5,2), '/', copy(alunoData.data,1,4), ' ');
      write(alunoData.car:3, ' ');
      
      if (alunoData.car_cla <> 0) then begin
        write('CLAS CAR=', alunoData.car_cla);
      end;
      writeLn();
    end;
    
  end;
  
  close(arq2);
  readln;
end.