<%--
  Created by IntelliJ IDEA.
  User: ELLIAS
  Date: 2014-7-27
  Time: 10:19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OgzqDwr" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="java.net.URLEncoder" %>
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
    <%
        String email = request.getParameter("email");
        List<Map<String, String>> players = new OgzqDwr().viewPlayer(email);
        int silver = Integer.parseInt(IDUtils.IDInfos.get(email).get("silver"));

        for(int i = 1; i < players.size(); i++) {
            Map<String, String> p = players.get(i);
            String id = p.get("id");

            HttpPost pm = new HttpPost(OgzqURL.URL + "/QiuYuanShengJie.aspx");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("type", "2"));
            params.add(new BasicNameValuePair("playerid", id));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String ret = IDUtils.execute(email, pm);

//669520*����*qx/qx1.png*0*7@
//3621652|38|10|8901.png|1|0|���������ǹ���*
//3622918|29|10|8902.png|1|0|���ɹ���*
//3626020|31|10|8903.png|2|0|����¡����*
//3625252|27|10|8904.png|1|0|���ص��߹���*
//3635998|15|10|8905.png|1|0|���ʹ���*
//3636892| 4|10|8906.png|0|0|�鶼��˹����@
//0@50000
            if(ret.equals("-10") || ret.equals("-2")) {
                p.put("currjie", "0"); //��ǰ����
                p.put("shengjiesilver", "0"); //������Ҫ����
                p.put("canshengjie", "0");
            } else {
                p.put("currjie", ret.split("@")[0].split("[*]")[3]); //��ǰ����
                p.put("shengjiesilver", ret.split("@")[3]); //������Ҫ����
                String[] flags = ret.split("@")[1].split("[*]");
                boolean canshengjie = !ret.split("@")[0].split("[*]")[3].equals("10");
                if(silver < Integer.parseInt(ret.split("@")[3])) {
                    canshengjie = false;
                }
                if(canshengjie) {
                    for(String f : flags) {
                        String[] ff = f.split("[|]");
                        if(Integer.parseInt(ff[4]) < 1) {
                            canshengjie = false;
                            break;
                        }
                    }
                }
                p.put("canshengjie", canshengjie ? "1" : "0");
            }
        }
        HttpPost pm = new HttpPost(OgzqURL.URL + OgzqURL.BAGS);
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("type", "0"));
        params.add(new BasicNameValuePair("itemtype", "4"));
        pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
        String str = IDUtils.execute(email, pm);
        String[] v = new String[34];
        if(str.equals("-1")) {
            v = new String[]{email, IDUtils.getNick(email), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""};
        } else {
            String[] parts = str.split("@")[0].split("[|]");
            v[0] = email;
            v[1] = IDUtils.getNick(email);
            for(int i = 2; i < v.length; i++) {
                v[i] = "";
            }
            for(String p : parts) {
                String[] pp = p.split("[*]");
                v[Integer.parseInt(pp[11]) - 8899] = pp[7];
            }
        }
    %>
        <%=email%>/<%=v[1]%>
        <input type="button" value="ѵ��" onclick="javascript:window.open('train.jsp?email=<%=URLEncoder.encode(email)%>')"/>
    ���ң�<%=IDUtils.IDInfos.get(email).get("silver")%>
    <br/>
    <table id="info" border="0" cellpadding="1" cellspacing="1">
        <tr class="head">
            <th>email</th>
            <th>nick</th>
            <th>����������</th>
            <th>����</th>
            <th>����¡</th>
            <th>���ص���</th>
            <th>����</th>
            <th>�鶼��˹</th>
            <th>��˹�����</th>
            <th>���ױ���</th>
            <th>����</th>
            <th>��������</th>
            <th>�Ĵ�����</th>
            <th>����</th>
            <th>�ձ�</th>
            <th>ī����</th>
            <th>����</th>
            <th>��϶��</th>
            <th>����</th>
            <th>������</th>
            <th>���޵���</th>
            <th>ϣ��</th>
            <th>����˹</th>
            <th>��ʿ</th>
            <th>����ʱ</th>
            <th>Ӣ����</th>
            <th>����</th>
            <th>������</th>
            <th>����</th>
            <th>����͢</th>
            <th>�����</th>
            <th>�¹�</th>
            <th>������</th>
            <th>����</th>
        </tr>
        <tr class="row1">
            <%
                for(String vv : v) {
            %>
            <td><%=vv%></td>
            <%
                }
            %>
        </tr>
    </table>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
            <tr class="head">
                <!--<th>ID</th>-->
                <th onclick="resort(this, 0, false)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 1, false)" style="cursor:pointer;text-decoration:underline;">�油</th>
                <th onclick="resort(this, 2, true)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 3, true)" style="cursor:pointer;text-decoration:underline;">����</th>
                <th onclick="resort(this, 4, false)" style="cursor:pointer;text-decoration:underline;">����</th>
            </tr>
            <%
                for (int i = 1; i < players.size(); i++) {
                    Map<String, String> p = players.get(i);
                    boolean isZijin = IDUtils.isZijinPlayer(p.get("id"));
            %>
            <tr class="row<%=i % 2 + 1%>">
                <%--<td><%=p.get("id")%></td>--%>
                <td>
                    <span <%=isZijin ? ("style='color:red;'") : ""%>>
                        <%=p.get("name")%>
                    </span>
                </td>
                <td><%=p.get("tibu")%></td>
                <td><%=p.get("currjie")%></td>
                <td><%=p.get("shengjiesilver")%></td>
                <td>
                    <%
                        if(p.get("canshengjie").equals("1")) {
                    %>
                    <input type="button" value="����" onclick="shengjie('<%=p.get("id")%>');"/>
                    <%
                        }
                    %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <br/>
    </body>
<script type="text/javascript">
    function after(msg) {
        alert(msg);
    }

    function shengjie(id) {
        OgzqDwr.qiuyuanshengjie('<%=email%>', id, after);
    }
</script>
</html>