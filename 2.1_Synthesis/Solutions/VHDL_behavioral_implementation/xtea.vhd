library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package xtea_pack is
	constant DELTA     : std_logic_vector (31 downto 0) := X"9E3779B9";
	constant N_CYCLES  : unsigned (7 downto 0)  := "01000000"; 
end xtea_pack;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.xtea_pack.all;
 
entity xtea is
    port (
        clk         : in    bit;
        rst         : in    bit;
        mode        : in    bit;
        din_rdy     : in    bit;
        dout_rdy    : out   bit;
        key0        : in    unsigned (31 downto 0);
        key1        : in    unsigned (31 downto 0);
        key2        : in    unsigned (31 downto 0);
        key3        : in    unsigned (31 downto 0);
        word0       : in    unsigned (31 downto 0);
        word1       : in    unsigned (31 downto 0);
        result0     : out   unsigned (31 downto 0);
        result1     : out   unsigned (31 downto 0));
end xtea;

architecture xtea_arc of xtea is

        type state         is (RESET, ST_READ, ST_M0, ST_M1, ST_K, ST_CALC, ST_SUM, ST_WRITE);
    	subtype int        is integer range 0 to 65;
	signal STATUS      : state;
	signal NEXT_STATUS : state;
	signal k           : unsigned (1 downto 0);
	signal key         : unsigned (31 downto 0);
	signal v0          : unsigned (31 downto 0);
	signal v1          : unsigned (31 downto 0);
	signal sum         : unsigned (31 downto 0);
	signal counter     : int := 0;
begin
	
	-- FSM
	fsm: process (STATUS, din_rdy)
	begin
	   NEXT_STATUS <= STATUS;
	   
	   case STATUS is
	       when RESET =>
	           NEXT_STATUS <= ST_READ;
	       when ST_READ =>
	           if din_rdy = '1' then
	               if mode = '0' then
	                   NEXT_STATUS <= ST_M0;
	               else
	                   NEXT_STATUS <= ST_M1;
	               end if;
	           end if;
	       when ST_M0 =>
	           if counter < N_CYCLES then
	               NEXT_STATUS <= ST_K;
	           else
	               NEXT_STATUS <= ST_WRITE;
	           end if;
	       when ST_M1 => 
	           if counter < N_CYCLES then
	               NEXT_STATUS <= ST_K;
	           else
	               NEXT_STATUS <= ST_WRITE;
	           end if;
	       when ST_K =>
	           NEXT_STATUS <= ST_CALC;
	       when ST_CALC =>
	           NEXT_STATUS <= ST_SUM;
	       when ST_SUM =>
	           if mode = '0' then
	               NEXT_STATUS <= ST_M0;
	           else
	               NEXT_STATUS <= ST_M1;
	           end if;
	       when ST_WRITE =>
	           --NEXT_STATUS <= RESET;
	       when others => 
	           NEXT_STATUS <= STATUS;
	   end case;
	end process;

	-- DATAPATH
	datapath: process (clk, rst)
    begin
        if rst /= '0' then
            STATUS <= RESET;
        else 
            if clk'event and clk = '1' then
                STATUS <= NEXT_STATUS;
                case STATUS is
                    when RESET => 
                        result0 <= (others => '0');
                        result1 <= (others => '0');
                        dout_rdy <= '0';
                        counter <= 0;
                        k <= "00";
                    when ST_READ => 
                        v0 <= word0;
                        v1 <= word1;
                        if mode = '0' then
                            sum <= (others => '0');
                        else 
                            sum <= "11000110111011110011011100100000";
                        end if;
                    when ST_M0 => 
                        if counter mod 2 = 0 then
                            k <= sum(1 downto 0) and "11";        -- sum & 3    
                        else
                            k <= sum(12 downto 11) and "11";      -- (sum >> 11) & 3
                        end if;
                    when ST_M1 => 
                        if counter mod 2 = 0 then
                            k <= sum(12 downto 11) and "11";      -- (sum >> 11) & 3 
                        else
                            k <= sum(1 downto 0) and "11";        -- sum & 3;
                        end if;
                    when ST_K =>
                        case k is
                            when "00" => key <= key0;
                            when "01" => key <= key1;
                            when "10" => key <= key2;
                            when "11" => key <= key3;
                            when others => null;
                        end case;
                    when ST_CALC =>
                        if mode = '0' then
                            if counter mod 2 = 0 then
                                v0 <= v0 + ((((v1 sll 4) xor (v1 srl 5)) + v1) xor (sum + key)); 
                            else
                                v1 <= v1 + ((((v0 sll 4) xor (v0 srl 5)) + v0) xor (sum + key));
                            end if;
                        else
                            if counter mod 2 = 0 then
                                v1 <= v1 - ((((v0 sll 4) xor (v0 srl 5)) + v0) xor (sum + key));
                            else
                                v0 <= v0 - ((((v1 sll 4) xor (v1 srl 5)) + v1) xor (sum + key));
                            end if;
                        end if;
                    when ST_SUM =>
                        if counter mod 2 = 0 then
                            if mode = '0' then
                                sum <= sum + unsigned(delta);
                            else
                                sum <= sum - unsigned(delta);
                            end if;
                        end if;
                        counter <= counter + 1;
                    when ST_WRITE =>
                        result0 <= v0;
                        result1 <= v1;
                        dout_rdy <= '1';
                    when others => 
                        dout_rdy <= '0';
                end case;
            end if;
        end if;
    end process;
end xtea_arc;