<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="servlet.GlobalContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.saille.rm.util.RMUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2017-09-10
  Time: 19:52
  To change this template use File | Settings | File Templates.
  ����������xml����Ӧ�ļ�
--%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>����������</title>
</head>
<body>
<%
    DataSource ds = (DataSource) GlobalContext.getSpringContext().getBean("mysql_ds");
    JdbcTemplate jt = new JdbcTemplate(ds);
    int count = jt.queryForInt("select count(1) from rm_song where has = 1");
%>
<html:form action="/rm.do" enctype="multipart/form-data">
    XML������������<%=count%><br/>
    <input type="hidden" name="method"/>
    ��ѡ���ϴ�excel�ļ���
    <html:file property="uploadXls"/>
    <br/>
    <input type="button" onclick="downloadexample();" value="����ģ��"/>
    <input type="button" onclick="doupload();" value="�ύ"/>
</html:form>
<script type="text/javascript">
    function downloadexample()
    {
        document.getElementsByName("method")[0].value = "example";
        document.forms[0].submit();
    }
    function doupload()
    {
        document.getElementsByName("method")[0].value = "generateXml";
        document.forms[0].submit();
    }
</script>
</body>
</html>
