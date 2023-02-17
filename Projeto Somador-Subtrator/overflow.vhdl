library ieee;
use ieee.std_logic_1164.all;

entity overflow is
    port(
        A : in std_logic;
        B : in std_logic;
        Cout : in std_logic;
        Ow : out std_logic
    );
end;

architecture comuta of overflow is
	constant lat : time := 4 ns;
begin
    Ow <= (A and B and (not Cout)) or ((not A) and (not B) and Cout) after 3*lat;
end; 
