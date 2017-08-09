<%@ include file="../include/include.jsp"%>

<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>Rightһ��</title>
    </head>
    <body>
        <c:set var="form" value="${rightForm}"/>
        <div class="page_title">Rightһ��</div>
        <c:if test="${!empty form.msg}">
            ${form.msg}
        </c:if>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>ID</th>
                <th>resourceId</th>
                <th>orgId</th>
                <th>orgType</th>
                <th>auth</th>
                <th>����</th>
            </tr>
            <c:forEach items="${form.rights}" var="obj" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>${obj.id}</td>
                    <td>
                        <c:set var="resource" value="${sys:getResource(obj.resourceId)}"/>
                        ${resource.name}(${resource.id})
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${obj.orgType==1}">
                                ${sys:getPosition(obj.orgId).name}(${obj.orgId})
                            </c:when>
                            <c:when test="${obj.orgType==2}">
                                ${sys:getEmployee(obj.orgId).name}(${obj.orgId})
                            </c:when>
                            <c:otherwise>
                                ${obj.orgId}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${obj.orgType==1}">
                                ����
                            </c:when>
                            <c:when test="${obj.orgType==2}">
                                Ա��
                            </c:when>
                            <c:otherwise>
                                δ֪
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${obj.auth}</td>
                    <td>
                        <input type="button" class="otterbtn" value="�޸�" onclick="doModify(${obj.id})"/>
                        <input type="button" class="otterbtn" value="ɾ��" onclick="doDelete(${obj.id})"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <input type="button" value="����" onclick="doModify(0);" class="otterbtn"/>
        <br/>
        <input type="button" value="ˢ�»���" onclick="document.location='/sys/right.do?method=refresh';" class="otterbtn"/>
        <script type="text/javascript">
            function doModify(id) {
                document.location = '<%=request.getContextPath()%>/sys/right.do?method=edit&id=' + id;
            }

            function doDelete(id) {
                if(confirm('ȷ��Ҫɾ����')) {
                    document.location = '<%=request.getContextPath()%>/sys/right.do?method=delete&id=' + id;
                }
            }
        </script>
    </body>
</html>
