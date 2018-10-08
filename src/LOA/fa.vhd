library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

entity fa is
    port(
    x    : in std_logic;
    y    : in std_logic;
    c_in : in std_logic;
	 s    : out std_logic;
	 c_out: out std_logic
    );
end entity fa;

architecture Bhv of fa is
-----------------------------
-- SIGNALS
-----------------------------
begin
    s <= (x XOR y) XOR c_in;
	c_out <= (x AND y) OR (c_in and (x xor y));
end architecture Bhv;
