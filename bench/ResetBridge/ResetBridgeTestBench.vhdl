library ieee;

use ieee.std_logic_1164.all;


entity ResetBridgeTestBench is
end ResetBridgeTestBench;


architecture ResetBridgeArchTestBench of ResetBridgeTestBench is

component ResetBridge
port( i_clock : in std_logic;
i_reset : in std_logic;
i_input : in std_logic;
o_output : out std_logic
);
end component;

signal clock : std_logic := '0';
signal rbi : std_logic := '0';
signal reset : std_logic := '0';

signal reset_output : std_logic := '0';


begin
  
    reset_bridge_0 : ResetBridge port map(i_clock => clock,i_reset => reset,i_input=>rbi,o_output=>reset_output);

  process
   begin
   clock <= '0'; wait for 10 ns;
   clock <= '1'; wait for 10 ns;
  end process;

  process
   begin
   reset <= '1';
   wait for 22 ns;
   reset <= '0'; wait for 101 ns;
   reset <= '1'; wait for 207 ns;
   reset <= '0';
  wait;
  end process;
    

end ResetBridgeArchTestBench;    