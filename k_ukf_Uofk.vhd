library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Uofk is
port (
      I          : in std_logic_vector(31 downto 0);
		Isc        : in std_logic_vector(31 downto 0);
		Vactofk    : in std_logic_vector(31 downto 0);
		D          : in std_logic_vector(31 downto 0);
		B          : in std_logic_vector(31 downto 0);
		clock      : in std_logic;
		Uofk       : out std_logic_vector(31 downto 0)
		);
		end k_ukf_Uofk;
architecture struct of k_ukf_Uofk is
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
component k_ukf_exp IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	signal Z1,Z2,Z3,Z4,Z5,Z6 : std_logic_vector(31 downto 0);
	signal Z                 : std_logic_vector(31 downto 0) := "00111111100000000000000000000000";
	begin
	M1 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => D,
			 datab => Z,
			 result => Z1);
	M2 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => B,
			 datab => Z1,
			 result => Z2);
	M3 : k_ukf_exp port map
	     ( clock => clock,
		    data => Z2,
			 result => Z3);
   M4 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => D,
			 datab => Z3,
			 result => Z4);
	M5 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Isc,
			 datab => Vactofk,
			 result => Z5);
	M6 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => Z5,
			 datab => Z4,
			 result => Z6);
	M7 : k_ukf_add port map
	     ( clock => clock,
		    dataa => I,
			 datab => Z6,
			 result => Uofk);
			 end struct;