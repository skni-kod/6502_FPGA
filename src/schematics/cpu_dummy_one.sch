<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(7:0)" />
        <signal name="XLXN_2(7:0)" />
        <signal name="XLXN_3(7:0)" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="XLXN_6(7:0)" />
        <signal name="XLXN_7(7:0)" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_10(7:0)" />
        <signal name="XLXN_11(7:0)" />
        <signal name="XLXN_15(7:0)" />
        <signal name="XLXN_16(7:0)" />
        <signal name="XLXN_17(7:0)" />
        <signal name="XLXN_18(7:0)" />
        <signal name="XLXN_19(7:0)" />
        <signal name="XLXN_21(7:0)" />
        <signal name="XLXN_22(7:0)" />
        <signal name="XLXN_23(7:0)" />
        <signal name="XLXN_24(7:0)" />
        <signal name="XLXN_25(7:0)" />
        <signal name="XLXN_26(7:0)" />
        <signal name="XLXN_27(7:0)" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29(7:0)" />
        <blockdef name="ALU_block">
            <timestamp>2021-5-14T17:22:37</timestamp>
            <rect width="320" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-384" y2="-384" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-76" height="24" />
            <line x2="448" y1="-64" y2="-64" x1="384" />
        </blockdef>
        <blockdef name="reg_AI">
            <timestamp>2021-5-14T17:21:55</timestamp>
            <rect width="304" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
        </blockdef>
        <blockdef name="reg_BI">
            <timestamp>2021-5-14T17:22:7</timestamp>
            <rect width="320" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-300" height="24" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
        </blockdef>
        <blockdef name="reg_ADD_HOLD">
            <timestamp>2021-5-14T17:22:18</timestamp>
            <rect width="384" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-300" height="24" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <blockdef name="reg_XY">
            <timestamp>2021-5-14T18:20:43</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-192" height="256" />
        </blockdef>
        <blockdef name="reg_ACC">
            <timestamp>2021-5-15T12:49:48</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-236" height="24" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="reg_PSR">
            <timestamp>2021-5-15T12:50:38</timestamp>
            <rect width="336" x="64" y="-1152" height="1152" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-1132" height="24" />
            <line x2="464" y1="-1120" y2="-1120" x1="400" />
        </blockdef>
        <blockdef name="reg_PCH">
            <timestamp>2021-4-8T22:18:30</timestamp>
            <rect width="400" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-140" height="24" />
            <line x2="528" y1="-128" y2="-128" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="reg_PCHS">
            <timestamp>2021-5-15T12:50:23</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-236" height="24" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
        </blockdef>
        <blockdef name="reg_PCL">
            <timestamp>2021-5-15T12:50:29</timestamp>
            <rect width="384" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-236" height="24" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
            <rect width="64" x="448" y="-140" height="24" />
            <line x2="512" y1="-128" y2="-128" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <blockdef name="reg_PCLS">
            <timestamp>2021-5-15T12:50:34</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-236" height="24" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
        </blockdef>
        <blockdef name="reg_S">
            <timestamp>2021-4-8T22:23:22</timestamp>
            <rect width="368" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <blockdef name="reg_DL">
            <timestamp>2021-5-15T12:50:9</timestamp>
            <rect width="384" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-300" height="24" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <rect width="64" x="448" y="-172" height="24" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <blockdef name="PRECHARGE">
            <timestamp>2021-5-15T12:49:45</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="PASS_MOS">
            <timestamp>2021-5-15T12:49:43</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="OPEN_DRAIN">
            <timestamp>2021-5-15T12:49:40</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="ALU_block" name="XLXI_1">
            <blockpin name="sig_DAA" />
            <blockpin name="sig_CARRY_IN" />
            <blockpin name="sig_SUMS" />
            <blockpin name="sig_ANDS" />
            <blockpin name="sig_EORS" />
            <blockpin name="sig_ORS" />
            <blockpin name="sig_SRS" />
            <blockpin signalname="XLXN_1(7:0)" name="reg_A(7:0)" />
            <blockpin signalname="XLXN_2(7:0)" name="reg_B(7:0)" />
            <blockpin name="sig_AVR" />
            <blockpin name="sig_ACR" />
            <blockpin name="sig_HC" />
            <blockpin signalname="XLXN_7(7:0)" name="ALU_OUT(7:0)" />
        </block>
        <block symbolname="reg_AI" name="XLXI_2">
            <blockpin name="ZERO_LOAD" />
            <blockpin name="SB_LOAD" />
            <blockpin signalname="XLXN_3(7:0)" name="SB_DATA(7:0)" />
            <blockpin name="TO_ALU(7:0)" />
        </block>
        <block symbolname="reg_BI" name="XLXI_3">
            <blockpin name="DB_LOAD" />
            <blockpin name="INV_DB_LOAD" />
            <blockpin name="ADL_LOAD" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_DATA(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="DB_DATA(7:0)" />
            <blockpin signalname="XLXN_2(7:0)" name="TO_ALU(7:0)" />
        </block>
        <block symbolname="reg_ADD_HOLD" name="XLXI_4">
            <blockpin name="ALU_LOAD" />
            <blockpin name="ADL_BUS_ENABLE" />
            <blockpin name="SB_L_BUS_ENABLE" />
            <blockpin name="SB_H_BUS_ENABLE" />
            <blockpin signalname="XLXN_7(7:0)" name="ALU_DATA(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_BUS(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="SB_BUS(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_5">
            <blockpin name="LOAD" />
            <blockpin name="BUS_ENABLE" />
            <blockpin signalname="XLXN_3(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_ACC" name="XLXI_7">
            <blockpin name="LOAD" />
            <blockpin name="SB_BUS_ENABLE" />
            <blockpin name="DB_BUS_ENABLE" />
            <blockpin signalname="XLXN_3(7:0)" name="DAA_DATA(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="SB_OUT(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="DB_OUT(7:0)" />
        </block>
        <block symbolname="reg_PSR" name="XLXI_8">
            <blockpin name="C_LOAD_DB0" />
            <blockpin name="C_LOAD_IR5" />
            <blockpin name="C_LOAD_ACR" />
            <blockpin name="Z_LOAD_DB1" />
            <blockpin name="Z_LOAD_DBZ" />
            <blockpin name="I_LOAD_DB2" />
            <blockpin name="I_LOAD_IR5" />
            <blockpin name="D_LOAD_DB3" />
            <blockpin name="D_LOAD_IR5" />
            <blockpin name="V_LOAD_DB6" />
            <blockpin name="V_LOAD_AVR" />
            <blockpin name="V_LOAD_I" />
            <blockpin name="N_LOAD_DB7" />
            <blockpin name="BUS_ENABLE" />
            <blockpin name="IR5" />
            <blockpin name="ACR" />
            <blockpin name="AVR" />
            <blockpin signalname="XLXN_5(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_PCH" name="XLXI_9">
            <blockpin name="DB_BUS_ENABLE" />
            <blockpin name="ADH_BUS_ENABLE" />
            <blockpin name="CLK" />
            <blockpin name="DATA(7:0)" />
            <blockpin name="DB_BUS(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="ADH_BUS(7:0)" />
            <blockpin signalname="XLXN_18(7:0)" name="PCH_LOOP(7:0)" />
        </block>
        <block symbolname="reg_PCHS" name="XLXI_10">
            <blockpin name="PCH_LOAD" />
            <blockpin name="ADH_LOAD" />
            <blockpin signalname="XLXN_18(7:0)" name="PCH_DATA(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="ADH_DATA(7:0)" />
            <blockpin name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_PCL" name="XLXI_11">
            <blockpin name="DB_BUS_ENABLE" />
            <blockpin name="ADL_BUS_ENABLE" />
            <blockpin name="CLK" />
            <blockpin name="DATA(7:0)" />
            <blockpin name="DB_BUS(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_BUS(7:0)" />
            <blockpin signalname="XLXN_17(7:0)" name="PCL_LOOP(7:0)" />
        </block>
        <block symbolname="reg_PCLS" name="XLXI_12">
            <blockpin name="PCL_LOAD" />
            <blockpin name="ADL_LOAD" />
            <blockpin signalname="XLXN_17(7:0)" name="PCL_DATA(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_DATA(7:0)" />
            <blockpin name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_S" name="XLXI_13">
            <blockpin name="RELOAD" />
            <blockpin name="SB_LOAD" />
            <blockpin name="SB_BUS_ENABLE" />
            <blockpin name="ADL_BUS_ENABLE" />
            <blockpin name="SB_DATA(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="SB_OUT(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_OUT(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_14">
            <blockpin name="LOAD" />
            <blockpin name="BUS_ENABLE" />
            <blockpin signalname="XLXN_11(7:0)" name="DATA(7:0)" />
            <blockpin name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_DL" name="XLXI_16">
            <blockpin name="LOAD" />
            <blockpin name="DB_BUS_ENABLE" />
            <blockpin name="ADL_BUS_ENABLE" />
            <blockpin name="ADH_BUS_ENABLE" />
            <blockpin name="DATA(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="DB_OUT(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="ADL_OUT(7:0)" />
            <blockpin signalname="XLXN_18(7:0)" name="ADH_OUT(7:0)" />
        </block>
        <block symbolname="PRECHARGE" name="XLXI_17">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_11(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="PRECHARGE" name="XLXI_18">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_5(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="PRECHARGE" name="XLXI_19">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_3(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="PRECHARGE" name="XLXI_20">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_8(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="PASS_MOS" name="XLXI_22">
            <blockpin name="ENABLE" />
            <blockpin signalname="XLXN_5(7:0)" name="INOUT1(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="INOUT2(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_23">
            <blockpin name="LOAD" />
            <blockpin name="BUS_ENABLE" />
            <blockpin signalname="XLXN_3(7:0)" name="DATA(7:0)" />
            <blockpin name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="OPEN_DRAIN" name="XLXI_24">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_11(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="OPEN_DRAIN" name="XLXI_25">
            <blockpin name="DATA_IN" />
            <blockpin signalname="XLXN_8(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_26">
            <blockpin name="LOAD" />
            <blockpin name="BUS_ENABLE" />
            <blockpin signalname="XLXN_8(7:0)" name="DATA(7:0)" />
            <blockpin name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="PASS_MOS" name="XLXI_27">
            <blockpin name="ENABLE" />
            <blockpin signalname="XLXN_11(7:0)" name="INOUT1(7:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="INOUT2(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="2640" y="3008" name="XLXI_1" orien="R0">
        </instance>
        <instance x="3552" y="2752" name="XLXI_4" orien="R0">
        </instance>
        <instance x="5008" y="3216" name="XLXI_5" orien="R0">
        </instance>
        <instance x="3328" y="4208" name="XLXI_7" orien="R0">
        </instance>
        <instance x="4624" y="1376" name="XLXI_9" orien="R0">
        </instance>
        <instance x="4640" y="576" name="XLXI_10" orien="R0">
        </instance>
        <instance x="3472" y="1376" name="XLXI_11" orien="R0">
        </instance>
        <instance x="3456" y="544" name="XLXI_12" orien="R0">
        </instance>
        <instance x="3968" y="2048" name="XLXI_13" orien="R0">
        </instance>
        <instance x="6016" y="1952" name="XLXI_14" orien="R0">
        </instance>
        <instance x="2208" y="448" name="XLXI_16" orien="R0">
        </instance>
        <instance x="2608" y="1232" name="XLXI_18" orien="R0">
        </instance>
        <instance x="4112" y="2208" name="XLXI_20" orien="R0">
        </instance>
        <instance x="4560" y="1632" name="XLXI_22" orien="R0">
        </instance>
        <instance x="4992" y="4112" name="XLXI_23" orien="R0">
        </instance>
        <instance x="2000" y="3184" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1904" y="2384" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_1(7:0)">
            <wire x2="2528" y1="3040" y2="3040" x1="2432" />
            <wire x2="2528" y1="2912" y2="3040" x1="2528" />
            <wire x2="2640" y1="2912" y2="2912" x1="2528" />
        </branch>
        <branch name="XLXN_2(7:0)">
            <wire x2="2496" y1="2096" y2="2096" x1="2352" />
            <wire x2="2496" y1="2096" y2="2976" x1="2496" />
            <wire x2="2640" y1="2976" y2="2976" x1="2496" />
        </branch>
        <instance x="1040" y="4416" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_3(7:0)">
            <wire x2="1936" y1="2912" y2="3152" x1="1936" />
            <wire x2="2000" y1="3152" y2="3152" x1="1936" />
            <wire x2="2480" y1="2912" y2="2912" x1="1936" />
            <wire x2="2480" y1="2912" y2="3184" x1="2480" />
            <wire x2="4576" y1="3184" y2="3184" x1="2480" />
            <wire x2="5008" y1="3184" y2="3184" x1="4576" />
            <wire x2="4576" y1="3184" y2="3392" x1="4576" />
            <wire x2="4576" y1="3392" y2="3984" x1="4576" />
            <wire x2="4576" y1="3984" y2="4080" x1="4576" />
            <wire x2="4992" y1="4080" y2="4080" x1="4576" />
            <wire x2="4576" y1="4080" y2="4192" x1="4576" />
            <wire x2="5392" y1="4192" y2="4192" x1="4576" />
            <wire x2="5472" y1="3392" y2="3392" x1="4576" />
            <wire x2="3264" y1="3872" y2="4176" x1="3264" />
            <wire x2="3328" y1="4176" y2="4176" x1="3264" />
            <wire x2="3952" y1="3872" y2="3872" x1="3264" />
            <wire x2="3952" y1="3872" y2="3984" x1="3952" />
            <wire x2="4576" y1="3984" y2="3984" x1="3952" />
            <wire x2="3952" y1="3984" y2="3984" x1="3808" />
            <wire x2="4560" y1="2720" y2="2720" x1="4064" />
            <wire x2="4576" y1="2720" y2="2720" x1="4560" />
            <wire x2="4576" y1="2720" y2="3184" x1="4576" />
            <wire x2="4560" y1="1760" y2="1760" x1="4464" />
            <wire x2="5024" y1="1760" y2="1760" x1="4560" />
            <wire x2="4560" y1="1760" y2="2272" x1="4560" />
            <wire x2="4560" y1="2272" y2="2720" x1="4560" />
            <wire x2="5280" y1="2272" y2="2272" x1="4560" />
            <wire x2="5024" y1="1600" y2="1600" x1="4944" />
            <wire x2="5024" y1="1600" y2="1760" x1="5024" />
            <wire x2="5280" y1="2144" y2="2144" x1="5264" />
            <wire x2="5280" y1="2144" y2="2272" x1="5280" />
            <wire x2="5472" y1="2864" y2="2864" x1="5376" />
            <wire x2="5472" y1="2864" y2="3248" x1="5472" />
            <wire x2="5472" y1="3248" y2="3392" x1="5472" />
            <wire x2="5472" y1="3248" y2="3248" x1="5392" />
            <wire x2="5392" y1="4144" y2="4192" x1="5392" />
        </branch>
        <branch name="XLXN_5(7:0)">
            <wire x2="1040" y1="4384" y2="4384" x1="960" />
            <wire x2="960" y1="4384" y2="4480" x1="960" />
            <wire x2="1808" y1="4480" y2="4480" x1="960" />
            <wire x2="3888" y1="4480" y2="4480" x1="1808" />
            <wire x2="1584" y1="3296" y2="3296" x1="1504" />
            <wire x2="1808" y1="3296" y2="3296" x1="1584" />
            <wire x2="1808" y1="3296" y2="4480" x1="1808" />
            <wire x2="1584" y1="1440" y2="3296" x1="1584" />
            <wire x2="3168" y1="1440" y2="1440" x1="1584" />
            <wire x2="5024" y1="1440" y2="1440" x1="3168" />
            <wire x2="5024" y1="1440" y2="1536" x1="5024" />
            <wire x2="1904" y1="2352" y2="2352" x1="1808" />
            <wire x2="1808" y1="2352" y2="3296" x1="1808" />
            <wire x2="3168" y1="832" y2="832" x1="2656" />
            <wire x2="3168" y1="832" y2="1200" x1="3168" />
            <wire x2="3168" y1="1200" y2="1440" x1="3168" />
            <wire x2="3168" y1="160" y2="160" x1="2720" />
            <wire x2="3168" y1="160" y2="832" x1="3168" />
            <wire x2="3168" y1="1200" y2="1200" x1="2992" />
            <wire x2="3888" y1="4176" y2="4176" x1="3808" />
            <wire x2="3888" y1="4176" y2="4480" x1="3888" />
            <wire x2="5024" y1="1536" y2="1536" x1="4944" />
        </branch>
        <branch name="XLXN_7(7:0)">
            <wire x2="3312" y1="2944" y2="2944" x1="3088" />
            <wire x2="3312" y1="2720" y2="2944" x1="3312" />
            <wire x2="3552" y1="2720" y2="2720" x1="3312" />
        </branch>
        <branch name="XLXN_11(7:0)">
            <wire x2="4640" y1="544" y2="544" x1="4576" />
            <wire x2="4576" y1="544" y2="656" x1="4576" />
            <wire x2="5200" y1="656" y2="656" x1="4576" />
            <wire x2="5200" y1="656" y2="1248" x1="5200" />
            <wire x2="5248" y1="656" y2="656" x1="5200" />
            <wire x2="5248" y1="656" y2="704" x1="5248" />
            <wire x2="5920" y1="704" y2="704" x1="5248" />
            <wire x2="5920" y1="704" y2="784" x1="5920" />
            <wire x2="5920" y1="784" y2="864" x1="5920" />
            <wire x2="5920" y1="864" y2="1920" x1="5920" />
            <wire x2="6016" y1="1920" y2="1920" x1="5920" />
            <wire x2="5920" y1="1920" y2="2448" x1="5920" />
            <wire x2="6224" y1="864" y2="864" x1="5920" />
            <wire x2="5968" y1="784" y2="784" x1="5920" />
            <wire x2="5200" y1="1248" y2="1248" x1="5152" />
            <wire x2="5824" y1="2800" y2="2800" x1="5376" />
            <wire x2="5920" y1="2448" y2="2448" x1="5824" />
            <wire x2="5824" y1="2448" y2="2800" x1="5824" />
            <wire x2="5968" y1="560" y2="560" x1="5952" />
            <wire x2="5968" y1="560" y2="784" x1="5968" />
            <wire x2="6224" y1="368" y2="368" x1="6160" />
            <wire x2="6224" y1="368" y2="864" x1="6224" />
        </branch>
        <branch name="XLXN_8(7:0)">
            <wire x2="1904" y1="2288" y2="2288" x1="1856" />
            <wire x2="1856" y1="2288" y2="3248" x1="1856" />
            <wire x2="4144" y1="3248" y2="3248" x1="1856" />
            <wire x2="3040" y1="288" y2="288" x1="2720" />
            <wire x2="3040" y1="288" y2="512" x1="3040" />
            <wire x2="3456" y1="512" y2="512" x1="3040" />
            <wire x2="3040" y1="512" y2="1632" x1="3040" />
            <wire x2="4400" y1="1632" y2="1632" x1="3040" />
            <wire x2="4400" y1="1632" y2="1696" x1="4400" />
            <wire x2="4640" y1="1696" y2="1696" x1="4400" />
            <wire x2="4640" y1="1696" y2="2016" x1="4640" />
            <wire x2="4816" y1="2016" y2="2016" x1="4640" />
            <wire x2="4816" y1="2016" y2="2176" x1="4816" />
            <wire x2="4816" y1="2176" y2="2368" x1="4816" />
            <wire x2="4816" y1="2368" y2="2464" x1="4816" />
            <wire x2="4816" y1="2464" y2="2688" x1="4816" />
            <wire x2="5872" y1="2688" y2="2688" x1="4816" />
            <wire x2="5872" y1="2688" y2="3504" x1="5872" />
            <wire x2="6096" y1="3504" y2="3504" x1="5872" />
            <wire x2="4400" y1="1248" y2="1248" x1="3984" />
            <wire x2="4400" y1="1248" y2="1632" x1="4400" />
            <wire x2="4816" y1="2464" y2="2464" x1="4064" />
            <wire x2="4144" y1="2688" y2="3248" x1="4144" />
            <wire x2="4816" y1="2688" y2="2688" x1="4144" />
            <wire x2="4640" y1="2016" y2="2016" x1="4464" />
            <wire x2="4816" y1="2176" y2="2176" x1="4496" />
            <wire x2="4816" y1="2368" y2="2368" x1="4496" />
        </branch>
        <instance x="4112" y="2400" name="XLXI_25" orien="R0">
        </instance>
        <branch name="XLXN_17(7:0)">
            <wire x2="3456" y1="448" y2="448" x1="3392" />
            <wire x2="3392" y1="448" y2="624" x1="3392" />
            <wire x2="4048" y1="624" y2="624" x1="3392" />
            <wire x2="4048" y1="624" y2="1344" x1="4048" />
            <wire x2="4048" y1="1344" y2="1344" x1="3984" />
        </branch>
        <branch name="XLXN_18(7:0)">
            <wire x2="3264" y1="416" y2="416" x1="2720" />
            <wire x2="4576" y1="96" y2="96" x1="3264" />
            <wire x2="4576" y1="96" y2="240" x1="4576" />
            <wire x2="4576" y1="240" y2="480" x1="4576" />
            <wire x2="4640" y1="480" y2="480" x1="4576" />
            <wire x2="5344" y1="240" y2="240" x1="4576" />
            <wire x2="5344" y1="240" y2="1344" x1="5344" />
            <wire x2="3264" y1="96" y2="416" x1="3264" />
            <wire x2="5344" y1="1344" y2="1344" x1="5152" />
        </branch>
        <instance x="6096" y="3536" name="XLXI_26" orien="R0">
        </instance>
        <instance x="4992" y="2896" name="XLXI_27" orien="R0">
        </instance>
        <instance x="5776" y="400" name="XLXI_17" orien="R0">
        </instance>
        <instance x="5568" y="592" name="XLXI_24" orien="R0">
        </instance>
        <instance x="4880" y="2176" name="XLXI_19" orien="R0">
        </instance>
    </sheet>
</drawing>