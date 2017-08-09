<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>Employeeһ��</title>
    </head>
    <body>
        <c:set var="form" value="${employeeForm}"/>
        <div class="page_title">Employeeһ��</div>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>name</th>
                <th>��¼��</th>
                <th>����</th>
                <th>gender</th>
                <th>birth</th>
                <th>mobile</th>
                <th>email</th>
                <th>memo</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.employees}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>${obj.name}</td>
                    <td>${obj.loginname}</td>
                    <td>${obj.positionNames}</td>
                    <td>${obj.gender}</td>
                    <td>${obj.birth}</td>
                    <td>${obj.mobile}</td>
                    <td>${obj.email}</td>
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
                document.location = '<%=request.getContextPath()%>/sys/employee.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/sys/employee.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
