<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2016-6-29
  Time: 11:03:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.ConfigUtils" %>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
    <%!
        List<String[]> players = new ArrayList<String[]>();
        String checkRange(int[] count, String currentCfg) {
//            if("6".equals(currentCfg)) {
                for(int i = 0; i < count.length; i++) {
                    if(count[i] == 0) {
                        return players.get(i)[1];
                    }
                }
//            } else if("7".equals(currentCfg)) {
//
//            }
            return "?";
        }
    %>
    <%
        players.clear();
        players.add(new String[]{"³��Ү", "6", "5"});
        players.add(new String[]{"л��", "6", "10"});
        players.add(new String[]{"������", "6", "10"});
        players.add(new String[]{"������", "6", "10"});
        players.add(new String[]{"â����", "6", "5"});
        players.add(new String[]{"������¡˹", "6", "10"});
        players.add(new String[]{"�߶�������", "6", "10"});
        players.add(new String[]{"������", "6", "10"});
        players.add(new String[]{"�ʵ���", "6", "5"});
        players.add(new String[]{"���", "8", "10"});
        players.add(new String[]{"���к�", "8", "10"});
        players.add(new String[]{"���к�", "8", "10"});
        players.add(new String[]{"ʲ������", "9", "5"});
        players.add(new String[]{"÷�߶���", "7", "4"});
        players.add(new String[]{"������", "8", "4"});
        players.add(new String[]{"�������з�", "9", "3"});
        List<String> ids = IDUtils.GETIDS();
        for(int j = ids.size() - 1; j >= 0; j--) {
            if(ids.get(j).startsWith("txjcf")) {
                ids.remove(j);
            }
        }
    %>
    <body>
    <table id="info" border="0" cellpadding="1" cellspacing="1">
        <tr class="head">
            <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 0, false)">����</th>
            <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 1, false)">�ǳ�</th>
            <%
                for(int i = 0; i < players.size(); i++) {
                    String[] p = players.get(i);
            %>
            <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, <%=i+2%>, true)"><%=p[0]%></th>
            <%
                }
            %>
            <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 18, true)">������Χ</th>
            <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 19, true)">Ԥ������</th>
        </tr>
        <%
            for(int i = 0; i < ids.size(); i++) {
                String id = ids.get(i);
                List<String[]> xiangqians = IDUtils.getXiangqianPlayer(id, 0);
                int[] full = new int[players.size()];
        %>
        <tr class="row<%=i % 2 + 1%>">
            <td><%=id%></td>
            <td><%=IDUtils.getNick(id)%></td>
            <%
                for(int j = 0; j < players.size(); j++) {
                    Map<String, String> m = new HashMap<String, String>();
                    m.put("name", players.get(j)[0]);
                    int[] count = OperationUtils.getFullXiangqianCount(m, xiangqians);
                    full[j] = count[j % 4] >= Integer.parseInt(players.get(j)[2]) ? 1 : 0;
            %>
            <td <%=j % 4 == 3 ? " style=\"border-right-style:double;\"" : ""%>>
                <c:if test="<%=count[j % 4] < Integer.parseInt(players.get(j)[2])%>">
                    <span style="color:red;">
                </c:if>
                <%=count[j % 4]%>
                <c:if test="<%=count[j % 4] < Integer.parseInt(players.get(j)[2])%>">
                    </span>
                </c:if>
            </td>
            <%
                }
            %>
            <%
                String now = ConfigUtils.getConf(id, "��Ա������Χ");
                String range = checkRange(full, now);
            %>
            <td><%=now%></td>
            <td value="<%=range%>">
                <c:if test="<%=!range.equals(now)%>">
                    <span style="color:red;font-weight:bold;">
                </c:if>
                <%=range%>
                <c:if test="<%=!range.equals(now)%>">
                    </span>
                </c:if>
            </td>
        <%
            }
        %>
    </table>
    <br/>
    </body>
</html>