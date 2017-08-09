<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>MilanGoalһ��</title>
    </head>
    <body>
        <c:set var="form" value="${milanGoalForm}"/>
        <div class="page_title">MilanGoalһ��</div>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>matchId</th>
                <th>minute</th>
                <th>playerId</th>
                <th>playerName</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.milanGoals}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${obj.matchId}</td>
                    <td>${obj.minute}</td>
                    <td>${obj.playerId}</td>
                    <td>${obj.playerName}</td>
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
                document.location = '<%=request.getContextPath()%>/milan/milanGoal.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/milan/milanGoal.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
