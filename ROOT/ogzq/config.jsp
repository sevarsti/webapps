<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2012-7-15
  Time: 20:01:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.ConfigUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ArrayList" %>
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
    <%
        List<String> configNames = new ArrayList<String>();
        configNames.add("��Ա������Χ");
        configNames.add("�Ƿ�������Ա");
        configNames.add("�Ƿ��߾�����");
        configNames.add("�������߼�����");
        configNames.add("�Ƿ���������ս");
        configNames.add("���ս��ʼ");
        configNames.add("���ս����");
        configNames.add("�Ƿ���Ѳ����");
        configNames.add("�Ƿ���ѵ����");
        configNames.add("�Ƿ�ѵ��");
        configNames.add("ѵ������Χ");
//        configNames.add("ѵ��������");
        configNames.add("��Ա����");
//        configNames.add("���ս��ʼ");
//        configNames.add("���ս����");
        configNames.add("���籭�Ѷ�");
//        configNames.add("�Ƿ��߸���1");
//        configNames.add("�Ƿ��߸���2");
//        configNames.add("�Ƿ��߸���3");
//        configNames.add("�Ƿ��߸���4");
//        configNames.add("�Ƿ��߸���5");
        configNames.add("�Ƿ���ѵ��");
        configNames.add("�Ƿ�������");
        configNames.add("�Ƿ���ŷ��֮��");
        configNames.add("ŷ��֮�۶���");
        configNames.add("�Ѽ�����");
        configNames.add("�Ƿ�������ѵ����");
        configNames.add("�Ƿ����۷�֮·");

        List<String> ids = IDUtils.GETIDS();
    %>
    <table id="confTable" border="0" cellpadding="1" cellspacing="1" class="frame" bgcolor="black">
        <tr class="head">
            <th colspan="2">����</th>
            <c:forEach items="<%=configNames%>" var="c">
                <th>${c}</th>
            </c:forEach>
        </tr>
        <tr class="row1">
            <td colspan="2">ȫ��</td>
            <%
                for(String conf : configNames) {
            %>
            <td><%=ConfigUtils.getConf(null, conf)%></td>
            <%
                }
            %>
        </tr>
        <%
            for(int i = 0; i < ids.size(); i++) {
                String id = ids.get(i);
                if(i % 15 == 0) {
        %>
        <tr class="head">
            <th colspan="2">����</th>
            <c:forEach items="<%=configNames%>" var="c">
                <th>${c}</th>
            </c:forEach>
        </tr>
        <%
                }
        %>
        <tr class="row<%=2 - i % 2%>">
            <td><%=id%></td>
            <td><%=IDUtils.getNick(id)%></td>
            <%
                for(String conf : configNames) {
                    String myConf = ConfigUtils.getConfExact(id, conf);
                    String globalConf = ConfigUtils.getConf(id, conf);
            %>
            <td nowrap onclick="edit(this, '<%=id%>', '<%=conf%>', '<%=myConf == null ? "" : myConf%>', event);">
                <%=myConf == null ? "" : "<span style=\"color:red;\">" + myConf + "</span>"%>
                <c:if test="<%=myConf != null%>"><input type="image" style="cursor:pointer;" src="../images/cancel.gif" title="ɾ��" onclick="if(confirm('ȷ��Ҫɾ��<%=conf%>.<%=id%>��')) {deleteConf('<%=conf%>.<%=id%>');}"/></c:if>
            </td>
            <%
                }
            %>
        </tr>
        <%
            }
        %>
    </table>
        <table id="info" border="0" cellpadding="1" cellspacing="1" class="rowover">
            <tr class="head">
                <th>KEY</th>
                <th>VALUE</th>
                <th>��</th>
                <th>OPERATION</th>
            </tr>
            <%
                List<String[]> list = ConfigUtils.listAll();
                for(int i = 0; i < list.size(); i++) {
                    String[] conf = list.get(i);
                    if(conf[0].indexOf(".") >= 0) {
                        if(IDUtils.IDInfos.get(conf[0].substring(conf[0].indexOf(".") + 1)) != null) {
                            continue;
                        }
                    }
            %>
                <tr class="row<%=i % 2 + 1%>">
                    <td onclick="doEdit('<%=conf[0]%>','<%=conf[1]%>');" style="cursor:pointer;">
                        <%=conf[0]%>
                    </td>
                    <td>
                        <%=conf[1]%>
                    </td>
                    <td>
                        <%=conf[0].indexOf(".") >= 0 ? (IDUtils.IDInfos.get(conf[0].substring(conf[0].indexOf(".") + 1)) == null ? "??" : IDUtils.getNick(conf[0].substring(conf[0].indexOf(".") + 1))) : "--"%>
                    </td>
                    <td>
                        <input type="button" value="ɾ��" onclick="deleteConf('<%=conf[0]%>')"/>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    ���ӣ�
    <select id="item">
        <option value="��Ա������Χ">��Ա������Χ</option>
        <option value="�Ƿ�������Ա">�Ƿ�������Ա</option>
        <option value="�Ƿ��߾�����">�Ƿ��߾�����</option>
        <option value="�������߼�����">�������߼�����</option>
        <option value="�Ƿ���������ս">�Ƿ���������ս</option>
        <option value="���ս��ʼ">���ս��ʼ</option>
        <option value="���ս����">���ս����</option>
        <option value="�Ƿ���Ѳ����">�Ƿ���Ѳ����</option>
        <option value="�Ƿ���ѵ����">�Ƿ���ѵ����</option>
        <option value="�Ƿ�ѵ��">�Ƿ�ѵ��</option>
        <option value="ѵ������Χ">ѵ������Χ</option>
        <!--<option value="ѵ��������">ѵ��������</option>-->
        <option value="��Ա����">��Ա����</option>
        <option value="���籭�Ѷ�">���籭�Ѷ�</option>
        <!--<option value="�Ƿ��߸���1">�Ƿ��߸���1</option>-->
        <!--<option value="�Ƿ��߸���2">�Ƿ��߸���2</option>-->
        <!--<option value="�Ƿ��߸���3">�Ƿ��߸���3</option>-->
        <!--<option value="�Ƿ��߸���4">�Ƿ��߸���4</option>-->
        <!--<option value="�Ƿ��߸���5">�Ƿ��߸���5</option>-->
        <option value="�Ƿ���ѵ��">�Ƿ���ѵ��</option>
        <option value="�Ƿ�������">�Ƿ�������</option>
        <option value="�Ƿ���ŷ��֮��">�Ƿ���ŷ��֮��</option>
        <option value="ŷ��֮�۶���">ŷ��֮�۶���</option>
        <option value="�Ѽ�����">�Ѽ�����</option>
        <option value="�Ƿ�������ѵ����">�Ƿ�������ѵ����</option>
        <option value="�Ƿ����۷�֮·">�Ƿ����۷�֮·</option>
    </select>
    ��Χ��
    <select id="scope">
        <option value="-1">ȫ��</option>
        <%
            ids = IDUtils.GETIDS();
            for(String id : ids) {
        %>
        <option value="<%=id%>"><%=IDUtils.getNick(id)%></option>
        <%
            }
        %>
    </select>
        ֵ��
    <input type="text" id="value"/>
    <input type="button" value="����" onclick="doSave();"/>
    </body>
<script type="text/javascript">
    function doEdit(key, value) {
        var p = key.indexOf(".");
        var kk = key;
        if(p != -1) {
            kk = key.substr(0,p);
        }
        for(var i = 0; i < document.getElementById('item').options.length; i++) {
            if(document.getElementById('item').options[i].value == kk) {
                document.getElementById('item').selectedIndex = i;
                break;
            }
        }
//        document.getElementById('item').value = key.substr(0,p);
        document.getElementById('scope').value = (p == -1) ? "-1" : key.substr(key.indexOf(".") + 1);
        document.getElementById('value').value = value;
        document.getElementById('value').focus();
    }

    function doSave() {
        var item = document.getElementById('item').value;
        var scope = document.getElementById('scope').value;
        var value = document.getElementById('value').value;
        var key = item;
        if(scope != -1) {
            key = key + "." + scope;
        }
        OgzqDwr.saveConfig(key, value, afterSave);
    }

    function afterSave(obj)
    {
        alert(obj);
        document.getElementById('item').value = '';
        document.getElementById('scope').value = '';
        document.getElementById('value').value = '';
    }

    function deleteConf(key)
    {
        OgzqDwr.deleteConfig(key, afterSave);
    }

    function edit(obj, email, conf, value, event) {
        if(event.target.tagName == 'INPUT') {
            return;
        }
        obj.innerHTML = "<input type='text' value='" + value + "' size='2' class='inputbox'/>" +
                        "<input type='hidden' value='" + email + "' name='email'/>" +
                        "<input type='hidden' value='" + conf + "' name='conf'/>" +
                        "<input type='button' value='��' onclick='saveConf(this);' style='padding-left: 1px;padding-right: 1px;'/>";
//        alert(obj.getElementsByTagName('input')[0].value);
    }

    function saveConf(obj) {
        var td = obj.parentNode;
        var value = td.getElementsByTagName('input')[0].value;
        var email = td.getElementsByTagName('input')[1].value;
        var conf = td.getElementsByTagName('input')[2].value;


        OgzqDwr.saveConfig(conf + (email == '' ? '' : ('.' + email)), value, afterSave);
    }
</script>
</html>