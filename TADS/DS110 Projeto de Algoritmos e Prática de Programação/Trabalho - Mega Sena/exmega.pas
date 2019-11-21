program exmega;
  var numbers: array[0..6] of integer;
  var i: integer;
  var counter: array[1..60] of integer;
  var arq: text;
begin
  assign(arq, 'd_megas.txt');
  reset(arq);

  while(NOT EOF(arq)) do begin
    for i := 0 to 6 do begin
      read(arq, numbers[i]);
    end;
    for i := 1 to 6 do begin
      counter[numbers[i]] := counter[numbers[i]] + 1;
    end;
  end;

  close(arq);

  for i := 1 to 60 do begin
      writeLn(i, ': ', counter[i]);
  end;

end.