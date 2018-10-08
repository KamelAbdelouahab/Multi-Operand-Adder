library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

library work;
    use work.DataTypes.all;

entity Accumulator is
    generic(
        NUM_OPERANDS : natural;
        DATA_WIDTH   : natural;
        SUM_WIDTH    : natural
    );
    port(
        clk_dsp    : in  std_logic;
        clk_sys    : in  std_logic;
        reset_n    : in  std_logic;
        in_data    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		    in_valid   : in  std_logic;
        out_data   : out std_logic_vector(SUM_WIDTH-1 downto 0)
    );
end entity Accumulator;

architecture bhv of Accumulator is
    signal sig_acc : std_logic_vector(SUM_WIDTH-1 downto 0) := (others=>'0');
    begin
    acc_process : process(clk_dsp)
    begin
        if (reset_n = '0') then
            sig_acc <= (others => '0');
        elsif (rising_edge(clk_dsp)) then
		      if (in_valid = '1') then
            sig_acc <= (others => '0');
            -- sig_acc(SUM_WIDTH-1 downto DATA_WIDTH) <= (others=>'0');
				    -- sig_acc(DATA_WIDTH-1 downto 0) <= in_data;
				else
            acc_loop : for i in 1 to NUM_OPERANDS-1 loop
                sig_acc <= sig_acc + in_data;
            end loop acc_loop;
				end if;
        end if;
    end process;

    out_process : process(clk_sys)
    Begin
        if (rising_edge(clk_sys)) then
            out_data <= sig_acc;
        end if;
    End process;

end architecture bhv;
