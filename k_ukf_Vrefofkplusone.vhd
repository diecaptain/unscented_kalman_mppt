library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vrefofkplusone is
port (
      clock                     : in std_logic;
		Vactcapofk                : in std_logic_vector(31 downto 0);
		M                         : in std_logic_vector(31 downto 0);
		Yofk                      : in std_logic_vector(31 downto 0);
		Vrefofkplusone            : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vrefofkplusone;
architecture struct of k_ukf_Vrefofkplusone is
component k_ukf_mult IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
component k_ukf_add IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	signal Z : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => M,
			 datab => Yofk,
			 result => Z);
	M2 : k_ukf_add port map
	     ( clock => clock,
		    dataa => Vactcapofk,
			 datab => Z,
			 result => Vrefofkplusone);
			end struct;