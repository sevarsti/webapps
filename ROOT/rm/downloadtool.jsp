<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: ELLIAS
  Date: 2016-1-1
  Time: 21:55:03
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
  <head><title>�����ʦ��������</title></head>
    <body>
    <%
        List<String[]> tools = new ArrayList<String[]>();
        String name, author, type, desc, link;
        name = "MROCK_SONG_CLIENT_ANDROID�޸Ĺ���EXCEL";
        author = "Ellias";
        type = "����";
        desc = "���Զ�ȡbin�ļ�������У��޸���֮��ֱ�ӱ�����bin�ļ�������Ҫת��Ϊxml<br/>ʹ��ʱ��Ҫ���ú꣬�������ļ��Ķ�ȡ�ͱ���·��";
        link = "MROCK_SONG_CLIENT_ANDROID�޸Ĺ���EXCEL";
        tools.add(new String[]{name, author, type, desc, link});

        name = "��׿���׹ٷ�����������";
        author = "�����ʦ��¿";
        type = "����";
        desc = "���ȣ���֤����/sdcard/RM/res/ mrock_song_client_android.xml���Ա�����ȡpath�����û�У��״δ򿪻��Զ����ء�<br/>\n" +
"��Σ���֤�������صĶ����ڽ����ʦ��û���ع���������������أ���ɾ��ԭ�����ļ���<br/>\n" +
"Ȼ�󣬵������Ҫ���صĸ�����ѡ��Ҫ���ص��ļ���<br/>\n" +
"��󣬵������ʦ��Ӧ���ļ���ȥ�ҡ�";
        link = "�ڲ�������";
        tools.add(new String[]{name, author, type, desc, link});

        name = "��������ʦv2";
        author = "�����ʦ��¿";
        type = "����";
        desc = "������־��<br/>\n" +
"+ȥ���̼�<br/>\n" +
"+txt����<br/>\n" +
"+��������<br/>\n" +
"*�޸������β����<br/>\n" +
"-��ת����ť<br/>\n" +
"<br/>\n" +
"�°汾˵����<br/>\n" +
"1.����ȥ���̼����ܣ�����ʱ��С�ڶ��ٵĶ������Զ�ת��Ϊ�������������£�ֻȥ����ͷ�ͽ�β�����ߣ���ͷ�����룬��β��ǰ���룬������������ǰ���롣<br/>\n" +
"2.txt��ʽ���棬�������ļ�ʱ��ͬʱ����imd,pts��txt���棬txt�����ֶ��޸ġ�<br/>\n" +
"<br/>\n" +
"txt��ʽ˵����<br/>\n" +
"PtsFile�ļ�ͷ<br/>\n" +
"����ʱ�䣬����ģʽ<br/>\n" +
"����ʱ�䣬bpm��<br/>\n" +
"BeatsEnd���Ľ���<br/>\n" +
"�����ʱ�䡪�����ʱ�䡭<br/>\n" +
"PointsEnd�˵����<br/>\n" +
"ÿһ��Ϊһ�����壬�����ж�Ӧ���Ƕ˵�λ�ã������˵�֮���ö������ӡ�";
        link = "��������ʦv2";
        tools.add(new String[]{name, author, type, desc, link});

        name = "��ǿ��������׿�棩";
        author = "�����ʦ��¿";
        type = "����";
        desc = "ʹ��˵����<br/>\n" +
"1����Ҫ��һ���ļ������<br/>\n" +
"2�����ļ�����������������ļ���<br/>\n" +
"3����֤ͬһ�ļ�������imd�����mp3������pngͼƬ������<br/>\n" +
"4�����imd�ļ�������ǿ������<br/>\n" +
"������<br/>\n" +
"1���ж��Ƚ��ɣ��ǳ����״����Perfect�������򲻳���Great<br/>\n" +
"2������������������XXXX<br/>\n" +
"3������ʱ������ʱ���ܻ����ˣ���������ڴ�����Ļ���¼��ϣ������������Ҳ�Ҳ�����������ʩ<br/>\n" +
"4����ʱֻ�ṩ4����<br/>\n" +
"5����¿������Ʒ����л���޿���С���֧�� @_����_@qq1473636901 @��������<br/>";
        link = "��ǿ��������׿�棩";
        tools.add(new String[]{name, author, type, desc, link});

        name = "�ڲ��ļ�������";
        author = "����";
        type = "����";
        desc = "�������ؽ����ʦ�ٷ�����ͼƬ���֡���ҪMD5list.xml����ļ�������path�����������׻���ļ����ص���������Ŀ¼";
        link = "�ڲ��ļ�������";
        tools.add(new String[]{name, author, type, desc, link});

        name = "���������";
        author = "�����ʦ��¿";
        type = "����";
        desc = "��һ���ļ����е����֡����桢ͼƬ���ļ���";
        link = "�������������׿�棩";
        tools.add(new String[]{name, author, type, desc, link});

        name = "CharacterBinEditor ���￪�����޸Ĺ���";
        author = "������˹֮��";
        type = "����";
        desc = "��ע�⣺������mrock.character_client.bin���޸�<br/>\n" +
"��ʹ�÷�����<br/>\n" +
"1.������򿪡���ť��ȡ���е�bin�����ߡ��ٷ�bin���Զ����ز���ȡ���µ�bin<br/>\n" +
"2.�����ѡ�����ѡ����Ҫ�޸ĵĿ�����<br/>\n" +
"3.���·�Gaming Speaking�����޸����֣�ע�ⳤ�����ƣ�<br/>\n" +
"4.����·����޸ġ���ť<br/>\n" +
"5.��������桱��ť<br/>\n" +
"6.������������̽�������ڴ�׸��<br/>\n" +
"�������غ�ȫ������������������<br/>\n" +
"��������ʹ�øù��ߣ������ִ������߸Ų�����<br/>\n" +
"��Made by hTC<br/>";
        link = "CharacterBinEditor";
        tools.add(new String[]{name, author, type, desc, link});
    %>
    <h1>˵������վ���ṩ���أ�����������Ч�Լ���ȫ�����κα�֤�������ɻ��������ء�<br/>ʹ��˵������İٶ�˯���аɡ�</h1>
        <table cellpadding="1" cellspacing="1" border="0" bgcolor="black" width="100%">
            <tr class="head">
                <th>����</th>
                <th>����</th>
                <th>����</th>
                <th>����</th>
                <th>����</th>
            </tr>
            <%
                for(int i = 0; i < tools.size(); i++) {
                    name = tools.get(i)[0];
                    author = tools.get(i)[1];
                    type = tools.get(i)[2];
                    desc = tools.get(i)[3];
                    link = tools.get(i)[4];
            %>
            <tr class="row<%=i % 2 + 1%>">
                <td><%=name%></td>
                <td><%=author%></td>
                <td><%=type%></td>
                <td><%=desc%></td>
                <td>
                    <a href="download.do?name=<%=link%>">
                        ����
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>