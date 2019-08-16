Program ex12;
var i, soma, num: integer;
Begin
	soma := 0;
  for i:= 1 to 10 do begin
  	write('Digite o ', i:0:0, '° número: ');
  	readLn(num);
  	soma := soma + num;
  end;
  write('A soma dos ', i:0:0, ' números digitados é ', soma:0:0);
End.