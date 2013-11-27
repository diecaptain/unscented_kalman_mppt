library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vsigrefofkofall is
port (
      clock                     : in std_logic;
		Vrefofkplusone            : in std_logic_vector(31 downto 0);
		refsigma                  : in std_logic_vector(31 downto 0);
		Vsigrefofkofzero          : out std_logic_vector(31 downto 0);
		Vsigrefofkofone           : out std_logic_vector(31 downto 0);
		Vsigrefofkoftwo           : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vsigrefofkofall;
architecture struct of k_ukf_Vsigrefofkofall is
component k_ukf_add IS
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
	begin
	Vsigrefofkofzero <= Vrefofkplusone;
	M1 : k_ukf_add port map
	     ( clock => clock,
		    dataa => Vrefofkplusone,
			 datab => refsigma,
			 result => Vsigrefofkofone);
	M2 : k_ukf_sub port map   
	     ( clock => clock,
		    dataa => Vrefofkplusone,
			 datab => refsigma,
			 result => Vsigrefofkoftwo);
			end struct;