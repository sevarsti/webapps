<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItem" %>
<%@ page import="java.util.zip.ZipInputStream" %>
<%@ page import="java.util.zip.ZipEntry" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: H00672
  Date: 2017/08/29 0029
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>�����ʦ����.xls�ϴ�</title>
</head>
<%
    if(request.getContentType() != null && request.getContentType().indexOf("multipart/form-data") >= 0) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List fileItems = upload.parseRequest(request);
        if(fileItems.size() != 1) {
            out.println("�ļ���������ȷ");
            return;
        }
        DiskFileItem item = (DiskFileItem) fileItems.get(0);
        if(!item.getName().equals("�����ʦ����.zip")) {
            out.println("�ļ�������ȷ");
            return;
        }
        ZipInputStream zis = new ZipInputStream(item.getInputStream(), Charset.forName("GBK"));
        ZipEntry entry = zis.getNextEntry();
        if(entry.getName().equals("�����ʦ����.xls")) {
            out.println("ѹ�������ļ�������ȷ");
            return;
        }
        /* ����ԭʼ�ļ� */
        File excelfile = new File("D:\\");
    }
%>
<body>
<form action="" enctype="multipart/form-data" method="post">
    <input type="file" name="xls"/>
    <input type="submit"/>
</form>
</body>
</html>
