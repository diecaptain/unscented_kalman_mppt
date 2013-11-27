library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vrefcapofkplusone is
port (
      clock                  : in std_logic;
		Vsigrefofkofzero       : in std_logic_vector(31 downto 0);
		Vsigrefofkofone        : in std_logic_vector(31 downto 0);
		Vsigrefofkoftwo        : in std_logic_vector(31 downto 0);
		Wofmofzero             : in std_logic_vector(31 downto 0);
		Wofmofone              : in std_logic_vector(31 downto 0);
		Wofmoftwo              : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone      : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vrefcapofkplusone;
architecture struct of k_ukf_Vrefcapofkplusone is
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
	signal Z4,Z5,Z6,Z7 : std_logic_vector(31 downto 0);
	begin
   M1 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Wofmofzero,
			 datab => Vsigrefofkofzero,
			 result => Z4);
	M2 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Wofmofone,
			 datab => Vsigrefofkofone,
			 result => Z5);
	M3 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Wofmoftwo,
			 datab => Vsigrefofkoftwo,
			 result => Z6);
	M4 : k_ukf_add port map
	     ( clock => clock,
		    dataa => Z4,
			 datab => Z5,
			 result => Z7);
	M5 : k_ukf_add port map
	     ( clock => clock,
		    dataa => Z7,
			 datab => Z6,
			 result => Vrefcapofkplusone);
			end struct;
	
	
		