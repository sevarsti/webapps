<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-8-11
  Time: 2:04:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
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
    <body>
    <%
        String email = request.getParameter("email");
        List<String> ids = new ArrayList<String>();
        if(StringUtils.isNotEmpty(email)) {
            ids.add(email);
        } else {
            ids = IDUtils.GETIDS();
        }
        List<String[]> values = new ArrayList<String[]>();
        for(String id : ids) {
            System.out.println("�鿴����" + ids.indexOf(id) + "/" + ids.size() + ":" + id);
            HttpPost pm = new HttpPost(OgzqURL.URL + OgzqURL.BAGS);
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("type", "0"));
            params.add(new BasicNameValuePair("itemtype", "4"));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String str = IDUtils.execute(id, pm);
            if(str.equals("-1")) {
                values.add(new String[]{id, IDUtils.getNick(id), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""});
                continue;
            }
            String[] parts = str.split("@")[0].split("[|]");
            String[] v = new String[34];
            v[0] = id;
            v[1] = IDUtils.getNick(id);
            for(int i = 2; i < v.length; i++) {
                v[i] = "";
            }
            for(String p : parts) {
                String[] pp = p.split("[*]");
                v[Integer.parseInt(pp[11]) - 8899] = pp[7];
            }
            values.add(v);
        }
    %>
        <table id="info" border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <th>����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 1, false)">
                        email
                </th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, false)">nick</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 3, true)">����������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 4, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 5, true)">����¡</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 6, true)">���ص���</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 7, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 8, true)">�鶼��˹</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 9, true)">��˹�����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 10, true)">���ױ���</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 11, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 12, true)">��������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 13, true)">�Ĵ�����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 14, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 15, true)">�ձ�</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 16, true)">ī����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 17, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 18, true)">��϶��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 19, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 20, true)">������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 21, true)">���޵���</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 22, true)">ϣ��</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 23, true)">����˹</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 24, true)">��ʿ</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 25, true)">����ʱ</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 26, true)">Ӣ����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 27, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 28, true)">������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 29, true)">����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 30, true)">����͢</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 31, true)">�����</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 32, true)">�¹�</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 33, true)">������</th>
                <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 34, true)">����</th>
            </tr>
            <%
                for (int i = 0; i < values.size(); i++) {
                    String[] v = values.get(i);
            %>
                <tr class="row<%=i % 2 + 1%>">
                    <td>
                        <input type="button" value="ɾ" onclick="removeRow(this);"/>
                        <input type="button" value="����" onclick="javascript:window.open('shengjie.jsp?email=<%=URLEncoder.encode(v[0])%>');"/>
                    </td>
                    <%
                        for(int j = 0; j < v.length; j++) {
                            String vv = v[j];
                    %>
                    <td style="<%=j % 3 == 1 ? "border-right:black;border-right-style:solid;border-right-width:1px;" : ""%>"><%=vv%></td>
                    <%
                        }
                    %>
                </tr>
            <%
                }
            %>
        </table>
    </body>
<script type="text/javascript">
    function removeRow(obj) {
        var table = document.getElementById('info');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);

//        for(var i = 1; i < table.rows.length; i++) {
//            table.rows[i].className = 'row' + (2 - (i % 2));
//        }
    }
</script>
</html>