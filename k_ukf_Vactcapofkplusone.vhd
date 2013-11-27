library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vactcapofkplusone is
port (
      clock                        : in std_logic;
		Vrefofkplusone               : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone            : in std_logic_vector(31 downto 0);
		Kofkplusone                  : in std_logic_vector(31 downto 0);
		Vactcapdashofkplusone        : in std_logic_vector(31 downto 0);
		Vactcapofkplusone            : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vactcapofkplusone;
architecture struct of k_ukf_Vactcapofkplusone is
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
	M1 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => Vrefofkplusone,
			 datab => Vrefcapofkplusone,
			 result => Z1);
	M2 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Kofkplusone,
			 datab => Z1,
			 result => Z2);
	M3 : k_ukf_add port map
	      ( clock => clock,
			  dataa => Vactcapdashofkplusone,
			  datab =>Z2,
			  result => Vactcapofkplusone);
			 end struct;