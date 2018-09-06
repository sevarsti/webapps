<%@ page import="com.saille.bbs.yssy.YSSYUtil"%>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2009-1-4
  Time: 16:20:53
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>--%>
<html>
<head><title>Simple jsp page</title></head>
<body>
<%
    try {
        Map<Thread, StackTraceElement[]> threads = Thread.getAllStackTraces();
        for(Thread t : threads.keySet()) {
            out.println(t.getName() + "<br/>");
            for(StackTraceElement ste : threads.get(t)) {
                out.println("&nbsp;&nbsp;");
                out.println(ste.getClassName() + "." + ste.getMethodName() + ":" + ste.getLineNumber() + "<br/>");
            }
        }
    } catch(Exception ex) {
        ex.printStackTrace();
    }
%>
  </body>
</html>