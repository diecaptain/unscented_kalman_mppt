library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_Vsigactofkoftwo is
port (
      clock                  : in std_logic;
		Vactcapofkoftwo        : in std_logic_vector(31 downto 0);
		I                      : in std_logic_vector(31 downto 0);
		Isc                    : in std_logic_vector(31 downto 0);
		D                      : in std_logic_vector(31 downto 0);
		B                      : in std_logic_vector(31 downto 0);
		M                      : in std_logic_vector(31 downto 0);
		Vsigactofkoftwo        : out std_logic_vector(31 downto 0)
		);
		end k_ukf_Vsigactofkoftwo;
architecture struct of k_ukf_Vsigactofkoftwo is
component k_ukf_Vsigactofkofzero is
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
		end component;
	begin
	M1 : k_ukf_Vsigactofkofzero port map
	     ( clock => clock,
		    I => I,
			 Isc => Isc,
			 Vactcapofk => Vactcapofkoftwo,
			 M => M,
			 D => D,
			 B => B,
			 Vsigactofkofzero => Vsigactofkoftwo);
			end struct;