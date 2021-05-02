<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(7:0)" />
        <signal name="X_LOAD" />
        <signal name="X_BE" />
        <signal name="XLXN_12(7:0)" />
        <signal name="XLXN_13(7:0)" />
        <signal name="XLXN_14(7:0)" />
        <signal name="XLXN_16(7:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="DATA_IN(7:0)" />
        <signal name="DATA_OUT(7:0)" />
        <signal name="Y_BE" />
        <signal name="Y_LOAD" />
        <signal name="XLXN_25(7:0)" />
        <port polarity="Input" name="X_LOAD" />
        <port polarity="Input" name="X_BE" />
        <port polarity="Input" name="DATA_IN(7:0)" />
        <port polarity="Output" name="DATA_OUT(7:0)" />
        <port polarity="Input" name="Y_BE" />
        <port polarity="Input" name="Y_LOAD" />
        <blockdef name="reg_XY">
            <timestamp>2021-5-2T20:27:7</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="reg_XY" name="XLXI_1">
            <blockpin signalname="X_LOAD" name="LOAD" />
            <blockpin signalname="X_BE" name="BUS_ENABLE" />
            <blockpin signalname="DATA_IN(7:0)" name="DATA(7:0)" />
            <blockpin signalname="DATA_OUT(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="reg_XY" name="XLXI_3">
            <blockpin signalname="Y_LOAD" name="LOAD" />
            <blockpin signalname="Y_BE" name="BUS_ENABLE" />
            <blockpin signalname="DATA_IN(7:0)" name="DATA(7:0)" />
            <blockpin signalname="DATA_OUT(7:0)" name="DATA_OUT(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="800" y="1072" name="XLXI_1" orien="R0">
        </instance>
        <branch name="X_LOAD">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="752" y="848" type="branch" />
            <wire x2="752" y1="832" y2="848" x1="752" />
            <wire x2="752" y1="848" y2="912" x1="752" />
            <wire x2="800" y1="912" y2="912" x1="752" />
        </branch>
        <branch name="X_BE">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="688" y="912" type="branch" />
            <wire x2="688" y1="832" y2="912" x1="688" />
            <wire x2="688" y1="912" y2="976" x1="688" />
            <wire x2="800" y1="976" y2="976" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="832" name="X_BE" orien="R270" />
        <iomarker fontsize="28" x="752" y="832" name="X_LOAD" orien="R270" />
        <iomarker fontsize="28" x="1440" y="912" name="DATA_OUT(7:0)" orien="R0" />
        <branch name="DATA_IN(7:0)">
            <wire x2="784" y1="992" y2="992" x1="608" />
            <wire x2="784" y1="992" y2="1040" x1="784" />
            <wire x2="800" y1="1040" y2="1040" x1="784" />
            <wire x2="784" y1="1040" y2="1200" x1="784" />
            <wire x2="1248" y1="1200" y2="1200" x1="784" />
        </branch>
        <iomarker fontsize="28" x="608" y="992" name="DATA_IN(7:0)" orien="R180" />
        <branch name="DATA_OUT(7:0)">
            <wire x2="1360" y1="912" y2="912" x1="1184" />
            <wire x2="1440" y1="912" y2="912" x1="1360" />
            <wire x2="1360" y1="912" y2="1024" x1="1360" />
            <wire x2="1696" y1="1024" y2="1024" x1="1360" />
            <wire x2="1696" y1="1024" y2="1072" x1="1696" />
            <wire x2="1696" y1="1072" y2="1072" x1="1632" />
        </branch>
        <instance x="1248" y="1232" name="XLXI_3" orien="R0">
        </instance>
        <branch name="Y_BE">
            <wire x2="1248" y1="1136" y2="1136" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="1216" y="1136" name="Y_BE" orien="R180" />
        <branch name="Y_LOAD">
            <wire x2="1248" y1="1072" y2="1072" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="1216" y="1072" name="Y_LOAD" orien="R180" />
    </sheet>
</drawing>