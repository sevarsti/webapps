<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-18
  Time: 0:25:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="java.util.ArrayList" %>
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
    </head>
    <%
        List<String> ids = IDUtils.GETIDS();
        List<String[]> atts = new ArrayList<String[]>();
        List<String> todo = new ArrayList<String>();
        for(String id : ids) {
//            System.out.println(id);
            int[] values = IDUtils.FubenStatus.get(id);
            if(values == null) {
                todo.add(id);
                continue;
            }
            String[] a = new String[values.length + 3];
            a[0] = id;
            a[1] = IDUtils.getNick(id);
            a[2] = IDUtils.IDInfos.get(id).get("shili");
            for(int i = 0; i < values.length; i++) {
                int v = values[i];
                a[i+3] = "" + v;
            }
            atts.add(a);
        }
        request.setAttribute("atts", atts);
        request.setAttribute("todo", todo);
    %>
    <body>
    <c:forEach items="${todo}" var="t">
        ${t}<br/>
    </c:forEach>
        <table id="info" width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th>��¼��</th>
                <th>��Ϸ��</th>
                <th>ʵ��</th>
                <th>����1</th>
                <th>����2</th>
                <th>����3</th>
                <th>����4</th>
                <th>����5</th>
            </tr>
            <c:forEach items="${atts}" var="a" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <c:forEach items="${a}" var="aa">
                        <td>${aa}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
<script type="text/javascript">
</script>
</html>