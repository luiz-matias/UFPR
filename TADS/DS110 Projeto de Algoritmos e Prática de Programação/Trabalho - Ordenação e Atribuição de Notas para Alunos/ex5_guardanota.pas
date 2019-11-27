Program guardanota;
var register: string[23];
type Nota = record
  code:integer;
  n1:integer;
  n2:integer;
  n3:integer;
  n4:integer;
  n5:integer;
  n6:integer;
end;
type Aluno = record
  num:integer;
  nome:string[35];
  cpf:string[11];
  data:string[8];
  car:integer;
  notas:array[1..6] of integer;
  soma,cla_ger,cla_car,car_cla:integer
end;
type Index = record
  num: integer;
  pf: integer;
end;
var indexData: Index;
var indexes: array[0..1014] of Index;
var alunoData: Aluno;
var alunos: array[0..1014] of Aluno;
var notas: array [0..1014] of Nota;
var i, j, k: integer;
var arq: text;
var arq2: file of Aluno;
var aux: integer;
var soma: integer;

begin
  writeLn('Iniciando leitura de notas...');
  
  assign(arq, 'notas.txt');
  reset(arq);
  i := 0;
  while(NOT EOF(arq)) do begin
    readLn(arq, register);
    val(copy(register, 1, 4), notas[i].code, aux);
    val(copy(register, 5, 3), notas[i].n1, aux);
    val(copy(register, 8, 3), notas[i].n2, aux);
    val(copy(register, 11, 3), notas[i].n3, aux);
    val(copy(register, 14, 3), notas[i].n4, aux);
    val(copy(register, 17, 3), notas[i].n5, aux);
    val(copy(register, 20, 3), notas[i].n6, aux);
    i := i + 1;
  end;
  close(arq);
  
  writeLn('Notas lidas! Aperte enter para continuar.');
  readLn();
  clrscr();
  
  writeLn('Indexando lista de candidatos...');
  assign(arq2, 'CAND.IND');
  reset(arq2);
  i := 0;
  while(NOT EOF(arq2)) do begin
    read(arq2, alunoData);
    indexData.num := alunoData.num;
    indexData.pf := i;
    indexes[i] := indexData;
    writeLn('Aluno n° ', indexes[i].num:4, ' tem  a posição física n° ', indexes[i].pf:4);
    i := i + 1;
  end;
  writeLn('Lista indexada! Aperte enter para continuar.');
  readLn();
  clrscr();
  
  writeLn('Atribuindo notas aos alunos...');
  for i := 0 to 1013 do begin
    for j := 0 to 1013 do begin
      if(indexes[j].num = notas[i].code) then begin
        seek(arq2, indexes[j].pf);
        read(arq2, alunoData);
        alunoData.notas[1] := notas[i].n1;
        alunoData.notas[2] := notas[i].n2;
        alunoData.notas[3] := notas[i].n3;
        alunoData.notas[4] := notas[i].n4;
        alunoData.notas[5] := notas[i].n5;
        alunoData.notas[6] := notas[i].n6;
        
        soma := 0;
        for k := 1 to 6 do begin
          soma := soma + alunoData.notas[k];
        end;
        alunoData.soma := soma;
        
        seek(arq2, indexes[j].pf);
        write(arq2, alunoData);
        writeLn('Aluno n° ', alunoData.num, ' recebeu sua nota com sucesso!');
        break;
      end;
    end;
  end;
  writeLn('Notas atribuídas aos alunos! Aperte enter para encerrar.');
  readLn();
  
end.