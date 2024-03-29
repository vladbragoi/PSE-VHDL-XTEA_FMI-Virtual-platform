-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xtea is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    word0 : IN STD_LOGIC_VECTOR (63 downto 0);
    word1 : IN STD_LOGIC_VECTOR (63 downto 0);
    key0 : IN STD_LOGIC_VECTOR (63 downto 0);
    key1 : IN STD_LOGIC_VECTOR (63 downto 0);
    key2 : IN STD_LOGIC_VECTOR (63 downto 0);
    key3 : IN STD_LOGIC_VECTOR (63 downto 0);
    mode : IN STD_LOGIC;
    result0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    result0_ap_vld : OUT STD_LOGIC;
    result1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    result1_ap_vld : OUT STD_LOGIC );
end;


architecture behav of xtea is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "xtea,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.581750,HLS_SYN_LAT=98,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1332,HLS_SYN_LUT=2585,HLS_VERSION=2019_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv37_0 : STD_LOGIC_VECTOR (36 downto 0) := "0000000000000000000000000000000000000";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv37_13C6EF3720 : STD_LOGIC_VECTOR (36 downto 0) := "1001111000110111011110011011100100000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv6_20 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv64_4 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv13_19B9 : STD_LOGIC_VECTOR (12 downto 0) := "1100110111001";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv13_800 : STD_LOGIC_VECTOR (12 downto 0) := "0100000000000";
    constant ap_const_lv13_1000 : STD_LOGIC_VECTOR (12 downto 0) := "1000000000000";
    constant ap_const_lv37_9E3779B9 : STD_LOGIC_VECTOR (36 downto 0) := "0000010011110001101110111100110111001";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv37_1F61C88647 : STD_LOGIC_VECTOR (36 downto 0) := "1111101100001110010001000011001000111";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal i_2_fu_258_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_2_reg_828 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal add_ln30_fu_350_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln30_reg_833 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln19_fu_252_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln30_1_fu_360_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln30_1_reg_838 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln36_2_fu_442_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln36_2_reg_843 : STD_LOGIC_VECTOR (63 downto 0);
    signal v0_fu_454_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal v0_reg_848 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal sum_2_fu_460_p2 : STD_LOGIC_VECTOR (36 downto 0);
    signal sum_2_reg_853 : STD_LOGIC_VECTOR (36 downto 0);
    signal add_ln43_fu_496_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln43_reg_858 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln43_1_fu_502_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln43_1_reg_863 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_2_fu_511_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal i_fu_523_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_reg_876 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal add_ln64_fu_629_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln64_reg_881 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln52_fu_517_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln64_1_fu_639_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln64_1_reg_886 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln70_2_fu_703_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln70_2_reg_891 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_fu_715_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_reg_896 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal sum_fu_721_p2 : STD_LOGIC_VECTOR (36 downto 0);
    signal sum_reg_901 : STD_LOGIC_VECTOR (36 downto 0);
    signal add_ln77_fu_757_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln77_reg_906 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln77_1_fu_763_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln77_1_reg_911 : STD_LOGIC_VECTOR (63 downto 0);
    signal v0_2_fu_772_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal sum_0_reg_142 : STD_LOGIC_VECTOR (36 downto 0);
    signal mode_read_read_fu_86_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_0_reg_154 : STD_LOGIC_VECTOR (5 downto 0);
    signal v0_0_reg_165 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_0_reg_175 : STD_LOGIC_VECTOR (63 downto 0);
    signal sum_1_reg_185 : STD_LOGIC_VECTOR (36 downto 0);
    signal i_1_reg_197 : STD_LOGIC_VECTOR (5 downto 0);
    signal v0_1_reg_208 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_1_reg_218 : STD_LOGIC_VECTOR (63 downto 0);
    signal v0_3_reg_228 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_3_reg_240 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal trunc_ln19_fu_264_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln21_fu_268_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln23_fu_274_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln21_fu_286_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln23_fu_292_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln25_fu_280_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln23_fu_304_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln23_fu_298_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln23_1_fu_310_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln4_fu_330_p4 : STD_LOGIC_VECTOR (58 downto 0);
    signal shl_ln30_fu_324_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln30_fu_340_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln30_fu_344_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln19_fu_356_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln23_2_fu_316_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln32_fu_366_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln32_1_fu_370_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal tmp_4_fu_376_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal and_ln1_fu_386_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal icmp_ln34_fu_394_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln36_fu_400_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln34_fu_412_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln36_fu_418_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln38_fu_406_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln36_fu_430_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln36_fu_424_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln36_1_fu_436_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln30_1_fu_450_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln6_fu_476_p4 : STD_LOGIC_VECTOR (58 downto 0);
    signal shl_ln43_fu_470_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln43_fu_486_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln43_fu_490_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln32_fu_466_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln43_1_fu_507_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_fu_529_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal and_ln_fu_539_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal icmp_ln55_fu_547_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln57_fu_553_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln55_fu_565_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln57_fu_571_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln59_fu_559_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln57_fu_583_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln57_fu_577_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln57_1_fu_589_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln1_fu_609_p4 : STD_LOGIC_VECTOR (58 downto 0);
    signal shl_ln64_fu_603_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln64_fu_619_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln64_fu_623_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln52_fu_635_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln57_2_fu_595_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln66_fu_645_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln66_1_fu_649_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln68_fu_655_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln70_fu_661_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln68_fu_673_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln70_fu_679_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln72_fu_667_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln70_fu_691_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln70_fu_685_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln70_1_fu_697_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln64_1_fu_711_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln3_fu_737_p4 : STD_LOGIC_VECTOR (58 downto 0);
    signal shl_ln77_fu_731_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln77_fu_747_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln77_fu_751_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln66_fu_727_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln77_1_fu_768_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    i_0_reg_154_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((mode_read_read_fu_86_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_0_reg_154 <= ap_const_lv6_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                i_0_reg_154 <= i_2_reg_828;
            end if; 
        end if;
    end process;

    i_1_reg_197_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (mode_read_read_fu_86_p2 = ap_const_lv1_1))) then 
                i_1_reg_197 <= ap_const_lv6_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                i_1_reg_197 <= i_reg_876;
            end if; 
        end if;
    end process;

    sum_0_reg_142_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((mode_read_read_fu_86_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                sum_0_reg_142 <= ap_const_lv37_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                sum_0_reg_142 <= sum_2_reg_853;
            end if; 
        end if;
    end process;

    sum_1_reg_185_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (mode_read_read_fu_86_p2 = ap_const_lv1_1))) then 
                sum_1_reg_185 <= ap_const_lv37_13C6EF3720;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                sum_1_reg_185 <= sum_reg_901;
            end if; 
        end if;
    end process;

    v0_0_reg_165_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((mode_read_read_fu_86_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                v0_0_reg_165 <= word0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                v0_0_reg_165 <= v0_reg_848;
            end if; 
        end if;
    end process;

    v0_1_reg_208_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (mode_read_read_fu_86_p2 = ap_const_lv1_1))) then 
                v0_1_reg_208 <= word0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                v0_1_reg_208 <= v0_2_fu_772_p2;
            end if; 
        end if;
    end process;

    v0_3_reg_228_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln19_fu_252_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                v0_3_reg_228 <= v0_0_reg_165;
            elsif (((icmp_ln52_fu_517_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                v0_3_reg_228 <= v0_1_reg_208;
            end if; 
        end if;
    end process;

    v1_0_reg_175_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((mode_read_read_fu_86_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                v1_0_reg_175 <= word1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                v1_0_reg_175 <= v1_2_fu_511_p2;
            end if; 
        end if;
    end process;

    v1_1_reg_218_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (mode_read_read_fu_86_p2 = ap_const_lv1_1))) then 
                v1_1_reg_218 <= word1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                v1_1_reg_218 <= v1_reg_896;
            end if; 
        end if;
    end process;

    v1_3_reg_240_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln19_fu_252_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                v1_3_reg_240 <= v1_0_reg_175;
            elsif (((icmp_ln52_fu_517_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                v1_3_reg_240 <= v1_1_reg_218;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln19_fu_252_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                add_ln30_1_reg_838 <= add_ln30_1_fu_360_p2;
                add_ln30_reg_833 <= add_ln30_fu_350_p2;
                select_ln36_2_reg_843 <= select_ln36_2_fu_442_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                add_ln43_1_reg_863 <= add_ln43_1_fu_502_p2;
                add_ln43_reg_858 <= add_ln43_fu_496_p2;
                sum_2_reg_853 <= sum_2_fu_460_p2;
                v0_reg_848 <= v0_fu_454_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln52_fu_517_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                add_ln64_1_reg_886 <= add_ln64_1_fu_639_p2;
                add_ln64_reg_881 <= add_ln64_fu_629_p2;
                select_ln70_2_reg_891 <= select_ln70_2_fu_703_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                add_ln77_1_reg_911 <= add_ln77_1_fu_763_p2;
                add_ln77_reg_906 <= add_ln77_fu_757_p2;
                sum_reg_901 <= sum_fu_721_p2;
                v1_reg_896 <= v1_fu_715_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_2_reg_828 <= i_2_fu_258_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                i_reg_876 <= i_fu_523_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln19_fu_252_p2, ap_CS_fsm_state5, icmp_ln52_fu_517_p2, mode_read_read_fu_86_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (mode_read_read_fu_86_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                elsif (((mode_read_read_fu_86_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln19_fu_252_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when ap_ST_fsm_state5 => 
                if (((icmp_ln52_fu_517_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    add_ln30_1_fu_360_p2 <= std_logic_vector(unsigned(zext_ln19_fu_356_p1) + unsigned(select_ln23_2_fu_316_p3));
    add_ln30_fu_350_p2 <= std_logic_vector(unsigned(v1_0_reg_175) + unsigned(xor_ln30_fu_344_p2));
    add_ln32_1_fu_370_p2 <= std_logic_vector(signed(ap_const_lv13_19B9) + signed(trunc_ln32_fu_366_p1));
    add_ln43_1_fu_502_p2 <= std_logic_vector(unsigned(zext_ln32_fu_466_p1) + unsigned(select_ln36_2_reg_843));
    add_ln43_fu_496_p2 <= std_logic_vector(unsigned(v0_fu_454_p2) + unsigned(xor_ln43_fu_490_p2));
    add_ln64_1_fu_639_p2 <= std_logic_vector(unsigned(zext_ln52_fu_635_p1) + unsigned(select_ln57_2_fu_595_p3));
    add_ln64_fu_629_p2 <= std_logic_vector(unsigned(v0_1_reg_208) + unsigned(xor_ln64_fu_623_p2));
    add_ln66_1_fu_649_p2 <= std_logic_vector(signed(ap_const_lv2_3) + signed(trunc_ln66_fu_645_p1));
    add_ln77_1_fu_763_p2 <= std_logic_vector(unsigned(zext_ln66_fu_727_p1) + unsigned(select_ln70_2_reg_891));
    add_ln77_fu_757_p2 <= std_logic_vector(unsigned(v1_fu_715_p2) + unsigned(xor_ln77_fu_751_p2));
    and_ln1_fu_386_p3 <= (tmp_4_fu_376_p4 & ap_const_lv11_0);
    and_ln23_fu_292_p2 <= (xor_ln21_fu_286_p2 and icmp_ln23_fu_274_p2);
    and_ln36_fu_418_p2 <= (xor_ln34_fu_412_p2 and icmp_ln36_fu_400_p2);
    and_ln57_fu_571_p2 <= (xor_ln55_fu_565_p2 and icmp_ln57_fu_553_p2);
    and_ln70_fu_679_p2 <= (xor_ln68_fu_673_p2 and icmp_ln70_fu_661_p2);
    and_ln_fu_539_p3 <= (tmp_fu_529_p4 & ap_const_lv11_0);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_done_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    i_2_fu_258_p2 <= std_logic_vector(unsigned(i_0_reg_154) + unsigned(ap_const_lv6_1));
    i_fu_523_p2 <= std_logic_vector(unsigned(i_1_reg_197) + unsigned(ap_const_lv6_1));
    icmp_ln19_fu_252_p2 <= "1" when (i_0_reg_154 = ap_const_lv6_20) else "0";
    icmp_ln21_fu_268_p2 <= "1" when (trunc_ln19_fu_264_p1 = ap_const_lv2_0) else "0";
    icmp_ln23_fu_274_p2 <= "1" when (trunc_ln19_fu_264_p1 = ap_const_lv2_1) else "0";
    icmp_ln25_fu_280_p2 <= "1" when (trunc_ln19_fu_264_p1 = ap_const_lv2_2) else "0";
    icmp_ln34_fu_394_p2 <= "1" when (and_ln1_fu_386_p3 = ap_const_lv13_0) else "0";
    icmp_ln36_fu_400_p2 <= "1" when (and_ln1_fu_386_p3 = ap_const_lv13_800) else "0";
    icmp_ln38_fu_406_p2 <= "1" when (and_ln1_fu_386_p3 = ap_const_lv13_1000) else "0";
    icmp_ln52_fu_517_p2 <= "1" when (i_1_reg_197 = ap_const_lv6_20) else "0";
    icmp_ln55_fu_547_p2 <= "1" when (and_ln_fu_539_p3 = ap_const_lv13_0) else "0";
    icmp_ln57_fu_553_p2 <= "1" when (and_ln_fu_539_p3 = ap_const_lv13_800) else "0";
    icmp_ln59_fu_559_p2 <= "1" when (and_ln_fu_539_p3 = ap_const_lv13_1000) else "0";
    icmp_ln68_fu_655_p2 <= "1" when (add_ln66_1_fu_649_p2 = ap_const_lv2_0) else "0";
    icmp_ln70_fu_661_p2 <= "1" when (add_ln66_1_fu_649_p2 = ap_const_lv2_1) else "0";
    icmp_ln72_fu_667_p2 <= "1" when (add_ln66_1_fu_649_p2 = ap_const_lv2_2) else "0";
    mode_read_read_fu_86_p2 <= (0=>mode, others=>'-');
    or_ln23_fu_304_p2 <= (icmp_ln21_fu_268_p2 or and_ln23_fu_292_p2);
    or_ln36_fu_430_p2 <= (icmp_ln34_fu_394_p2 or and_ln36_fu_418_p2);
    or_ln57_fu_583_p2 <= (icmp_ln55_fu_547_p2 or and_ln57_fu_571_p2);
    or_ln70_fu_691_p2 <= (icmp_ln68_fu_655_p2 or and_ln70_fu_679_p2);
    result0 <= v0_3_reg_228;

    result0_ap_vld_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            result0_ap_vld <= ap_const_logic_1;
        else 
            result0_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    result1 <= v1_3_reg_240;

    result1_ap_vld_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            result1_ap_vld <= ap_const_logic_1;
        else 
            result1_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    select_ln23_1_fu_310_p3 <= 
        key2 when (icmp_ln25_fu_280_p2(0) = '1') else 
        key3;
    select_ln23_2_fu_316_p3 <= 
        select_ln23_fu_298_p3 when (or_ln23_fu_304_p2(0) = '1') else 
        select_ln23_1_fu_310_p3;
    select_ln23_fu_298_p3 <= 
        key1 when (and_ln23_fu_292_p2(0) = '1') else 
        key0;
    select_ln36_1_fu_436_p3 <= 
        key2 when (icmp_ln38_fu_406_p2(0) = '1') else 
        key3;
    select_ln36_2_fu_442_p3 <= 
        select_ln36_fu_424_p3 when (or_ln36_fu_430_p2(0) = '1') else 
        select_ln36_1_fu_436_p3;
    select_ln36_fu_424_p3 <= 
        key1 when (and_ln36_fu_418_p2(0) = '1') else 
        key0;
    select_ln57_1_fu_589_p3 <= 
        key2 when (icmp_ln59_fu_559_p2(0) = '1') else 
        key3;
    select_ln57_2_fu_595_p3 <= 
        select_ln57_fu_577_p3 when (or_ln57_fu_583_p2(0) = '1') else 
        select_ln57_1_fu_589_p3;
    select_ln57_fu_577_p3 <= 
        key1 when (and_ln57_fu_571_p2(0) = '1') else 
        key0;
    select_ln70_1_fu_697_p3 <= 
        key2 when (icmp_ln72_fu_667_p2(0) = '1') else 
        key3;
    select_ln70_2_fu_703_p3 <= 
        select_ln70_fu_685_p3 when (or_ln70_fu_691_p2(0) = '1') else 
        select_ln70_1_fu_697_p3;
    select_ln70_fu_685_p3 <= 
        key1 when (and_ln70_fu_679_p2(0) = '1') else 
        key0;
        sext_ln30_fu_340_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln4_fu_330_p4),64));

        sext_ln43_fu_486_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln6_fu_476_p4),64));

        sext_ln64_fu_619_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln1_fu_609_p4),64));

        sext_ln77_fu_747_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln3_fu_737_p4),64));

    shl_ln30_fu_324_p2 <= std_logic_vector(shift_left(unsigned(v1_0_reg_175),to_integer(unsigned('0' & ap_const_lv64_4(31-1 downto 0)))));
    shl_ln43_fu_470_p2 <= std_logic_vector(shift_left(unsigned(v0_fu_454_p2),to_integer(unsigned('0' & ap_const_lv64_4(31-1 downto 0)))));
    shl_ln64_fu_603_p2 <= std_logic_vector(shift_left(unsigned(v0_1_reg_208),to_integer(unsigned('0' & ap_const_lv64_4(31-1 downto 0)))));
    shl_ln77_fu_731_p2 <= std_logic_vector(shift_left(unsigned(v1_fu_715_p2),to_integer(unsigned('0' & ap_const_lv64_4(31-1 downto 0)))));
    sum_2_fu_460_p2 <= std_logic_vector(unsigned(ap_const_lv37_9E3779B9) + unsigned(sum_0_reg_142));
    sum_fu_721_p2 <= std_logic_vector(signed(ap_const_lv37_1F61C88647) + signed(sum_1_reg_185));
    tmp_4_fu_376_p4 <= add_ln32_1_fu_370_p2(12 downto 11);
    tmp_fu_529_p4 <= sum_1_reg_185(12 downto 11);
    trunc_ln19_fu_264_p1 <= sum_0_reg_142(2 - 1 downto 0);
    trunc_ln1_fu_609_p4 <= v0_1_reg_208(63 downto 5);
    trunc_ln32_fu_366_p1 <= sum_0_reg_142(13 - 1 downto 0);
    trunc_ln3_fu_737_p4 <= v1_fu_715_p2(63 downto 5);
    trunc_ln4_fu_330_p4 <= v1_0_reg_175(63 downto 5);
    trunc_ln66_fu_645_p1 <= sum_1_reg_185(2 - 1 downto 0);
    trunc_ln6_fu_476_p4 <= v0_fu_454_p2(63 downto 5);
    v0_2_fu_772_p2 <= std_logic_vector(unsigned(v0_1_reg_208) - unsigned(xor_ln77_1_fu_768_p2));
    v0_fu_454_p2 <= std_logic_vector(unsigned(xor_ln30_1_fu_450_p2) + unsigned(v0_0_reg_165));
    v1_2_fu_511_p2 <= std_logic_vector(unsigned(xor_ln43_1_fu_507_p2) + unsigned(v1_0_reg_175));
    v1_fu_715_p2 <= std_logic_vector(unsigned(v1_1_reg_218) - unsigned(xor_ln64_1_fu_711_p2));
    xor_ln21_fu_286_p2 <= (icmp_ln21_fu_268_p2 xor ap_const_lv1_1);
    xor_ln30_1_fu_450_p2 <= (add_ln30_reg_833 xor add_ln30_1_reg_838);
    xor_ln30_fu_344_p2 <= (shl_ln30_fu_324_p2 xor sext_ln30_fu_340_p1);
    xor_ln34_fu_412_p2 <= (icmp_ln34_fu_394_p2 xor ap_const_lv1_1);
    xor_ln43_1_fu_507_p2 <= (add_ln43_reg_858 xor add_ln43_1_reg_863);
    xor_ln43_fu_490_p2 <= (shl_ln43_fu_470_p2 xor sext_ln43_fu_486_p1);
    xor_ln55_fu_565_p2 <= (icmp_ln55_fu_547_p2 xor ap_const_lv1_1);
    xor_ln64_1_fu_711_p2 <= (add_ln64_reg_881 xor add_ln64_1_reg_886);
    xor_ln64_fu_623_p2 <= (shl_ln64_fu_603_p2 xor sext_ln64_fu_619_p1);
    xor_ln68_fu_673_p2 <= (icmp_ln68_fu_655_p2 xor ap_const_lv1_1);
    xor_ln77_1_fu_768_p2 <= (add_ln77_reg_906 xor add_ln77_1_reg_911);
    xor_ln77_fu_751_p2 <= (shl_ln77_fu_731_p2 xor sext_ln77_fu_747_p1);
    zext_ln19_fu_356_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sum_0_reg_142),64));
    zext_ln32_fu_466_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sum_2_fu_460_p2),64));
    zext_ln52_fu_635_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sum_1_reg_185),64));
    zext_ln66_fu_727_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sum_fu_721_p2),64));
end behav;
