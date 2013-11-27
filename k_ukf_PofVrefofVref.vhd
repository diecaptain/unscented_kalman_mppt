library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_PofVrefofVref is
port (
      clock                       : in std_logic;
		R                           : in std_logic_vector(31 downto 0);
		Wofcofzero                  : in std_logic_vector(31 downto 0);
		Wofcofone                   : in std_logic_vector(31 downto 0);
		Wofcoftwo                   : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone           : in std_logic_vector(31 downto 0);
		Vsigrefofkofzero            : in std_logic_vector(31 downto 0);
		Vsigrefofkofone             : in std_logic_vector(31 downto 0);
		Vsigrefofkoftwo             : in std_logic_vector(31 downto 0);
		PofVrefofVref               : out std_logic_vector(31 downto 0)
		);
	end k_ukf_PofVrefofVref;
architecture struct of k_ukf_PofVrefofVref is
component k_ukf_Pdashofkplusone is
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
		end component;
		begin
		M1 : k_ukf_Pdashofkplusone port map
		     ( clock => clock,
			    Vsigactofkofzero => Vsigrefofkofzero,
				 Vsigactofkofone => Vsigrefofkofone,
				 Vsigactofkoftwo => Vsigrefofkoftwo,
				 Wofcofzero => Wofcofzero,
				 Wofcofone => Wofcofone,
				 Wofcoftwo => Wofcoftwo,
				 Vactcapdashofkplusone => Vrefcapofkplusone,
				 Q => R,
				 Pdashofkplusone => PofVrefofVref);
				end struct;