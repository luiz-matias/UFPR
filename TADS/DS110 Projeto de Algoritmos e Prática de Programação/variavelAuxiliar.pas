Program exercicioAula;

var a, b, c: string[8];
var aux: string[8];
Begin
	a := 'Paran�';
	b := 'Atl�tico';
	c := 'Coritiba';
	
	aux := a;
	a := c;
	c := aux;
	aux := b;
	b := c;
	c := aux;
	
	writeLn(a,'-',b,'-',c);
	
End.