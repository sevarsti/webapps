<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@ page import="com.saille.weixin.WeixinHandler" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.saille.util.FileUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2015-4-15
  Time: 13:40:54
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
    <head><title>�����ʦ��������</title></head>
    <body>
        ���гɹ�����ͨ�����µ�ַ����<br/>
        <a href="../musiccut/${mp3path}">MP3�ļ�</a><br/>
        <a href="../musiccut/${imdpath}">IMD�ļ�</a><br/>
    </body>
</html>