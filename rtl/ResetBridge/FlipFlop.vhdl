library ieee;
use ieee.std_logic_1164.all;


entity FlipFlop is
    
    generic( INIT_VALUE :std_logic := '1' );

    port(
        i_clock : in std_logic;
        i_reset : in std_logic;
        i_input : in std_logic;
        o_output : out std_logic
    );


end FlipFlop;    


architecture FlipFlopArch of FlipFlop is

 signal q : std_logic := INIT_VALUE;   

begin
    
  process(i_clock,i_reset)

  begin
  
    if i_reset = '1' then
      q <= INIT_VALUE;
    else 
     
        if rising_edge(i_clock) then
        
            q <= i_input;    

        end if;    

    end if;

  end process;  


  process(q)
  begin
    o_output <= q; 
  end process;  


end FlipFlopArch;    