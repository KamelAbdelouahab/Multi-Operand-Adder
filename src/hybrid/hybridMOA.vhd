library ieee;
    use ieee.std_logic_1164.all;
    use ieee.math_real.all;
library work;
    use work.DataTypes.all;

entity SerialMOA is
    generic(
        DATA_WIDTH   : natural := CONST_DATA_WIDTH;   -- Bitwidth
        NUM_OPERANDS : natural := CONST_NUM_OPERANDS; -- Number of operands
        CLUSTER_SIZE : natural := CONST_CLUSTER_SIZE; 
        SUM_WIDTH    : natural := CONST_SUM_WIDTH
    );
    port(
        clk_dsp    : in  std_logic;
        clk_sys    : in  std_logic;
        reset_n    : in  std_logic;
        in_data    : in  std_logic_vector (DATA_WIDTH-1 downto 0);
        in_valid   : in  std_logic;
        out_data   : out std_logic_vector (SUM_WIDTH-1 downto 0)
    );
end entity SerialMOA;

architecture bhv of SerialMOA is
    -- Serializer
    -----------------------------


    -- SIGNALS
   -----------------------------


  begin
   -- ARCHITECTURE
   -----------------------------


end architecture bhv;
