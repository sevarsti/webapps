<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2015-9-9
  Time: 13:19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ include file="../include/include.jsp"%>
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
    <%
        //������˵��Ϣ��-1��δ��ã� @ ��֯��˵��Ϣ��-1��δ��ã� @ ���ؽ�˵��Ϣ��-1��δ��ã�  ���� ��������Ϣ��
//��Ϣ���Ƿ�����1��-1��&��˵��*�ȼ�*�Ǽ� & ����(����)���辭��ֵ*��ǰ����ֵ & ����(����)����Ǳ����Itemcode*����Ǳ������*���иÿ����� & ����(����)��������*���������� & ���������һ��(��)��������ʵ��
// 1&����  *1*1& 2000*0& 5401*1*1&  1000*4679514& 500@
//-1&¦һ��*0*0&    0*0&    0*0*0&2 0000*4679514& 600@
//-1&����  *0*0&    0*0&    0*0*0& 20000*4679514& 600
        List<String> ids = new ArrayList<String>();
        String email = request.getParameter("email");
        if(email == null || email.length() == 0) {
            out.println("please input email");
            return;
        }
        List<Map<String, String>> currentItems = OperationUtils.listCoachBags(email, "5");
//        System.out.println("email=" + email);
        request.setAttribute("items", currentItems);
    %>
    <body>
        <table id='items' class="frame" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
            <tr class="head">
                <td>����</td>
                <td>code</td>
                <td>����</td>
                <td>����</td>
            </tr>
            <%
                for(int i = 0; i < currentItems.size(); i++) {
                    Map<String, String> item = currentItems.get(i);
            %>
                <tr class="row<%=i % 2 + 1%>">
                    <td><%=item.get("name")%></td>
                    <td><%=item.get("itemCode")%></td>
                    <td><%=item.get("count")%></td>
                    <td>
                        <%
                            if(item.get("itemCode").startsWith("54")) {
                        %>
                        <input type="button" value="�ϲ�" onclick="combine('<%=item.get("itemId")%>');"/>
                        <%
                            }
                        %>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </body>
<script type="text/javascript">
    function combine(itemId)
    {
        OgzqDwr.combineJieshuo('<%=email%>', itemId, after);
    }

    function after(obj)
    {
        alert(obj);
    }
</script>
</html>