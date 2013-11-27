library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity k_ukf_final is
port (
      clock                 : in std_logic;
		I                     : in std_logic_vector(31 downto 0);
		Vactofk               : in std_logic_vector(31 downto 0);
		Pdashofk              : in std_logic_vector(31 downto 0);
		Yofk                  : in std_logic_vector(31 downto 0);
		Vactofkplusone        : out std_logic_vector(31 downto 0);
		Pofkplusone           : out std_logic_vector(31 downto 0)
		);
		end k_ukf_final;
architecture struct of k_ukf_final is
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
component k_ukf_d is
port (
       Vactofk    : in std_logic_vector(31 downto 0);
		 Voc        : in std_logic_vector(31 downto 0);
		 clock      : in std_logic;
		 D          : out std_logic_vector(31 downto 0)
		 );
		 end component;
component k_ukf_b is
port (
       q        : in std_logic_vector(31 downto 0);
		 A        : in std_logic_vector(31 downto 0);
		 k        : in std_logic_vector(31 downto 0);
		 T        : in std_logic_vector(31 downto 0);
		 clock    : in std_logic;
		 B        : out std_logic_vector(31 downto 0)
		 );
		 end component;
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
component k_ukf_sigma is
port (
      clock          : in std_logic;
		Pdashofk       : in std_logic_vector(31 downto 0);
		T              : in std_logic_vector(31 downto 0);
		sigma          : out std_logic_vector(31 downto 0)
		);
		end component;
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
component k_ukf_Vsigactofkofone is
port (
      clock                  : in std_logic;
		Vactcapofkofone        : in std_logic_vector(31 downto 0);
		I                      : in std_logic_vector(31 downto 0);
		Isc                    : in std_logic_vector(31 downto 0);
		D                      : in std_logic_vector(31 downto 0);
		B                      : in std_logic_vector(31 downto 0);
		M                      : in std_logic_vector(31 downto 0);
		Vsigactofkofone        : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Vsigactofkoftwo is
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
		end component;
component k_ukf_Vactcapdashofkplusone is
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
		end component;
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
component k_ukf_Vrefofkplusone is
port (
      clock                     : in std_logic;
		Vactcapofk                : in std_logic_vector(31 downto 0);
		M                         : in std_logic_vector(31 downto 0);
		Yofk                      : in std_logic_vector(31 downto 0);
		Vrefofkplusone            : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_refsigma is
port (
      clock                    : in std_logic;
		Pdashofkplusone          : in std_logic_vector(31 downto 0);
		T                        : in std_logic_vector(31 downto 0);
		refsigma                 : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Vsigrefofkofall is
port (
      clock                     : in std_logic;
		Vrefofkplusone            : in std_logic_vector(31 downto 0);
		refsigma                  : in std_logic_vector(31 downto 0);
		Vsigrefofkofzero          : out std_logic_vector(31 downto 0);
		Vsigrefofkofone           : out std_logic_vector(31 downto 0);
		Vsigrefofkoftwo           : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Vrefcapofkplusone is
port (
      clock                  : in std_logic;
		Vsigrefofkofzero       : in std_logic_vector(31 downto 0);
		Vsigrefofkofone        : in std_logic_vector(31 downto 0);
		Vsigrefofkoftwo        : in std_logic_vector(31 downto 0);
		Wofmofzero             : in std_logic_vector(31 downto 0);
		Wofmofone              : in std_logic_vector(31 downto 0);
		Wofmoftwo              : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone      : out std_logic_vector(31 downto 0)
		);
      end component;
component k_ukf_PofVrefofVref is
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
		end component;
component  k_ukf_PofVactofVref is
port (
      clock                       : in std_logic;
		Wofcofzero                  : in std_logic_vector(31 downto 0);
		Wofcofone                   : in std_logic_vector(31 downto 0);
		Wofcoftwo                   : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone           : in std_logic_vector(31 downto 0);
		Vsigrefofkofzero            : in std_logic_vector(31 downto 0);
		Vsigrefofkofone             : in std_logic_vector(31 downto 0);
		Vsigrefofkoftwo             : in std_logic_vector(31 downto 0);
		Vsigactofkofzero            : in std_logic_vector(31 downto 0);
		Vsigactofkofone             : in std_logic_vector(31 downto 0);
		Vsigactofkoftwo             : in std_logic_vector(31 downto 0);
		Vactcapdashofkplusone       : in std_logic_vector(31 downto 0);
		PofVactofVref               : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Kofkplusone is
port (
      clock                       : in std_logic;
		PofVrefofVrefinv            : in std_logic_vector(31 downto 0);
		PofVactofVref               : in std_logic_vector(31 downto 0);
		Kofkplusone                 : out std_logic_vector(31 downto 0)
		);
		end component;
component  k_ukf_Vactcapofkplusone is
port (
      clock                        : in std_logic;
		Vrefofkplusone               : in std_logic_vector(31 downto 0);
		Vrefcapofkplusone            : in std_logic_vector(31 downto 0);
		Kofkplusone                  : in std_logic_vector(31 downto 0);
		Vactcapdashofkplusone        : in std_logic_vector(31 downto 0);
		Vactcapofkplusone            : out std_logic_vector(31 downto 0)
		);
		end component;
component k_ukf_Pofkplusone is
port (
      clock                  : in std_logic;
		Kofkplusone            : in std_logic_vector(31 downto 0);
		PofVrefofVref          : in std_logic_vector(31 downto 0);
		Pdashofkplusone        : in std_logic_vector(31 downto 0);
		Pofkplusone            : out std_logic_vector(31 downto 0)
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
		signal  Voc : std_logic_vector(31 downto 0) := "01000001101100000000000000000000";
		signal  e : std_logic_vector(31 downto 0) := "00100000001111010010000101111011";
		signal  A : std_logic_vector(31 downto 0) := "00111110011111000101000001001000";
		signal  k : std_logic_vector(31 downto 0) := "00011001100001011000011000000000";
		signal  T : std_logic_vector(31 downto 0) := "01000011100101001000000000000000";
		signal  Isc : std_logic_vector(31 downto 0) := "00111111101001100110011001100110";
		signal  M : std_logic_vector(31 downto 0) := "00111011000000110001001001101111";
		signal  N : std_logic_vector(31 downto 0) := "00111111010111011011001111010000";
		signal  Wofmofzero : std_logic_vector(31 downto 0) := "10111110101010101010101010011111";
		signal  Wofmofone : std_logic_vector(31 downto 0) := "00111111001010101010101010110000";
		signal  Wofmoftwo : std_logic_vector(31 downto 0) := "00111111001010101010101010110000";
		signal  Wofcofzero : std_logic_vector(31 downto 0) := "01000000000110101010101010101100";
		signal  Wofcofone : std_logic_vector(31 downto 0) := "00111111001010101010101010110000";
		signal  Wofcoftwo : std_logic_vector(31 downto 0) := "00111111001010101010101010110000";
		signal  Q : std_logic_vector(31 downto 0) := "00111000110100011011011100010111";
		signal  R : std_logic_vector(31 downto 0) := "00111100001000111101011100001010";
		signal  X1 : std_logic_vector(31 downto 0) := "00111111100000000000000000000000";
		signal X2,X3,X4,X5,X6,X7,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19 : std_logic_vector(31 downto 0);
		begin
		M1 : k_ukf_d port map
		     ( clock => clock,
			    Vactofk => Vactofk,
				 Voc => Voc,
				 D => Z1);
		M2 : k_ukf_b port map
		     ( clock => clock,
			    q => e,
				 A => A,
				 k => k,
				 T => T,
				 B => Z2);
		M3 : k_ukf_Uofk port map
		     ( clock => clock,
			    D => Z1,
				 B => Z2,
				 I => I,
				 Isc => Isc,
				 Vactofk => Vactofk,
				 Uofk => Z3);
		M4 : k_ukf_Vactcapofk port map
		     ( clock => clock,
			    Vactofk => Vactofk,
				 M => M,
				 Uofk => Z3,
				 Vactcapofk => Z4);
		M5 : k_ukf_sigma port map
		     ( clock => clock,
			    Pdashofk => Pdashofk,
				 T => N,
				 sigma => Z5);
		M6 : k_ukf_d port map
		     ( clock => clock,
			    Vactofk => Z4,
				 Voc => Voc,
				 D => X3);
		M7 : k_ukf_Vsigactofkofzero port map
		     ( clock => clock,
			    I => I,
				 Isc => Isc,
				 Vactcapofk => Z4,
				 M => M,
				 D => X3,
				 B => Z2,
				 Vsigactofkofzero => Z6);
		M8 : k_ukf_add port map
		     ( clock => clock,
			    dataa => Z4,
				 datab => Z5,
				 result => X4);
		M9 : k_ukf_d port map
		     ( clock => clock,
			    Vactofk => X4,
				 Voc => Voc,
				 D => X5);
		M10 : k_ukf_Vsigactofkofone port map
		     ( clock => clock,
			    Vactcapofkofone => X4,
				 I => I,
				 Isc => Isc,
				 D => X5,
				 B => Z2,
				 M => M,
				 Vsigactofkofone => Z7);
	   M11 : k_ukf_sub port map
		      ( clock => clock,
				  dataa => Z4,
				  datab => Z5,
				  result => X6);
		M12 : k_ukf_d port map
		      ( clock => clock,
				  Vactofk => X6,
				  Voc => Voc,
				  D => X7);
		M13 : k_ukf_Vsigactofkoftwo port map
		     ( clock => clock,
			    Vactcapofkoftwo => X6,
				 I => I,
				 Isc => Isc,
				 D => X7,
				 B => Z2,
				 M => M,
				 Vsigactofkoftwo => Z8);
		M14 : k_ukf_Vactcapdashofkplusone port map
		     ( clock => clock,
			    Vsigactofkofzero => Z6,
				 Vsigactofkofone => Z7,
				 Vsigactofkoftwo => Z8,
				 Wofmofzero => Wofmofzero,
				 Wofmofone => Wofmofone,
				 Wofmoftwo => Wofmoftwo,
				 Vactcapdashofkplusone => Z9);
		M15 : k_ukf_Pdashofkplusone port map
		      ( clock => clock,
				  Vsigactofkofzero => Z6,
				  Vsigactofkofone => Z7,
				  Vsigactofkoftwo => Z8,
				  Wofcofzero => Wofcofzero,
				  Wofcofone => Wofcofone,
				  Wofcoftwo => Wofcoftwo,
				  Q => Q,
				  Vactcapdashofkplusone => Z9,
				  Pdashofkplusone => Z10);
		M16 : k_ukf_Vrefofkplusone port map
		      ( clock => clock,
				  M => M,
				  Yofk => Yofk,
				  Vactcapofk => Z4,
				  Vrefofkplusone => Z11);
		M17 : k_ukf_refsigma port map
		      ( clock => clock,
				  Pdashofkplusone => Z10,
				  T => N,
				  refsigma => Z12);
		M18 : k_ukf_Vsigrefofkofall port map
		      ( clock => clock,
				  Vrefofkplusone => Z11,
				  refsigma => Z12,
				  Vsigrefofkofzero => Z13,
				  Vsigrefofkofone => Z14,
				  Vsigrefofkoftwo => Z15);
		M19 : k_ukf_Vrefcapofkplusone port map
		       ( clock => clock,
				   Vsigrefofkofzero => Z13,
				   Vsigrefofkofone => Z14,
					Vsigrefofkoftwo => Z15,
				   Wofmofzero => Wofmofzero,
					Wofmofone => Wofmofone,
					Wofmoftwo => Wofmoftwo,
					Vrefcapofkplusone => Z16);
		M20 : k_ukf_PofVrefofVref port map
		      ( clock => clock,
				  R => R,
				  Wofcofzero => Wofcofzero,
				  Wofcofone => Wofcofone,
				  Wofcoftwo => Wofcoftwo,
				  Vsigrefofkofzero => Z13,
				  Vsigrefofkofone => Z14,
				  Vsigrefofkoftwo => Z15,
				  Vrefcapofkplusone => Z16,
				  PofVrefofVref => Z17);
		M21 : k_ukf_PofVactofVref port map
		      ( clock => clock,
				  Wofcofzero => Wofcofzero,
				  Wofcofone => Wofcofone,
				  Wofcoftwo => Wofcoftwo,
				  Vsigrefofkofzero => Z13,
				  Vsigrefofkofone => Z14,
				  Vsigrefofkoftwo => Z15,
				  Vrefcapofkplusone => Z16,
				  Vsigactofkofzero => Z6,
				  Vsigactofkofone => Z7,
				  Vsigactofkoftwo => Z8,
				  Vactcapdashofkplusone => Z9,
				  PofVactofVref => Z18);
		M22 : k_ukf_div port map
		      ( clock => clock,
				  dataa => X1,
				  datab => Z17,
				  result => X2);
		M23 : k_ukf_Kofkplusone port map 
		      ( clock => clock,
				  PofVrefofVrefinv => X2,
				  PofVactofVref => Z18,
				  Kofkplusone => Z19);
		M24 : k_ukf_Vactcapofkplusone port map
		      ( clock => clock,
				  Vrefofkplusone => Z11,
				  Vrefcapofkplusone => Z16,
				  Kofkplusone => Z19,
				  Vactcapdashofkplusone => Z9,
				  Vactcapofkplusone => Vactofkplusone);
		M25 : k_ukf_Pofkplusone  port map
		      ( clock => clock,
				  Kofkplusone => Z19,
				  PofVrefofVref => Z17,
				  Pdashofkplusone => Z10,
				  Pofkplusone => Pofkplusone);
				 end struct;
		
				 
				 
		