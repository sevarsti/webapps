/*
���߷ֽ� � ����
*/
function ItemDecomposition() {
    /*
    ��ʾ��Ľ���  ����
    */
    this.GotoItemDecomposition = function () {
        $.post("ItemDecomposition.aspx", { type: 1 }, function (result) {
            //result:�ѷֽ�����*�Ƿ����ȡŷ��֮�꣨0��������ȡ��1����ȡ��*�Ƿ�VIP��0���ǣ�1�ǣ�
            //result = "2995*0*1��12��29��10��|12��30��24��";
            var ActivityBeginTime = result.split('��')[1].split('|')[0]; //���ʼʱ��
            var ActivityEndTime = result.split('��')[1].split('|')[1]; //�����ʱ��
            result = result.split('��')[0];
            var resultArr = result.split('*');
            var DecompositionNum = resultArr[0] <= 0 ? 0 : resultArr[0]; //�ѷֽ�����
            var canGet = resultArr[1]; //�Ƿ����ȡ
            var isVIP = resultArr[2]; //�Ƿ�VIP --------------------------------------------------------------------------------------------------2013.11.11�պ��Ϊ û��VIP���ƣ��˱�����������̶�ֵ��1
            isVIP = 1;
            //--------------------------------------------�Ժ����ӵ��ߺ͸��ķֽ�ĵ��ߵȼ�ʱ��ֻ��Ҫ�޸����������鼴��
            var ItemNameArr = new Array('��ͬ', '����', '��ͧ', '�ɻ�', '������ѥ', 'ϣʽ���', '����������', '�������', '��ʿ�۾�', '���˷���', '����������ͬ', '�߼�������ͬ', 'ս��', '����', 'սѥ', '����');
            var ItemNameValueArr = new Array(110, 120, 130, 140, 210, 220, 230, 240, 250, 260, 270, 280, 150, 160, 170, 180);
            var LevelArr = new Array('1��', '2��', '3��', '4��', '5��', '6��');

            var mainHtml = "<div style='position:absolute;left:210px;top:180px;font-size:18px;color:white;'>ѡ���������</div>";
            mainHtml += "<select id='ItemName'  style='position:absolute;left:330px;top:178px;width:100px;height:27px;font-size:14px;' onchange='ItemDecompositionObj.changeNum()'>";
            for (var i = 0; i < ItemNameArr.length; i++) {
                mainHtml += "<option value='" + ItemNameValueArr[i] + "'>" + ItemNameArr[i] + "</option> ";
            }
            mainHtml += "</select>";
            mainHtml += "<div style='position:absolute;left:210px;top:232px;font-size:18px;color:white;'>ѡ����ߵȼ�</div>";
            mainHtml += "<select id='ItemLevel'  style='position:absolute;left:330px;top:238px;width:100px;height:27px;font-size:14px;letter-spacing:2px' onchange='ItemDecompositionObj.changeNum()'>";
            for (var i = 0; i < LevelArr.length; i++) {
                mainHtml += "<option value='" + (i + 1) + "'>" + LevelArr[i] + "</option> ";
            }
            mainHtml += "</select>";
            mainHtml += "<input id='hidden' type='hidden' value=''/>"; //������value���ڱ���Ҫ�ֽ�ĵ����ڱ����е�������
            mainHtml += "<div style='position:absolute;left:210px;top:284px;font-size:18px;color:white;'>����ֽ�����</div>";
            mainHtml += "<input id='InputNum' style='position:absolute;left:330px;top:283px;width:98px;height:20px;text-align:left;font-size:14px;' value='1' onkeyup='ItemDecompositionObj.formatNum(this)' onclick='ItemDecompositionObj.GetNum()'/>";
            mainHtml += "<div class='div_btn4' style='left:245px;top:330px;font-size:14px;color:white;position:absolute;cursor:pointer;'onclick='ItemDecompositionObj.doItemDecomposition(2," + isVIP + ")'>100%�ֽ�</div>";
            mainHtml += "<div class='div_btn2' style='left:370px;top:330px;font-size:14px;color:white;position:absolute;cursor:pointer;'onclick='ItemDecompositionObj.doItemDecomposition(1," + isVIP + ")'>�ֽ�</div>";
            mainHtml += "<div style='position:absolute;left:485px;top:180px;font-size:18px;color:white;'>�ѷֽ�����</div>";
            mainHtml += "<div style='position:absolute;left:585px;top:178px;width:102px;height:27px;background:url(Images/ItemDecomposition/whiteBg.png);'>";
            mainHtml += "<div id='AllTime' style='position:absolute;top:3px;width:102px;text-align:center;font-size:18px;'>" + DecompositionNum + "</div></div>";
            mainHtml += "<div style='position:absolute;left:505px;top:230px;width:74px;height:74px;background:url(Images/ItemDecomposition/Frame.png);'>";
            mainHtml += "<div style='position:absolute;left:4px;top:4px;width:64px;height:64px;background:url(Images/Item/11202.png);'></div></div>";
            if (canGet == 1) {
                mainHtml += "<div id='getBtn' class='div_btn2' style='left:606px;top:260px;font-size:14px;color:white;position:absolute;cursor:pointer;'onclick='ItemDecompositionObj.getReward()'>��ȡ</div>";
            } else if (canGet == 0) {
                mainHtml += "<div id='getBtn' class='div_btn2grey' style='left:606px;top:260px;font-size:14px;color:white;position:absolute;'>��ȡ</div>";
            } else {
                mainHtml += "<div id='getBtn' class='div_btn2grey' style='left:606px;top:260px;font-size:14px;color:white;position:absolute;'>��ȡ</div>";
            }

            //�ʱ��
            var activityTime = "<div style='position:absolute;left:315px;top:99px;font-size:14px;color:#FFFF00;width:275px;text-align:center;'>�ʱ�䣺" + ActivityBeginTime + "��" + ActivityEndTime + "</div>";
            //�˵��
            var activityDesc = "<div style='position:absolute;left:125px;top:400px;width:690px;height:50px;font-size:12px;color:white;line-height:18px;'>";
            activityDesc += "�˵����<br>��ڼ���,��ҿ��Խ�����Ҫ��ǩԼ���߽��зֽ⣬���߷ֽ���Ի��ս�����ֿ���ѵ��������Ա���鿨��һ�����߷ֽ��Ӧһ�ſ�Ƭ���м��ʷֽⷭ��Ŷ~����ȻҲ�м��ʷֽ�ʧ�ܣ�ʧ�ܺ������ʧ��ÿ�ֽ�2000�����߸����������ȡŷ��֮��һ��";
            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div id='mainHTML' style='width:909px;height:457px;background:url(Images/ItemDecomposition/Bg.jpg);position:absolute;left:6px;top:0px;'>" + mainHtml + activityTime + activityDesc + "</div>"
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(40, 85, 925, 494, "�ֽ�6�1�������", html, $('#totalMainDiv'), "ȷ��", null, "ItemDecompositionUI", false, true, null);
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�
            $("#InputNum").blur(function () {
                var InputVal = $("#InputNum").val();
                if (InputVal == '' || InputVal == null || InputVal <= 0) {
                    $("#InputNum").val('1'); alert123();
                }
            });
        });
    }
    //ȥ�����Ϸ��ַ���ֻ��������
    this.formatNum = function (dom) {
        var val = $(dom).val();
        $(dom).val(val.replace(/\D/g, ''));
        var newVal = $(dom).val();
        var allNum = $("#hidden").val();
        if (allNum == 0 || parseInt(newVal) == 0) {
            $(dom).val(1);
        }
        else if (parseInt(newVal) > parseInt(allNum)) {
            $(dom).val(allNum);
        }
    }
    this.changeNum = function () {
        $("#InputNum").val(1);
    }
    //����ItemCode����ڱ����е�����,����ֵ��������
    this.GetNum = function () {
        var ItemNameVal = $("#ItemName").val();
        var ItemLevelVal = $("#ItemLevel").val();
        var ItemCode = ItemNameVal + "" + ItemLevelVal;
        $.post("ItemDecomposition.aspx", { type: 4, ItemCode: ItemCode }, function (result) {
            $("#hidden").val(result);
        });
    }
    //�ֽ�  mold=1,��ͨ�ֽ⣻mold=2,100%�ֽ�
    this.doItemDecomposition = function (mold, isVIP) {
        if (isVIP == 0) {
            ShowMsg("ʹ��VIP������˹��ܣ�", null, function () { $("#divMsg2").remove(); GotoStore(); }, "��ܰ��ʾ", function () { $("#divMsg2").remove(); }, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
        } else {
            var num = parseInt($("#InputNum").val()); //����
            var ItemNameVal = $("#ItemName").val();
            var ItemLevelVal = $("#ItemLevel").val(); //�ȼ�
            var ItemCode = ItemNameVal + "" + ItemLevelVal; //Itemcode
            //var ItemName = document.all.ItemName.options[document.all.ItemName.selectedIndex].text + ItemLevelVal + "��"; //���ߵ�����
            var ItemName = $("#ItemName").find("option:selected").text() + ItemLevelVal + "��";  //��ȡSelectѡ���Text

            var needGameCoin = parseInt(ItemLevelVal) * 10 * num; //��ͨ�ķֽ���Ҫ���ѵ�����-----------------------------------------------------------���п�����Ҫ�ĵĵط�----------------------
            if (mold == 2) {//100%�ֽ���Ҫ���ѵ�����
                needGameCoin = 6 * needGameCoin; //----------------------------------------------------------------------------------------------------���п�����Ҫ�ĵĵط�----------------------
            }
            ShowMsg("��" + num + "��" + ItemName + "���зֽ⣬<br>����" + needGameCoin + "���ң�ȷ����", null, function () {
                $.post("ItemDecomposition.aspx", { type: 2, mold: mold, itemCode: ItemCode, count: num }, function (result) {
                    //1@��õĵ�����|����*��õĵ�����|����
                    //result = "1@��ͬ1��|1";
                    if (result == -1) {
                        ShowMsg("ʹ��VIP������˹��ܣ�", null, function () { GotoStore(); }, "��ܰ��ʾ", null, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
                    } else if (result == -2) {
                        ShowMsg("�ܱ�Ǹ��������Ҳ��㣡", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", null, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
                    } else if (result == -3) {
                        ShowMsg("���޸ķֽ���������������������ӵ�е�������", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", null, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
                    } else if (result == -4) {
                        ShowMsg("������û�иõ��ߣ���ֽ��������ߣ�", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", null, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
                    } else if (result.lastIndexOf("@") > 0) {
                        publicAddGSEL(2, -parseInt(needGameCoin));
                        var gettedItemInfoArr = "";
                        if (result.split('@')[1].lastIndexOf("*") > 0) {
                            gettedItemInfoArr = result.split('@')[1].split('*');
                        } else {
                            gettedItemInfoArr = new Array(result.split('@')[1]);
                        }
                        ItemDecompositionObj.splitArr(gettedItemInfoArr, num);
                    }
                });
            }, "��ܰ��ʾ", function () { $("#divMsg2").remove(); }, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
        }
    }
    //�ֽ������С����
    this.splitArr = function (arr, num) {
        var item = "";
        var getNum = 0; // ��¼�ֽ��õ���������������0��ʾ�ֽ�ʧ�ܣ�����0����ʾ�ֽ����˵���
        var html = "��ϲ���ֽ���";
        for (var i = 0; i < arr.length; i++) {
            item = arr[i].split('|');
            if (item[0] != -1) {
                getNum = getNum + 1;
                html += item[0] + "*" + item[1] + ",";
            }
        }
        if (getNum == 0) {
            html = "���ź����ֽ����ˣ�";
        } else if (getNum >= 1) {
            html = html.substring(0, html.length - 1);
        }
        ShowMsg(html, null, function () { $("#divMsg2").remove(); ItemDecompositionObj.updateAllTime(num); }, "��ܰ��ʾ", function () { ItemDecompositionObj.updateAllTime(num); }, null, 180, 180, $('#ItemDecompositionUI'), 'divMsg2');
    }
    //�ֽ���ɺ�����ʧ����񣩵��ȷ����رյ��¼�:��������������ȡ��ť�Ƿ�ɵ㣬����ֽ�������Ϊ1
    this.updateAllTime = function (num) {
        num = parseInt(num);
        var AllTime = num + parseInt($("#AllTime").text());
        $("#AllTime").text(AllTime);
        var cha = parseInt(AllTime / 2000) - parseInt((AllTime - num) / 2000);
        if (cha >= 1) {
            $("#getBtn").remove();
            $("#mainHTML").append("<div id='getBtn' class='div_btn2' style='left:606px;top:260px;font-size:14px;color:white;position:absolute;cursor:pointer;'onclick='ItemDecompositionObj.getReward()'>��ȡ</div>");
            $("#InputNum").val('1');
        }
    }

    //�����ȡ��ťʱ�������¼�
    this.getReward = function () {
        $.post("ItemDecomposition.aspx", { type: 3 }, function (result) {
            if (result == 1) {
                ShowMsg("��ȡ�ɹ����ѷ��ŵ������У�ע����գ�", null, function () { $("#divMsg2").remove(); ItemDecompositionObj.GotoItemDecomposition(); }, "��ܰ��ʾ", function () { ItemDecompositionObj.GotoItemDecomposition(); }, null, 270, 220, $('#ItemDecompositionUI'), 'divMsg2');
            } else if (result == -1) {
                ShowMsg("����ȡ�������ù⣬<br>����Ŭ���ֽ�ɣ�", null, function () { $("#divMsg2").remove(); ItemDecompositionObj.GotoItemDecomposition(); }, "��ܰ��ʾ", function () { ItemDecompositionObj.GotoItemDecomposition(); }, null, 270, 220, $('#ItemDecompositionUI'), 'divMsg2');
            }
        });
    }

}

