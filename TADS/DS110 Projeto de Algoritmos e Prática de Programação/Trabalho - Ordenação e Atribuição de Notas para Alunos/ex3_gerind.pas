Program gerind ;
//le arquivo text acesso sequencial e gera arquivo formatado (record) de acesso indexado.
  //Feito pelo Professor
  type regis=record
    num:integer;
    nome:string[35];
    cpf:string[11];
    data:string[8];
    car,n1,n2,n3,n4,n5,n6,so,clg,clc,ccl:integer
  end;
  var arqa: file of regis;
  rega:regis;
  arqb:text;
  regb:string[65];
  a,b,c,E:integer;
  
  Begin
    assign(arqa,'CAND.IND');
    assign(arqb,'cadast.txt');
    reset(arqb);
    rewrite(arqa);
    REPEAT
      a:=A+1;
      READLN(ARQB,REGB);              //LE SEGUENCIALMENTE REGISTROS DE .txt
      writeLn(regb);
      
      if (a = 1) then begin
        VAL(COPY(REGB,4,7),REGA.NUM,E);//RETIRA INSCRICAO DE .txt E JOGA PARA O CAMPO INS (INTEGER) DE .ind
        //VER APOSTILA PASCALZIM FUNCIONAMENTO FUNCTIN COPY<====
        REGA.NOME:=COPY(REGB,8,38);
        REGA.CPF:=COPY(REGB,43,14);       //RETIRA NOME DE .txt E JOGA PARA O CAMPO NOME DE .ind
        INSERT(COPY(REGB,54,2),REGA.DATA,1); //RETIRA DIA DE .txt E INSERE EM .ind (EX 27------)
        INSERT(COPY(REGB,56,2),REGA.DATA,1); //RETIRA MES DE .txt E INSERE EM .ind (EX 1027----)
        INSERT(COPY(REGB,58,4),REGA.DATA,1); //RETIRA ANO DE .txt E INSERE EM .ind (EX 19981027)
        //IDEM CPF
        VAL(COPY(REGB,62,2),REGA.CAR,E);     //RETIRA CODIGO DE .txt E JOGA PARA O CAMPO COD (INTEGER) DE .ind
      end else begin
        VAL(COPY(REGB,1,4),REGA.NUM,E);//RETIRA INSCRICAO DE .txt E JOGA PARA O CAMPO INS (INTEGER) DE .ind
        //VER APOSTILA PASCALZIM FUNCIONAMENTO FUNCTIN COPY<====
        REGA.NOME:=COPY(REGB,5,35);
        REGA.CPF:=COPY(REGB,40,11);       //RETIRA NOME DE .txt E JOGA PARA O CAMPO NOME DE .ind
        INSERT(COPY(REGB,51,2),REGA.DATA,1); //RETIRA DIA DE .txt E INSERE EM .ind (EX 27------)
        INSERT(COPY(REGB,53,2),REGA.DATA,1); //RETIRA MES DE .txt E INSERE EM .ind (EX 1027----)
        INSERT(COPY(REGB,55,4),REGA.DATA,1); //RETIRA ANO DE .txt E INSERE EM .ind (EX 19981027)
        //IDEM CPF
        VAL(COPY(REGB,59,2),REGA.CAR,E);     //RETIRA CODIGO DE .txt E JOGA PARA O CAMPO COD (INTEGER) DE .ind
      end;
      //SEEK(ARQA, REGA.num-1);            //Salva o registro em modo de indexação (posição física)
      WRITE(ARQA,REGA);                    //GRAVA EM .IND
    UNTIL EOF(ARQB);
    CLOSE(ARQA);
    CLOSE(ARQB);
    WRITELN('LIDOS=',A:5);
    READLN;
  End.