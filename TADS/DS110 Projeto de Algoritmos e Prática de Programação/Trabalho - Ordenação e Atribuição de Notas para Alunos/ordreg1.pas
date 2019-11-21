Program ordreg1;
//uso da variavel registro
//FUP que leia todos os registros do arquivo cadast.txt montando um vetor com
//numero, noe e cargo. Ap?s, mostre o conte[udo do vetor em ordem alfab?tica.
type
tudo=record
  num:integer;
  nome:string[35];
  car:integer;
end;
var
vet:array[1..2000] of tudo; //cada posicao do vetor contera 3 informacoes definidas em tudo(tipo registro)
//ou seja, num,nome,car/num,nome,car/num,nome,car..... posicoes 1,2,3.....
aux:tudo;
a,b,c,tot,tots,e:integer;
troca:boolean;
arq:text;
linha:string[60];
Begin
  assign(arq,'cadast.txt');
  reset(arq);
  repeat
    readln(arq,linha);
    tot:=tot+1;
    val(copy(linha,1,4),vet[tot].num,e);
    vet[tot].nome:=copy(linha,5,35);
    val(copy(linha,59,2),vet[tot].car,e);
  until(eof(arq));
  tots:=tot;
  writeln('ordenando');
  repeat
    tot:=tot-1;
    troca:=true;
    for a:=1 to tot do
    if(vet[a].nome>vet[a+1].nome)then //compara o campo do vetor pelo qual quer classificar na posicao [a]
    begin
      aux:=vet[a];     //troca a posicao
      vet[a]:=vet[a+1];
      vet[a+1]:=aux;
      troca:=false;
    end;
  until(troca);
  for a:=1 to tots do
  begin
    writeln(vet[a].num:6,' ',vet[a].nome,vet[a].car:4);
    if(a mod 30 = 0)then
    readln;
  end;
  write('enter para encerrar');
  readln;
  close(arq);
End.