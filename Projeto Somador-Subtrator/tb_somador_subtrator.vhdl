library ieee;
use ieee.std_logic_1164.all;

entity tb_somador_subtrator is
end;

architecture soma_subtrai of tb_somador_subtrator is
	constant ciclo : time := 172 ns;
	component not_12 is
		port(
			X : in std_logic_vector (11 downto 0);
			notX : out std_logic_vector (11 downto 0)
		);
	end component;
	
	component mux2x12 is
		port(
			c0 : in std_logic_vector (11 downto 0);
			c1 : in std_logic_vector (11 downto 0);
			sel : in std_logic;
			z : out std_logic_vector (11 downto 0)
		);
	end component;
	
	component adderx12 is
		port(
			A : in std_logic_vector (11 downto 0);
			B : in std_logic_vector (11 downto 0);
			Cin : in std_logic;
			Z : out std_logic_vector (11 downto 0);
			Cout: out std_logic
		);
	end component;
	
	component overflow is
		port(
		    A : in std_logic;
		    B : in std_logic;
		    Cout : in std_logic;
		    Ow : out std_logic
		);
	end component;
	
	signal op, Cout_geral, ow : std_logic;
	signal X, Y, notY, S : std_logic_vector(11 downto 0);
	signal sY : std_logic_vector(11 downto 0);
	
begin
	u_not_12 : not_12 port map(Y, notY); -- 4 Ns de latencia
	u_mux2x12 : mux2x12 port map(Y, notY, op, sY); -- 12 Ns de latencia
	u_overflow : overflow port map(X(11), sY(11), S(11), ow); -- 12 NS de latencia
	u_adderx12 : adderx12 port map(X, sY, op, S, Cout_geral); -- 144 Ns de latencia
	u_tb : process
	begin
	
		X <= x"000";
        Y <= x"FFF";
        op <= '0';
        wait for ciclo;
        
        X <= x"000";
        Y <= x"FFF";
        op <= '1';
        wait for ciclo;
        
        X <= x"FFF";
        Y <= x"001";
        op <= '0';
        wait for ciclo;
        
        X <= x"FFF";
        Y <= x"001";
        op <= '1';
        wait for ciclo;
        
        X <= x"FFE";
        Y <= x"FFE";
        op <= '0';
        wait for ciclo;
        
        X <= x"0FF";
        Y <= x"0FF";
        op <= '0';
        wait for ciclo;
        
        X <= x"ABC";
        Y <= x"000";
        op <= '1';
        wait for ciclo;
        
        X <= x"001";
        Y <= x"000";
        op <= '0';
        wait for ciclo;
        
        X <= x"0FF";
        Y <= x"ABC";
        op <= '0';
        wait for ciclo;
        
        end process;
end;
