library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vactcapdashofkplusone is
port (
      clock                       : in std_logic;
		Vsigactofkofzero            : in std_logic_vector(31 downto 0);
		Vsigactofkofone             : in std_logic_vector(31 downto 0);
		Vsigactofkoftwo             : in std_logic_vector(31 downto 0);
		Wofmofzero                  : in std_logic_vector(31 downto 0);
		Wofmofone                   : in std_logic_vector(31 downto 0);
		Wofmoftwo                   : in std_logic_vector(31 downto 0);
		Vactcapdashofkplusone       : out std_logic_vector(31 downto 0)
		);
		end k_ukf_Vactcapdashofkplusone;
architecture struct of k_ukf_Vactcapdashofkplusone is
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
	signal Z1,Z2,Z3,Z4 : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_mult port map   
	     ( clock => clock,
		    dataa => Wofmofzero,
			 datab => Vsigactofkofzero,
			 result => Z1);
   M2 : k_ukf_mult port map   
	     ( clock => clock,
		    dataa => Wofmofone,
			 datab => Vsigactofkofone,
			 result => Z2);
	M3 : k_ukf_mult port map   
	     ( clock => clock,
		    dataa => Wofmoftwo,
			 datab => Vsigactofkoftwo,
			 result => Z3);
	M4 : k_ukf_add port map 
	     ( clock => clock,
		    dataa => Z1,
			 datab => Z2,
			 result => Z4);
	M5 : k_ukf_add port map 
	     ( clock => clock,
		    dataa => Z3,
			 datab => Z4,
			 result => Vactcapdashofkplusone);
			end struct;
			 