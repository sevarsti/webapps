/*
���˺�ķ���� �򸱱��������  ����  ����
*/
function BeckhamClub() {
    /*
    ��ʾ���Ľ���1  ����
    */
    this.GotoBeckhamClub = function () {
        $.post("BeckhamClub.aspx", { load: 1 }, function (result) {
            //result = "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1@9901|�����1|2*9901|�����2|2*9901|�����3|2*9901|�����4|2*9901|�����5|2*9901|�����6|2*9901|�����7|2*9901|�����8|2*9901|�����9|2*9901|�����10|2*9901|�����11|2";
            if (result == -1) {
                ShowMsg("ֻ������Ա�ſ��Բ��뱾�Ŷ��", "ȷ��", function () { $("#divMsg").remove(); }, "��ܰ��ʾ", null, null, 380, 150, $('#totalMainDiv'), 'divMsg', false);
                return;
            }
            //result = "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1@9901|�����1|2*9901|�����2|2*9901|�����3|2*9901|�����4|2*9901|�����5|2*9901|�����6|2*9901|�����7|2*9901|�����8|2*9901|�����9|2*9901|�����10|2*9901|�����11|2";
            var getterArr = result.split('@')[0].split('|');
            //19��������ͼƬ�������߲�����
            var cupImgs = "<div style='position:absolute;left:195px;top:78px;width:385px;height:274px;'>";
            for (var i = 0; i < getterArr.length; i++) {
                var getterName = getterArr[i];
                if (getterName != "-1") {
                    cupImgs += "<div style='position:absolute;left:" + (0 + parseInt(i % 7) * 58) + "px;top:" + (17 + parseInt(i / 7) * 96) + "px;width:35px;height:64px;background:url(Images/BeckhamClub/cup.png);' onmouseover='ShowTipBox(\"" + getterName + "\",$(this))'></div>";
                }
            }
            cupImgs += "</div>";
            //��ṱ��
            var clubMembers = "<div style='position:absolute;left:735px;top:20px;width:80px;color:white;font-weight:bold;font-size:20px;'>��ṱ��</div>";
            clubMembers += "<div style='position:absolute;left:670px;top:68px;width:200px;color:#FDE101;font-weight:bold;font-size:15px;'>";
            clubMembers += "<div style='position:absolute;left:0px;'>�����</div><div style='position:absolute;left:120px;'>�������</div></div>";
            //��ӹ��׵���Ϣ������10����Ҫ��ʾ������
            var MembersInfo = "<div style='position:absolute;left:0px;top:0px;width:200px;height:270px;color:white;font-weight:bold;font-size:14px;'>";
            if (result.split('@')[1] != "") {// || result.split('@')[1] != null || typeof (result.split('@')[1]) != 'undefined'
                var clubInfoArr = result.split('@')[1].split('*');
                for (var j = 0; j < clubInfoArr.length; j++) {
                    var MemberArr = clubInfoArr[j].split('|');
                    MembersInfo += "<div style='position:absolute;left:0px;top:" + (0 + j * 27) + "px;width:200px;height:27px;color:white;font-weight:bold;font-size:15px;'>";
                    MembersInfo += "<div class='clubName_b' style='position:absolute;left:0px;top:0px;cursor:pointer;'onclick='objTeam.ShowClub(" + MemberArr[0] + ")'>" + MemberArr[1] + "</div>";
                    MembersInfo += "<div style='position:absolute;left:152px;'>" + MemberArr[2] + "</div></div>";
                }
            }
            MembersInfo += "</div>";

            //�����������
            var MembersInfoSc = "";
            if (result.split('@')[1] != "" || result.split('@')[1] != null || typeof (result.split('@')[1]) != 'undefined') {
                var clubInfoArr = result.split('@')[1].split('*');
                if (clubInfoArr.length > 10) {
                    MembersInfoSc = "";
                    MembersInfoSc += "<div class='Container' style='position:absolute;top:100px;left:670px;width:200px;height:270px;'>";
                    MembersInfoSc += "<div id='Scroller-Game-ph' style='left:0px;width:200px;height:270px;position:absolute;overflow:hidden;'>";
                    MembersInfoSc += "<div class='Scroller-Container'>";
                    MembersInfoSc += "<div style='top:-7px;left:0px;height:" + 27 * (clubInfoArr.length) + "px;'></div>" + MembersInfo + "</div></div>";
                    MembersInfoSc += "<div id='Scrollbar-Container-ph' style='width:10px;height:270px;position:absolute;left:200px;top:-4px;'><div class='Scrollbar-Up'></div>";
                    MembersInfoSc += "<div class='Scrollbar-Track2' style='height:267px;'></div><div class='Scrollbar-Down'></div>";
                    MembersInfoSc += "<div class='Scrollbar-Track' style='height:273px;'><div class='Scrollbar-Handle'></div></div>";
                    MembersInfoSc += "</div></div>";
                } else {//����һҳ������ʾ������
                    MembersInfoSc += "<div style='position:absolute;top:100px;left:670px;'>" + MembersInfo + "</div>";
                }
            }
            //����ͼƬ+������ť+�콱��ť+���븱����ť
            var rewardImg = "<div style='position:absolute;left:488px;top:393px;width:36px;height:36px;background:url(Images/item/1107s.png);' onmouseover='ShowTipBox(\"��ͬ7��\",$(this))'></div>";
            rewardImg += "<div style='position:absolute;left:536px;top:393px;width:36px;height:36px;background:url(Images/item/1806s.png);' onmouseover='ShowTipBox(\"����6��\",$(this))'></div>";
            rewardImg += "<div class='div_btn4' style='position:absolute;left:790px;top:400px;font-size:13px;'onclick='BeckhamClubObj.ShowClubRank()'>�������</div>";
            rewardImg += "<div class='div_btn4' style='position:absolute;left:680px;top:400px;font-size:13px;'onclick='challengeObj.GoToChallenge()'>���븱��</div>";
            rewardImg += "<div class='div_btn4' style='position:absolute;left:508px;top:330px;font-size:13px;' onclick='BeckhamClubObj.ShowReward()'>��ȡ����</div>";
            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div style='width:910px;height:459px;background:url(Images/BeckhamClub/BeckhamClubBg1.jpg);position:absolute;left:6px;top:0px;'>" + cupImgs + clubMembers + MembersInfoSc + rewardImg + "</div>"
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(40, 85, 925, 494, "ӡ��6�1������", html, $('#totalMainDiv'), "ȷ��", null, "BeckhamClubUI", false, true, null)
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�
            $(".clubName_b").hover(function () { $(this).css({ "text-decoration": "underline", "color": "#F255B3" }); }, function () { $(this).css({ "text-decoration": "none", "color": "white" }); });
            //��ӹ�����ʱ ��Ҫ�Ĵ���
            if (result.split('@')[1] != "" || result.split('@')[1] != null || typeof (result.split('@')[1]) != 'undefined') {
                var clubInfoArr = result.split('@')[1].split('*');
                if (clubInfoArr.length > 10) {
                    var scrollbar = null;
                    scroller = new jsScroller(document.getElementById("Scroller-Game-ph"), 200, 270);
                    scrollbar = new jsScrollbar(document.getElementById("Scrollbar-Container-ph"), scroller, false);
                }
            }
        });
    }

    /*
    ��ʾ�����������  ����
    */
    this.ShowClubRank = function () {
        $.post("BeckhamClub.aspx", { ShowClubRank: 1 }, function (result) {
            // result = "101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12*101|�����|9910|�᳤��|12";
            var titles = "<div style='position:absolute;left:313px;top:75px;width:563px;color:white;font-weight:bold;font-size:16px;'>";
            titles += "<div style='position:absolute;left:50px;'>����</div><div style='position:absolute;left:170px;'>�����</div>";
            titles += "<div style='position:absolute;left:315px;'>�᳤</div><div style='position:absolute;left:440px;'>����������</div></div>";

            var rankInfo = "";
            var rankInfoSc = "";
            if (result != -2) {
                rankInfo += "<div style='position:absolute;left:0px;top:0px;width:563px;height:300px;color:gold;font-weight:bold;font-size:14px;'>";
                var rankArr = result.split('*');
                for (var i = 0; i < rankArr.length; i++) {
                    var oneRank = rankArr[i].split('|');
                    rankInfo += "<div style='position:absolute;left:0px;top:" + (0 + 30 * i) + "px;width:563px;height:30px;color:gold;font-weight:bold;font-size:14px;line-height:35px'>";
                    rankInfo += "<div style='position:absolute;left:50px;'>" + (i + 1) + "</div>";
                    rankInfo += "<div style='position:absolute;left:170px;'>" + oneRank[1] + "</div>";
                    rankInfo += "<div style='position:absolute;left:315px;cursor:pointer;'onclick='objTeam.ShowClub(" + oneRank[2] + ")'>" + oneRank[3] + "</div>";
                    rankInfo += "<div style='position:absolute;left:440px;'>" + oneRank[4] + "</div></div>";
                }
                rankInfo += "</div>";

                //�����������   313 112
                if (rankArr.length > 10) {
                    rankInfoSc += "<div class='Container' style='position:absolute;left:313px;top:112px;width:563px;height:300px;'>";
                    rankInfoSc += "<div id='Scroller-Game-ph' style='left:0px;width:563px;height:300px;position:absolute;overflow:hidden;'>";
                    rankInfoSc += "<div class='Scroller-Container'>";
                    rankInfoSc += "<div style='top:-7px;left:0px;height:" + 30 * (rankArr.length) + "px;'></div>" + rankInfo + "</div></div>";
                    rankInfoSc += "<div id='Scrollbar-Container-ph' style='width:10px;height:300px;position:absolute;left:550px;top:-4px;'><div class='Scrollbar-Up'></div>";
                    rankInfoSc += "<div class='Scrollbar-Track2' style='height:297px;'></div><div class='Scrollbar-Down'></div>";
                    rankInfoSc += "<div class='Scrollbar-Track' style='height:303px;'><div class='Scrollbar-Handle'></div></div>";
                    rankInfoSc += "</div></div>";
                } else {//����һҳ������ʾ������
                    rankInfoSc += "<div style='position:absolute;left:313px;top:112px;'>" + rankInfo + "</div>";
                }
            }
            var backBtn = "<div class='div_btn4' style='position:absolute;left:805px;top:425px;font-size:13px;' onclick='BeckhamClubObj.GotoBeckhamClub()'>����</div>";
            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div style='width:910px;height:459px;background:url(Images/BeckhamClub/BeckhamClubBg2.jpg);position:absolute;left:6px;top:0px;'>" + titles + backBtn + rankInfoSc + "</div>"
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(40, 85, 925, 494, "ӡ��6�1������", html, $('#totalMainDiv'), "ȷ��", null, "BeckhamClubUI", false, true, null)
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�
            // $(".rankshow").hover(function () { $(this).css("font-style", "oblique"); }, function () { $(this).css("font-style", "normal"); });
            //��ӹ�����ʱ ��Ҫ�Ĵ���
            if (result != -2) {
                if (rankArr.length > 10) {
                    var scrollbar = null;
                    scroller = new jsScroller(document.getElementById("Scroller-Game-ph"), 563, 300);
                    scrollbar = new jsScrollbar(document.getElementById("Scrollbar-Container-ph"), scroller, false);
                }
            }
        });
    }


    /*
    ��ʾ��������  ����
    */
    this.ShowReward = function () {
        var bestRewardImgArr = new Array(1108, 9206, 10012, 3307);
        var bestRewardNameArr = new Array('��ͬ8��x2', '6��װ����x2', '���Ҷһ�������У�x5', 'ս�����ֿ�10000��x5');
        var bestRewardNumArr = new Array(2, 2, 5, 5);
        var cupImg1 = new Array(1105, 7006);
        var cupImg2 = new Array(1804, 6017);
        var cupImg3 = new Array(1705, 1905);
        var cupImg4 = new Array(2603, 6017);
        var cupImg5 = new Array(1605, 7006);
        var cupImg6 = new Array(2104, 6017);
        var cupImg7 = new Array(10012, 1905);
        var cupImg8 = new Array(2403, 6017);
        var cupImg9 = new Array(1505, 7006);
        var cupImg10 = new Array(2503, 6017);
        var cupImg11 = new Array(3305, 6017);
        var cupImg12 = new Array(2304, 1905);
        var cupImg13 = new Array(1106, 7006);
        var cupImg14 = new Array(2204, 1905);
        var cupImg15 = new Array(2704, 1905);
        var cupImg16 = new Array(2803, 7006);
        var cupImg17 = new Array(1806, 7006);
        var cupImg18 = new Array(1205, 1305, 1405, 7006);
        var cupImg19 = new Array(2911, 1905);
        var itemname1 = new Array('��ͬ5��', 'ѵ����5000��');
        var itemname2 = new Array('����4��', '��Ա���鿨2000��');
        var itemname3 = new Array('սѥ5��', '����');
        var itemname4 = new Array('���˷���3��', '��Ա���鿨2000��');
        var itemname5 = new Array('����5��', 'ѵ����5000��');
        var itemname6 = new Array('������ѥ4��', '��Ա���鿨2000��');
        var itemname7 = new Array('���Ҷһ������У�', '����');
        var itemname8 = new Array('�������3��', '��Ա���鿨2000��');
        var itemname9 = new Array('ս��5��', 'ѵ����5000��');
        var itemname10 = new Array('��ʿ�۾�3��', '��Ա���鿨2000��');
        var itemname11 = new Array('ս������2000��', '��Ա���鿨2000��');
        var itemname12 = new Array('����������4��', '����');
        var itemname13 = new Array('��ͬ6��', 'ѵ����5000��');
        var itemname14 = new Array('ϣʽ���4��', '����');
        var itemname15 = new Array('����������ͬ4��', '����');
        var itemname16 = new Array('�߼�������ͬ3��', 'ѵ����5000��');
        var itemname17 = new Array('����6��', 'ѵ����5000��');
        var itemname18 = new Array('����5��', '��ͧ5��', '�ɻ�5��', 'ѵ����5000��');
        var itemname19 = new Array('�������鿨1000', '����');

        var itemNameArr = new Array(itemname1, itemname2, itemname3, itemname4, itemname5, itemname6, itemname7, itemname8, itemname9, itemname10, itemname11, itemname12, itemname13, itemname14, itemname15, itemname16, itemname17, itemname18, itemname19);
        var itemCodeArr = new Array(cupImg1, cupImg2, cupImg3, cupImg4, cupImg5, cupImg6, cupImg7, cupImg8, cupImg9, cupImg10, cupImg11, cupImg12, cupImg13, cupImg14, cupImg15, cupImg16, cupImg17, cupImg18, cupImg19);
        $.post("BeckhamClub.aspx", { ShowReward: 1 }, function (result) {
            //result = "1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"; //��־19����ť+1���󽱵İ�ť�Ƿ���
            stateArr = result.split('|');
            var bestReward = "<div style='position:absolute;left:320px;top:30px;width:542px;height:81px;background:url(Images/BeckhamClub/tiao_b.png);'></div>";
            bestReward += "<div style='position:absolute;left:340px;top:35px;width:75px;height:75px;background:url(Images/BeckhamClub/dajiang.png);' onmouseover='ShowTipBox(\"���մ�\",$(this))'></div>";
            //�󽱽���ͼƬ��ʾ
            for (var i = 0; i < bestRewardImgArr.length; i++) {
                var itemcode = bestRewardImgArr[i];
                var itemname = bestRewardNameArr[i];
                var itemNum = bestRewardNumArr[i];
                bestReward += "<div style='position:absolute;left:" + (420 + i * 50) + "px;top:60px;width:36px;height:36px;background:url(Images/item/" + itemcode + "s.png);' onmouseover='ShowTipBox(\"" + itemname + "\",$(this))'>";
                if (itemNum > 1) {
                    bestReward += "<div style='text-align:right;font-weight:bold;font-size:10px;color:white;position:absolute;left:0px;top:25px;width:36px;'>x" + itemNum + "</div>";
                }
                bestReward += "</div>";
            }
            if (stateArr[19] == 1) {
                bestReward += "<div class='div_btn2' style='position:absolute;left:790px;top:65px;font-size:13px;' onclick='BeckhamClubObj.getReward(20)'>��ȡ</div>";
            } else if (stateArr[19] == 2) {
                bestReward += "<div class='div_btn2grey' style='position:absolute;left:790px;top:65px;font-size:13px;'>����ȡ</div>";
            } else {
                bestReward += "<div class='div_btn2grey' style='position:absolute;left:790px;top:65px;font-size:13px;'>��ȡ</div>";
            }
            var nineteenCups = "<div style='position:absolute;left:0px;top:0px;width:542px;height:292px;'>";
            for (var i = 0; i < stateArr.length - 1; i++) {
                nineteenCups += "<div style='position:absolute;left:0px;top:" + (0 + 42 * i) + "px;width:542px;height:42px;'>"; //����һ����������Ԫ�ص�DIV
                nineteenCups += "<div style='position:absolute;left:0px;top:0px;width:542px;height:40px;background:url(Images/BeckhamClub/tiao_s.png);'></div>";
                nineteenCups += "<div style='position:absolute;left:20px;top:5px;height:40px;font-size:25px;font-weight:bold;color:white;'>" + (i + 1) + "<span style='font-size:14px;'>�Ž���</span></div>";
                //����ͼƬ��ʾ
                for (var j = 0; j < itemCodeArr[i].length; j++) {
                    var itemcode = itemCodeArr[i][j];
                    var itemname = itemNameArr[i][j];
                    nineteenCups += "<div style='position:absolute;left:" + (150 + j * 50) + "px;top:3px;width:36px;height:36px;background:url(Images/item/" + itemcode + "s.png);' onmouseover='ShowTipBox(\"" + itemname + "\",$(this))'>";
                    nineteenCups += "<div style='text-align:right;font-weight:bold;font-size:10px;color:white;position:absolute;left:0px;top:25px;width:36px;'>x2</div></div>";
                }

                if (stateArr[i] == 1) {
                    nineteenCups += "<div class='div_btn2' style='position:absolute;left:470px;top:8px;font-size:13px;' onclick='BeckhamClubObj.getReward(" + (i + 1) + ")'>��ȡ</div>";
                } else if (stateArr[i] == 2) {
                    nineteenCups += "<div class='div_btn2grey' style='position:absolute;left:470px;top:8px;font-size:13px;'>����ȡ</div>";
                } else {
                    nineteenCups += "<div class='div_btn2grey' style='position:absolute;left:470px;top:8px;font-size:13px;'>��ȡ</div>";
                }
                nineteenCups += "</div>";
            }
            nineteenCups += "</div>";

            //�����������  320 113
            var nineteenCupsSc = "";
            nineteenCupsSc += "<div class='Container' style='position:absolute;left:320px;top:113px;width:542px;height:292px;'>";
            nineteenCupsSc += "<div id='Scroller-Game-ph' style='left:0px;width:542px;height:292px;position:absolute;overflow:hidden;'>";
            nineteenCupsSc += "<div class='Scroller-Container'>";
            nineteenCupsSc += "<div style='top:-7px;left:0px;height:" + 42 * (19) + "px;'></div>" + nineteenCups + "</div></div>";
            nineteenCupsSc += "<div id='Scrollbar-Container-ph' style='width:10px;height:292px;position:absolute;left:550px;top:-4px;'><div class='Scrollbar-Up'></div>";
            nineteenCupsSc += "<div class='Scrollbar-Track2' style='height:290px;'></div><div class='Scrollbar-Down'></div>";
            nineteenCupsSc += "<div class='Scrollbar-Track' style='height:295px;'><div class='Scrollbar-Handle'></div></div>";
            nineteenCupsSc += "</div></div>";

            var readme = "<div style='position:absolute;left:25px;top:305px;width:275px;height:125px;font-size:16px;line-height:30px;color:white;' onclick='BeckhamClubObj.GotoBeckhamClub()'>����Աͨ����С��������ý��������ݽ��������Ի�ö�Ӧ�Ľ�����ȫ����Ա������ȡȨ�ޣ��������н�������������Ա���ɻ�����մ󽱣�</div>";
            var backBtn = "<div class='div_btn4' style='position:absolute;left:783px;top:425px;font-size:13px;'  onclick='BeckhamClubObj.GotoBeckhamClub()'>����</div>";
            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div style='width:910px;height:459px;background:url(Images/BeckhamClub/BeckhamClubBg3.jpg);position:absolute;left:6px;top:0px;'>" + bestReward + nineteenCupsSc + readme + backBtn + "</div>"
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(40, 85, 925, 494, "ӡ��6�1������", html, $('#totalMainDiv'), "ȷ��", null, "BeckhamClubUI", false, true, null)
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�

            //��ӹ�����ʱ ��Ҫ�Ĵ���
            var scrollbar = null;
            scroller = new jsScroller(document.getElementById("Scroller-Game-ph"), 542, 292);
            scrollbar = new jsScrollbar(document.getElementById("Scrollbar-Container-ph"), scroller, false);
        });
    }

    /*
    ��ȡ�¼�
    */
    this.getReward = function (index) {
        $.post("BeckhamClub.aspx", { getReward: index }, function (result) {
            //result = 1;
            if (result == 1) {
                ShowMsg("<div style='width:100%;text-align:center;font-size:14px;'>��ȡ�ɹ���</div>", null, function () { BeckhamClubObj.ShowReward(); }, "��ܰ��ʾ", function () { BeckhamClubObj.ShowReward(); }, null, 340, 120, $('#BeckhamClubUI'), 'divMsg2');
            } else if (result == -1) {
                ShowMsg("<div style='font-size:13px;'>�ܱ�Ǹ������᲻��48Сʱ��<br>������ȡ������</div>", null, function () { BeckhamClubObj.ShowReward(); }, "��ܰ��ʾ", function () { BeckhamClubObj.ShowReward(); }, null, 325, 120, $('#BeckhamClubUI'), 'divMsg2');
            } else {
                ShowMsg("��ȡʧ�ܣ������²���", null, function () { BeckhamClubObj.ShowReward(); }, "��ܰ��ʾ", function () { BeckhamClubObj.ShowReward(); }, null, 325, 120, $('#BeckhamClubUI'), 'divMsg2');
            }
        });
    }
}