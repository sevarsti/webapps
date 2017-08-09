<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>MilanMatchһ��</title>
    </head>
    <body>
        <div class="page_title">MilanMatchһ��</div>
        <c:set var="form" value="${milanMatchForm}"/>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>against</th>
                <th>statium</th>
                <th>city</th>
                <th>type</th>
                <th>round</th>
                <th>�ȷ�</th>
                <th>ʱ��</th>
                <th>homeawy</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.milanMatchs}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${obj.against}</td>
                    <td>${obj.statium}</td>
                    <td>${obj.city}</td>
                    <td>${obj.type}</td>
                    <td>${obj.round}</td>
                    <td>${obj.goal}:${obj.goaled}</td>
                    <td>${obj.year}-${obj.date}&nbsp;${obj.time}</td>
                    <td>${obj.homeawy}</td>
                    <td>
                        <input type="button" class="otterbtn" value="�޸�" onclick="doModify(${obj.id})"/>
                        <input type="button" class="otterbtn" value="ɾ��" onclick="doDelete(${obj.id})"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <input type="button" value="����" onclick="doModify(0);" class="otterbtn"/>
        <script type="text/javascript">
            function doModify(id) {
                document.location = '<%=request.getContextPath()%>/milan/milanMatch.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/milan/milanMatch.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
