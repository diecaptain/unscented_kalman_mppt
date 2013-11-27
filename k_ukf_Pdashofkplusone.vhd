library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Pdashofkplusone is
port (
      clock                       : in std_logic;
		Vsigactofkofzero            : in std_logic_vector(31 downto 0);
		Vsigactofkofone             : in std_logic_vector(31 downto 0);
		Vsigactofkoftwo             : in std_logic_vector(31 downto 0);
		Wofcofzero                  : in std_logic_vector(31 downto 0);
		Wofcofone                   : in std_logic_vector(31 downto 0);
		Wofcoftwo                   : in std_logic_vector(31 downto 0);
		Vactcapdashofkplusone       : in std_logic_vector(31 downto 0);
		Q                           : in std_logic_vector(31 downto 0);
		Pdashofkplusone             : out std_logic_vector(31 downto 0)
		);
		end k_ukf_Pdashofkplusone;
architecture struct of k_ukf_Pdashofkplusone is
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
	signal Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11 : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => Vsigactofkofzero,
			 datab => Vactcapdashofkplusone,
			 result => Z1);
	M2 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => Vsigactofkofone,
			 datab => Vactcapdashofkplusone,
			 result => Z4);
	M3 : k_ukf_sub port map
	     ( clock => clock,
		    dataa => Vsigactofkoftwo,
			 datab => Vactcapdashofkplusone,
			 result => Z7);
	M4 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z1,
			  datab => Z1,
			  result => Z2);
	M5 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z4,
			  datab => Z4,
			  result => Z5);
	M6 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z7,
			  datab => Z7,
			  result => Z8);
	M7 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z2,
			  datab => Wofcofzero,
			  result => Z3);
	M8 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z5,
			  datab => Wofcofone,
			  result => Z6);
	M9 : k_ukf_mult port map
	      ( clock => clock,
			  dataa => Z8,
			  datab => Wofcoftwo,
			  result => Z9);
	M10 : k_ukf_add port map
	       ( clock => clock,
			   dataa => Z3,
				datab => Z6,
				result => Z10);
	M11 : k_ukf_add port map
	       ( clock => clock,
			   dataa => Z10,
				datab => Z9,
				result => Z11);
	M12 : k_ukf_add port map
	       ( clock => clock,
			   dataa => Q,
				datab => Z11,
				result => Pdashofkplusone);
			end struct;