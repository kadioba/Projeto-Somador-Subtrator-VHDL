library ieee;
use ieee.std_logic_1164.all;

entity mux2x12 is
	port(
		c0 : in std_logic_vector (11 downto 0);
		c1 : in std_logic_vector (11 downto 0);
		sel : in std_logic;
		z : out std_logic_vector (11 downto 0)
	);
end;

architecture comuta of mux2x12 is
	constant lat : time := 4 ns;
begin
	z <= c0 when sel='0' else c1 after 3*lat;
	
end;
