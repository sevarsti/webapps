<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-16
  Time: 22:33:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.saille.ogzq.*" %>
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
    </head>
    <body>
    <%!
        public String convert(String in) {
            Map<String, String> list = new HashMap<String, String>();
            list.put("������", "7");
            list.put("��������", "6");
            list.put("����", "5");
            list.put("�ܳ�", "4");
            list.put("��Ӣ", "3");
            list.put("����", "2");
            list.put("��ͨ", "1");
            return list.get(in);
        }
    %>
    <%
        String email = request.getParameter("email");
        email = URLDecoder.decode(email, "utf-8");
        List<Map<String, String>> players = new OgzqDwr().viewPlayer(email);
        List<String[]> tacticXiangqians = IDUtils.getXiangqianPlayer(email, 0);
    %>
    <%=email%>/<%=IDUtils.getNick(email)%>��ʣ�����ң�<%=IDUtils.IDInfos.get(email).get("silver")%>��ʵ����<%=IDUtils.IDInfos.get(email).get("shili")%>
    <br/>
        <input type="button" value="ѵ��" onclick="javascript:window.open('train.jsp?email=<%=URLEncoder.encode(email)%>')"/>
    <br/>
    <table width="100%" border="0">
        <tr>
            <td valign="top">
                <table id="info" border="0" cellpadding="1" cellspacing="1">
                    <tr class="head">
                        <!--<th>ID</th>-->
                        <th>����</th>
                        <th>��Ա</th>
                        <!--<th>ID</th>-->
                        <th>����</th>
                        <th>λ��</th>
                        <th>Ʒ��</th>
                        <th>�ȼ�</th>
                        <th>�油</th>
                        <th>��ͨ</th>
                        <th>����</th>
                        <th>��Ӣ</th>
                        <th>�ܳ�</th>
                        <th>����</th>
                        <th>����</th>
                    </tr>
                    <%
                        for(int i = 1; i < players.size(); i++) {
                            Map<String, String> p = players.get(i);
//                            Map<String, String> detail = OperationUtils.viewPlayer(email, p.get("id"));
                            Map<String, String> detail = CacheManager.loadPlayer(email, p.get("id"), false);
                            HttpPost pm = new HttpPost(OgzqURL.URL + "/Ogzd.aspx");
                            List<NameValuePair> params = new ArrayList<NameValuePair>();
                            params.add(new BasicNameValuePair("QyzxLoad1", p.get("id")));
                            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                            String str = IDUtils.execute(email, pm);
//695956|220301|��ŵ����|6|3056|1|Activity1/220301.png@
//0@
//767314|10901|â����|2|264|1|France/09/10901.png@
//688036|11001|�ʵ���|3|392|1|France/10/11001.png@
//678694|40601|ʲ������|4|823|1|England/06/40601.png@
//0@
//-1
                            String[] subs = str.split("@");
                            List<String> showstr = new ArrayList<String>();
                            for(int j = 1; j < subs.length; j++) {
                                if(subs[j].equals("-1") || subs[j].equals("0")) {
                                    showstr.add(subs[j]);
                                } else {
                                    if("-2".equals(subs[j].split("[|]")[0])) {
                                        showstr.add("-1");
                                    } else {
                                        String[] attrs = subs[j].split("[|]");
                                        showstr.add(attrs[4] + attrs[2]);
                                    }
                                }
                            }
                            boolean isZijin = IDUtils.isZijinPlayer(p.get("id"));
//                    str = str.replaceAll("@", "<br/>");
                    %>
                    <tr class="row<%=i % 2 + 1%>">
                        <td>
                            <input type="button" value="��ѵ" onclick="fulltrain('<%=p.get("id")%>', '<%=convert(detail.get("pinzhi"))%>')"/>
                            <input type="button" value="��" onclick="doFire('<%=p.get("id")%>')"/>
                        </td>
                        <td>
                            <span <%=isZijin ? ("style='color:red;'") : ""%>>
                                <%=p.get("name")%><br/>
                            </span>
                        </td>
                        <td>
                            <%=p.get("ability")%>
                            <%--<%=p.get("id")%>--%>
                        </td>
                        <td><%=detail.get("pos")%></td>
                        <td><%=detail.get("pinzhi")%></td>
                        <td><%=p.get("level")%></td>
                        <td><%=p.get("tibu")%></td>
                        <%
                            for(int j = 0; j < showstr.size(); j++) {
                                String s = showstr.get(j);
                        %>
                            <td>
                                <%
                                    if(!"-1".equals(s)) {
                                %>
                                <input type="button" value="Ƕ" onclick="showxiangqian(this, '<%=p.get("id")%>', '<%=p.get("name")%>', '<%=j+1%>');"/>
                                <%
                                    }
                                %>
                                <%=s.equals("0") ? "��" : (s.equals("-1") ? "--" : s)%>
                            </td>
                        <%
                            }
                        %>
                        <%--<td>--%>
                            <%--<input type="button" value="�ɳ�" onclick="chengzhang('<%=p.get("id")%>')"/>--%>
                        <%--</td>--%>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </td>
            <td valign="top" align="left">
                <input type="button" id="query1" value="��ͨ" onclick="doinit(1)"/>
                <input type="button" id="query2" value="����" onclick="doinit(2)"/>
                <input type="button" id="query3" value="��Ӣ" onclick="doinit(3)"/><br/>
                <input type="button" id="query4" value="�ܳ�" onclick="doinit(4)"/>
                <input type="button" id="query5" value="����" onclick="doinit(5)"/>
                <input type="button" id="query6" value="����" onclick="doinit(6)"/>
                <br/>
                <span id="ready"></span><br/>
                <span id="todoplayer"></span><br/>
                <table border="0" cellpadding="1" cellspacing="1" id="xq">
                    <tr class="head">
                        <td>ID</td>
                        <td>����</td>
                        <td>Ʒ��</td>
                        <td>ʵ��</td>
                        <td>λ��</td>
                        <td>����</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br/>
    </body>
<script type="text/javascript">
    var players = new Array(); //id, name, pinzhi, shili, pos
    <%
        for(int i = 0; i < tacticXiangqians.size(); i++) {
            String[] ss = tacticXiangqians.get(i);
    %>players[<%=i%>] = new Array('<%=ss[0]%>', '<%=ss[1]%>', '<%=ss[2]%>', '<%=ss[3]%>', '<%=ss[4]%>', '<%=ss[5]%>');
    <%
        }
    %>
    function after(obj)
    {
        alert(obj);
    }

    function chengzhang(playerId) {
        OgzqDwr.qiuyuanchengzhang('<%=email%>', playerId, after);
    }

    function showxiangqian(obj, id, name, pinzhi)
    {
        var table = document.getElementById('info');
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].style.color = 'black';
        }
        obj.parentNode.parentNode.style.color = 'red';
        document.getElementById('todoplayer').innerHTML = name;
        var table = document.getElementById('xq');
        for(var i = table.rows.length - 1; i > 0; i--) {
            table.deleteRow(i);
        }
        for(var i = 0; i < players.length; i++) {
            if(players[i][2] == pinzhi) {
                var row = table.insertRow(-1);
                row.className = 'row' + (i % 2 + 1);
                if(srcXiangqianId == players[i][0]) {
                    row.style.color = 'red';
                }
                var cell;
                for(var j = 0; j < 5; j++) {
                    cell = row.insertCell(-1);
                    cell.innerHTML = players[i][j];
                }
                cell = row.insertCell(-1);
                if(players[i][5] == "1") {
                    cell.innerHTML = "<input type=\"button\" value=\"Ƕ\" onclick=\"doxq(this, '" + id + "', '" + players[i][0] + "')\"/>" +
                                     "<input type=\"button\" value=\"��\" onclick=\"backFromTactic(this, '" + players[i][0] + "')\"/>"
                }
            }
        }
    }

    var srcXiangqianId = '';


    function backFromTactic(obj, playerId) {
        var table = document.getElementById('xq');
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].style.color = 'black';
        }
        srcXiangqianId = playerId;
        obj.parentNode.parentNode.style.color = 'red';
        OgzqDwr.backFromTacti('<%=email%>', playerId,  after);
    }

    function doxq(obj, playerId, xiangqianId) {
        var table = document.getElementById('xq');
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].style.color = 'black';
        }
        srcXiangqianId = xiangqianId;
        obj.parentNode.parentNode.style.color = 'red';
        OgzqDwr.xiangqian('<%=email%>', playerId,  xiangqianId, after);
    }

    function fulltrain(playerId, level) {
        OgzqDwr.fullTrain('<%=email%>', playerId,  level, after);
    }

    function afterpreload(list) {
        var curLen = players.length;
        for(var i = 0; i < list.length; i++) {
            players[curLen + i] = new Array(list[i][0], list[i][1], list[i][2], list[i][3], list[i][4], list[i][5]);
        }
        pz = pz + 1;
        document.getElementById('ready').innerHTML = '��ȡƷ��' + pz;
        preload(pz);
    }

    function preload(pinzhi) {
        if(pinzhi > 6) {
            document.getElementById('ready').innerHTML = '';
            return;
        }
        OgzqDwr.loadXiangqianTactic('<%=email%>', pinzhi, afterpreload);
    }

    function doFire(id) {
        if(confirm('ȷ��Ҫ��͵�ս�����ģ�')) {
            OgzqDwr.fireToTactic('<%=email%>', id, after);
        }
    }

    function doinit(id) {
        document.getElementById('ready').innerHTML = '���ڲ�ѯ' + id;
        document.getElementById('query' + id).style.display = 'none';
        OgzqDwr.loadXiangqianTactic('<%=email%>', id, afterload);
    }

    function afterload(list) {
        document.getElementById('ready').innerHTML = '';
        if(list != null && list.length > 0) {
            var pinzhi = list[0][2];
            var curLen = players.length;
            for(var i = curLen - 1; i >= 0; i--) {
                if(players[i][2] == pinzhi) {
                    players[curLen + i] = null;
                }
            }
            curLen = players.length;
            for(var i = 0; i < list.length; i++) {
                players[curLen + i] = new Array(list[i][0], list[i][1], list[i][2], list[i][3], list[i][4], list[i][5]);
            }
        }
    }

    var pz = 1;
//    preload(pz);
</script>
</html>