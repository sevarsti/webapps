<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-8-11
  Time: 2:04:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OperationUtils" %>
<%@ page import="java.util.*" %>
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='../scripts/tablesort.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
    </head>
            <%
                int i = 0;
                List<String> ids = IDUtils.GETIDS();
                List<Map<String, String>> allItems = new ArrayList<Map<String, String>>();
                for (String id : ids) {
                    System.out.println(ids.indexOf(id) + "/" + ids.size());
                    List<Map<String, String>> items = OperationUtils.listBags(id, "0");
                    allItems.addAll(items);
                }
                for (Map<String, String> item : allItems) {
                    System.out.println(allItems.indexOf(item) + "/" + allItems.size());
                    if(item.get("name").startsWith("ѵ����") ||
                            item.get("name").startsWith("ս�����ֿ�") ||
                            item.get("name").indexOf("װ����") >= 0 ||
                            item.get("name").startsWith("ŷ����Ӯ�Ұ�") ||
                            item.get("name").indexOf("���鿨") >= 0 ||
                            item.get("name").indexOf("�����") >= 0 ||
                            item.get("name").startsWith("ŷ�ں��˰�") ||
                            item.get("name").startsWith("ÿ�յ�¼���") ||
                            item.get("name").startsWith("�������ֿ�") ||
                            item.get("name").startsWith("ͻ�ƻ���") ||
                            item.get("name").startsWith("ʥ��С���") ||
                            item.get("name").startsWith("ʥ�������") ||
                            item.get("name").indexOf("���籭���ֿ�") >= 0 ||
                            item.get("name").indexOf("��Ա�ɳ����ֿ�") >= 0 ||
                            item.get("name").indexOf("ǩ�����ֿ�") >= 0 ||
                            item.get("name").startsWith("ǩ��") ||
                            item.get("name").startsWith("�����") ||
                            item.get("name").startsWith("С���") ||
                            item.get("name").startsWith("���Ҷһ���")) {
                        int n = Integer.parseInt(item.get("number"));
                        for(int j = 0; j < n; j++) {
                            System.out.println(item.get("email") + ",use:" + item.get("name") + ":" + j + "/" + n);
                            OperationUtils.useItem(item.get("email"), item.get("id"));
                        }
                    }
                    i++;
                }
            %>
</html>