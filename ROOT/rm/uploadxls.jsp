<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItem" %>
<%@ page import="java.util.zip.ZipInputStream" %>
<%@ page import="java.util.zip.ZipEntry" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.io.File" %>
<%@ page import="com.GlobalConstant" %>
<%@ page import="com.saille.rm.RMConstant" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="org.springframework.util.FileCopyUtils" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="com.saille.sys.BaseThread" %>
<%@ page import="com.saille.baidu.bos.SynchronizeExcel" %>
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
        if(fileItems.size() != 1 && fileItems.size() != 2) {
            out.println("�ļ���������ȷ");
            return;
        }

        DiskFileItem item;
        boolean needSynchronize = false;
        if(fileItems.size() == 1) {
            item = (DiskFileItem) fileItems.get(0);
            if(!item.getName().equals("�����ʦ����.zip")) {
                out.println("�ļ�������ȷ");
                return;
            }
        } else {
            item = (DiskFileItem) fileItems.get(0);
            if("�����ʦ����.zip".equals(item.getName())) {
                DiskFileItem item2 = (DiskFileItem) fileItems.get(1);
                if(item2.getFieldName().equals("sychronize")) {
                    needSynchronize = true;
                }
            } else if("sychronize".equals(item.getFieldName())) {
                needSynchronize = true;
                if("�����ʦ����.zip".equals(item.getName())) {
                    item = (DiskFileItem) fileItems.get(1);
                } else {
                    out.println("�ļ�������ȷ");
                    return;
                }
            } else {
                out.println("�ļ�������ȷ");
                return;
            }
        }
        ZipInputStream zis = new ZipInputStream(item.getInputStream(), Charset.forName("GBK"));
        ZipEntry entry = zis.getNextEntry();
        if(!entry.getName().equals("�����ʦ����.xls")) {
            out.println("ѹ�������ļ�������ȷ");
            return;
        }
        /* ����ԭʼ�ļ� */
        long modifytime = entry.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        File excelfile = new File(GlobalConstant.DISKPATH + "\\excel\\" + RMConstant.RM_EXCEL);
        File backupfile = new File(GlobalConstant.DISKPATH + "\\backup\\" + RMConstant.RM_EXCEL + "." + sdf.format(new Date()));
        FileUtils.copyFile(excelfile, backupfile, true);
        FileOutputStream fos = new FileOutputStream(excelfile);
        FileCopyUtils.copy(zis, fos);
        fos.close();
        zis.close();
        item.getInputStream().close();
        excelfile.setLastModified(modifytime);
        if(needSynchronize) {
            System.out.println("need sync");
            BaseThread t = BaseThread.findThread("com.saille.baidu.bos.SynchronizeExcel");
            if(t != null) {
                t.interrupt();
            }
            t = BaseThread.findThread("com.saille.rm.loop.UpdateScoreThread");
            if(t != null) {
                t.interrupt();
            }
        }
    }
%>
<body>
<form action="" enctype="multipart/form-data" method="post">
    <input type="file" name="xls" class="inputbox"/><br/>
    <input type="checkbox" name="sychronize" value="1"/>����ͬ��</br>
    <input type="submit" value="�ϴ�"/>
</form>
</body>
</html>
