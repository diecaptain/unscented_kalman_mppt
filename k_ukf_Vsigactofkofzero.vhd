library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vsigactofkofzero is
port (
      clock            : in std_logic;
		I                : in std_logic_vector(31 downto 0);
		Isc              : in std_logic_vector(31 downto 0);
		Vactcapofk       : in std_logic_vector(31 downto 0);
		M                : in std_logic_vector(31 downto 0);
		D                : in std_logic_vector(31 downto 0);
		B                : in std_logic_vector(31 downto 0);
		Vsigactofkofzero : out std_logic_vector(31 downto 0)
		);
	end k_ukf_Vsigactofkofzero;
architecture struct of k_ukf_Vsigactofkofzero is
component k_ukf_Uofk is
port (
      I          : in std_logic_vector(31 downto 0);
		Isc        : in std_logic_vector(31 downto 0);
		Vactofk    : in std_logic_vector(31 downto 0);
		D          : in std_logic_vector(31 downto 0);
		B          : in std_logic_vector(31 downto 0);
		clock      : in std_logic;
		Uofk       : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Vactcapofk is
port (
      clock             : in std_logic;
		Vactofk           : in std_logic_vector(31 downto 0);
		M                 : in std_logic_vector(31 downto 0);
		Uofk              : in std_logic_vector(31 downto 0);
		Vactcapofk        : out std_logic_vector(31 downto 0)
		);
		end component;
	signal Z : std_logic_vector(31 downto 0);
	begin
	M1 : k_ukf_Uofk port map
	     ( clock => clock,
		    I => I,
			 Isc => Isc,
			 Vactofk => Vactcapofk,
			 D => D,
			 B => B,
			 Uofk => Z);
	M2 : k_ukf_Vactcapofk port map
	     ( clock => clock,
		    Vactofk => Vactcapofk,
			 M => M,
			 Uofk => Z,
			 Vactcapofk => Vsigactofkofzero);
			end struct;