library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_refsigma is
port (
      clock                    : in std_logic;
		Pdashofkplusone          : in std_logic_vector(31 downto 0);
		T                        : in std_logic_vector(31 downto 0);
		refsigma                 : out std_logic_vector(31 downto 0)
		);
	end k_ukf_refsigma;
architecture struct of k_ukf_refsigma is
component k_ukf_mult IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	component k_ukf_sqrt IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	signal Z : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_sqrt port map
	     ( clock => clock,
		    data => Pdashofkplusone,
			 result => Z);
	M2 : k_ukf_mult port map
	     ( clock => clock,
		    dataa => T,
			 datab => Z,
			 result => refsigma);
		end struct;