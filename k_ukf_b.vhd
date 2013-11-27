library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_b is
port (
       q        : in std_logic_vector(31 downto 0);
		 A        : in std_logic_vector(31 downto 0);
		 k        : in std_logic_vector(31 downto 0);
		 T        : in std_logic_vector(31 downto 0);
		 clock    : in std_logic;
		 B        : out std_logic_vector(31 downto 0)
		 );
		 end k_ukf_b;
architecture struct of k_ukf_b is
component k_ukf_mult IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
component k_ukf_div IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	signal Z1,Z2 : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_mult port map 
	     ( clock => clock,
		    dataa => q,
			 datab => A,
			 result => Z1);
	M2 : k_ukf_mult port map 
	     ( clock => clock,
		    dataa => k,
			 datab => T,
			 result => Z2);
	M3 : k_ukf_div port map 
	     ( clock => clock,
		    dataa => Z1,
			 datab => Z2,
			 result => B);
			 end struct;