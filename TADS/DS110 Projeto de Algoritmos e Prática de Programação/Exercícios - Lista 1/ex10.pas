Program ex10;
var i,j : integer;
Begin
	for i:= 1 to 10 do begin
		write('Tabuada do ', i:0:0, ': ');
		for j:= 1 to 10 do begin
		   write(i*j:0:0, ' ');
		end;
		writeLn();
	end
End.