<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2013-11-7
  Time: 23:27:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OgzqDwr" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.saille.ogzq.RobNaiBa" %>
<%@ include file="../include/include.jsp"%>
<html>
  <head></head>
  <body>
  <%

  %>
  <table id="info" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
      <tr class="head">
          <th>����</th>
          <th>�ϵϰ���</th>
          <th>����ɭ</th>
          <th>�������</th>
      </tr>
      <tr class="row1">
          <td>��һ��</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.first[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row2">
          <td>��һ������</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.firstScore[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row1">
          <td>���ĺ�</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.nick[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row2">
          <td>Ҫ���������ƣ�����С�ڵ��ڸ÷������������</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.lingxian[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row2">
          <td>��ǰ��������</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.currentLingxian[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row1">
          <td>�������ޣ������û�����������ģ�</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.max[i]%></td>
          <%
              }
          %>
      </tr>
      <tr class="row2">
          <td>ʣ��ʱ�䣨�룩</td>
          <%
              for(int i = 0; i < 3; i++) {
          %>
          <td><%=RobNaiBa.restTime[i]%></td>
          <%
              }
          %>
      </tr>
  </table>
  </body>
</html>