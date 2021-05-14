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
        <signal name="SB_TO_A" />
        <signal name="DB_TO_B" />
        <signal name="NOT_DB_TO_B" />
        <signal name="ADL_TO_B" />
        <signal name="ADL(7:0)" />
        <signal name="sig_DAA" />
        <signal name="sig_CARRY_IN" />
        <signal name="sig_SUMS" />
        <signal name="sig_ANDS" />
        <signal name="sig_EORS" />
        <signal name="sig_ORS" />
        <signal name="sig_SRS" />
        <signal name="SB(7:0)" />
        <signal name="DB(7:0)" />
        <signal name="ALU_TO_HOLD" />
        <signal name="HOLD_TO_ADL" />
        <signal name="HOLD_L_TO_SB" />
        <signal name="HOLD_H_TO_SB" />
        <signal name="ZERO_A" />
        <signal name="AVR_OUT" />
        <signal name="ACR_OUT" />
        <signal name="HC_OUT" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_43(7:0)" />
        <signal name="XLXN_47(7:0)" />
        <signal name="XLXN_48" />
        <signal name="dummy_HIGH" />
        <signal name="XLXN_53" />
        <signal name="force_DB" />
        <signal name="force_SB" />
        <signal name="force_ADL" />
        <signal name="XLXN_57(7:0)" />
        <signal name="DUMMY_DB(7:0)" />
        <signal name="DUMMY_ADL(7:0)" />
        <signal name="DUMMY_SB(7:0)" />
        <port polarity="Input" name="SB_TO_A" />
        <port polarity="Input" name="DB_TO_B" />
        <port polarity="Input" name="NOT_DB_TO_B" />
        <port polarity="Input" name="ADL_TO_B" />
        <port polarity="Output" name="ADL(7:0)" />
        <port polarity="Input" name="sig_DAA" />
        <port polarity="Input" name="sig_CARRY_IN" />
        <port polarity="Input" name="sig_SUMS" />
        <port polarity="Input" name="sig_ANDS" />
        <port polarity="Input" name="sig_EORS" />
        <port polarity="Input" name="sig_ORS" />
        <port polarity="Input" name="sig_SRS" />
        <port polarity="Output" name="SB(7:0)" />
        <port polarity="Output" name="DB(7:0)" />
        <port polarity="Input" name="ALU_TO_HOLD" />
        <port polarity="Input" name="HOLD_TO_ADL" />
        <port polarity="Input" name="HOLD_L_TO_SB" />
        <port polarity="Input" name="HOLD_H_TO_SB" />
        <port polarity="Input" name="ZERO_A" />
        <port polarity="Output" name="AVR_OUT" />
        <port polarity="Output" name="ACR_OUT" />
        <port polarity="Output" name="HC_OUT" />
        <port polarity="Input" name="dummy_HIGH" />
        <port polarity="Input" name="force_DB" />
        <port polarity="Input" name="force_SB" />
        <port polarity="Input" name="force_ADL" />
        <port polarity="Input" name="DUMMY_DB(7:0)" />
        <port polarity="Input" name="DUMMY_ADL(7:0)" />
        <port polarity="Input" name="DUMMY_SB(7:0)" />
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
        <block symbolname="ALU_block" name="XLXI_1">
            <blockpin signalname="sig_DAA" name="sig_DAA" />
            <blockpin signalname="sig_CARRY_IN" name="sig_CARRY_IN" />
            <blockpin signalname="sig_SUMS" name="sig_SUMS" />
            <blockpin signalname="sig_ANDS" name="sig_ANDS" />
            <blockpin signalname="sig_EORS" name="sig_EORS" />
            <blockpin signalname="sig_ORS" name="sig_ORS" />
            <blockpin signalname="sig_SRS" name="sig_SRS" />
            <blockpin signalname="XLXN_1(7:0)" name="reg_A(7:0)" />
            <blockpin signalname="XLXN_2(7:0)" name="reg_B(7:0)" />
            <blockpin signalname="AVR_OUT" name="sig_AVR" />
            <blockpin signalname="ACR_OUT" name="sig_ACR" />
            <blockpin signalname="HC_OUT" name="sig_HC" />
            <blockpin signalname="XLXN_3(7:0)" name="ALU_OUT(7:0)" />
        </block>
        <block symbolname="reg_ADD_HOLD" name="XLXI_2">
            <blockpin signalname="ALU_TO_HOLD" name="ALU_LOAD" />
            <blockpin signalname="HOLD_TO_ADL" name="ADL_BUS_ENABLE" />
            <blockpin signalname="HOLD_L_TO_SB" name="SB_L_BUS_ENABLE" />
            <blockpin signalname="HOLD_H_TO_SB" name="SB_H_BUS_ENABLE" />
            <blockpin signalname="XLXN_3(7:0)" name="ALU_DATA(7:0)" />
            <blockpin signalname="ADL(7:0)" name="ADL_BUS(7:0)" />
            <blockpin signalname="SB(7:0)" name="SB_BUS(7:0)" />
        </block>
        <block symbolname="reg_AI" name="XLXI_3">
            <blockpin signalname="ZERO_A" name="ZERO_LOAD" />
            <blockpin signalname="SB_TO_A" name="SB_LOAD" />
            <blockpin signalname="SB(7:0)" name="SB_DATA(7:0)" />
            <blockpin signalname="XLXN_1(7:0)" name="TO_ALU(7:0)" />
        </block>
        <block symbolname="reg_BI" name="XLXI_4">
            <blockpin signalname="DB_TO_B" name="DB_LOAD" />
            <blockpin signalname="NOT_DB_TO_B" name="INV_DB_LOAD" />
            <blockpin signalname="ADL_TO_B" name="ADL_LOAD" />
            <blockpin signalname="ADL(7:0)" name="ADL_DATA(7:0)" />
            <blockpin signalname="DB(7:0)" name="DB_DATA(7:0)" />
            <blockpin signalname="XLXN_2(7:0)" name="TO_ALU(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_13">
            <blockpin signalname="dummy_HIGH" name="LOAD" />
            <blockpin signalname="force_SB" name="BUS_ENABLE" />
            <blockpin signalname="DUMMY_SB(7:0)" name="DATA(7:0)" />
            <blockpin signalname="SB(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_14">
            <blockpin signalname="dummy_HIGH" name="LOAD" />
            <blockpin signalname="force_DB" name="BUS_ENABLE" />
            <blockpin signalname="DUMMY_DB(7:0)" name="DATA(7:0)" />
            <blockpin signalname="DB(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_15">
            <blockpin signalname="dummy_HIGH" name="LOAD" />
            <blockpin signalname="force_ADL" name="BUS_ENABLE" />
            <blockpin signalname="DUMMY_ADL(7:0)" name="DATA(7:0)" />
            <blockpin signalname="ADL(7:0)" name="DATA_OUT(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1456" y="1552" name="XLXI_1" orien="R0">
        </instance>
        <instance x="624" y="1552" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_1(7:0)">
            <wire x2="1248" y1="1392" y2="1392" x1="1056" />
            <wire x2="1248" y1="1392" y2="1456" x1="1248" />
            <wire x2="1456" y1="1456" y2="1456" x1="1248" />
        </branch>
        <branch name="XLXN_2(7:0)">
            <wire x2="1440" y1="1712" y2="1712" x1="1056" />
            <wire x2="1456" y1="1520" y2="1520" x1="1440" />
            <wire x2="1440" y1="1520" y2="1712" x1="1440" />
        </branch>
        <instance x="608" y="2000" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_3(7:0)">
            <wire x2="1920" y1="1488" y2="1488" x1="1904" />
            <wire x2="2528" y1="928" y2="928" x1="1920" />
            <wire x2="1920" y1="928" y2="1488" x1="1920" />
        </branch>
        <instance x="2528" y="960" name="XLXI_2" orien="R0">
        </instance>
        <branch name="SB_TO_A">
            <wire x2="624" y1="1456" y2="1456" x1="592" />
        </branch>
        <iomarker fontsize="28" x="592" y="1456" name="SB_TO_A" orien="R180" />
        <branch name="DB_TO_B">
            <wire x2="608" y1="1712" y2="1712" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="1712" name="DB_TO_B" orien="R180" />
        <branch name="NOT_DB_TO_B">
            <wire x2="608" y1="1776" y2="1776" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="1776" name="NOT_DB_TO_B" orien="R180" />
        <branch name="ADL_TO_B">
            <wire x2="608" y1="1840" y2="1840" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="1840" name="ADL_TO_B" orien="R180" />
        <branch name="ADL(7:0)">
            <wire x2="608" y1="1904" y2="1904" x1="576" />
            <wire x2="576" y1="1904" y2="2064" x1="576" />
            <wire x2="3104" y1="2064" y2="2064" x1="576" />
            <wire x2="3104" y1="672" y2="672" x1="3040" />
            <wire x2="3104" y1="672" y2="2064" x1="3104" />
            <wire x2="3152" y1="608" y2="608" x1="3104" />
            <wire x2="3104" y1="608" y2="640" x1="3104" />
            <wire x2="3104" y1="640" y2="648" x1="3104" />
            <wire x2="3104" y1="648" y2="672" x1="3104" />
            <wire x2="3264" y1="640" y2="640" x1="3104" />
            <wire x2="3264" y1="640" y2="736" x1="3264" />
            <wire x2="3456" y1="736" y2="736" x1="3264" />
            <wire x2="3456" y1="736" y2="848" x1="3456" />
        </branch>
        <branch name="sig_DAA">
            <wire x2="1456" y1="1008" y2="1008" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1008" name="sig_DAA" orien="R180" />
        <branch name="sig_CARRY_IN">
            <wire x2="1456" y1="1072" y2="1072" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1072" name="sig_CARRY_IN" orien="R180" />
        <branch name="sig_SUMS">
            <wire x2="1456" y1="1136" y2="1136" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1136" name="sig_SUMS" orien="R180" />
        <branch name="sig_ANDS">
            <wire x2="1456" y1="1200" y2="1200" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1200" name="sig_ANDS" orien="R180" />
        <branch name="sig_EORS">
            <wire x2="1456" y1="1264" y2="1264" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1264" name="sig_EORS" orien="R180" />
        <branch name="sig_ORS">
            <wire x2="1456" y1="1328" y2="1328" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1328" name="sig_ORS" orien="R180" />
        <branch name="sig_SRS">
            <wire x2="1456" y1="1392" y2="1392" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="1392" name="sig_SRS" orien="R180" />
        <branch name="SB(7:0)">
            <wire x2="48" y1="992" y2="1184" x1="48" />
            <wire x2="48" y1="1184" y2="1360" x1="48" />
            <wire x2="304" y1="1360" y2="1360" x1="48" />
            <wire x2="384" y1="1360" y2="1360" x1="304" />
            <wire x2="384" y1="1360" y2="1456" x1="384" />
            <wire x2="64" y1="992" y2="992" x1="48" />
            <wire x2="80" y1="992" y2="992" x1="64" />
            <wire x2="304" y1="1520" y2="1520" x1="240" />
            <wire x2="560" y1="1520" y2="1520" x1="304" />
            <wire x2="624" y1="1520" y2="1520" x1="560" />
            <wire x2="560" y1="1520" y2="1632" x1="560" />
            <wire x2="3120" y1="1632" y2="1632" x1="560" />
            <wire x2="384" y1="1456" y2="1456" x1="304" />
            <wire x2="304" y1="1456" y2="1520" x1="304" />
            <wire x2="3120" y1="928" y2="928" x1="3040" />
            <wire x2="3120" y1="928" y2="1632" x1="3120" />
        </branch>
        <branch name="DB(7:0)">
            <wire x2="352" y1="2096" y2="2096" x1="208" />
            <wire x2="208" y1="2096" y2="2320" x1="208" />
            <wire x2="224" y1="2320" y2="2320" x1="208" />
            <wire x2="352" y1="1968" y2="1968" x1="288" />
            <wire x2="608" y1="1968" y2="1968" x1="352" />
            <wire x2="352" y1="1968" y2="2096" x1="352" />
        </branch>
        <branch name="ALU_TO_HOLD">
            <wire x2="2528" y1="672" y2="672" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2496" y="672" name="ALU_TO_HOLD" orien="R180" />
        <branch name="HOLD_TO_ADL">
            <wire x2="2528" y1="736" y2="736" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2496" y="736" name="HOLD_TO_ADL" orien="R180" />
        <branch name="HOLD_L_TO_SB">
            <wire x2="2528" y1="800" y2="800" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2496" y="800" name="HOLD_L_TO_SB" orien="R180" />
        <branch name="HOLD_H_TO_SB">
            <wire x2="2528" y1="864" y2="864" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2496" y="864" name="HOLD_H_TO_SB" orien="R180" />
        <branch name="ZERO_A">
            <wire x2="624" y1="1392" y2="1392" x1="592" />
        </branch>
        <iomarker fontsize="28" x="592" y="1392" name="ZERO_A" orien="R180" />
        <branch name="AVR_OUT">
            <wire x2="2064" y1="1008" y2="1008" x1="1904" />
        </branch>
        <branch name="ACR_OUT">
            <wire x2="2064" y1="1168" y2="1168" x1="1904" />
        </branch>
        <branch name="HC_OUT">
            <wire x2="2064" y1="1328" y2="1328" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="2064" y="1008" name="AVR_OUT" orien="R0" />
        <iomarker fontsize="28" x="2064" y="1168" name="ACR_OUT" orien="R0" />
        <iomarker fontsize="28" x="2064" y="1328" name="HC_OUT" orien="R0" />
        <iomarker fontsize="28" x="240" y="1520" name="SB(7:0)" orien="R180" />
        <iomarker fontsize="28" x="288" y="1968" name="DB(7:0)" orien="R180" />
        <iomarker fontsize="28" x="3152" y="608" name="ADL(7:0)" orien="R0" />
        <instance x="464" y="1024" name="XLXI_13" orien="R180">
        </instance>
        <instance x="3424" y="1232" name="XLXI_15" orien="R270">
        </instance>
        <instance x="608" y="2352" name="XLXI_14" orien="R180">
        </instance>
        <branch name="dummy_HIGH">
            <wire x2="1120" y1="1184" y2="1184" x1="464" />
            <wire x2="1120" y1="1184" y2="2512" x1="1120" />
            <wire x2="3264" y1="2512" y2="2512" x1="1120" />
            <wire x2="1120" y1="2512" y2="2576" x1="1120" />
            <wire x2="1120" y1="2512" y2="2512" x1="608" />
            <wire x2="3264" y1="1232" y2="2512" x1="3264" />
        </branch>
        <iomarker fontsize="28" x="1120" y="2576" name="dummy_HIGH" orien="R90" />
        <branch name="force_DB">
            <wire x2="640" y1="2448" y2="2448" x1="608" />
        </branch>
        <iomarker fontsize="28" x="640" y="2448" name="force_DB" orien="R0" />
        <branch name="force_SB">
            <wire x2="480" y1="1120" y2="1120" x1="464" />
            <wire x2="496" y1="1120" y2="1120" x1="480" />
        </branch>
        <iomarker fontsize="28" x="496" y="1120" name="force_SB" orien="R0" />
        <branch name="force_ADL">
            <wire x2="3328" y1="1232" y2="1264" x1="3328" />
        </branch>
        <iomarker fontsize="28" x="3328" y="1264" name="force_ADL" orien="R90" />
        <branch name="DUMMY_DB(7:0)">
            <wire x2="640" y1="2384" y2="2384" x1="608" />
        </branch>
        <iomarker fontsize="28" x="640" y="2384" name="DUMMY_DB(7:0)" orien="R0" />
        <branch name="DUMMY_ADL(7:0)">
            <wire x2="3392" y1="1232" y2="1264" x1="3392" />
        </branch>
        <iomarker fontsize="28" x="3392" y="1264" name="DUMMY_ADL(7:0)" orien="R90" />
        <branch name="DUMMY_SB(7:0)">
            <wire x2="496" y1="1056" y2="1056" x1="464" />
        </branch>
        <iomarker fontsize="28" x="496" y="1056" name="DUMMY_SB(7:0)" orien="R0" />
    </sheet>
</drawing>