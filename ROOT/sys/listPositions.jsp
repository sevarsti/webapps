<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>Positionһ��</title>
    </head>
    <body>
        <c:set var="form" value="${positionForm}"/>
        <div class="page_title">Positionһ��</div>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>name</th>
                <th>parentId</th>
                <th>memo</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.positions}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${functions:reptString("&nbsp;",obj.level * 2)}${obj.name}</td>
                    <td>
                        <c:set var="parent" value="${sys:getPosition(obj.parentId)}"/>
                        ${parent.name}(${parent.id})
                    </td>
                    <td>${obj.memo}</td>
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
                document.location = '<%=request.getContextPath()%>/sys/position.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/sys/position.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
