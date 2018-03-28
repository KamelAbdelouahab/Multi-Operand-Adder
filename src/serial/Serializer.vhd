library ieee;
    use ieee.std_logic_1164.all;

library work;
    use work.DataTypes.all;

entity Serializer is
    generic(
        NUM_OPERANDS : natural;
        DATA_WIDTH   : natural
    );
    port(
        clk_dsp    : in  std_logic;
        clk_sys    : in  std_logic;
        reset_n    : in  std_logic;
        in_data    : in  data_array (0 to NUM_OPERANDS-1);
        in_valid   : in  std_logic;
        out_data   : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity Serializer;

architecture bhv of Serializer is
    signal internal : data_array (0 to NUM_OPERANDS-1);
    begin
    process(clk_dsp,clk_sys)
        variable cmp : natural range 0 to NUM_OPERANDS;
        begin
        if (reset_n = '0') then
            internal <= (others =>(others => '0'));
            out_data <= (others => '0');
        elsif (rising_edge(clk_dsp) and in_valid = '1') then
            if (clk_sys = '1') then
                internal <= in_data;
            end if;
                out_data <= internal(NUM_OPERANDS-1);
                shift_reg : for i in 1 to NUM_OPERANDS-1 loop
                    internal(i) <= internal(i-1);
                end loop shift_reg;
        end if;
    end process;
end architecture bhv;
