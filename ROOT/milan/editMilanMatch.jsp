<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>�༭MilanMatch</title>
    </head>
    <body>
        <c:set var="form" value="${milanMatchForm}"/>
        <html:form action="/milan/milanMatch.do">
            <input type="hidden" name="method" value="save"/>
            <html:hidden property="id"/>
            <table>
                <tr valign="top">
                    <td>
                        <table>
                            <tr>
                                <td class="fieldname">
                                    against
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="against"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    statium
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="statium"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    city
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="city"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    type
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="type"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    round
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="round"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    goal
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="goal"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    goaled
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="goaled"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    year
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="year"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    date
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="date"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    time
                                </td>
                                <td class="fieldvalue">
                                    <html:text property="time"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldname">
                                    homeawy
                                </td>
                                <td class="fieldvalue">
                                    <html:select property="homeawy">
                                        <html:option value="0">-ѡ-</html:option>
                                        <html:option value="1">��</html:option>
                                        <html:option value="2">��</html:option>
                                    </html:select>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        ��������<br/>
                        <table>
                            <tr>
                                <th>���</th>
                                <th>��Ա</th>
                                <th>�׷�</th>
                                <th>�ϳ�ʱ��</th>
                                <th>�³�ʱ��</th>
                                <th>����</th>
                                <th>����</th>
                                <th>����</th>
                                <th>����</th>
                            </tr>
                            <c:set var="list" value="${milan:getAllPlayers()}"/>
                            <c:forEach begin="0" end="13" varStatus="i">
                                <tr class="row${i.index % 2 + 1}">
                                    <td>
                                        ${i.index}
                                    </td>
                                    <td>
                                        <html:select property="playerId">
                                            <html:option value="0">--ѡ--</html:option>
                                            <c:forEach items="${list}" var="p">
                                                <html:option value="${p.id}">${p.name}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                    <td>
                                        <html:select property="substitude">
                                            <c:choose>
                                                <c:when test="${i.index <= 10}">
                                                    <html:option value="0">��</html:option>
                                                    <html:option value="1">��</html:option>
                                                </c:when>
                                                <c:otherwise>
                                                    <html:option value="1">��</html:option>
                                                    <html:option value="0">��</html:option>
                                                </c:otherwise>
                                            </c:choose>
                                        </html:select>
                                    </td>
                                    <td>
                                        <html:text property="onTime" size="3" value="0"/>
                                    </td>
                                    <td>
                                        <html:text property="offTime" size="3" value="90"/>
                                    </td>
                                    <td>
                                        <html:text property="goals" size="1"/>
                                    </td>
                                    <td>
                                        <html:text property="ownGoal" size="1"/>
                                    </td>
                                    <td>
                                        <html:text property="yellowCard" size="1"/>
                                    </td>
                                    <td>
                                        <html:select property="redCard">
                                            <html:option value="0">��</html:option>
                                            <html:option value="1">��</html:option>
                                        </html:select>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table id="goal">
                            <tr class="head">
                                <th>����</th>
                                <th>������</th>
                                <th>�Է�������</th>
                            </tr>
                            <tr class="row1">
                                <td>
                                    <html:text property="goalMinute" size="3" onblur="addGoal();"/>
                                </td>
                                <td>
                                    <html:select property="goalPlayerId">
                                        <html:option value="0">--ѡ--</html:option>
                                        <c:forEach items="${list}" var="p">
                                            <html:option value="${p.id}">${p.name}</html:option>
                                        </c:forEach>
                                    </html:select>
                                </td>
                                <td>
                                    <html:text property="goalPlayerName"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <input type="button" value="����" onclick="document.forms[0].submit();" class="otterbtn"/>
        </html:form>
    </body>
<script type="text/javascript">
    function addGoal() {
        var minute = document.getElementsByName('goalMinute');
        if(minute[minute.length - 1].value != '') {
            var table = document.getElementById('goal');
            var row = table.insertRow(-1);
            row.className = 'row' + (table.rows.length % 2 + 1);
            var cell = row.insertCell(-1);
            cell.innerHTML = "<input type='text' name='goalMinute' size='3' onblur='addGoal();'/>";
            cell = row.insertCell(-1);
            var html = "<select name='goalPlayerId'><option value='0'>--ѡ--</option>";
            <c:forEach items="${list}" var="p">
                html = html + "<option value='${p.id}'>${p.name}</option>";
            </c:forEach>
            html = html + "</select>";
            cell.innerHTML = html;
            cell = row.insertCell(-1);
            cell.innerHTML = "<input type='text' name='goalPlayerName'/>";
        }
    }
</script>
</html>
