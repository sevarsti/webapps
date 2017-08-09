<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2013-8-17
  Time: 1:24:14
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
  <head>
      <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
      <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
      <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
  </head>
  <body>
  <%!
      String convert2TacticalDesc(String in) {
          if(in == null) {
              return "δ֪";
          } else if("1".equals(in)) {
              return "�߹�";
          } else if("3".equals(in)) {
              return "����";
          } else if("5".equals(in)) {
              return "�߷�";
          } else {
              return in;
          }
      }
  %>
  <%
      List<String> ids = new ArrayList<String>();
      String email = request.getParameter("email");
      if(email != null && !email.equals("")) {
          String[] emails = email.split("\\,");
          for(String e : emails) {
              ids.add(e.trim());
          }
//                    keys.add(email);
      } else {
          ids = IDUtils.GETIDS();
      }
      List<String[]> list = new ArrayList<String[]>();
      for(String id : ids) {
          System.out.println(ids.indexOf(id) + "/" + ids.size() + ":" + id);
          HttpPost pm = new HttpPost(OgzqURL.URL + OgzqURL.TACTICAL);
          List<NameValuePair> params = new ArrayList<NameValuePair>();
          params.add(new BasicNameValuePair("type", "0"));
          pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
          String str = IDUtils.execute(id, pm);
          if(str.indexOf("DOCTYPE") >= 0) {
              list.add(new String[]{id, IDUtils.getNick(id)});
          } else {
              String currentTactical = str.split("��")[1];

              pm = new HttpPost(OgzqURL.URL + "/Coach/Coach.aspx");
              params = new ArrayList<NameValuePair>();
              params.add(new BasicNameValuePair("LoadCoach1", ""));
              pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
              String ret = IDUtils.execute(id, pm);
//4|�ϵϰ���|5*
//1|��¬|7*
//2|ϣ����|7*
//3|��Ƥ|7*
//5|����ɭ|1*
//6|�������|1@
//1|0|2|1|��¬|7|9400|-999|0|44|30|18|10|0|0|0|0|0|0|0|0^
//1|0|2|2|ϣ����|7|9400|-999|1|30|44|18|10|0|0|0|0|0|0|0|0^
//1|0|2|3|��Ƥ|7|9400|-999|2|18|30|44|10|0|0|0|0|0|0|0|0^
//1|1|0|4|�ϵϰ���|5|65000|70000|0|92|60|34|16|70|0|0|0|0|0|0|0^
//1|0|0|5|����ɭ|1|0|5000|1|36|60|18|8|0|0|0|0|0|0|0|0^
//1|0|0|6|�������|1|0|5000|2|18|36|60|8|0|0|0|0|0|0|0|0@
//@
//1
              ret = ret.split("@")[1];
              String[] coaches = ret.split("\\^");
              String[] add = new String[15];//email, nick, ��ǰ��(�����ȼ�����Ҫ����) * 6
              add[0] = id;
              add[1] = IDUtils.getNick(id);
              for(int i = 0; i < coaches.length; i++) {
                  String c = coaches[i];
                  String[] parts = c.split("\\|");
                  if(parts[1].equals("1")) {
                      add[2] = convert2TacticalDesc(currentTactical) + "<br/>" + parts[5] + parts[4];
                  }
                  if(parts[0].equals("0")) {
                      add[3 + i * 2] = null;
                      continue;
                  }
                  add[3 + i * 2] = parts[5];
                  add[3 + i * 2 + 1] = Integer.parseInt(parts[7]) < 0 ? "&nbsp;" : ((Integer.parseInt(parts[7]) - Integer.parseInt(parts[6])) + "");
//            1|0      |2|1|��¬    |7 |9400 |-999 |0   |44 |30 |18 |10|0 |0   |0|0|0|0|0|0^
//            1|0      |2|2|ϣ����  |7 |9400 |-999 |1   |30 |44 |18 |10|0 |0   |0|0|0|0|0|0^
//            1|0      |2|3|��Ƥ    |7 |9400 |-999 |2   |18 |30 |44 |10|0 |0   |0|0|0|0|0|0^
//            1|0      |1|4|�ϵϰ���|5 |73618|70000|0   |92 |60 |34 |16|86|0   |0|0|0|0|0|0^
//            1|0      |0|5|����ɭ  |2 |5987 |13000|1   |42 |68 |22 |10|10|0   |0|0|0|0|0|0^
//            1|1      |0|6|�������|1 |3316 |5000 |2   |18 |36 |60 |8 |57|0   |0|0|0|0|0|0
//     �Ƿ�Ƹ�� current     name     lv exp   next  type att mid def       ����
//            0 1       2 3 4        5  6     7     8    9   10  11  12 13 14
              }
              list.add(add);
          }
      }
      request.setAttribute("atts", list);
  %>
  <br/>
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
      <tr>
          <td valign="top">
              <table border="0" cellpadding="1" cellspacing="1" bgcolor="black" id="full">
                  <tr class="head">
                      <th rowspan="2">��¼��</th>
                      <th rowspan="2">��Ϸ��</th>
                      <th rowspan="2" style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, false)">��ǰ����</th>
                      <th colspan="2">��¬</th>
                      <th colspan="2">ϣ����</th>
                      <th colspan="2">��Ƥ</th>
                      <th colspan="2">�ϵϰ���</th>
                      <th colspan="2">����ɭ</th>
                      <th colspan="2">�������</th>
                  </tr>
                  <tr class="head">
                      <c:forEach begin="0" end="5">
                          <th>�ȼ�</th>
                          <th>��������</th>
                      </c:forEach>
                  </tr>
                  <c:forEach items="${atts}" var="a" varStatus="i">
                      <tr class="row${i.index % 2 + 1}">
                          <c:choose>
                              <c:when test="${fn:length(a) > 2}">
                                  <c:forEach items="${a}" var="aa" varStatus="ii">
                                      <td>
                                          <c:if test="${ii.index == 0}">
                                              <input type="button" value="��" onclick="javascript:window.open('upCoach.jsp?email=${aa}');"/>
                                              <input type="button" value="D" onclick="removeRow(this);"/>
                                          </c:if>
                                          <c:if test="${ii.index > 2 && ii.index % 2 == 1}">
                                              <c:choose>
                                                  <c:when test="${empty aa}">
                                                      <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="hire(this, '${a[0]}', '${(ii.index - 3) / 2 + 1}')"/>
                                                  </c:when>
                                                  <c:otherwise>
                                                      <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="showBag(this, '${a[0]}', '${(ii.index - 3) / 2 + 1}')"/>
                                                      <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="levelup('${a[0]}', '${(ii.index - 5) / 2 + 1}')"/>
                                                      <c:if test="${ii.index == 3}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', '��¬')"/>
                                                      </c:if>
                                                      <c:if test="${ii.index == 5}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', 'ϣ����')"/>
                                                      </c:if>
                                                      <c:if test="${ii.index == 7}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', '��Ƥ')"/>
                                                      </c:if>
                                                      <c:if test="${ii.index == 9}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', '�ϵϰ���')"/>
                                                      </c:if>
                                                      <c:if test="${ii.index == 11}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', '����ɭ')"/>
                                                      </c:if>
                                                      <c:if test="${ii.index == 13}">
                                                          <input style="padding-left: 1px;padding-right: 1px;" type="button" value="��" onclick="change('${a[0]}', '�������')"/>
                                                      </c:if>
                                                  </c:otherwise>
                                              </c:choose>
                                          </c:if>
                                          ${aa}
                                      </td>
                                  </c:forEach>
                              </c:when>
                              <c:otherwise>
                                  <td>${a[0]}</td>
                                  <td>${a[1]}</td>
                                  <td colspan="13">����ѵ��</td>
                              </c:otherwise>
                          </c:choose>
                      </tr>
                  </c:forEach>
              </table>
          </td>
          <td valign="top" align="left">
              <span id='info'></span><br/>
              <table id="detail" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
                  <tr class="head">
                      <td>����</td>
                      <td>����</td>
                      <td>����</td>
                      <td>����</td>
                  </tr>
              </table>
          </td>
      </tr>
  </table>
  </body>
<script type="text/javascript">
    var coachId, e;

    function change(email, name) {
        OgzqDwr.changeCoach(email, name, after);
    }

    function levelup(email, coachId) {
        OgzqDwr.coachLevelUp(email, parseInt(coachId, 10), after);
    }

    function showBag(obj, email, playerId) {
        coachId = parseInt(playerId, 10);
        e = email;
        var table = document.getElementById('full');
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].style.color = 'black';
        }
        obj.parentNode.parentNode.style.color = 'red';
        OgzqDwr.listCoachBags(email, "3", afterShowBag);
    }

    function hire(obj, email, playerId) {
        coachId = parseInt(playerId, 10);
        e = email;
        var table = document.getElementById('full');
        for(var i = 1; i < table.rows.length; i++) {
            table.rows[i].style.color = 'black';
        }
        obj.parentNode.parentNode.style.color = 'red';
        OgzqDwr.hireCoach(email, parseInt(playerId, 10), after);
    }

    function afterShowBag(list) {
        var table = document.getElementById('detail');
        for(var i = table.rows.length - 1; i > 0; i--) {
            table.deleteRow(i);
        }
        for(var i = 0; i < list.length; i++) {
//            m.put("itemId", parts[0]);
//            m.put("name", parts[3]);
//            m.put("count", parts[7]);
//            m.put("canuse", parts[8]);
//            m.put("itemCode", parts[11]);
            var row = table.insertRow(-1);
            row.className = 'row' + (2 - i % 2);
            var cell = row.insertCell(-1);
            cell.innerHTML = list[i]['name'];
            cell = row.insertCell(-1);
            cell.innerHTML = list[i]['itemCode'];
            cell = row.insertCell(-1);
            cell.innerHTML = list[i]['count'];
            cell = row.insertCell(-1);
            cell.innerHTML = "<input type=\"button\" value=\"��\" onclick=\"useCoachItem('" + e + "', '" + list[i]['itemCode'] + "');\"/>" +
                    "<input type=\"button\" value=\"��\" onclick=\"combine('" + e + "', '" + list[i]['itemId'] + "');\"/>";
        }
    }

    function combine(email, itemId) {
        OgzqDwr.combineCoach(email, itemId, after);
    }

    function useCoachItem(email, itemCode) {
        OgzqDwr.useCoachItem(email, coachId, itemCode, after);
    }

    function after(obj) {
        alert(obj);
    }
    function removeRow(obj) {
        var table = document.getElementById('full');
        table.deleteRow(obj.parentNode.parentNode.rowIndex);

        for(var i = 2; i < table.rows.length; i++) {
            table.rows[i].className = 'row' + (2 - (i % 2));
        }
    }
</script>
</html>