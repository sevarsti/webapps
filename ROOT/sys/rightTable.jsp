<%--
  Created by IntelliJ IDEA.
  User: ELLIAS
  Date: 2015-1-10
  Time: 18:42:57
  To change this template use File | Settings | File Templates.
--%>
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
        <table border="0" cellpadding="1" cellspacing="1" class="frame">
            <tr class="head">
                <th>��Դ</th>
                <c:forEach items="${employees}" var="emp">
                    <th>${emp.name}</th>
                </c:forEach>
            </tr>
            <c:forEach items="${resources}" var="res" varStatus="i">
                <tr class="row${i.index % 2 + 1}">
                    <td>
                        ${functions:reptString("&nbsp;",res.level * 2)}${res.name}
                    </td>
                    <c:forEach items="${employees}" var="emp" varStatus="j">
                        <td>
                            <c:choose>
                                <c:when test="${rights[i.index][j.index] == 1}">
                                    ��
                                </c:when>
                                <c:otherwise>
                                    &nbsp;
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
