<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-15
  Time: 20:01:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="java.util.List" %>
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
        <script type="text/javascript" src="../scripts/swfobject.js"></script>
    </head>
    <body>
    <table width="100%" class="frame" bgcolor="black" cellpadding="1" cellspacing="1">
        <tr class="head">
            <td colspan="5">���</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="�챴�˺�ķ����ս���" onclick="callFunction('getPersonalBeckhamGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="�챴�˺�ķ���ս���" onclick="callFunction('getBeckhamClubGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="��͵ٸ���ս���" onclick="callFunction('getBatiGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="��͵����ս���" onclick="callFunction('getBatiClubGift')"/>
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="�쿨������ս���" onclick="callFunction('getPersonalCafuGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="�쿨�����ս���" onclick="callFunction('getCafuClubGift')"/>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr class="head">
            <td colspan="5">��߳�</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="�������" onclick="callFunction('getGridGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="����������" onclick="callFunction('beginDaliwan')"/>
            </td>
            <td width="20%">
                <input type="button" value="������״̬" onclick="callFunction('daliwanStatus')"/>
            </td>
            <td width="20%"></td>
            <td width="20%"></td>
        </tr>
        <tr class="head">
            <td colspan="5">��ѻ</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="��ѷ���ҵ�" onclick="callFunction('crazyEggFree');"/>
            </td>
            <td width="20%">
                <input type="button" value="������" onclick="callFunction('liansuo')"/>
            </td>
            <td width="20%">
                <input type="button" value="��Ա����Ӫ" onclick="callFunction('jizhongying')"/>
            </td>
            <td width="20%">
                <input type="button" value="ˢˢ��" onclick="callFunction('shuashuale')"/>
            </td>
            <td width="20%">
                <input type="button" value="�����ֺ�" onclick="callFunction('mashanglehe')"/>
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="����תת" onclick="callFunction('superZhuanzhuan')"/>
            </td>
            <td width="20%">
                <input type="button" value="���ۿ�" onclick="callFunction('bigDiscount')"/>
            </td>
            <td width="20%">
                <input type="button" value="��¼ҡ��" onclick="callFunction('dengluyaojiang')"/>
            </td>
            <td width="20%">
                <input type="button" value="����򣨲Σ�" onclick="callFunction('playBall')"/>
            </td>
            <td width="20%">
                <input type="button" value="�����״̬" onclick="callFunction('playBallStatus')"/>
            </td>
        </tr>
        <tr class="head">
            <td colspan="5">���ָ��</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="ʹ�ô�����" onclick="callFunction('useYouxiang')"/>
            </td>
            <td width="20%">
                <input type="button" value="��lv5����" onclick="callFunction('doSellLv5')"/>
            </td>
            <td width="20%">
                <input type="button" value="����������" onclick="callFunction('openBox')"/>
            </td>
            <td width="20%">
                <input type="button" value="������ʯ(��)" onclick="callFunction('ronglianGem')"/>
            </td>
            <td width="20%">
                <input type="button" value="ʹ�õ���" onclick="callFunction('useItem')"/>
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="�����̳���1����ͬ��" onclick="callFunction('buyCoinDaoju')"/>
            </td>
            <td width="20%">
                <input type="button" value="��ȡ���" onclick="callFunction('getGift')"/>
            </td>
            <td width="20%">
                <input type="button" value="����С��ͶƱ" onclick="callFunction('worldclubGroupVote')"/>
            </td>
            <td width="20%">
                <input type="button" value="������̭ͶƱ" onclick="callFunction('worldclubPlayOffVote')"/>
            </td>
            <td width="20%">
                <input type="button" value="���˹ھ�������" onclick="callFunction('leagueChampionVote')"/>
            </td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="������������" onclick="callFunction('upPele')"/>
            </td>
            <td width="20%">
                <input type="button" value="ʹ���۷�ض�" onclick="callFunction('useOgHuidou')"/>
            </td>
            <td width="20%">
                <input type="button" value="��¼���ս" onclick="callFunction('doLoginTeamgame')"/>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr class="head">
            <td colspan="5">�鿴��Ϣ</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="��ŷ�ڶ���" onclick="callFunction('viewChampionCup')"/>
            </td>
            <td width="20%">
                <input type="button" value="ŷ��ͶƱ���Σ�" onclick="callFunction('voteChampionCup')"/>
            </td>
            <td width="20%">
                <input type="button" value="��ȡ��Ա����" onclick="callFunction('loadPlayer')"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴���ʵ�����Σ�" onclick="callFunction('viewTeamAbility')"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴���buff���Σ�" onclick="callFunction('viewBuff')"/>
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="�鿴�" onclick="callFunction('viewActivity')"/>
            </td>
            <td width="20%">
                <input type="button" value="����" onclick="callFunction('viewNews')"/>
            </td>
            <td width="20%">
                <input type="button" value="�����۷�״̬" onclick="callFunction('topChallengePersonStatus')"/>
            </td>
            <td width="20%">
                <input type="button" value="��������ս����" onclick="callFunction('viewLMGX')"/>
            </td>
            <td width="20%">
                <input type="button" value="��������" onclick="callFunction('beiliStatus')"/>
            </td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="�����۷�״̬" onclick="callFunction('bayernChallengeStatus')"/>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr class="head">
            <td colspan="5">�ѷ���</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="ǩ��" onclick="callFunction('qiandao')"/>
            </td>
            <td width="20%">
                <input type="button" value="������" onclick="callFunction('lianliankan')"/>
            </td>
            <td width="20%">
                <input type="button" value="�ǹ�ǩ��" onclick="callFunction('yaguanqiandao')"/>
            </td>
            <td width="20%">
                <input type="button" value="�ǹ�ͶƱ" onclick="callFunction('yaguanVote')"/>
            </td>
            <td width="20%">
                <input type="button" value="�ǹ������" onclick="callFunction('yaguanGet')"/>
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="�ǹڶһ�" onclick="callFunction('yaguanDuihuan')"/>
            </td>
            <td width="20%">
                <input type="button" value="�����۷����" onclick="callFunction('custTopChallenge')"/>
            </td>
            <td width="20%">
                <input type="button" value="������" onclick="callFunction('fishBlow')"/>
            </td>
            <td width="20%"></td>
            <td width="20%"></td>
        </tr>
        <tr class="head">
            <td colspan="5">����</td>
        </tr>
        <tr class="row1">
            <td width="20%">
                <input type="button" value="��Ƕ����״̬" onclick="javascript:window.open('xiangqianTactic.jsp');"/>
            </td>
            <td width="20%">
                <input type="button" value="����ʵ��" onclick="javascript:window.open('uplevel.jsp');"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴����" onclick="javascript:window.open('mytactic.jsp');"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴����" onclick="javascript:window.open('flag.jsp');"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴���ʵ��" onclick="javascript:window.open('viewClubs.jsp');"/>
            </td>
        </tr>
        <tr class="row2">
            <td width="20%">
                <input type="button" value="�鿴���ֲ�����" onclick="javascript:window.open('clubbuff.jsp');"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴������ս" onclick="javascript:window.open('monitor.jsp?show=1');"/>
            </td>
            <td width="20%">
                <input type="button" value="�鿴���ֻ���" onclick="javascript:window.open('score.jsp');"/>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <input type="button" value="�鿴ȫƽ̨ʵ��" onclick="javascript:window.open('allTop.jsp?show=1');"/>
            </td>
        </tr>
    </table>
    <br/>
    ������<input id="param" value="" size="50" type="text"/>
    <br/>
    <span id="content"/>
    </body>
<script type="text/javascript">
    function callFunction(methodName) {
        var param = document.getElementById('param').value;
        document.getElementById('content').innerHTML = '';
        OgzqDwr.callFunction(methodName, param, after);
        document.getElementById('param').value = '';
    }

    function after(obj) {
        document.getElementById('content').innerHTML = obj;
        alert('done');
    }
</script>
</html>