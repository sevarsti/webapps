<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-15
  Time: 20:01:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type="text/javascript" src="../scripts/swfobject.js"></script>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    <input type="button" value="�鿴�¼�" onclick="javascript:window.open('events.jsp');"/>
                </td>
            </tr>
        </table>
        <br/>
        <table>
            <tr>
                <td>
                    Ⱥ������
                </td>
                <td>
                    <input type="button" value="�鿴��ѡ��Ա" onclick="viewMiddleMan('');"/>
                    <input type="button" value="�鿴����" onclick="viewTaskinfo('', 0);"/>
                    <input type="button" value="�鿴�������" onclick="viewTaskinfo('', 1);"/>
                    <input type="button" value="�鿴δ�������" onclick="viewTaskinfo('', 2);"/>
                    <input type="button" value="�鿴��Ա" onclick="viewPlayer('');"/>
                    <input type="button" value="�鿴��������Ա" onclick="viewUpgradePlayer('');"/>
                    <%--<input type="button" value="�鿴ǩԼ����" onclick="javascript:window.open('bag.jsp');"/>--%>
                    <%--<input type="button" value="�鿴��������" onclick="javascript:window.open('item.jsp');"/>--%>
                    <%--<input type="button" value="�Զ�ѵ��" onclick="autoTrainTask('');"/>--%>
                    <input type="button" value="����������ս" onclick="signupTeamGame('');"/>
                    <input type="button" value="��������" onclick="javascript:window.open('config.jsp');"/>
                    <input type="button" value="�鿴ս��" onclick="javascript:window.open('mytactic.jsp');"/>
                    <input type="button" value="��������" onclick="javascript:window.open('ogzqUtils.jsp');"/>
                </td>
            </tr>
            <tr>
                <td>
                    �Զ����
                </td>
                <td>
                    <input type="button" value="ȫ��" onclick="finishTaskAll('0');"/>
                    <input type="button" value="ѵ����Ա" onclick="finishTaskAll('1');"/>
                    <input type="button" value="������" onclick="finishTaskAll('2');"/>
                    <input type="button" value="������ս" onclick="finishTaskAll('3');"/>
                    <input type="button" value="������Ա" onclick="finishTaskAll('4');"/>
                    <input type="button" value="ѵ����" onclick="finishTaskAll('5');"/>
                    <input type="button" value="ŷ��֮��" onclick="finishTaskAll('6');"/>
                    <input type="button" value="ŷ��֮��" onclick="finishTaskAll('7');"/>
                    <input type="button" value="����Ѳ��" onclick="finishTaskAll('8');"/>
                </td>
            </tr>
        </table>
        <br/>
        <input type="button" value="չ��/������Ϣ" onclick="showTable('info');"/>
        <table id="info" width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 0, false)">��¼��</th>
                <th>��Ϸ��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, true)">�ƽ�</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 3, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 4, true)">�ȼ�</th>
                <!--<th>����</th>-->
                <!--<th>��һ������</th>-->
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 5, true)">ʵ��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 6, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 7, false)">���</th>
                <th>ѵ����</th>
                <th>������</th>
                <!--<th>����</th>-->
                <th>��Ա����</th>
            </tr>
            <%
                int i = 0;
                List<String> keys = IDUtils.GETIDS();
                for (String key : keys) {
            %>
                <tr class="row<%=i % 2 + 1%>">
                    <td>
                        <input type="button" value="ѵ��" onclick="javascript:window.open('train.jsp?email=<%=URLEncoder.encode(key)%>')" style="padding-left: 1px;padding-right: 1px;"/>
                        <%--<input type="button" value="װ��" onclick="javascript:window.open('equip.jsp?email=<%=URLEncoder.encode(key)%>')" style="padding-left: 1px;padding-right: 1px;"/>--%>
                        <input type="button" value="����" onclick="viewTaskinfo('<%=key%>', 0)" style="padding-left: 1px;padding-right: 1px;"/>
                        <input type="button" value="��ѡ��Ա" onclick="viewMiddleMan('<%=key%>');" style="padding-left: 1px;padding-right: 1px;"/>
                        <input type="button" value="�鿴ս������" onclick="javascript:window.open('tactic.jsp?email=<%=URLEncoder.encode(key)%>');" style="padding-left: 1px;padding-right: 1px;"/>
                        <%--<input type="button" value="�������ս" onclick="signupTeamGame('<%=key%>');"/>--%>
                        <input type="button" value="����" onclick="javascript:window.open('bag.jsp?email=<%=URLEncoder.encode(key)%>');" style="padding-left: 1px;padding-right: 1px;"/>
                        <input type="button" value="ս��" onclick="javascript:window.open('mytactic.jsp?email=<%=key%>');" style="padding-left: 1px;padding-right: 1px;"/>
                        <%--<input type="button" value="����" onclick="javascript:window.open('shengjie.jsp?email=<%=key%>');" style="padding-left: 1px;padding-right: 1px;"/>--%>
                        <%=key%>
                    </td>
                    <td><%=IDUtils.getNick(key)%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("gold")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("silver")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("level")%></td>
                    <%--<td><%=IDUtils.IDInfos.get(key).get("exp")%></td>--%>
                    <%--<td><%=IDUtils.IDInfos.get(key).get("nextlevel")%></td>--%>
                    <td><%=IDUtils.IDInfos.get(key).get("shili")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("shengwang")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("club")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("xunliansai")%></td>
                    <td><%=IDUtils.IDInfos.get(key).get("arena")%></td>
                    <%--<td><%=(IDUtils.IDTasks.containsKey(key) && IDUtils.IDTasks.get(key).containsKey("league")) ? IDUtils.IDTasks.get(key).get("league") : "δ֪"%></td>--%>
                    <td><%=IDUtils.IDInfos.get(key).get("search")%></td>
                </tr>
            <%
                    i++;
                }
            %>
        </table>
        <br/>
        <input type="button" value="չ��/�����ѡ��Ա" onclick="showTable('middleman');"/>
        <table id="middleman" width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th onclick="resort(this, 0, false)" style="cursor:pointer;text-decoration:underline;">email</th>
                <th onclick="resort(this, 1, false)" style="cursor:pointer;text-decoration:underline;">�ǳ�</th>
                <th onclick="resort(this, 2, true)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 3, true)" style="cursor:pointer;text-decoration:underline;">ID</th>
                <th onclick="resort(this, 4, false)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 5, true)" style="cursor:pointer;text-decoration:underline;">�ȼ�</th>
                <th onclick="resort(this, 6, true)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 7, true)" style="cursor:pointer;text-decoration:underline;">λ��</th>
                <th onclick="resort(this, 8, true)" style="cursor:pointer;text-decoration:underline;">ʣ��ʱ��</th>
                <th onclick="resort(this, 9, true)" style="cursor:pointer;text-decoration:underline;">���</th>
                <th>����</th>
            </tr>
        </table>
        <br/>
        <input type="button" value="չ��/��������" onclick="showTable('taskinfo');"/>
        <table id="taskinfo" width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th onclick="resort(this, 0, false)" style="cursor:pointer;text-decoration:underline;">email</th>
                <th onclick="resort(this, 1, false)" style="cursor:pointer;text-decoration:underline;">nick</th>
                <th onclick="resort(this, 2, false)" style="cursor:pointer;text-decoration:underline;">ID</th>
                <th onclick="resort(this, 3, false)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 4, false)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 5, false)" style="cursor:pointer;text-decoration:underline;">״̬</th>
                <th onclick="resort(this, 6, false)" style="cursor:pointer;text-decoration:underline;">�����</th>
                <th onclick="resort(this, 7, false)" style="cursor:pointer;text-decoration:underline;">����</th>
            </tr>
        </table>
        <br/>
        <input type="button" value="չ��/������Ա" onclick="showTable('player');"/>
        <table id="player" width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 0, false)">email</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 1, false)">nick</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, true)">ID</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 3, false)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 4, false)">�ȼ�</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 5, false)">Ʒ��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 6, false)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 7, false)">λ��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 8, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 9, false)">�Ƿ��油</th>
                <th>����</th>
            </tr>
        </table>
    </body>
<script type="text/javascript">
    function init(type)
    {
//        OgzqDwr.init();
    }

    function viewTaskinfo(email, type)
    {
        var table = document.getElementById('taskinfo');
        for(var i = table.rows.length - 1; i > 0; i--)
        {
            table.deleteRow(i);
        }
        OgzqDwr.viewTaskinfo(email, type, afterViewTaskinfo);
    }

    function sellLv5(email)
    {
        OgzqDwr.doSellLv5(email, afterDo);
    }

    function afterViewTaskinfo(list)
    {
        if(list != null) {
            var table = document.getElementById('taskinfo');
            var currentemail = '';
            var bgcolor = 1;
            for(var i = 0;i < list.length; i++) {
                var row = table.insertRow(-1);
                if(list[i]['email'] != currentemail) {
                    bgcolor = 3 - bgcolor;
                    currentemail = list[i]['email'];
                }
                row.className = 'row' + bgcolor;
                var cell = row.insertCell(-1);
                cell.innerHTML = list[i]['email'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['nick'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['type'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['id'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['desc'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['status'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['finished'];
                cell = row.insertCell(-1);
                cell.innerHTML = "<input type=\"button\" value=\"���\" onclick=\"finishTask(this, '" + list[i]['email'] + "', '" + list[i]['id'] + "');\"/>"
            }
        }
    }

    function finishTask(obj, email, id) {
        OgzqDwr.finishTask(email, id);
        var table = document.getElementById('taskinfo');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);
    }

    function finishTaskAll(type) {
        OgzqDwr.finishTaskAll(type, afterDo);
    }

    function viewPlayer(email)
    {
        var table = document.getElementById('player');
        for(var i = table.rows.length - 1; i > 0; i--)
        {
            table.deleteRow(i);
        }
        OgzqDwr.viewPlayer(email, afterViewPlayer);
    }

    function viewUpgradePlayer(email)
    {
        var table = document.getElementById('player');
        for(var i = table.rows.length - 1; i > 0; i--)
        {
            table.deleteRow(i);
        }
        OgzqDwr.viewUpgradePlayer(email, afterViewPlayer);
    }

    function afterViewPlayer(list) {
        if(list) {
            var table = document.getElementById('player');
            var currentemail = '';
            var bgcolor = 1;
            for(var i = 0;i < list.length; i++) {
                var row = table.insertRow(-1);
                if(list[i]['email'] != currentemail) {
                    bgcolor = 3 - bgcolor;
                    currentemail = list[i]['email'];
                }
                row.className = 'row' + bgcolor;
                var cell = row.insertCell(-1);
                cell.innerHTML = list[i]['email'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['nick'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['id'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['name'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['level'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['pinzhi'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['exp'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['place'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['ability'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['tibu'];
//                cell = row.insertCell(-1);
//                cell.innerHTML = "<input type=\"button\" value=\"����\" onclick=\"dropPlayer(" + (i + 1) + ", '" + list[i]['email'] + "', '" + list[i]['id'] + "');\"/>";
            }
        }
    }

    function viewMiddleMan(email)
    {
        var table = document.getElementById('middleman');
        for(var i = table.rows.length - 1; i > 0; i--)
        {
            table.deleteRow(i);
        }
        OgzqDwr.viewMiddleMan(email, afterViewMiddleMan);
    }

    function afterViewMiddleMan(list)
    {
        if(list != null) {
            var table = document.getElementById('middleman');
            var currentemail = '';
            var bgcolor = 1;
            for(var i = 0;i < list.length; i++) {
                var row = table.insertRow(-1);
                if(list[i]['email'] != currentemail) {
                    bgcolor = 3 - bgcolor;
                    currentemail = list[i]['email'];
                }
                row.className = 'row' + bgcolor;
                if(isKey(list[i]['name']) || list[i]['name'].indexOf("����") >= 0) {
                    row.style.color = 'red';
                } else if(list[i]['level'] < 5) {
                    row.style.color = 'blue';
                }
                var cell = row.insertCell(-1);
                cell.noWrap = 'true';
                cell.innerHTML = "<input type=\"button\" value=\"ѵ��\" onclick=\"javascript:window.open('train.jsp?email=" + list[i]['email'] + "')\"/>" +
                        "<input type=\"button\" value=\"ս������\" onclick=\"javascript:window.open('tactic.jsp?email=" + list[i]['email'] + "')\"/>" +
                        "<input type=\"button\" value=\"����\" onclick=\"javascript:window.open('bag.jsp?email=" + encodeURI(encodeURI(list[i]['email'])) + "')\"/>" +
                        "<input type=\"button\" value=\"��Ƕ\" onclick=\"javascript:window.open('doxiangqian.jsp?email=" + encodeURI(encodeURI(list[i]['email'])) + "')\"/>" + list[i]['email'] +
                        "<span id=\"email-" + list[i]['email'] + "\"></span>";

//                if(!!navigator.userAgent.match(/AppleWebKit.*Mobile.*/)||!!navigator.userAgent.match(/AppleWebKit/)) {
//
//                } else {
//                    var params = {menu:"false",
//                        scale:"noScale",
//                        allowFullscreen:"false",
//                        allowScriptAccess:"always",
//                        bgcolor:"#FFFFFF",
//                        wmode:"transparent",
//                        FlashVars:"text=����&data=" + list[i]['email']};
//                    var attributes = {id:"clipboard",style:"margin:0 0 -5px 10px;"};
//                    swfobject.embedSWF("../include/clip.swf", "email-" + list[i]['email'], "30px", "20px", "9.0.0", "", null, params, attributes);
//                }

                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['nick'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['silver'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['id'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['name'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['level'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['value'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['place'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['lefttime'];
                cell = row.insertCell(-1);
                cell.innerHTML = list[i]['count'];
                cell = row.insertCell(-1);
                cell.noWrap = "nowrap";
                var giveup = "<input type=\"button\" value=\"����\" onclick=\"dropPlayer(this, '" + list[i]['email'] + "', '" + list[i]['id'] + "');\"/>";
                var beforesign = "<input type=\"button\" value=\"ǩԼ\" onclick=\"beforeSign('" + list[i]['email'] + "', '" + list[i]['id'] + "');\"/>";
                var signAndFire = "<input type=\"button\" value=\"ǩ-��\" onclick=\"signFire(this, '" + list[i]['email'] + "', '" + list[i]['id'] + "');\"/>"
                var signAndTrainAndFire = "<input type=\"button\" value=\"ǩ-ѵ-��\" onclick=\"signTrainFire(this, '" + list[i]['email'] + "', '" + list[i]['name'] + "', '" + list[i]['id'] + "','" + list[i]['level'] + "');\"/>"
                var deleterow = "<input type=\"button\" value=\"D\" onclick=\"document.getElementById('middleman').deleteRow(this.parentNode.parentNode.rowIndex);\"/>"
                cell.innerHTML = giveup + beforesign + signAndFire + signAndTrainAndFire + deleterow;
            }
        }
    }

    function beforeSign(email, id)
    {
        OgzqDwr.beforeSign(email, id, afterBeforeSign);
    }

    function afterBeforeSign(obj)
    {
        if(obj == null || obj.length == 0) {
            alert('�油����');
        }
        if(confirm(obj[2])) {
            OgzqDwr.signPlayer(obj[0], obj[1], afterDo);
        }
    }

    function signFire(obj, email, id)
    {
        var table = document.getElementById('middleman');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);
        OgzqDwr.signAndFirePlayer(email, id, afterDo);
    }

    function signTrainFire(obj, email, name, id, level)
    {
        if("���˹ά��" == name) {
            if(confirm('��ǶΪ������')) {
                name = "���˹ά����";
            } else if(confirm('��ǶΪ�г���')) {
                name = "���˹ά����";
            } else if(confirm('��ǶΪǰ�棿')) {
                name = "���˹ά��ǰ";
            } else {
                alert('����Ƕ');
                return;
            }
        }
        var table = document.getElementById('middleman');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);
        OgzqDwr.signAndTrainAndFirePlayer(email, name, id, level, afterDo);
    }

    function afterDo(obj)
    {
        alert(obj);
    }

    function dropPlayer(obj, email, id)
    {
        OgzqDwr.dropPlayer(email, id);
        var table = document.getElementById('middleman');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);
    }

    function showTable(id)
    {
        var table = document.getElementById(id);
        if(table) {
            if(table.style.display == 'none') {
                table.style.display = '';
            } else {
                table.style.display = 'none';
            }
        }
    }

    function autoTrainTask(id)
    {
        OgzqDwr.autoTrainTask(id, afterDo);
    }

    function doVoteChampion(id)
    {
        OgzqDwr.doVoteChampion(id, afterDo);

    }

    function signupTeamGame(id)
    {
        OgzqDwr.signupTeamGame(id, afterDo);
    }

    function getTacticPoint(id)
    {
        OgzqDwr.getTacticPoint(id, afterDo);
    }

    var keyPlayers = new Array();
    var keyIdx = 0;
    keyPlayers[keyIdx] = '�Ͷ�';
    keyIdx++;
    keyPlayers[keyIdx] = '����';
    keyIdx++;
    keyPlayers[keyIdx] = '������';
    keyIdx++;
    keyPlayers[keyIdx] = '������';
    keyIdx++;
    keyPlayers[keyIdx] = '������';
    keyIdx++;
    keyPlayers[keyIdx] = '��ά';
    keyIdx++;
    keyPlayers[keyIdx] = '��ͼ��';
    keyIdx++;
    keyPlayers[keyIdx] = 'Ƥ����';
    keyIdx++;
    keyPlayers[keyIdx] = 'ʩκ��˹̩��';
    keyIdx++;
    keyPlayers[keyIdx] = '�ޱ�';
    keyIdx++;
    keyPlayers[keyIdx] = '��˹��';
    keyIdx++;
    keyPlayers[keyIdx] = '¬����';
    keyIdx++;
    keyPlayers[keyIdx] = '����';
    keyIdx++;
    keyPlayers[keyIdx] = 'T��ϯ����';
    keyIdx++;
    keyPlayers[keyIdx] = '��ķ';
    keyIdx++;
    keyPlayers[keyIdx] = 'W�����°���';
    keyIdx++;
    keyPlayers[keyIdx] = '�޲�����';
    keyIdx++;
    keyPlayers[keyIdx] = 'A���ƶ�';
    keyIdx++;
//    keyPlayers[keyIdx] = '��Ī˹';
//    keyIdx++;
    keyPlayers[keyIdx] = '��Ү����';
    keyIdx++;
    keyPlayers[keyIdx] = '�����';
    keyIdx++;
    keyPlayers[keyIdx] = '������';
    keyIdx++;
    keyPlayers[keyIdx] = '���ڵ�';
    keyIdx++;
    keyPlayers[keyIdx] = '��������';
    keyIdx++;
    keyPlayers[keyIdx] = '��������';
    keyIdx++;
    keyPlayers[keyIdx] = '³��';
    keyIdx++;
    keyPlayers[keyIdx] = '�е�';
    keyIdx++;
    keyPlayers[keyIdx] = 'ƤҮ��';
    keyIdx++;
    keyPlayers[keyIdx] = '������';
    keyIdx++;
    keyPlayers[keyIdx] = 'F������˹';
    keyIdx++;

    function isKey(p) {
        var ret = false;
        for(var i = 0; i < keyPlayers.length; i++) {
            if(p == keyPlayers[i]) {
                return true;
            }
        }
        return false;
    }

    function copySuccess() {
        alert("���Ƴɹ�");
    }

</script>
</html>