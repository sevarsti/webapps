<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>MilanPlayerһ��</title>
    </head>
    <body>
        <c:set var="form" value="${milanPlayerForm}"/>
        <div class="page_title">MilanPlayerһ��</div>
        <c:if test="${!empty form.msg}">
            <div class="alert">${form.msg}</div>
        </c:if>
        <input type="button" value="����һ��" onclick="document.location.href='<%=request.getContextPath()%>/milan/milanMatch.do?method=list'"/>
        <br/>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>name</th>
                <th>nationality</th>
                <th>birth</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.milanPlayers}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${obj.name}</td>
                    <td>${obj.nationality}</td>
                    <td>${obj.birth}</td>
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
                document.location = '<%=request.getContextPath()%>/milan/milanPlayer.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/milan/milanPlayer.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
