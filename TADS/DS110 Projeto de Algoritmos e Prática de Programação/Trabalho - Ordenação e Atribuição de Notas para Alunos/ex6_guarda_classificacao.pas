Program guardaclassificacao;

type cc = record
  pf:integer;
  c_chave:string[29];
end;
Vetor = array[0..1014] of cc;
var VV:Vetor;

type Cargo = record
  nome:string[26];
  vagas:integer;
end;
var cargos: array[0..12] of Cargo;
var vagasOcupadas: array[0..12] of integer;
var code: integer;

type Aluno = record
  num:integer;
  nome:string[35];
  cpf:string[11];
  data:string[8];
  car:integer;
  notas:array[1..6] of integer;
  soma,cla_ger,cla_car,car_cla:integer
end;

var alunoData: Aluno;
var aux: string;
var dataSum: integer;
var data: integer;

var register: string[32];
var i, j, k: integer;
var arq: text;
var arq2: file of Aluno;
var e: integer;

procedure ordem(var vet:vetor; t:integer);
var aux:cc;
tot,a,jt:integer;
tro:boolean;
begin
  tot:=t;
  jt:=1;
  repeat
    tro:=true;
    tot:=tot-jt;
    for a:=1 to tot do
    if(vet[a].c_chave<vet[a+1].c_chave) then begin
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
  writeLn('Iniciando leitura de vagas...');
  
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
  
  writeLn('Vagas lidas! Aperte enter para continuar.');
  readLn();
  clrscr;
  
  
  assign(arq2,'CAND.IND');
  reset(arq2);
  i:=0;
  repeat
    read(arq2, alunoData);
    begin
      VV[i].pf := i;
      
      str(alunoData.soma:3, aux);
      VV[i].c_chave := aux;
      str(alunoData.notas[4]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      str(alunoData.notas[5]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      str(alunoData.notas[3]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      str(alunoData.notas[2]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      str(alunoData.notas[6]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      str(alunoData.notas[1]:3, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      
      val(copy(alunoData.data, 5, 4), data, e);
      dataSum := data * 12 * 30;
      val(copy(alunoData.data, 3, 2), data, e);
      dataSum := dataSum + data * 30;
      val(copy(alunoData.data, 3, 2), data, e);
      dataSum := dataSum + data;
      
      str(dataSum, aux);
      VV[i].c_chave := concat(VV[i].c_chave, aux);
      
      i:=i+1;
    end;
  until EOF(arq2);
  
  writeLn('Ordenando alunos...');
  ordem(VV,i);
  writeLn('Alunos ordenados! Aperte enter para continuar.');
  readLn();
  clrscr;
  
  writeLn('Alimentando informações dos alunos...');
  
  for j:=1 to i do
  begin
    seek(arq2,VV[j].pf);
    read(arq2, alunoData);
    
    alunoData.cla_ger := j;
    vagasOcupadas[alunoData.car] := vagasOcupadas[alunoData.car] + 1;
    alunoData.cla_car := vagasOcupadas[alunoData.car];
    
    if(vagasOcupadas[alunoData.car] <= cargos[alunoData.car].vagas) then begin
      alunoData.car_cla := alunoData.car;
    end else begin
      alunoData.car_cla := 0;
    end;
    
    seek(arq2,VV[j].pf);
    write(arq2, alunoData);
    
  end;
  close(arq2);
  
  writeLn('Alunos com todos campos preenchidos! Aperte enter para encerrar.');
  readLn();
  
  
end.