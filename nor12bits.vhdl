library ieee;
use ieee.std_logic_1164.all;

entity not12bits is
	port(
		X : in std_logic_vector (11 downto 0);
		notx: out std_logic_vector (11 downto 0)
	);
end;

architecture comuta of not12bits is

begin
	notx(11 downto 0) <= not X(11 downto 0);
end;
