// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="xtea,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.581750,HLS_SYN_LAT=98,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1332,HLS_SYN_LUT=2585,HLS_VERSION=2019_1}" *)

module xtea (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        word0,
        word1,
        key0,
        key1,
        key2,
        key3,
        mode,
        result0,
        result0_ap_vld,
        result1,
        result1_ap_vld
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] word0;
input  [63:0] word1;
input  [63:0] key0;
input  [63:0] key1;
input  [63:0] key2;
input  [63:0] key3;
input   mode;
output  [63:0] result0;
output   result0_ap_vld;
output  [63:0] result1;
output   result1_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg result0_ap_vld;
reg result1_ap_vld;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [5:0] i_2_fu_258_p2;
reg   [5:0] i_2_reg_828;
wire    ap_CS_fsm_state2;
wire   [63:0] add_ln30_fu_350_p2;
reg   [63:0] add_ln30_reg_833;
wire   [0:0] icmp_ln19_fu_252_p2;
wire   [63:0] add_ln30_1_fu_360_p2;
reg   [63:0] add_ln30_1_reg_838;
wire   [63:0] select_ln36_2_fu_442_p3;
reg   [63:0] select_ln36_2_reg_843;
wire   [63:0] v0_fu_454_p2;
reg   [63:0] v0_reg_848;
wire    ap_CS_fsm_state3;
wire   [36:0] sum_2_fu_460_p2;
reg   [36:0] sum_2_reg_853;
wire   [63:0] add_ln43_fu_496_p2;
reg   [63:0] add_ln43_reg_858;
wire   [63:0] add_ln43_1_fu_502_p2;
reg   [63:0] add_ln43_1_reg_863;
wire   [63:0] v1_2_fu_511_p2;
wire    ap_CS_fsm_state4;
wire   [5:0] i_fu_523_p2;
reg   [5:0] i_reg_876;
wire    ap_CS_fsm_state5;
wire   [63:0] add_ln64_fu_629_p2;
reg   [63:0] add_ln64_reg_881;
wire   [0:0] icmp_ln52_fu_517_p2;
wire   [63:0] add_ln64_1_fu_639_p2;
reg   [63:0] add_ln64_1_reg_886;
wire   [63:0] select_ln70_2_fu_703_p3;
reg   [63:0] select_ln70_2_reg_891;
wire   [63:0] v1_fu_715_p2;
reg   [63:0] v1_reg_896;
wire    ap_CS_fsm_state6;
wire   [36:0] sum_fu_721_p2;
reg   [36:0] sum_reg_901;
wire   [63:0] add_ln77_fu_757_p2;
reg   [63:0] add_ln77_reg_906;
wire   [63:0] add_ln77_1_fu_763_p2;
reg   [63:0] add_ln77_1_reg_911;
wire   [63:0] v0_2_fu_772_p2;
wire    ap_CS_fsm_state7;
reg   [36:0] sum_0_reg_142;
wire   [0:0] mode_read_read_fu_86_p2;
reg   [5:0] i_0_reg_154;
reg   [63:0] v0_0_reg_165;
reg   [63:0] v1_0_reg_175;
reg   [36:0] sum_1_reg_185;
reg   [5:0] i_1_reg_197;
reg   [63:0] v0_1_reg_208;
reg   [63:0] v1_1_reg_218;
reg   [63:0] v0_3_reg_228;
reg   [63:0] v1_3_reg_240;
wire    ap_CS_fsm_state8;
wire   [1:0] trunc_ln19_fu_264_p1;
wire   [0:0] icmp_ln21_fu_268_p2;
wire   [0:0] icmp_ln23_fu_274_p2;
wire   [0:0] xor_ln21_fu_286_p2;
wire   [0:0] and_ln23_fu_292_p2;
wire   [0:0] icmp_ln25_fu_280_p2;
wire   [0:0] or_ln23_fu_304_p2;
wire   [63:0] select_ln23_fu_298_p3;
wire   [63:0] select_ln23_1_fu_310_p3;
wire   [58:0] trunc_ln4_fu_330_p4;
wire   [63:0] shl_ln30_fu_324_p2;
wire  signed [63:0] sext_ln30_fu_340_p1;
wire   [63:0] xor_ln30_fu_344_p2;
wire   [63:0] zext_ln19_fu_356_p1;
wire   [63:0] select_ln23_2_fu_316_p3;
wire   [12:0] trunc_ln32_fu_366_p1;
wire   [12:0] add_ln32_1_fu_370_p2;
wire   [1:0] tmp_4_fu_376_p4;
wire   [12:0] and_ln1_fu_386_p3;
wire   [0:0] icmp_ln34_fu_394_p2;
wire   [0:0] icmp_ln36_fu_400_p2;
wire   [0:0] xor_ln34_fu_412_p2;
wire   [0:0] and_ln36_fu_418_p2;
wire   [0:0] icmp_ln38_fu_406_p2;
wire   [0:0] or_ln36_fu_430_p2;
wire   [63:0] select_ln36_fu_424_p3;
wire   [63:0] select_ln36_1_fu_436_p3;
wire   [63:0] xor_ln30_1_fu_450_p2;
wire   [58:0] trunc_ln6_fu_476_p4;
wire   [63:0] shl_ln43_fu_470_p2;
wire  signed [63:0] sext_ln43_fu_486_p1;
wire   [63:0] xor_ln43_fu_490_p2;
wire   [63:0] zext_ln32_fu_466_p1;
wire   [63:0] xor_ln43_1_fu_507_p2;
wire   [1:0] tmp_fu_529_p4;
wire   [12:0] and_ln_fu_539_p3;
wire   [0:0] icmp_ln55_fu_547_p2;
wire   [0:0] icmp_ln57_fu_553_p2;
wire   [0:0] xor_ln55_fu_565_p2;
wire   [0:0] and_ln57_fu_571_p2;
wire   [0:0] icmp_ln59_fu_559_p2;
wire   [0:0] or_ln57_fu_583_p2;
wire   [63:0] select_ln57_fu_577_p3;
wire   [63:0] select_ln57_1_fu_589_p3;
wire   [58:0] trunc_ln1_fu_609_p4;
wire   [63:0] shl_ln64_fu_603_p2;
wire  signed [63:0] sext_ln64_fu_619_p1;
wire   [63:0] xor_ln64_fu_623_p2;
wire   [63:0] zext_ln52_fu_635_p1;
wire   [63:0] select_ln57_2_fu_595_p3;
wire   [1:0] trunc_ln66_fu_645_p1;
wire   [1:0] add_ln66_1_fu_649_p2;
wire   [0:0] icmp_ln68_fu_655_p2;
wire   [0:0] icmp_ln70_fu_661_p2;
wire   [0:0] xor_ln68_fu_673_p2;
wire   [0:0] and_ln70_fu_679_p2;
wire   [0:0] icmp_ln72_fu_667_p2;
wire   [0:0] or_ln70_fu_691_p2;
wire   [63:0] select_ln70_fu_685_p3;
wire   [63:0] select_ln70_1_fu_697_p3;
wire   [63:0] xor_ln64_1_fu_711_p2;
wire   [58:0] trunc_ln3_fu_737_p4;
wire   [63:0] shl_ln77_fu_731_p2;
wire  signed [63:0] sext_ln77_fu_747_p1;
wire   [63:0] xor_ln77_fu_751_p2;
wire   [63:0] zext_ln66_fu_727_p1;
wire   [63:0] xor_ln77_1_fu_768_p2;
reg   [7:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((mode_read_read_fu_86_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_0_reg_154 <= 6'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        i_0_reg_154 <= i_2_reg_828;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (mode_read_read_fu_86_p2 == 1'd1))) begin
        i_1_reg_197 <= 6'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        i_1_reg_197 <= i_reg_876;
    end
end

always @ (posedge ap_clk) begin
    if (((mode_read_read_fu_86_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        sum_0_reg_142 <= 37'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        sum_0_reg_142 <= sum_2_reg_853;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (mode_read_read_fu_86_p2 == 1'd1))) begin
        sum_1_reg_185 <= 37'd84941944608;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        sum_1_reg_185 <= sum_reg_901;
    end
end

always @ (posedge ap_clk) begin
    if (((mode_read_read_fu_86_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        v0_0_reg_165 <= word0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        v0_0_reg_165 <= v0_reg_848;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (mode_read_read_fu_86_p2 == 1'd1))) begin
        v0_1_reg_208 <= word0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        v0_1_reg_208 <= v0_2_fu_772_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_252_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        v0_3_reg_228 <= v0_0_reg_165;
    end else if (((icmp_ln52_fu_517_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        v0_3_reg_228 <= v0_1_reg_208;
    end
end

always @ (posedge ap_clk) begin
    if (((mode_read_read_fu_86_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        v1_0_reg_175 <= word1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        v1_0_reg_175 <= v1_2_fu_511_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (mode_read_read_fu_86_p2 == 1'd1))) begin
        v1_1_reg_218 <= word1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        v1_1_reg_218 <= v1_reg_896;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_252_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        v1_3_reg_240 <= v1_0_reg_175;
    end else if (((icmp_ln52_fu_517_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        v1_3_reg_240 <= v1_1_reg_218;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_252_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        add_ln30_1_reg_838 <= add_ln30_1_fu_360_p2;
        add_ln30_reg_833 <= add_ln30_fu_350_p2;
        select_ln36_2_reg_843 <= select_ln36_2_fu_442_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln43_1_reg_863 <= add_ln43_1_fu_502_p2;
        add_ln43_reg_858 <= add_ln43_fu_496_p2;
        sum_2_reg_853 <= sum_2_fu_460_p2;
        v0_reg_848 <= v0_fu_454_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln52_fu_517_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
        add_ln64_1_reg_886 <= add_ln64_1_fu_639_p2;
        add_ln64_reg_881 <= add_ln64_fu_629_p2;
        select_ln70_2_reg_891 <= select_ln70_2_fu_703_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        add_ln77_1_reg_911 <= add_ln77_1_fu_763_p2;
        add_ln77_reg_906 <= add_ln77_fu_757_p2;
        sum_reg_901 <= sum_fu_721_p2;
        v1_reg_896 <= v1_fu_715_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_2_reg_828 <= i_2_fu_258_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_reg_876 <= i_fu_523_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        result0_ap_vld = 1'b1;
    end else begin
        result0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        result1_ap_vld = 1'b1;
    end else begin
        result1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (mode_read_read_fu_86_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((mode_read_read_fu_86_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln19_fu_252_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state5 : begin
            if (((icmp_ln52_fu_517_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln30_1_fu_360_p2 = (zext_ln19_fu_356_p1 + select_ln23_2_fu_316_p3);

assign add_ln30_fu_350_p2 = (v1_0_reg_175 + xor_ln30_fu_344_p2);

assign add_ln32_1_fu_370_p2 = ($signed(13'd6585) + $signed(trunc_ln32_fu_366_p1));

assign add_ln43_1_fu_502_p2 = (zext_ln32_fu_466_p1 + select_ln36_2_reg_843);

assign add_ln43_fu_496_p2 = (v0_fu_454_p2 + xor_ln43_fu_490_p2);

assign add_ln64_1_fu_639_p2 = (zext_ln52_fu_635_p1 + select_ln57_2_fu_595_p3);

assign add_ln64_fu_629_p2 = (v0_1_reg_208 + xor_ln64_fu_623_p2);

assign add_ln66_1_fu_649_p2 = ($signed(2'd3) + $signed(trunc_ln66_fu_645_p1));

assign add_ln77_1_fu_763_p2 = (zext_ln66_fu_727_p1 + select_ln70_2_reg_891);

assign add_ln77_fu_757_p2 = (v1_fu_715_p2 + xor_ln77_fu_751_p2);

assign and_ln1_fu_386_p3 = {{tmp_4_fu_376_p4}, {11'd0}};

assign and_ln23_fu_292_p2 = (xor_ln21_fu_286_p2 & icmp_ln23_fu_274_p2);

assign and_ln36_fu_418_p2 = (xor_ln34_fu_412_p2 & icmp_ln36_fu_400_p2);

assign and_ln57_fu_571_p2 = (xor_ln55_fu_565_p2 & icmp_ln57_fu_553_p2);

assign and_ln70_fu_679_p2 = (xor_ln68_fu_673_p2 & icmp_ln70_fu_661_p2);

assign and_ln_fu_539_p3 = {{tmp_fu_529_p4}, {11'd0}};

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign i_2_fu_258_p2 = (i_0_reg_154 + 6'd1);

assign i_fu_523_p2 = (i_1_reg_197 + 6'd1);

assign icmp_ln19_fu_252_p2 = ((i_0_reg_154 == 6'd32) ? 1'b1 : 1'b0);

assign icmp_ln21_fu_268_p2 = ((trunc_ln19_fu_264_p1 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln23_fu_274_p2 = ((trunc_ln19_fu_264_p1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_280_p2 = ((trunc_ln19_fu_264_p1 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln34_fu_394_p2 = ((and_ln1_fu_386_p3 == 13'd0) ? 1'b1 : 1'b0);

assign icmp_ln36_fu_400_p2 = ((and_ln1_fu_386_p3 == 13'd2048) ? 1'b1 : 1'b0);

assign icmp_ln38_fu_406_p2 = ((and_ln1_fu_386_p3 == 13'd4096) ? 1'b1 : 1'b0);

assign icmp_ln52_fu_517_p2 = ((i_1_reg_197 == 6'd32) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_547_p2 = ((and_ln_fu_539_p3 == 13'd0) ? 1'b1 : 1'b0);

assign icmp_ln57_fu_553_p2 = ((and_ln_fu_539_p3 == 13'd2048) ? 1'b1 : 1'b0);

assign icmp_ln59_fu_559_p2 = ((and_ln_fu_539_p3 == 13'd4096) ? 1'b1 : 1'b0);

assign icmp_ln68_fu_655_p2 = ((add_ln66_1_fu_649_p2 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln70_fu_661_p2 = ((add_ln66_1_fu_649_p2 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln72_fu_667_p2 = ((add_ln66_1_fu_649_p2 == 2'd2) ? 1'b1 : 1'b0);

assign mode_read_read_fu_86_p2 = mode;

assign or_ln23_fu_304_p2 = (icmp_ln21_fu_268_p2 | and_ln23_fu_292_p2);

assign or_ln36_fu_430_p2 = (icmp_ln34_fu_394_p2 | and_ln36_fu_418_p2);

assign or_ln57_fu_583_p2 = (icmp_ln55_fu_547_p2 | and_ln57_fu_571_p2);

assign or_ln70_fu_691_p2 = (icmp_ln68_fu_655_p2 | and_ln70_fu_679_p2);

assign result0 = v0_3_reg_228;

assign result1 = v1_3_reg_240;

assign select_ln23_1_fu_310_p3 = ((icmp_ln25_fu_280_p2[0:0] === 1'b1) ? key2 : key3);

assign select_ln23_2_fu_316_p3 = ((or_ln23_fu_304_p2[0:0] === 1'b1) ? select_ln23_fu_298_p3 : select_ln23_1_fu_310_p3);

assign select_ln23_fu_298_p3 = ((and_ln23_fu_292_p2[0:0] === 1'b1) ? key1 : key0);

assign select_ln36_1_fu_436_p3 = ((icmp_ln38_fu_406_p2[0:0] === 1'b1) ? key2 : key3);

assign select_ln36_2_fu_442_p3 = ((or_ln36_fu_430_p2[0:0] === 1'b1) ? select_ln36_fu_424_p3 : select_ln36_1_fu_436_p3);

assign select_ln36_fu_424_p3 = ((and_ln36_fu_418_p2[0:0] === 1'b1) ? key1 : key0);

assign select_ln57_1_fu_589_p3 = ((icmp_ln59_fu_559_p2[0:0] === 1'b1) ? key2 : key3);

assign select_ln57_2_fu_595_p3 = ((or_ln57_fu_583_p2[0:0] === 1'b1) ? select_ln57_fu_577_p3 : select_ln57_1_fu_589_p3);

assign select_ln57_fu_577_p3 = ((and_ln57_fu_571_p2[0:0] === 1'b1) ? key1 : key0);

assign select_ln70_1_fu_697_p3 = ((icmp_ln72_fu_667_p2[0:0] === 1'b1) ? key2 : key3);

assign select_ln70_2_fu_703_p3 = ((or_ln70_fu_691_p2[0:0] === 1'b1) ? select_ln70_fu_685_p3 : select_ln70_1_fu_697_p3);

assign select_ln70_fu_685_p3 = ((and_ln70_fu_679_p2[0:0] === 1'b1) ? key1 : key0);

assign sext_ln30_fu_340_p1 = $signed(trunc_ln4_fu_330_p4);

assign sext_ln43_fu_486_p1 = $signed(trunc_ln6_fu_476_p4);

assign sext_ln64_fu_619_p1 = $signed(trunc_ln1_fu_609_p4);

assign sext_ln77_fu_747_p1 = $signed(trunc_ln3_fu_737_p4);

assign shl_ln30_fu_324_p2 = v1_0_reg_175 << 64'd4;

assign shl_ln43_fu_470_p2 = v0_fu_454_p2 << 64'd4;

assign shl_ln64_fu_603_p2 = v0_1_reg_208 << 64'd4;

assign shl_ln77_fu_731_p2 = v1_fu_715_p2 << 64'd4;

assign sum_2_fu_460_p2 = (37'd2654435769 + sum_0_reg_142);

assign sum_fu_721_p2 = ($signed(37'd134784517703) + $signed(sum_1_reg_185));

assign tmp_4_fu_376_p4 = {{add_ln32_1_fu_370_p2[12:11]}};

assign tmp_fu_529_p4 = {{sum_1_reg_185[12:11]}};

assign trunc_ln19_fu_264_p1 = sum_0_reg_142[1:0];

assign trunc_ln1_fu_609_p4 = {{v0_1_reg_208[63:5]}};

assign trunc_ln32_fu_366_p1 = sum_0_reg_142[12:0];

assign trunc_ln3_fu_737_p4 = {{v1_fu_715_p2[63:5]}};

assign trunc_ln4_fu_330_p4 = {{v1_0_reg_175[63:5]}};

assign trunc_ln66_fu_645_p1 = sum_1_reg_185[1:0];

assign trunc_ln6_fu_476_p4 = {{v0_fu_454_p2[63:5]}};

assign v0_2_fu_772_p2 = (v0_1_reg_208 - xor_ln77_1_fu_768_p2);

assign v0_fu_454_p2 = (xor_ln30_1_fu_450_p2 + v0_0_reg_165);

assign v1_2_fu_511_p2 = (xor_ln43_1_fu_507_p2 + v1_0_reg_175);

assign v1_fu_715_p2 = (v1_1_reg_218 - xor_ln64_1_fu_711_p2);

assign xor_ln21_fu_286_p2 = (icmp_ln21_fu_268_p2 ^ 1'd1);

assign xor_ln30_1_fu_450_p2 = (add_ln30_reg_833 ^ add_ln30_1_reg_838);

assign xor_ln30_fu_344_p2 = (shl_ln30_fu_324_p2 ^ sext_ln30_fu_340_p1);

assign xor_ln34_fu_412_p2 = (icmp_ln34_fu_394_p2 ^ 1'd1);

assign xor_ln43_1_fu_507_p2 = (add_ln43_reg_858 ^ add_ln43_1_reg_863);

assign xor_ln43_fu_490_p2 = (shl_ln43_fu_470_p2 ^ sext_ln43_fu_486_p1);

assign xor_ln55_fu_565_p2 = (icmp_ln55_fu_547_p2 ^ 1'd1);

assign xor_ln64_1_fu_711_p2 = (add_ln64_reg_881 ^ add_ln64_1_reg_886);

assign xor_ln64_fu_623_p2 = (shl_ln64_fu_603_p2 ^ sext_ln64_fu_619_p1);

assign xor_ln68_fu_673_p2 = (icmp_ln68_fu_655_p2 ^ 1'd1);

assign xor_ln77_1_fu_768_p2 = (add_ln77_reg_906 ^ add_ln77_1_reg_911);

assign xor_ln77_fu_751_p2 = (shl_ln77_fu_731_p2 ^ sext_ln77_fu_747_p1);

assign zext_ln19_fu_356_p1 = sum_0_reg_142;

assign zext_ln32_fu_466_p1 = sum_2_fu_460_p2;

assign zext_ln52_fu_635_p1 = sum_1_reg_185;

assign zext_ln66_fu_727_p1 = sum_fu_721_p2;

endmodule //xtea