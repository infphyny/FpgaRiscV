library ieee;
use ieee.std_logic_1164.all;


entity ResetBridge is

  port( i_clock : in std_logic;
        i_reset : in std_logic;
        i_input : in std_logic;
        o_output : out std_logic
   );

end ResetBridge;    


architecture ResetBridgeArch of ResetBridge is

component FlipFlop
    generic( INIT_VALUE :std_logic := '1' );

    port(
        i_clock : in std_logic;
        i_reset : in std_logic;
        i_input : in std_logic;
        o_output : out std_logic
    );
end component;

signal ff_0 : std_logic;

begin    

flipflop_0 : FlipFlop port map(i_clock => i_clock, i_reset => i_reset,i_input => i_input,o_output => ff_0 );
flipflop_1 : FlipFlop port map(i_clock => i_clock, i_reset => i_reset,i_input => ff_0, o_output => o_output);

end ResetBridgeArch;    