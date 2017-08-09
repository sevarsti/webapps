<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>MatchPlayerһ��</title>
    </head>
    <body>
        <div class="page_title">MatchPlayerһ��</div>
        <c:set var="form" value="${matchPlayerForm}"/>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>matchId</th>
                <th>playerId</th>
                <th>substitude</th>
                <th>onTime</th>
                <th>offTime</th>
                <th>goal</th>
                <th>yellowCard</th>
                <th>redCard</th>
                <th>ownGoal</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.matchPlayers}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${obj.matchId}</td>
                    <td>${obj.playerId}</td>
                    <td>${obj.substitude}</td>
                    <td>${obj.onTime}</td>
                    <td>${obj.offTime}</td>
                    <td>${obj.goal}</td>
                    <td>${obj.yellowCard}</td>
                    <td>${obj.redCard}</td>
                    <td>${obj.ownGoal}</td>
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
                document.location = '<%=request.getContextPath()%>/milan/matchPlayer.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/milan/matchPlayer.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
