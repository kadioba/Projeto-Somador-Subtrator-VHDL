library ieee;
use ieee.std_logic_1164.all;

entity not_12 is
	port(
		X : in std_logic_vector (11 downto 0);
		notX : out std_logic_vector (11 downto 0)
	);
end;

architecture comuta of not_12 is
	constant lat : time := 4 ns;
begin
	notX(11 downto 0) <= not X(11 downto 0) after lat;
end;
