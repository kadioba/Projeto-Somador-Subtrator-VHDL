library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port(
		c0: in bit;
		c1: in bit;
		sel : in bit;
		z: out bit
	);
end entity;

architecture comuta of mux2x1 is
	constant lat : time := 4 ns;
begin
	z <= c0 when sel = '0' else c1 after 2*lat;
	
end architecture;
