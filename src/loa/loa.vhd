library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

entity loa is
    generic(
    DATA_WIDTH   : natural := 10;
    LSB_WIDTH   : natural := 1
    );
    port(
    a          : in  std_logic_vector (DATA_WIDTH-1 downto 0);
    b          : in  std_logic_vector (DATA_WIDTH-1 downto 0);
    s          : out std_logic_vector (DATA_WIDTH downto 0)
    );
end entity loa;

architecture Bhv of loa is
component fa is 
    port(
    x    : in std_logic;
    y    : in std_logic;
    c_in : in std_logic;
	s    : out std_logic;
	c_out: out std_logic
    );
end component;

--signal c : std_logic_vector
signal c : std_logic;
begin
    -- LSB Part
    lsb_part: for i in 0 to LSB_WIDTH-1 generate
        s(i) <= a(i) OR b(i);
    end generate lsb_part;

	-- Carry 
	c <= a(LSB_WIDTH) and b(LSB_WIDTH);
	
	-- MSB Part
	s(DATA_WIDTH-1 downto LSB_WIDTH) <= a(DATA_WIDTH-1 downto LSB_WIDTH) 
	                                  + b(DATA_WIDTH-1 downto LSB_WIDTH)
									          + c;
	-- msb_part: for i in LSB_WIDTH to DATA_WIDTH-1 generate
	    
		-- first_fa : if i=LSB_WIDTH generate
		    -- first_fa_inst : fa
			-- port map(
			-- x     => 
			-- y     => 
			-- c_in  => 
			-- s     => 
			-- c_out => 
			-- );
			
	    -- end generate first_fa;
	-- end generate msb_part;

end architecture Bhv;
