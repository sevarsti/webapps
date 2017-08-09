<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.saille.util.FileUtils" %>
<%@ page import="com.saille.weixin.WeixinHandler" %>
<%--
  Created by IntelliJ IDEA.
  User: ELLIAS
  Date: 2015-4-3
  Time: 22:28:33
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
    <head><title>����ȫ������ս���Ծ��ѯ</title></head>
    <%!
        void log(String ip, String qq) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String route = WeixinHandler.class.getResource("").getPath();
            route = route.substring(0, route.indexOf("WEB-INF"));
            File f = new File(route + "\\log\\huoyue.log");
            FileUtils.WriteFile(f, sdf.format(new Date()) + "\t" + ip + "\t" + qq + "\r\n", true);
        }
    %>
    <%
        String qq = request.getParameter("qq");
        String nick = "", enterTime = "";
        int beginhuoyue = 0, lasthuoyue = 0;
        int d3 = 0, d7 = 0, dmonth = 0;
        double average = 0d;
        DecimalFormat df = new DecimalFormat("#,##0.00");
        Boolean found = null;
        if(qq == null) {
            found = false;
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            Calendar c = Calendar.getInstance();
            String filename = sdf.format(c.getTime());
            File f = new File("D:\\����ȫ����Ծ" + filename + ".xls");
            FileInputStream fis = new FileInputStream(f);
            HSSFWorkbook workbook = new HSSFWorkbook(fis);
            HSSFSheet sheet = workbook.getSheet("��ϸ");
            int rownum = -1;
            for(int i = 2; i <= sheet.getLastRowNum(); i++) {
                HSSFRow row = sheet.getRow(i);
                HSSFCell cell = row.getCell(1);
                if(cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                    if(qq.equals(((long) cell.getNumericCellValue()) + "")) {
                        rownum = i;
                        cell = row.getCell(2);
                        if(cell != null) {
                            if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                enterTime = ((int)cell.getNumericCellValue()) + "";
                            } else {
                                enterTime = cell.getRichStringCellValue().getString();
                            }
                        }
                        cell = row.getCell(3);
                        if(cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                            beginhuoyue = (int) cell.getNumericCellValue();
                        }
                        cell = row.getCell(6);
                        if(cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC || cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
                            lasthuoyue = (int) cell.getNumericCellValue();
                        }
                        break;
                    }
                }
            }
            if(rownum != -1) {
                sheet = workbook.getSheet("ժҪ");
                HSSFRow row = sheet.getRow(rownum);
                HSSFCell cell = row.getCell(0);
                nick = cell.getRichStringCellValue().getString();
                cell = row.getCell(2);
                try {
                    d3 = (int) cell.getNumericCellValue();
                } catch(Exception ex) {
                    d3 = 0;
                }
                cell = row.getCell(3);
                try {
                    d7 = (int) cell.getNumericCellValue();
                } catch(Exception ex) {
                    d7 = 0;
                }
                cell = row.getCell(4);
                if(cell != null) {
                    dmonth = (int) cell.getNumericCellValue();
                }
                cell = row.getCell(5);
                if(cell != null) {
                    average = cell.getNumericCellValue();
                }
                found = true;
                log(request.getRemoteAddr(), qq + "(" + nick + ")");
//                return nick + "(" + text + ")���ջ�Ծ��" + d3 + "�����ջ�Ծ��" + d7 + "�����»�Ծ��" + dmonth + "������ƽ��ÿ�ջ�Ծ��" + df.format(average);
            } else {
                found = false;
//                return "�Ҳ�����QQ�ţ�" + text;
            }
        }
        request.setAttribute("found", found);
    %>
    <body>
    <form action="huoyue.jsp" method="post">
        <table class="frame" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td>
                    ������QQ�ţ�
                    <input type="text" name="qq"/>
                    <input type="submit" value="��ѯ" class="otterbtn"/>
                </td>
            </tr>
        </table>
    </form>
    <c:choose>
        <c:when test="${empty found}">

        </c:when>
        <c:when test="${!found}">
            û���ҵ���QQ�š�
        </c:when>
        <c:otherwise>
            <table border="0" cellpadding="1" cellspacing="1">
                <tr>
                    <td class="fieldname">
                        �ǳ�
                    </td>
                    <td class="fieldvalue">
                        <%=nick%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ����ս��ʱ��
                    </td>
                    <td class="fieldvalue">
                        <%=enterTime%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ��ʼ��Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=beginhuoyue%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        �����ۼƻ�Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=lasthuoyue%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ս�ӹ���
                    </td>
                    <td class="fieldvalue">
                        <%=lasthuoyue - beginhuoyue%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ������ջ�Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=d3%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ������ջ�Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=d7%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ���»�Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=dmonth%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        ����ƽ��ÿ�ջ�Ծ
                    </td>
                    <td class="fieldvalue">
                        <%=df.format(average)%>
                    </td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>
    </body>
</html>