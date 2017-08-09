<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-18
  Time: 0:25:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
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
        List<String[]> places = new ArrayList<String[]>();
        Map<Integer, String> colorMap = new HashMap<Integer, String>();
        colorMap.put(0, "��");
        colorMap.put(1, "��");
        colorMap.put(2, "��");
        colorMap.put(3, "��");
        List<String> ids = IDUtils.GETIDS();
        for(int i = 0; i <= 3; i++) {
            HttpPost pm = new HttpPost(OgzqURL.URL + "/TrainingBase2.aspx");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("type", "0"));
            params.add(new BasicNameValuePair("leagueIndex", "" + i));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String s = IDUtils.execute(IDUtils.GETIDS().get(0), pm);
            s = s.split("@")[1];
            String[] clubs = s.split("[*]");
            for(String c : clubs) {
                String[] parts = c.split("\\|");
                if(parts[9].equals("1")) { //����ѵ���ĳ���
                    continue;
                }
//                if(parts[2].equals("0")) { //û��ѵ���ĳ���
//                    places.add(new String[]{colorMap.get(i), parts[4], parts[5], parts[3], null, i + ""});
//                    continue;
//                }
                String email = null;
                for(String id : ids) {
                    if(IDUtils.getNick(id).equals(parts[4])) {
                        email = id;
                        break;
                    }
                }
                places.add(new String[]{colorMap.get(i), parts[4], parts[5], parts[3], email, i + "", parts[2]}); //��ɫ���ţ���ᣬѵ���㣬����
//0|0|0|900||||||1
//0|1|0|900||||||1
//0|2|0|900||||||0
//0|3|0|1080||||||0
//0|4|0|900||||||0
//0|5|0|900||||||1
//0|6|0|900||||||1
//0|7|0|900||||||1
//0|8|0|900||||||1
//0|9|0|1080||||||0
//0|10|1|1350|�ʼ�������|ɫ|||9|0
//0|11|0|1080||||||0
//0|12|0|900||||||1
//0|13|0|900||||||1
//0|14|0|900||||||1
//0|15|0|900||||||1
//0|16|0|900||||||0
//0|17|0|1080||||||0
//0|18|0|900||||||0
//0|19|0|900||||||1
//0|20|0|900||||||1
            }
        }
        request.setAttribute("places", places);
    %>
    <body>
        <table border="0" cellpadding="1" cellspacing="1">
            <tr class="head">
                <td>��ɫ</td>
                <td>��</td>
                <td>���</td>
                <td>ѵ����</td>
                <td>״̬</td>
                <td>����</td>
            </tr>
            <c:set var="row" value="0"/>
            <c:set var="rowColor" value="2"/>
            <c:forEach items="${places}" var="p">
                <c:if test="${p[0] != row}">
                    <c:set var="rowColor" value="${3 - rowColor}"/>
                    <c:set var="row" value="${p[0]}"/>
                </c:if>
                <tr class="row${rowColor}">
                    <c:forEach begin="0" end="3" var="i">
                        <td>${p[i]}</td>
                    </c:forEach>
                    <td>
                        ${p[6] == '2' ? '������' : '&nbsp;'}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${!empty p[4]}">
                                <input type="button" value="��ֹ" onclick="stopTraining('${p[4]}', '${p[5]}')"/>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
<script type="text/javascript">
    function stopTraining(email, level) {
        OgzqDwr.stopTrainingBase2(email, level, after);
    }

    function after(obj) {
        if(obj == '-1|-1') {
            alert('���ڱ�������������˳�');
        } else {
            alert(obj);
        }
    }
</script>
</html>