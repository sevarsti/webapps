//ˢˢ�� �
//ÿ��������Ҫע���޸ĵĵط���1.�ʱ��activityTime 2.ZheKouImgs�����Ƿ��б仯(��������±�Ҫ�ͺ�̨���������������ֶ�Ӧ������); 3.�ʱ�䣺activityTime
function ShuaShuaLe() {

    //-----------------------------------------------�����Ǽ�ǿ���ˢˢ��-----ֻ�ǽ���ͼ���ˣ���������һ��------------------------------------------------------------------------
    this.GotoShuaShuaLe = function (typeIndex) {
        //typeIndex:1��ͨ��    2��ǿ��    3������
        var Name = "ˢˢ��";
        var Bg_Main = 'ShuaShuaLeBg_jq'; var Frame_Card = 'Frame_jq';
        if (typeIndex == null) { typeIndex = 2; }
        if (typeIndex == 1) {
            Bg_Main = 'ShuaShuaLeBg'; Frame_Card = 'Frame';
        } else if (typeIndex == 2) {
            Bg_Main = 'ShuaShuaLeBg_jq'; Name = 'ˢˢ�ּ�ǿ��';
        } else if (typeIndex == 3) {
            Bg_Main = 'ShuaShuaLeBg_hh'; Name = 'ˢˢ�ֺ�����';
        }
        $.post("ShuaShuaLe.aspx", { load: 1 }, function (result) {
            //result��ʽ�����6�����ߵ���Ϣ@��ҫ�������Ϣ@ʣ�����@ˢ�£�0���,1����ң�@6�������Ƿ��ѹ���
            //            ������Ϣ��ʽ�� ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��*ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��*ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��*...ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��
            //            ��ҫ���ʽ��clubname|itemname*clubname|itemname*....
            //ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��*...*ItemCode|des|ԭ��|�ּ�|�ۿۣ�0-8��@clubname|itemname*...*clubname|itemname@ʣ�����@ˢ�£�0���,1����ң�@1|1|1|1|1|1��0�ѹ���1�ɹ���
            //result = "1704|սѥ4��|800|208|2*1905|����|100|46|4*1705|սѥ5��|4000|1440|0*1505|ս��5��|4000|640|0*2803|�߼�������ͬ3��|90|33|3*1505|ս��5��|4000|1040|2@�����|ŷ��֮��*�����2|��ͬ1��@10@0@1|1|1|1|1|1��12��29��10��|12��30��24��";
            var ActivityBeginTime = result.split('��')[1].split('|')[0]; //���ʼʱ��
            var ActivityEndTime = result.split('��')[1].split('|')[1]; //�����ʱ��
            result = result.split('��')[0];

            var cardLefts = new Array('25', '230', '435');
            var cardTops = new Array('157', '285');
            var ZheKouImgs = new Array('0', '0.6', '1.6', '2.6', '3.6', '4.6', '5.6', '6.6', '7.6', '8.6');
            if (result == -1) {
                return;
            }
            var resultArr = result.split('@');
            var allTools = resultArr[0].split('*'); //������Ƭ�ϵĵ��ߵ���Ϣ
            var buyNum = resultArr[2]; // ʣ�๺��Ĵ���
            var isFree = resultArr[3]; //�Ƿ����ˢ��
            var isBuyed = resultArr[4].split('|'); //���������Ƿ��ѹ���

            //���е�������Ƭ
            var Cards = "";
            for (var i = 0; i < allTools.length; i++) {
                var oneCard = allTools[i].split('|');
                Cards += "<div style='width:194px;height:119px;background:url(" + ImgPath + "Images/ShuaShuaLe/" + Frame_Card + ".png);position:absolute;left:" + cardLefts[i % 3] + "px;top:" + cardTops[parseInt(i / 3)] + "px;'>";
                Cards += "<div style='width:64px;height:64px;background:url(" + ImgPath + "Images/Item/" + oneCard[0] + ".png);position:absolute;left:15px;top:17px;'></div>";
                Cards += "<div style='width:47px;height:47px;background:url(" + ImgPath + "Images/ShuaShuaLe/ZheKou/" + ZheKouImgs[oneCard[4]] + ".png);position:absolute;left:148px;top:0px;'></div>";
                Cards += "<div style='position:absolute;left:88px;top:21px;font-size:12px;color:white;line-height:20px;font-weight:bold;width:105px;'>ԭ�ۣ�<span style='color:gold;'>" + oneCard[2] + "</span>���<br>�ּۣ�<span style='color:gold;'>" + oneCard[3] + "</span>���</div>";
                Cards += "<div style='position:absolute;left:15px;top:92px;width:64px;font-size:14px;color:#FFFF10;text-align:center;font-weight:bold;white-space: nowrap;'>" + oneCard[1] + "</div>";
                if (isBuyed[i] == 1) {//itemcode, itemdes, zhekou, price_now, num_buy, i
                    Cards += "<div class='div_btn2Y' style='position:absolute;left:105px;top:65px;font-weight:bold;' onclick='ShuaShuaLeObj.beforeBuy(" + oneCard[0] + ",\"" + oneCard[1] + "\"," + oneCard[3] + "," + oneCard[4] + "," + buyNum + "," + i + "," + typeIndex + ")' >����</div>";
                } else if (isBuyed[i] == 0) {
                    Cards += "<div class='div_btn2grey' style='position:absolute;left:105px;top:65px;font-weight:bold;'>�ѹ���</div>";
                }
                Cards += "</div>";
            }
            //��ʾ0��ҹ��򵽵��ߵ����
            var playersMsg = "<div style='width:198px;height:162px;position:absolute;left:685px;top:54px;text-align:left;font-size:12px;color:black;overflow:hidden;'>";
            var freePlayers = ''; //0��ҹ��򵽵��ߵ������Ϣ
            if (resultArr[1].length > 0) {
                freePlayers = resultArr[1].split('*');
                for (var i = 0; i < freePlayers.length; i++) {
                    var onePlayer = freePlayers[i].split('|');
                    playersMsg += "<div style='width:100%;height:21px;overflow:hidden;white-space: nowrap;letter-spacing:-1px;'><span style='color:white;'>" + onePlayer[0] + "</span>&nbsp;<span style='color:red;font-weight:bold;'>0���</span>������<span style='color:green;'>" + onePlayer[1] + "</span></div>";
                }
            }
            playersMsg += "</div>";
            //ˢ�°�ť
            var refreshBtn = "<div id='id_refreshBtn' style='position:absolute;left:732px;top:320px;width:106px;height:41px;background:url(" + ImgPath + "Images/ShuaShuaLe/button01.png);letter-spacing:20px;font-weight:bold;font-size:25px;color:#000032;line-height:52px;cursor:pointer;' onclick='ShuaShuaLeObj.Refresh(" + isFree + "," + typeIndex + ")'>";
            refreshBtn += "<div style='position:absolute;left:25px;width:106px;height:41px;letter-spacing:15px;font-weight:bold;font-size:20px;color:#000032;line-height:40px;cursor:pointer;'>ˢ��</div></div>";
            //ҳ���ڵ�����������Ϣ
            var otherFonts = "<div style='text-align:center;font-size:14px;color:white;letter-spacing:4px;position:absolute;left:680px;top:250px;width:212px;line-height:30px;'>ʣ�๺�������<span style='color:red;font-weight:bold;'>" + buyNum + "</span>��";
            var font1 = "����ˢ��<span style='color:yellow;font-weight:bold;font-size:15px'>���</span>";
            if (isFree == 1) { font1 = "����ˢ����<span style='color:gold;font-weight:bold;'>10</span>���"; }
            otherFonts += "<br>" + font1 + "</div>";
            otherFonts += "<div style='text-align:center;font-size:12px;color:yellow;letter-spacing:2px;position:absolute;left:685px;top:385px;width:212px;'>ˢ�º������������ش���Ŷ��</div>";
            //�˵��
            var activityDesc = "<div class='div_btn4'  style='position:absolute;left:825px;top:430px;' onclick='ShuaShuaLeObj.ShowActivityDes()'>�˵��</div>";
            //�ʱ��
            var activityTime = "<div style='text-align:center;font-size:14px;font-weight:bold;color:#8C2671;position:absolute;left:155px;top:425px;'>�ʱ�䣺" + ActivityBeginTime + "��" + ActivityEndTime + "</div>";
            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div style='width:909px;height:457px;background:url(Images/ShuaShuaLe/" + Bg_Main + ".jpg) -2px -2px;position:absolute;left:5px;top:0px;'>" + Cards + playersMsg + otherFonts + refreshBtn + activityDesc + activityTime + "</div>";
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(60, 80, 922, 492, Name, html, $('#totalMainDiv'), null, null, "ShuaShuaLeUI", false, true, null);
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�
            //$("#ShuaShuaLeUI").css('display', 'none').fadeIn("fast");

            $("#id_refreshBtn").bind({ mouseover: function () { $(this).css({ background: 'url(Images/ShuaShuaLe/button02.png)' }); }, mouseout: function () { $(this).css({ background: 'url(Images/ShuaShuaLe/button01.png)' }); } });
        });
    }

    /*
    ��ʾ�˵��
    */
    this.ShowActivityDes = function () {
        var desc = "";
        desc += "<div style = 'position:absolute;top:35px;left:35px;width:520px;font-size:14px;line-height:35px;'>";
        desc += "<div style = 'position:absolute;width:400px;font-size:14px;'>1�������ˢ�¡���ť��ˢ��6��������߼�����ۿۣ�����п���ˢ��<span style = 'color:red;font-weight:bold;font-size:16px;'>���</span>������ߵĻ��ᡣ<br>2��ÿ�첻����ˢ�´�����ÿ��ǰ���ο�<span style = 'color:red;font-weight:bold;font-size:16px;'>���</span>ˢ�£��˺�ÿ��ˢ��������10��ҡ�<br>3���ڻ�ڼ��ڣ�ÿ��ÿ���޹�20�ε��ߡ�</div></div>";
        var html = createBg(5, 0, 450, 260) + desc;
        AddBox(160, 80, 465, 297, "ˢˢ�ֻ˵��", html, $('#ShuaShuaLeUI'), null, null, "ShuaShuaLeDes", false, true, null);
        $("#ShuaShuaLeDes").css('display', 'none').fadeIn("fast");
    }
    /*
    ���ˢ��ǰ
    */
    this.Refresh = function (isFree, typeIndex) {
        if (parseInt(isFree) == 0) {//���ˢ��
            ShuaShuaLeObj.doRefresh(isFree, typeIndex);
        }
        else if (parseInt(isFree) == 1) {//���Ľ��ˢ��
            ShowMsg("<div style='width:100%;text-align:center'>����ˢ�½�����10��ң�<br>�Ƿ������</div>", "ȷ��", function () { ShuaShuaLeObj.doRefresh(isFree, typeIndex); }, "��ܰ��ʾ", null, null, 220, 160, $('#ShuaShuaLeUI'), 'divChangEMsg', false, 'ȡ��');
        }
    }
    /*
    ��ʼˢ��
    */
    this.doRefresh = function (isFree, typeIndex) {
        $.post("ShuaShuaLe.aspx", { refresh: 1 }, function (result) {
            //-1��Ҳ��㣬-2ˢ��ʧ�ܣ�1�ɹ�
            //result = "1";
            if (parseInt(result) == 1) {//ˢ�³ɹ�
                if (isFree == 1) {//��10��
                    ShowMsg("<div style='width:100%;text-align:center'>ˢ�³ɹ���</div>", "ȷ��", function () {
                        publicAddGSEL(1, -parseInt(10));
                        ShuaShuaLeObj.GotoShuaShuaLe(typeIndex);
                    }, "��ܰ��ʾ", function () {
                        publicAddGSEL(1, -parseInt(10));
                        ShuaShuaLeObj.GotoShuaShuaLe(typeIndex);
                    }, null, 221, 159, $('#ShuaShuaLeUI'), 'divMsg2', false);
                } else if (isFree == 0) {//���
                    ShowMsg("<div style='width:100%;text-align:center'>ˢ�³ɹ���</div>", "ȷ��", function () {
                        ShuaShuaLeObj.GotoShuaShuaLe(typeIndex);
                    }, "��ܰ��ʾ", function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, null, 221, 159, $('#ShuaShuaLeUI'), 'divMsg2', false);
                }
            } else if (parseInt(result) == -1) {//��Ҳ���
                $("#divChangEMsg").remove();
                OpenPayMsg();
            } else {
                ShowMsg("ˢ��ʧ��", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", null, null, 221, 159, $('#ShuaShuaLeUI'), 'divMsg2');
            }
        });
    }

    /*
    ����ǰ
    */
    this.beforeBuy = function (itemcode, itemdes, price_now, zhekou, num_buy, i, typeIndex) {
        if (num_buy == "0" || num_buy == 0) {
            ShowMsg("���ĵ��칺��������ù�Ŷ��", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, null, 221, 159, $('#ShuaShuaLeUI'), 'divMsg');
        }
        else if (zhekou != "0" || zhekou != 0) {
            ShowMsg("����˵�����Ҫ����" + price_now + "��ң�<br>ȷ������", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.doBuy(itemcode, itemdes, price_now, zhekou, i, typeIndex); }, "��ܰ��ʾ", null, null, 221, 159, $('#ShuaShuaLeUI'), 'divMsg');
        } else {
            ShuaShuaLeObj.doBuy(itemcode, itemdes, price_now, zhekou, i, typeIndex);
        }
    }
    /*
    ȷ�Ϲ���
    */
    this.doBuy = function (itemcode, itemdes, price_now, zhekou, i, typeIndex) {
        $.post("ShuaShuaLe.aspx", { Buy: itemcode + "*" + zhekou + "*" + i }, function (result) {
            //-1��Ҳ��㣬-2����ʧ�ܣ�1�ɹ���2��������
            //result = "1";
            switch (result) {
                case "1":
                    publicAddGSEL(1, -parseInt(price_now));
                    ShowMsg("��ϲ��������" + itemdes + "�ɹ�", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, null, 220, 160, $('#ShuaShuaLeUI'), 'divMsg');
                    break;
                case "-1":
                    OpenPayMsg();
                    break;
                case "-2":
                    ShowMsg("����ʧ��", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, null, 220, 160, $('#ShuaShuaLeUI'), 'divMsg');
                    break;
                case "2":
                    ShowMsg("���ĵ��칺��������ù�Ŷ��", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", null, function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, 220, 160, $('#ShuaShuaLeUI'), 'divMsg');
                    break;
                case "-5":
                    ShowMsg("���ڻʱ���ڣ�", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", null, function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, 220, 160, $('#ShuaShuaLeUI'), 'divMsg');
                    break;
                default:
                    ShowMsg("����ʧ��", null, function () { $("#divMsg").remove(); ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, "��ܰ��ʾ", function () { ShuaShuaLeObj.GotoShuaShuaLe(typeIndex); }, null, 220, 160, $('#ShuaShuaLeUI'), 'divMsg');
            }
        });
    }


}



  