entity f_adder is
	port(
		A : in bit;
		B : in bit;
		Cin : in bit;
		Z : out bit;
		Cout : out bit
	);
end;

architecture comuta of f_adder is
	constant lat : time := 4 ns;
begin
	Z <= (A xor B) xor Cin after lat;
	Cout <= (Cin and (a or b)) or (a and b) after 3*lat;
end;
