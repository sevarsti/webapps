<%@ include file="../include/include.jsp"%>
<html>
<head>
<title>ϵͳ����</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<script type="text/javascript" language="javascript">
    <!--
    function show(src, url) {
        var elements = document.getElementsByTagName('table');
        for(i = 0; i < elements.length; i++) {
            if(elements[i].className == 'BaseMenuItem' || elements[i].className == 'BaseMenuItemActive') {
                elements[i].className = 'BaseMenuItem';
            }
        }
        src.className = 'BaseMenuItemActive';
        top.right.location = url;
    }

    function updateShow(obj) {
        var currentstatus = obj.parentNode.rows[obj.rowIndex + 1].style.display;
        if(currentstatus == 'none') {
            currentstatus = '';
        } else {
            currentstatus = 'none';
        }
        for(var i = obj.rowIndex + 1; i < obj.parentNode.rows.length; i++) {
            if(obj.parentNode.rows[i].style.height == '1%') {
                obj.parentNode.rows[i].style.display = currentstatus;
            } else {
                break;
            }
        }
//        alert(this.style.height + ',' + this.parentNode.rows[this.rowIndex + 1].style.height)
    }
    //-->
</script>
</head>
<body>
<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="1">
<%--
    <tr style="height:17px;cursor:pointer;" onclick="updateShow(this);">
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%"
                   style="height:100%;background-image:url(../images/panelbar/sep_bg.gif)">
                <tr>
                    <td width="1"><img src="../images/panelbar/sep_begin.gif" border="0"/></td>
                    <td align="center" nowrap><b>��Ϣ</b></td>
                    <td width="1"><img src="../images/panelbar/sep_end.gif" border="0"/></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:1%"><td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"onclick="show(this, '/msg/privateMsg.do?method=write');">
            <tr><td align="center" nowrap width="98%">
                    д��Ϣ
            </td></tr>
        </table>
    </td></tr>
    <tr style="height:1%"><td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"onclick="show(this, '/msg/privateMsg.do?method=myMsg&readflag=-1');">
            <tr><td align="center" nowrap width="98%">
                    �ҵ���Ϣ
            </td></tr>
        </table>
    </td></tr>
    <sys:CheckMenuRightTag resourcePath="�˵�Ȩ��/���˹�����">
        <tr style="height:17px;cursor:pointer;" onclick="updateShow(this);">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%"
                       style="height:100%;background-image:url(../images/panelbar/sep_bg.gif)">
                    <tr>
                        <td width="1"><img src="../images/panelbar/sep_begin.gif" border="0"/></td>
                        <td align="center" nowrap><b>���˹�����</b></td>
                        <td width="1"><img src="../images/panelbar/sep_end.gif" border="0"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </sys:CheckMenuRightTag>
--%>
    <sys:CheckMenuRightTag resourcePath="�˵�Ȩ��/ŷ������">
        <tr style="height:17px;cursor:pointer;" onclick="updateShow(this);">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%"
                       style="height:100%;background-image:url(../images/panelbar/sep_bg.gif)">
                    <tr>
                        <td width="1"><img src="../images/panelbar/sep_begin.gif" border="0"/></td>
                        <td align="center" nowrap><b>ŷ������</b></td>
                        <td width="1"><img src="../images/panelbar/sep_end.gif" border="0"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/ogzq/main.jsp');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ��ҳ��
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/ogzq/uplevel.jsp');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ����ʵ��
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/ogzq/monitor.jsp?show=1');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ���ս���
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/ogzq/monitor.jsp');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ���ս�鿴
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </sys:CheckMenuRightTag>
    <sys:CheckMenuRightTag resourcePath="�˵�Ȩ��/ϵͳ����">
    <tr style="height:17px;cursor:pointer;" onclick="updateShow(this);">
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%"
                   style="height:100%;background-image:url(../images/panelbar/sep_bg.gif)">
                <tr>
                    <td width="1"><img src="../images/panelbar/sep_begin.gif" border="0"/></td>
                    <td align="center" nowrap><b>ϵͳ����</b></td>
                    <td width="1"><img src="../images/panelbar/sep_end.gif" border="0"/></td>
                </tr>
            </table>
        </td>
    </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/position.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ��λ��ѯ
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/employee.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            Ա����ѯ
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/resource.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ��Դ��ѯ
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/right.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            Ȩ�޲�ѯ
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/right.do?method=table');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            Ȩ�ޱ�
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/workflow/workflow.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ������
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/workflow/task.do?method=myTask');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            �ҵ�����
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/sys/setting.do?method=list');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            ��������
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:1%">
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                        onclick="show(this, '/aliyun/buckets.jsp');">
                    <tr>
                        <td align="center" nowrap width="98%">
                            OSS
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </sys:CheckMenuRightTag>
    <tr style="height:1%">
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                    onclick="show(this, '/login.do?method=logout');">
                <tr>
                    <td align="center" nowrap width="98%">
                        ע��
                    </td>
                </tr>
            </table>
        </td>
    </tr>
<tr style="height:17px;cursor:pointer;" onclick="updateShow(this);">
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%"
               style="height:100%;background-image:url(../images/panelbar/sep_bg.gif)">
            <tr>
                <td width="1"><img src="../images/panelbar/sep_begin.gif" border="0"/></td>
                <td align="center" nowrap><b>�����ʦ</b></td>
                <td width="1"><img src="../images/panelbar/sep_end.gif" border="0"/></td>
            </tr>
        </table>
    </td>
</tr>
<tr style="height:1%">
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                onclick="show(this, '/rm/weekstage.jsp?my');">
            <tr>
                <td align="center" nowrap width="98%">
                    ���Ѵ���
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr style="height:1%">
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                onclick="show(this, '/rm/songStatus.jsp');">
            <tr>
                <td align="center" nowrap width="98%">
                    ����ͳ��
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr style="height:1%">
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="BaseMenuItem"
                onclick="show(this, '/rm/songScore.jsp');">
            <tr>
                <td align="center" nowrap width="98%">
                    ������ѯ
                </td>
            </tr>
        </table>
    </td>
</tr>
    <tr>
        <td></td>
    </tr>
</table>
</body>
</html>