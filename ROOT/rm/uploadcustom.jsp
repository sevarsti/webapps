<%--
  Created by IntelliJ IDEA.
  User: H00672
  Date: 2017/09/06 0006
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
    <title>�ϴ�������</title>
</head>
<body>
<form action="uploadcustomconfirm.jsp" method="post" enctype="multipart/form-data" >
<table border="0" cellpadding="1" cellspacing="1">
    <tr>
        <td class="fieldname">����</td>
        <td class="fieldvalue">
            <input type="text" name="name"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">·��</td>
        <td class="fieldvalue">
            <input type="text" name="path"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">����</td>
        <td class="fieldvalue">
            <input type="text" name="author"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">��ע</td>
        <td class="fieldvalue">
            <input type="text" name="memo"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname" valign="top">MP3</td>
        <td class="fieldvalue">
            <input type="file" name="mp3" accept=".MP3"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname" valign="top">Сͼ</td>
        <td class="fieldvalue">
            <input type="file" name="hdpng" accept=".PNG"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname" valign="top">��ͼ</td>
        <td class="fieldvalue">
            <input type="file" name="png" accept=".PNG"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname" valign="top">IMD</td>
        <td class="fieldvalue">
            <input type="file" name="imd" accept=".IMD"/><input type="button" onclick="doadd(this)" value="����" id="btn"/>
        </td>
    </tr>
</table>
    <input type="button" value="����" onclick="beforeSave();"/>
</form>
<script type="text/javascript">
    function beforeSave()
    {
        document.forms[0].submit();
    }
    function doadd(obj)
    {
        var imds = document.getElementsByName("imd");
        if(imds.length < 9)
        {
//            obj.parentNode.appendText("<br/>");
            var span = document.createElement("span");
            span.innerHTML = "<br/>";
            obj.parentNode.appendChild(span);
            var file = document.createElement("input");
            file.type = "file";
            file.name = "imd";
            file.accept = ".IMD";
            obj.parentNode.appendChild(file);
            var button = document.createElement("input");
            button.type = "button";
            button.onclick = document.getElementById('btn').onclick;
            button.value = "����";
            obj.parentNode.appendChild(button);
//            obj.parentNode.innerHTML = obj.parentNode.innerHTML + "<br/>" +
//                    "<input type=\"file\" name=\"imd\"/>\n" +
//                    "<input type=\"button\" onclick=\"doadd(this)\" value=\"����\"/>";
        }
    }
</script>
</body>
</html>
