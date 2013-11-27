library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vactcapofk is
port (
      clock             : in std_logic;
		Vactofk           : in std_logic_vector(31 downto 0);
		M                 : in std_logic_vector(31 downto 0);
		Uofk              : in std_logic_vector(31 downto 0);
		Vactcapofk        : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vactcapofk;
architecture struct of k_ukf_Vactcapofk is
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
			 datab => Uofk,
			 result => Z);
	M2 : k_ukf_add port map
	     ( clock => clock,
		    dataa => Vactofk,
			 datab => Z,
			 result => Vactcapofk);
		end struct;