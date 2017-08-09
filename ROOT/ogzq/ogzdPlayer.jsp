<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-8-11
  Time: 2:04:54
  To change this template use File | Settings | File Templates.
--%>
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
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='../scripts/tablesort.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
    </head>
    <body onload="updatecount();">
        <select id="pos" onchange="updatePlayer();">
            <option value="0">-ȫ-</option>
            <option value="1">�Ž�</option>
            <option value="2">����</option>
            <option value="3">�г�</option>
            <option value="4">ǰ��</option>
        </select>
        <select id="level" onchange="updatePlayer();">
            <option value="0">-ȫ-</option>
            <option value="1">��ͨ</option>
            <option value="2">����</option>
            <option value="3">��Ӣ</option>
            <option value="4">�ܳ�</option>
            <option value="5">����</option>
            <option value="6">����</option>
        </select>
        <select id="league" onchange="updatePlayer();">
            <option value="0">-ȫ-</option>
            <option value="1">��</option>
            <option value="2">��</option>
            <option value="3">��</option>
            <option value="4">Ӣ</option>
            <option value="5">��</option>
        </select>
        <%!
            private int containPlayer(List<String[]> players, String name) {
                for(int i = 0; i < players.size(); i++) {
                    String[] p = players.get(i);
                    if(p[0].equals(name)) {
                        return i;
                    }
                }
                return -1;
            }
        %>
        <%
            List<String[]> players = new ArrayList<String[]>();
            players.add(new String[]{"³��Ү", "1��ͨ", "1", "1"});
            players.add(new String[]{"л��", "1��ͨ", "2", "1"});
            players.add(new String[]{"������", "1��ͨ", "3", "1"});
            players.add(new String[]{"������", "1��ͨ", "4", "1"});
            players.add(new String[]{"â����", "2����", "1", "1"});
            players.add(new String[]{"������¡˹", "2����", "2", "1"});
            players.add(new String[]{"�߶�������", "2����", "3", "1"});
            players.add(new String[]{"������", "2����", "4", "1"});
            players.add(new String[]{"�ʵ���", "3��Ӣ", "1", "1"});
            players.add(new String[]{"���˹ά��", "3��Ӣ", "234", "1"});
            players.add(new String[]{"���", "3��Ӣ", "2", "3"});
            players.add(new String[]{"���к�", "3��Ӣ", "4", "3"});
            players.add(new String[]{"����", "4�ܳ�", "1", "3"});
            players.add(new String[]{"ʲ������", "4�ܳ�", "1", "4"});
            players.add(new String[]{"������", "4�ܳ�", "2", "1"});
            players.add(new String[]{"÷�߶���", "4�ܳ�", "2", "2"});
            players.add(new String[]{"���ǸꡤĪ��", "4�ܳ�", "3", "1"});
            players.add(new String[]{"������", "4�ܳ�", "3", "3"});
            players.add(new String[]{"�������з�", "4�ܳ�", "4", "4"});
            players.add(new String[]{"�����ǿ�", "4�ܳ�", "4", "1"});
//            players.add(new String[]{"G������", "4�ܳ�"});
//            players.add(new String[]{"������ŵ", "4�ܳ�"});
            players.add(new String[]{"˹�ؿ��ײ���", "5����", "1", "4"});
            players.add(new String[]{"��Ī˹", "5����", "23", "5"});
            players.add(new String[]{"����", "5����", "4", "4"});

        %>
        <table class="frame" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="black" id="player">
            <tr class="head" valign="top" align="left">
                <th rowspan="2">
                    email
                </th>
                <th rowspan="2">
                    nick
                </th>
                <%
                    for(int i = 0; i < players.size(); i++) {
                        String[] player = players.get(i);
                %>
                <th pos="<%=player[2]%>" level="<%=player[1].substring(0, 1)%>" league="<%=player[3]%>"><%=player[0]%></th>
                <%
                    }
                %>
            </tr>
            <tr class="head" valign="top" align="left">
                <%
                    for(int i = 0; i < players.size(); i++) {
                        String level = players.get(i)[1];
                %>
                <td  ><%=level%></td>
                <%
                    }
                %>
            </tr>
        <%
            String email = request.getParameter("email");
            List<String> ids;
            if(StringUtils.isEmpty(email)) {
                ids = IDUtils.GETIDS();
            } else {
                ids = new ArrayList<String>();
                String[] emails = email.split("\\,");
                for(String e : emails) {
                    ids.add(e);
                }
//                ids.add(email);
            }
            for(int idx = 0; idx < ids.size(); idx++) {
                System.out.println(idx + "/" + ids.size() + ":" + ids.get(idx));
                String id = ids.get(idx);
                if(id.indexOf("txjcf") >= 0) {
                    continue;
                }
                if(idx > 0 && idx % 15 == 0) {
        %>
            <tr class="head" valign="top" align="left">
                <th>
                    email
                </th>
                <th>
                    nick
                </th>
                <%
                    for(int i = 0; i < players.size(); i++) {
                        String[] player = players.get(i);
                %>
                <td  ><%=player[0]%></td>
                <%
                    }
                %>
            </tr>
            <%
                }
                boolean[] has = new boolean[players.size()];
                for(int league = 1; league <= 5; league++) {
                    HttpPost pm = new HttpPost(OgzqURL.URL + "/Ogzd.aspx");
                    List<NameValuePair> params = new ArrayList<NameValuePair>();
                    params.add(new BasicNameValuePair("ShowOgzdGame1", league + ""));
                    pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                    String s = IDUtils.execute(id, pm); //0@1@9@2@2*0@78438|ʥ���ٰ�   |3001|100........@18752|Ambrosini|npc53.png|14206|6

                    if(Integer.parseInt(s.substring(0, s.indexOf("@"))) < 0) {
                        continue;
                    }
                    if(s.split("@").length < 6) {
                        continue;
                    }
                    String team = s.split("@")[5];
                    String[] teams = team.split("&");
                    for(String t : teams) {
                        String player = t.substring(t.lastIndexOf("|") + 1);
                        String[] myPlayers = player.split("[\\^]");
                        for(String p : myPlayers) {
                            String[] pp = p.split("[*]");
                            if(pp.length < 6) {
                                continue;
                            }
                            if(pp[5].equals("1")) {
                                int index = containPlayer(players, pp[0]);
                                if(index >= 0) {
                                    has[index] = true;
                                }
                            }
                        }
                    }
                }
        %>
            <tr class="row<%=idx % 2 + 1%>">
                <td><%=id%></td>
                <td><%=IDUtils.getNick(id)%></td>
                <%
                    for(int i = 0; i < has.length; i++) {
                %>
                <td  >
                    <c:choose>
                        <c:when test="<%=has[i]%>">
                            ��
                        </c:when>
                        <c:otherwise>
                            &nbsp;
                        </c:otherwise>
                    </c:choose>
                </td>
                <%
                    }
                %>
            </tr>
        <%
            }
        %>
        </table>
    </body>
<script type="text/javascript">
    function updatePlayer() {
        var pos = document.getElementById('pos').value;
        var level = document.getElementById('level').value;
        var league = document.getElementById('league').value;
        var table = document.getElementById('player');
//        for(var i = 0; i < table.rows.length; i++) {
            for(var j = 2; j < table.rows[0].cells.length; j++) {
                if(!table.rows[0].cells[j].attributes['pos']) {
                    continue;
                }
                if(!table.rows[0].cells[j].attributes['level']) {
                    continue;
                }
                if(!table.rows[0].cells[j].attributes['league']) {
                    continue;
                }
                var show = false;
                if(pos == 0 || table.rows[0].cells[j].attributes['pos'].value.indexOf(pos) >= 0) {
                    if(level == 0 || level == table.rows[0].cells[j].attributes['level'].value) {
                        if(league == 0 || league == table.rows[0].cells[j].attributes['league'].value) {
                            show = true;
                        }
                    }
                }
                if(show) {
                    table.rows[0].cells[j].style.display = '';
                    table.rows[1].cells[j-2].style.display = '';
                    for(var i = 2; i < table.rows.length; i++)
                    {
                        table.rows[i].cells[j].style.display = '';
                    }
                } else {
                    table.rows[0].cells[j].style.display = 'none';
                    table.rows[1].cells[j-2].style.display = 'none';
                    for(var i = 2; i < table.rows.length; i++)
                    {
                        table.rows[i].cells[j].style.display = 'none';
                    }
                }
            }
//        }
    }

    function updatecount()
    {
        var table = document.getElementById('player');
        for(var j = 2; j < table.rows[0].cells.length; j++)
        {
            var count = 0;
            for(var i = 2; i < table.rows.length; i++)
            {
                if(table.rows[i].cells[j].innerHTML.indexOf("��") >= 0)
                {
                    count += 1;
                }
            }
            table.rows[1].cells[j - 2].innerHTML = count;
        }
    }
</script>
</html>