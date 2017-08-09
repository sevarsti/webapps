<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="com.saille.ogzq.OgzqDwr" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../include/include.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2016-11-21
  Time: 17:01:28
  To change this template use File | Settings | File Templates.
--%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='../scripts/tablesort.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
    </head>
    <body>
    <%
        int[] xingyunneed = new int[]{200, 260, 280, 300, 350, 400, 500, 600, 800, 1000};
        int [] qiuhunneed = new int[]{15, 20, 20, 30, 30, 50, 50, 70, 70, 100, 10000};
        request.setAttribute("xingyunneed", xingyunneed);
        request.setAttribute("qiuhunneed", qiuhunneed);

        String email = URLDecoder.decode(request.getParameter("email"));

        List<String[]> results = new ArrayList<String[]>();

        String xingyun = "0";
        List<Map<String, String>> items = OperationUtils.listBags(email, "0");
        for(Map<String, String> m : items) {
            if(m.get("itemid").equals("24201")) { //���˺ϼ�
                xingyun = m.get("number");
                break;
            }
        }

        List<Map<String, String>> players = new OgzqDwr().viewPlayer(email);
        for(int i = 1; i < players.size(); i++) {
            String[] r = new String[7];
            Map<String, String> m = players.get(i);
            r[0] = m.get("id");
            r[1] = m.get("name");

            String id = m.get("id");
            HttpPost pm = new HttpPost(OgzqURL.URL + "/MatchList/ChallengeMatch/Challenge1.aspx");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("DFRoad_PlayerTitleInfo", "1"));
            params.add(new BasicNameValuePair("pid", id));
            params.add(new BasicNameValuePair("idx", "0"));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String s = IDUtils.execute(email, pm);
            String[] parts = s.split("��");
            r[2] = parts[1]; //��ν�ȼ�
            r[3] = parts[2]; //��ǰӵ�е��������
            r[4] = parts[3]; //��ǰӵ�е����˺ϼ�����
            r[5] = parts[5]; //������Ҫ���������
            r[6] = parts[4]; //������Ҫ�������Ƭ����
            results.add(r);
        }
    %>
    <%=email%><br/>
    <%=IDUtils.getNick(email)%><br/>
    ���ң�<%=IDUtils.IDInfos.get(email).get("silver")%><br/>
    <input type="button" value="ѵ��" onclick="javascript:window.open('train.jsp?email=<%=URLEncoder.encode(email)%>')"/><br/>
        <table id="info" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 0, false)">ID</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 1, false)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, true)">�ȼ�</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 3, true)">�������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 3, true)">���˺ϼ�����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 4, true)">��Ҫ�������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 5, true)">��Ƭ����</th>
                <th>����</th>
            </tr>
            <c:forEach items="<%=results%>" var="r" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${r[0]}</td>
                    <td>${r[1]}</td>
                    <td>${r[2]}</td>
                    <td>${r[3]}/${qiuhunneed[r[2]]}</td>
                    <td>${r[4]}/${xingyunneed[r[2]]}</td>
                    <td>${r[5]}</td>
                    <td>${r[6]}</td>
                    <td>
                        <c:if test="${r[3] >= qiuhunneed[r[2]]}">
                            <input type="button" onclick="doUpgrade('${r[0]}', '0')" value="����"/>
                            <c:if test="${r[4] >= xingyunneed[r[2]]}">
                                <input type="button" onclick="doUpgrade('${r[0]}', '1')" value="����(��)"/>
                            </c:if>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
<script type="text/javascript">
    function after(obj) {
        alert(obj);
    }

    function doUpgrade(player, isLucky) {
        OgzqDwr.upgradeTitle('<%=email%>', player, isLucky, after);
    }
</script>
</html>