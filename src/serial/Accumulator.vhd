library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

library work;
    use work.DataTypes.all;

entity Accumulator is
    generic(
        NUM_OPERANDS : natural;
        DATA_WIDTH : natural;
        SUM_WIDTH : natural
    );
    port(
        clk_dsp    : in     std_logic;
        reset_n    : in     std_logic;
        in_data    : in     std_logic_vector(DATA_WIDTH-1 downto 0);
        out_data   : buffer std_logic_vector(SUM_WIDTH-1 downto 0)
    );
end entity Accumulator;

architecture bhv of Accumulator is
    signal sig_acc : std_logic_vector(SUM_WIDTH-1 downto 0);
    begin
    acc_process : process(clk_dsp)
    begin
        if (reset_n = '0') then
            sig_acc <= (others => '0');
            out_data <= (others => '0');
        elsif (rising_edge(clk_dsp)) then
            acc_loop : for i in 0 to NUM_OPERANDS-1 loop
                out_data <= out_data + in_data;
            end loop acc_loop;
        end if;
    end process;
end architecture bhv;
