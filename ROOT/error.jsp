<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2017-09-02
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="include/include.jsp"%>
<html>
  <head>
      <title>����</title>
  </head>
<body>
<%
    Map<String, String> errors = new HashMap<String, String>();
    errors.put("noright", "�Բ�����û��Ȩ��");
    String errormsg = request.getParameter("errormsg");
    if(errormsg == null) {
        errormsg = "δ֪����";
    }
    errormsg = errors.get(errormsg);
%>
<%=errormsg%>
</body>
</html>