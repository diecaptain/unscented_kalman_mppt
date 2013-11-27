library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_d is
port (
       Vactofk    : in std_logic_vector(31 downto 0);
		 Voc        : in std_logic_vector(31 downto 0);
		 clock      : in std_logic;
		 D          : out std_logic_vector(31 downto 0)
		 );
		 end k_ukf_d;
architecture struct of k_ukf_d is
component k_ukf_div IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	end component;
	begin
	M1 : k_ukf_div port map
	     ( clock => clock,
		    dataa => Vactofk,
			 datab => Voc,
			 result => D);
	       end struct;
	