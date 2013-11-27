library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Kofkplusone is
port (
      clock                       : in std_logic;
		PofVrefofVrefinv            : in std_logic_vector(31 downto 0);
		PofVactofVref               : in std_logic_vector(31 downto 0);
		Kofkplusone                 : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Kofkplusone;
architecture struct of k_ukf_Kofkplusone is
component k_ukf_mult IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	begin
	M1 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => PofVactofVref,
			 datab => PofVrefofVrefinv,
			 result => Kofkplusone);
	       end struct;
	