<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="servlet.GlobalContext" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.saille.rm.util.ImdUtils" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RMDwr.js'></script>
<body>
<input type="file" onchange="doupload(event, this);" name="uploadfile" id="uploadfile"/>
<script type="text/javascript">
    function doupload(event, obj)
    {
        var file = dwr.util.getValue(obj);
        RMDwr.testFile(file, after);
    }
    function after(str)
    {
        alert('�ļ�ǰ10���ֽ�Ϊ[' + str + "]");
    }
</script>
</body>
</html>