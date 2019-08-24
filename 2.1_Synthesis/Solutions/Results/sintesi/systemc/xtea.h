// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _xtea_HH_
#define _xtea_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct xtea : public sc_module {
    // Port declarations 17
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<64> > word0;
    sc_in< sc_lv<64> > word1;
    sc_in< sc_lv<64> > key0;
    sc_in< sc_lv<64> > key1;
    sc_in< sc_lv<64> > key2;
    sc_in< sc_lv<64> > key3;
    sc_in< sc_logic > mode;
    sc_out< sc_lv<64> > result0;
    sc_out< sc_logic > result0_ap_vld;
    sc_out< sc_lv<64> > result1;
    sc_out< sc_logic > result1_ap_vld;


    // Module declarations
    xtea(sc_module_name name);
    SC_HAS_PROCESS(xtea);

    ~xtea();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<8> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<6> > i_2_fu_258_p2;
    sc_signal< sc_lv<6> > i_2_reg_828;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<64> > add_ln30_fu_350_p2;
    sc_signal< sc_lv<64> > add_ln30_reg_833;
    sc_signal< sc_lv<1> > icmp_ln19_fu_252_p2;
    sc_signal< sc_lv<64> > add_ln30_1_fu_360_p2;
    sc_signal< sc_lv<64> > add_ln30_1_reg_838;
    sc_signal< sc_lv<64> > select_ln36_2_fu_442_p3;
    sc_signal< sc_lv<64> > select_ln36_2_reg_843;
    sc_signal< sc_lv<64> > v0_fu_454_p2;
    sc_signal< sc_lv<64> > v0_reg_848;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_lv<37> > sum_2_fu_460_p2;
    sc_signal< sc_lv<37> > sum_2_reg_853;
    sc_signal< sc_lv<64> > add_ln43_fu_496_p2;
    sc_signal< sc_lv<64> > add_ln43_reg_858;
    sc_signal< sc_lv<64> > add_ln43_1_fu_502_p2;
    sc_signal< sc_lv<64> > add_ln43_1_reg_863;
    sc_signal< sc_lv<64> > v1_2_fu_511_p2;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<6> > i_fu_523_p2;
    sc_signal< sc_lv<6> > i_reg_876;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<64> > add_ln64_fu_629_p2;
    sc_signal< sc_lv<64> > add_ln64_reg_881;
    sc_signal< sc_lv<1> > icmp_ln52_fu_517_p2;
    sc_signal< sc_lv<64> > add_ln64_1_fu_639_p2;
    sc_signal< sc_lv<64> > add_ln64_1_reg_886;
    sc_signal< sc_lv<64> > select_ln70_2_fu_703_p3;
    sc_signal< sc_lv<64> > select_ln70_2_reg_891;
    sc_signal< sc_lv<64> > v1_fu_715_p2;
    sc_signal< sc_lv<64> > v1_reg_896;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<37> > sum_fu_721_p2;
    sc_signal< sc_lv<37> > sum_reg_901;
    sc_signal< sc_lv<64> > add_ln77_fu_757_p2;
    sc_signal< sc_lv<64> > add_ln77_reg_906;
    sc_signal< sc_lv<64> > add_ln77_1_fu_763_p2;
    sc_signal< sc_lv<64> > add_ln77_1_reg_911;
    sc_signal< sc_lv<64> > v0_2_fu_772_p2;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_lv<37> > sum_0_reg_142;
    sc_signal< sc_lv<1> > mode_read_read_fu_86_p2;
    sc_signal< sc_lv<6> > i_0_reg_154;
    sc_signal< sc_lv<64> > v0_0_reg_165;
    sc_signal< sc_lv<64> > v1_0_reg_175;
    sc_signal< sc_lv<37> > sum_1_reg_185;
    sc_signal< sc_lv<6> > i_1_reg_197;
    sc_signal< sc_lv<64> > v0_1_reg_208;
    sc_signal< sc_lv<64> > v1_1_reg_218;
    sc_signal< sc_lv<64> > v0_3_reg_228;
    sc_signal< sc_lv<64> > v1_3_reg_240;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_lv<2> > trunc_ln19_fu_264_p1;
    sc_signal< sc_lv<1> > icmp_ln21_fu_268_p2;
    sc_signal< sc_lv<1> > icmp_ln23_fu_274_p2;
    sc_signal< sc_lv<1> > xor_ln21_fu_286_p2;
    sc_signal< sc_lv<1> > and_ln23_fu_292_p2;
    sc_signal< sc_lv<1> > icmp_ln25_fu_280_p2;
    sc_signal< sc_lv<1> > or_ln23_fu_304_p2;
    sc_signal< sc_lv<64> > select_ln23_fu_298_p3;
    sc_signal< sc_lv<64> > select_ln23_1_fu_310_p3;
    sc_signal< sc_lv<59> > trunc_ln4_fu_330_p4;
    sc_signal< sc_lv<64> > shl_ln30_fu_324_p2;
    sc_signal< sc_lv<64> > sext_ln30_fu_340_p1;
    sc_signal< sc_lv<64> > xor_ln30_fu_344_p2;
    sc_signal< sc_lv<64> > zext_ln19_fu_356_p1;
    sc_signal< sc_lv<64> > select_ln23_2_fu_316_p3;
    sc_signal< sc_lv<13> > trunc_ln32_fu_366_p1;
    sc_signal< sc_lv<13> > add_ln32_1_fu_370_p2;
    sc_signal< sc_lv<2> > tmp_4_fu_376_p4;
    sc_signal< sc_lv<13> > and_ln1_fu_386_p3;
    sc_signal< sc_lv<1> > icmp_ln34_fu_394_p2;
    sc_signal< sc_lv<1> > icmp_ln36_fu_400_p2;
    sc_signal< sc_lv<1> > xor_ln34_fu_412_p2;
    sc_signal< sc_lv<1> > and_ln36_fu_418_p2;
    sc_signal< sc_lv<1> > icmp_ln38_fu_406_p2;
    sc_signal< sc_lv<1> > or_ln36_fu_430_p2;
    sc_signal< sc_lv<64> > select_ln36_fu_424_p3;
    sc_signal< sc_lv<64> > select_ln36_1_fu_436_p3;
    sc_signal< sc_lv<64> > xor_ln30_1_fu_450_p2;
    sc_signal< sc_lv<59> > trunc_ln6_fu_476_p4;
    sc_signal< sc_lv<64> > shl_ln43_fu_470_p2;
    sc_signal< sc_lv<64> > sext_ln43_fu_486_p1;
    sc_signal< sc_lv<64> > xor_ln43_fu_490_p2;
    sc_signal< sc_lv<64> > zext_ln32_fu_466_p1;
    sc_signal< sc_lv<64> > xor_ln43_1_fu_507_p2;
    sc_signal< sc_lv<2> > tmp_fu_529_p4;
    sc_signal< sc_lv<13> > and_ln_fu_539_p3;
    sc_signal< sc_lv<1> > icmp_ln55_fu_547_p2;
    sc_signal< sc_lv<1> > icmp_ln57_fu_553_p2;
    sc_signal< sc_lv<1> > xor_ln55_fu_565_p2;
    sc_signal< sc_lv<1> > and_ln57_fu_571_p2;
    sc_signal< sc_lv<1> > icmp_ln59_fu_559_p2;
    sc_signal< sc_lv<1> > or_ln57_fu_583_p2;
    sc_signal< sc_lv<64> > select_ln57_fu_577_p3;
    sc_signal< sc_lv<64> > select_ln57_1_fu_589_p3;
    sc_signal< sc_lv<59> > trunc_ln1_fu_609_p4;
    sc_signal< sc_lv<64> > shl_ln64_fu_603_p2;
    sc_signal< sc_lv<64> > sext_ln64_fu_619_p1;
    sc_signal< sc_lv<64> > xor_ln64_fu_623_p2;
    sc_signal< sc_lv<64> > zext_ln52_fu_635_p1;
    sc_signal< sc_lv<64> > select_ln57_2_fu_595_p3;
    sc_signal< sc_lv<2> > trunc_ln66_fu_645_p1;
    sc_signal< sc_lv<2> > add_ln66_1_fu_649_p2;
    sc_signal< sc_lv<1> > icmp_ln68_fu_655_p2;
    sc_signal< sc_lv<1> > icmp_ln70_fu_661_p2;
    sc_signal< sc_lv<1> > xor_ln68_fu_673_p2;
    sc_signal< sc_lv<1> > and_ln70_fu_679_p2;
    sc_signal< sc_lv<1> > icmp_ln72_fu_667_p2;
    sc_signal< sc_lv<1> > or_ln70_fu_691_p2;
    sc_signal< sc_lv<64> > select_ln70_fu_685_p3;
    sc_signal< sc_lv<64> > select_ln70_1_fu_697_p3;
    sc_signal< sc_lv<64> > xor_ln64_1_fu_711_p2;
    sc_signal< sc_lv<59> > trunc_ln3_fu_737_p4;
    sc_signal< sc_lv<64> > shl_ln77_fu_731_p2;
    sc_signal< sc_lv<64> > sext_ln77_fu_747_p1;
    sc_signal< sc_lv<64> > xor_ln77_fu_751_p2;
    sc_signal< sc_lv<64> > zext_ln66_fu_727_p1;
    sc_signal< sc_lv<64> > xor_ln77_1_fu_768_p2;
    sc_signal< sc_lv<8> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<8> ap_ST_fsm_state1;
    static const sc_lv<8> ap_ST_fsm_state2;
    static const sc_lv<8> ap_ST_fsm_state3;
    static const sc_lv<8> ap_ST_fsm_state4;
    static const sc_lv<8> ap_ST_fsm_state5;
    static const sc_lv<8> ap_ST_fsm_state6;
    static const sc_lv<8> ap_ST_fsm_state7;
    static const sc_lv<8> ap_ST_fsm_state8;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<37> ap_const_lv37_0;
    static const sc_lv<6> ap_const_lv6_0;
    static const sc_lv<37> ap_const_lv37_13C6EF3720;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<6> ap_const_lv6_20;
    static const sc_lv<6> ap_const_lv6_1;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<2> ap_const_lv2_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<64> ap_const_lv64_4;
    static const sc_lv<32> ap_const_lv32_3F;
    static const sc_lv<13> ap_const_lv13_19B9;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<32> ap_const_lv32_C;
    static const sc_lv<11> ap_const_lv11_0;
    static const sc_lv<13> ap_const_lv13_0;
    static const sc_lv<13> ap_const_lv13_800;
    static const sc_lv<13> ap_const_lv13_1000;
    static const sc_lv<37> ap_const_lv37_9E3779B9;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<37> ap_const_lv37_1F61C88647;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln30_1_fu_360_p2();
    void thread_add_ln30_fu_350_p2();
    void thread_add_ln32_1_fu_370_p2();
    void thread_add_ln43_1_fu_502_p2();
    void thread_add_ln43_fu_496_p2();
    void thread_add_ln64_1_fu_639_p2();
    void thread_add_ln64_fu_629_p2();
    void thread_add_ln66_1_fu_649_p2();
    void thread_add_ln77_1_fu_763_p2();
    void thread_add_ln77_fu_757_p2();
    void thread_and_ln1_fu_386_p3();
    void thread_and_ln23_fu_292_p2();
    void thread_and_ln36_fu_418_p2();
    void thread_and_ln57_fu_571_p2();
    void thread_and_ln70_fu_679_p2();
    void thread_and_ln_fu_539_p3();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_i_2_fu_258_p2();
    void thread_i_fu_523_p2();
    void thread_icmp_ln19_fu_252_p2();
    void thread_icmp_ln21_fu_268_p2();
    void thread_icmp_ln23_fu_274_p2();
    void thread_icmp_ln25_fu_280_p2();
    void thread_icmp_ln34_fu_394_p2();
    void thread_icmp_ln36_fu_400_p2();
    void thread_icmp_ln38_fu_406_p2();
    void thread_icmp_ln52_fu_517_p2();
    void thread_icmp_ln55_fu_547_p2();
    void thread_icmp_ln57_fu_553_p2();
    void thread_icmp_ln59_fu_559_p2();
    void thread_icmp_ln68_fu_655_p2();
    void thread_icmp_ln70_fu_661_p2();
    void thread_icmp_ln72_fu_667_p2();
    void thread_mode_read_read_fu_86_p2();
    void thread_or_ln23_fu_304_p2();
    void thread_or_ln36_fu_430_p2();
    void thread_or_ln57_fu_583_p2();
    void thread_or_ln70_fu_691_p2();
    void thread_result0();
    void thread_result0_ap_vld();
    void thread_result1();
    void thread_result1_ap_vld();
    void thread_select_ln23_1_fu_310_p3();
    void thread_select_ln23_2_fu_316_p3();
    void thread_select_ln23_fu_298_p3();
    void thread_select_ln36_1_fu_436_p3();
    void thread_select_ln36_2_fu_442_p3();
    void thread_select_ln36_fu_424_p3();
    void thread_select_ln57_1_fu_589_p3();
    void thread_select_ln57_2_fu_595_p3();
    void thread_select_ln57_fu_577_p3();
    void thread_select_ln70_1_fu_697_p3();
    void thread_select_ln70_2_fu_703_p3();
    void thread_select_ln70_fu_685_p3();
    void thread_sext_ln30_fu_340_p1();
    void thread_sext_ln43_fu_486_p1();
    void thread_sext_ln64_fu_619_p1();
    void thread_sext_ln77_fu_747_p1();
    void thread_shl_ln30_fu_324_p2();
    void thread_shl_ln43_fu_470_p2();
    void thread_shl_ln64_fu_603_p2();
    void thread_shl_ln77_fu_731_p2();
    void thread_sum_2_fu_460_p2();
    void thread_sum_fu_721_p2();
    void thread_tmp_4_fu_376_p4();
    void thread_tmp_fu_529_p4();
    void thread_trunc_ln19_fu_264_p1();
    void thread_trunc_ln1_fu_609_p4();
    void thread_trunc_ln32_fu_366_p1();
    void thread_trunc_ln3_fu_737_p4();
    void thread_trunc_ln4_fu_330_p4();
    void thread_trunc_ln66_fu_645_p1();
    void thread_trunc_ln6_fu_476_p4();
    void thread_v0_2_fu_772_p2();
    void thread_v0_fu_454_p2();
    void thread_v1_2_fu_511_p2();
    void thread_v1_fu_715_p2();
    void thread_xor_ln21_fu_286_p2();
    void thread_xor_ln30_1_fu_450_p2();
    void thread_xor_ln30_fu_344_p2();
    void thread_xor_ln34_fu_412_p2();
    void thread_xor_ln43_1_fu_507_p2();
    void thread_xor_ln43_fu_490_p2();
    void thread_xor_ln55_fu_565_p2();
    void thread_xor_ln64_1_fu_711_p2();
    void thread_xor_ln64_fu_623_p2();
    void thread_xor_ln68_fu_673_p2();
    void thread_xor_ln77_1_fu_768_p2();
    void thread_xor_ln77_fu_751_p2();
    void thread_zext_ln19_fu_356_p1();
    void thread_zext_ln32_fu_466_p1();
    void thread_zext_ln52_fu_635_p1();
    void thread_zext_ln66_fu_727_p1();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif