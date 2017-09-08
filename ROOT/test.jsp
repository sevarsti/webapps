<%@ page import="com.saille.rm.loop.UpdateScoreThread" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="com.saille.rm.loop.WeekSThread" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.saille.aliyun.OssUtils" %>
<%@ page import="java.io.File" %>
<%@ include file="include/include.jsp"%>
<%
    try {
        File f = new File("F:\\temp\\1\\1.rar");
        f.createNewFile();
        OssUtils.downloadFile("ellias-std", "temp/rm_zizhi/自制谱/官方/得奖作品/买票歌.rar", f);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        System.out.println("end");
    } catch(Exception ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        ex.printStackTrace();
        String s = sw.toString();
        s = s.replaceAll("\n", "<br/>");
        out.println(s);
    }
%>
<script type="text/javascript">
</script>