<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2015-9-10
  Time: 18:13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="com.saille.ogzq.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ include file="../include/include.jsp"%>
<html>
    <head>
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <!--<script type='text/javascript' src='../include/json.js'> </script>-->
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OgzqDwr.js'></script>
    </head>
    <body>
    <%!
        String convertAttributes(String in1, String in2) {
            int gk = 0, d = 0, m = 0, f = 0;
            if(in1 != null && in1.length() > 0) {
                String[] s = in1.split("��");
                for(String ss : s) {
                    if(ss.startsWith("ͻ��") || ss.startsWith("����")) {
                        f += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("����") || ss.startsWith("�ٶ�")) {
                        m += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("����") || ss.startsWith("����")) {
                        d += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("�˾�") || ss.startsWith("����")) {
                        gk += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    }
                }
            }
            if(in2 != null && in2.length() > 0) {
                String[] s = in2.split("��");
                for(String ss : s) {
                    if(ss.startsWith("ͻ��") || ss.startsWith("����")) {
                        f += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("����") || ss.startsWith("�ٶ�")) {
                        m += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("����") || ss.startsWith("����")) {
                        d += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    } else if(ss.startsWith("�˾�") || ss.startsWith("����")) {
                        gk += Integer.parseInt(ss.substring(ss.indexOf("+") + 1));
                    }
                }
            }
            if(gk + d + m + f == 0) {
                return "";
            } else {
                return "�ţ�" + (gk) + "������" + (d) + "���У�" + (m) + "���棺" + (f);
            }
        }

        List<String[]> insertItems(List<String[]> items, String[] newItem) {
            boolean insert = false;
            for(int i = 0; i < items.size(); i++) {
                String[] item = items.get(i);
                if(item[1].compareTo(newItem[3]) >= 0) {
                    items.add(i, new String[]{newItem[0], newItem[3], newItem[11], newItem[7], newItem[13], newItem[3].replaceAll("[^0-9]", "")});
                    insert = true;
                    break;
                }
            }
            if(!insert) {
                items.add(new String[]{newItem[0], newItem[3], newItem[11], newItem[7], newItem[13], newItem[3].replaceAll("[^0-9]", "")});
            }
            return items;
        }

        List<String[]> getItems(String email) throws Exception {
            List<String[]> ret = new ArrayList<String[]>();
            HttpPost pm = new HttpPost(OgzqURL.URL + OgzqURL.BAGS);
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("type", "0"));
            params.add(new BasicNameValuePair("itemtype", "2"));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String s = IDUtils.execute(email, pm);
            String[] items = s.split("[|]");
            List<String[]> xianliang = new ArrayList<String[]>();
            List<String[]> qiuyi = new ArrayList<String[]>();
            List<String[]> huxi = new ArrayList<String[]>();
            List<String[]> qiuxie = new ArrayList<String[]>();
            List<String[]> shoutao = new ArrayList<String[]>();
            List<String[]> xiubiao = new ArrayList<String[]>();
            for(String item : items) {
                String[] atts = item.split("[*]");
                if(atts[3].startsWith("����")) {
                    xianliang.add(new String[]{atts[0], atts[3], atts[11], atts[7], atts[13], atts[3].replaceAll("[^0-9]", "")});
                }else if(atts[3].startsWith("ս��")) {
                    insertItems(qiuyi, atts);
                } else if(atts[3].startsWith("����")) {
                    insertItems(huxi, atts);
                } else if(atts[3].startsWith("սѥ")) {
                    insertItems(qiuxie, atts);
                } else if(atts[3].startsWith("����")) {
                    insertItems(shoutao, atts);
                } else if(atts[3].startsWith("���")) {
                    insertItems(xiubiao, atts);
                }
            }
            ret.addAll(xianliang);
            ret.addAll(qiuyi);
            ret.addAll(huxi);
            ret.addAll(qiuxie);
            ret.addAll(shoutao);
            ret.addAll(xiubiao);
            return ret;
        }
    %>
    <%
        String email = request.getParameter("email");
        List<Map<String, String>> equips = new ArrayList<Map<String, String>>();

        List<Map<String, String>> players = new OgzqDwr().viewPlayer(email);
        for(int i = 1; i < players.size(); i++) {
            Map<String, String> detail = CacheManager.loadPlayer(email, players.get(i).get("id"), false);
            if(StringUtils.isNotBlank(detail.get("qiuyi"))) {
                Map<String, String> playerequip = new HashMap<String, String>();
                playerequip.put("name", detail.get("qiuyi"));
                playerequip.put("type", "ս��");
                playerequip.put("player", i + players.get(i).get("name"));
                playerequip.put("playerId", players.get(i).get("id"));
                playerequip.put("attr", convertAttributes(detail.get("qiuyi1"), detail.get("qiuyi2")));
                playerequip.put("gem", detail.get("qiuyi3"));
                equips.add(playerequip);
            }
            if(StringUtils.isNotBlank(detail.get("huxi"))) {
                Map<String, String> playerequip = new HashMap<String, String>();
                playerequip.put("name", detail.get("huxi"));
                playerequip.put("type", "����");
                playerequip.put("player", i + players.get(i).get("name"));
                playerequip.put("playerId", players.get(i).get("id"));
                playerequip.put("attr", convertAttributes(detail.get("huxi1"), detail.get("huxi2")));
                playerequip.put("gem", detail.get("huxi3"));
                equips.add(playerequip);
            }
            if(StringUtils.isNotBlank(detail.get("qiuxie"))) {
                Map<String, String> playerequip = new HashMap<String, String>();
                playerequip.put("name", detail.get("qiuxie"));
                playerequip.put("type", "սѥ");
                playerequip.put("player", i + players.get(i).get("name"));
                playerequip.put("playerId", players.get(i).get("id"));
                playerequip.put("attr", convertAttributes(detail.get("qiuxie1"), detail.get("qiuxie2")));
                playerequip.put("gem", detail.get("qiuxie3"));
                equips.add(playerequip);
            }
            if(StringUtils.isNotBlank(detail.get("shoutao"))) {
                Map<String, String> playerequip = new HashMap<String, String>();
                playerequip.put("name", detail.get("shoutao"));
                playerequip.put("type", "����");
                playerequip.put("player", i + players.get(i).get("name"));
                playerequip.put("playerId", players.get(i).get("id"));
                playerequip.put("attr", convertAttributes(detail.get("shoutao1"), detail.get("shoutao2")));
                playerequip.put("gem", detail.get("shoutao3"));
                equips.add(playerequip);
            }
            if(StringUtils.isNotBlank(detail.get("xiubiao")) && !"-1".equals(detail.get("xiubiao"))) {
                Map<String, String> playerequip = new HashMap<String, String>();
                playerequip.put("name", detail.get("xiubiao"));
                playerequip.put("type", "���");
                playerequip.put("player", i + players.get(i).get("name"));
                playerequip.put("playerId", players.get(i).get("id"));
                playerequip.put("attr", convertAttributes(detail.get("xiubiao1"), detail.get("xiubiao2")));
                playerequip.put("gem", detail.get("xiubiao3"));
                equips.add(playerequip);
            }
        }
        List<String[]> ret = new ArrayList<String[]>();
        HttpPost pm = new HttpPost(OgzqURL.URL + OgzqURL.BAGS);
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("type", "0"));
        params.add(new BasicNameValuePair("itemtype", "2"));
        pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
        String s = IDUtils.execute(email, pm);
        String[] items = s.split("[|]");
        List<Map<String, String>> gems = new ArrayList<Map<String, String>>();
        for(String item : items) {
            String[] attrs = item.split("\\*");
            if(attrs[3].startsWith("��ʯ")) {
                Map<String, String> m = new HashMap<String, String>();
                m.put("name", attrs[3]);
                m.put("count", attrs[7]);
                m.put("itemCode", attrs[11]);
                m.put("id", attrs[0]);
                gems.add(m);
            }
        }
//        List<String[]> equipsbag = this.getItems(email);
//        for(String[] e : equipsbag) {
//            Map<String, String> bagequip = new HashMap<String, String>();
//            bagequip.put("name", e[1]);
//            bagequip.put("type", e[1].substring(0, 2));
//            bagequip.put("player", "");
//            bagequip.put("attr", e[4]);
//            bagequip.put("gem", "-1");
//            equips.add(bagequip);
//        }
        request.setAttribute("equips", equips);
    %>
        <%=email%>/<%=IDUtils.getNick(email)%>/<%=IDUtils.IDInfos.get(email).get("silver")%>
    <br/>
    <table width="100%" border="0">
        <tr valign="top" align="left">
            <td>
                <table id="info" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
                    <tr class="head">
                        <!--<th>ID</th>-->
                        <th>����</th>
                        <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 1, false)">����</th>
                        <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 2, false)">װ����Ա</th>
                        <th>����</th>
                        <th style="cursor:pointer;text-decoration:underline;" onclick="resort(this, 4, true)">��ʯ</th>
                        <th>����</th>
                    </tr>
                    <%
                        for(int i = 0; i < equips.size(); i++) {
                            Map<String, String> m = equips.get(i);
                    %>
                    <tr class="row<%=i % 2 + 1%>">
                        <td>
                            <%=m.get("name")%>
                        </td>
                        <td>
                            <%=m.get("type")%>
                        </td>
                        <td>
                            <%=m.get("player")%>
                        </td>
                        <td>
                            <%=m.get("attr")%>
                        </td>
                        <td>
                            <%=m.get("gem")%>
                        </td>
                        <td>
                            <c:if test="<%=StringUtils.isNotBlank(m.get("player"))%>">
                                <input type="radio" name="player" value="<%=m.get("playerId") + "*" + m.get("type")%>"/>
                            </c:if>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </td>
            <td>
                <table id="gem" border="0" cellpadding="1" cellspacing="1" bgcolor="black">
                    <tr class="head">
                        <th>
                            ����
                        </th>
                        <th>
                            ����
                        </th>
                        <th>
                            ����
                        </th>
                    </tr>
                    <%
                        for(int i = 0; i < gems.size(); i++) {
                            Map<String, String> m = gems.get(i);
                    %>
                    <tr class="row<%=i % 2 + 1%>">
                        <td>
                            <%=m.get("name")%>
                        </td>
                        <td>
                            <%=m.get("count")%>
                        </td>
                        <td>
                            <input type="button" onclick="doxiangqian('<%=m.get("id")%>');" value="��Ƕ"/>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </td>
        </tr>
    </table>
    <%--���ң�<%=IDUtils.IDInfos.get(email).get("silver")%>���������֣�<%=xianliangPoint%>--%>
    <br/>
    </body>
<script type="text/javascript">
    function doxiangqian(gemId)
    {
        var list = document.getElementsByName('player');
        var playerId = '';
        for(var i = 0; i < list.length; i++) {
            if(list[i].checked) {
                playerId = list[i].value;
                break;
            }
        }
        if(playerId != '') {
            var parts = playerId.split("*")
            playerId = parts[0];
            var itemType = parts[1];
            if(itemType == 'ս��') {
                itemType = '0';
            } else if(itemType == '����') {
                itemType = '1';
            } else if(itemType == 'սѥ') {
                itemType = '2';
            } else if(itemType == '����') {
                itemType = '3';
            } else if(itemType == '���') {
                itemType = '4';
            }
            OgzqDwr.xiangqianGem('<%=email%>', playerId, gemId, itemType, after);
        }
    }

    function after(obj) {
        alert(obj);
    }
</script>
</html>