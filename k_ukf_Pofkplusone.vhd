library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Pofkplusone is
port (
      clock                  : in std_logic;
		Kofkplusone            : in std_logic_vector(31 downto 0);
		PofVrefofVref          : in std_logic_vector(31 downto 0);
		Pdashofkplusone        : in std_logic_vector(31 downto 0);
		Pofkplusone            : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Pofkplusone;
architecture struct of k_ukf_Pofkplusone is
component k_ukf_mult IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
component k_ukf_sub IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	signal Z1,Z2 : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_mult port map 
	     ( clock => clock,
		    dataa => Kofkplusone,
			 datab => Kofkplusone,
			 result => Z1);
	M2 : k_ukf_mult port map 
	     ( clock => clock,
		    dataa => Z1,
			 datab => PofVrefofVref,
			 result => Z2);
	M3 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => Pdashofkplusone,
			 datab => Z2,
			 result => Pofkplusone);
			end struct;
			