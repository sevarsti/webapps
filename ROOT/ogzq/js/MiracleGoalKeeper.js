function MiracleGoalkeeper() {
    this.GotoMiracleGoalkeeper = function () {
        $.post("MiracleGoalKeeper.aspx", { Load: 1 }, function (result) {
            //result = "1|1|1|1|0|0|0@7@500";  //ԲȦ��Ϣ@��ǰ�ڼ���@��ӵ���Ž���
            var ActivityTimeStr = result.split('��')[1]; //�ʱ��
            result = result.split('��')[0];

            var state = result.split('@')[0].split('|');
            var step = result.split('@')[1];
            var cardnum = result.split('@')[2];
            var html = "<div id='div_keeper' style='width:909px;height:457px;left:5px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/bj.jpg);position:absolute;'></div>";
            //       html += "<div id='div_keeper' style='left:738px;top:135px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/circle.png);position:absolute;width:119px;height:118px;'></div>";
            html += "<div style='left:325px;top:100px;position:absolute;color:yellow;font-size:11px'>���ʱ�䡿" + ActivityTimeStr + "</div>";
            html += "<div style='left:784px;top:362px;position:absolute;color:white;font-size:14px;font-weight:bold;'>�Ž�������:" + cardnum + "</div>";
            html += "<div class='div_btn4' onclick='GoalkeeperObj.leap(" + cardnum + ")' style='left:790px;top:398px;position:absolute;color:white;font-size:12px;'>���Ծ��</div>"
            html += "<div style='left:792px;top:399px;width:12px;height:17px;position:absolute;background:url(" + ImgPath + "Images/MiracleGoalkeeper/arrow.png)'></div>"
            html += "<div id='btn_go' onclick='GoalkeeperObj.ReadyGo(" + step + ")' onmouseover='GoalkeeperObj.onbutton(1)' onmouseout='GoalkeeperObj.onbutton(2)' style='left:530px;top:380px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/butter.png);position:absolute;width:156px;height:42px;color:#3d1400;font-size:24px;font-weight:bold;text-align:center;line-height:40px;cursor:pointer;'>ǰ��&nbsp&nbsp" + step + "</div>";

            var cercleArr = new Array("196|66", "272|178", "320|314", "430|231", "522|132", "620|220", "738|135");
            var cardcountArr = new Array(1, 2, 3, 5, 10, 20, 30);
            var LeftPx = 0;
            var TopPx = 0;
            var cardcount = 0
            for (var i = 0; i < 7; i++) {
                LeftPx = cercleArr[i].split('|')[0];
                TopPx = cercleArr[i].split('|')[1];
                cardcount = cardcountArr[i];
                if (state[i] == 1) {
                    html += "<div style='left:" + LeftPx + "px;top:" + TopPx + "px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/circle.png);position:absolute;width:119px;height:118px;'></div>";
                }

                html += "<div style='left:" + (parseInt(LeftPx) + 26) + "px;top:" + (parseInt(TopPx) + 22) + "px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/k2.png);position:absolute;width:66px;height:66px;'></div>";
                html += "<div style = 'left:" + (parseInt(LeftPx) + 26) + "px;top:" + (parseInt(TopPx) + 22) + "px;position:absolute;width:64px;height:64px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/card.png)'></div>";
                if (i % 2 != 0) {
                    html += "<div class='div_btn2' onclick='GoalkeeperObj.Besafesure(" + (i + 1) + ")' style='left:" + (parseInt(LeftPx) + 36) + "px;top:" + (parseInt(TopPx) + 68) + "px;position:absolute;'>����</div>";
                }
                html += "<div style='left:" + (parseInt(LeftPx) + 72) + "px;top:" + (parseInt(TopPx) + 28) + "px;position:absolute;width:66px;height:66px;font-size:14px;color:yellow;font-weight:bold;'>" + cardcount + "</div>";
            }


            AddBox(120, 70, 922, 492, "�����Ž���Ծ��", html, null, null, null, 'Goalkeeper', null, null, null);
        });
    }
    this.onbutton = function (type) {
        if (type == "1") {
            $('#btn_go').css("background", "url(" + ImgPath + "Images/MiracleGoalkeeper/butter2.png)");
        } else if (type == "2") {
            $('#btn_go').css("background", "url(" + ImgPath + "Images/MiracleGoalkeeper/butter.png)");
        }
    }
    this.ReadyGo = function (step) {
        var gold = 0;
        if (step == "1") {
            gold = 20
        } else if (step == "2") {
            gold = 35
        } else if (step == "3") {
            gold = 50
        } else if (step == "4") {
            gold = 80
        } else if (step == "5") {
            gold = 150
        } else if (step == "6") {
            gold = 200
        } else if (step == "7") {
            gold = 260
        }
        ShowMsg("ȷ������" + gold + "���ǰ����", null, function () { GoalkeeperObj.GoAward(gold); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
    }
    this.GoAward = function (gold) {
        $.post("MiracleGoalKeeper.aspx", { GoAward: 1 }, function (result) {
            //result = 1;
            if (result == "1") {
                publicAddGSEL(1, -gold);
                ShowMsg("��ϲ��ǰ��һ��", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            } else if (result == "-1") {
                OpenPayMsg();
            } else if (result == "-3") {
                publicAddGSEL(1, -gold);
                ShowMsg("���ź���ǰ��ʧ�ܣ�����ԭ��", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            } else if (result == "-2") {
                publicAddGSEL(1, -gold);
                ShowMsg("���ź���ǰ��ʧ�ܣ������ٽ����յ�", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            }
        });
    }
    this.Besafesure = function (index) {
        var gold = 0;
        if (index == "2") {
            gold = 60;
        } else if (index == "4") {
            gold = 160;
        } else if (index == "6") {
            gold = 260;
        }
        ShowMsg("��ȷ������" + gold + "��ұ�����", null, function () { GoalkeeperObj.Besafe(index, gold); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
    }
    this.Besafe = function (index, gold) {
        $.post("MiracleGoalKeeper.aspx", { Besafe: index }, function (result) {
            if (result == "1") {
                publicAddGSEL(1, -gold);
                ShowMsg("��ϲ�����ճɹ�", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            } else if (result == "-1") {
                OpenPayMsg();
            } else if (result == "-2") {
                ShowMsg("����Ͷ�����գ�������Ͷ��Ŷ", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            } else {
                ShowMsg("����ʧ��", null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_gold');
            }
        });
    }
    this.leap = function (cardnum) {
        var html = "<div id='div_keeper' style='width:909px;height:457px;left:5px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/bj2.jpg);position:absolute;'></div>";
        if (cardnum >= 700) {
            var stateArr = new Array(1, 1, 1, 1, 1);
        } else if (cardnum >= 300) {
            var stateArr = new Array(1, 1, 1, 0, 1);
        } else if (cardnum >= 260) {
            var stateArr = new Array(0, 1, 1, 0, 1);
        } else if (cardnum >= 200) {
            var stateArr = new Array(0, 0, 1, 0, 1);
        } else {
            var stateArr = new Array(0, 0, 0, 0, 0);
        }
        html += "<div style = 'left:84px;top:412px;position:absolute;color:yellow'>���ʱ�䡿11��16��10:00-11��17��24:00</div>"
        //CreatePlayer(105, 5, "Super/10036.png", "����÷��", 6, null, 0, 0, null); //�ۺ�����,����λ��,ͷ��ͼ������,��Ա����,��ԱƷ��,��ԱID(null=������Ա���Կ�),��Ա��left,��Ա��top,��Ա��Ƭdiv��ID
        var PlayerHtml = "";
        var playerinfo = new Array("97|�Ž�|Spain/09/50901.png|��������˹|6", "93|�Ž�|Italy/08/30801.png|����|6", "92|�Ž�|England/08/40801.png|�к�|6", "95|�Ž�|Super/10014.png|������|6");
        var powerArr = new Array(102, 101, 100, 105);
        var playerpower = 0;
        var role = "";
        var imgpath = "";
        var playername = "";
        var quality = 0;
        for (var i = 0; i < 4; i++) {



            playerpower = playerinfo[i].split('|')[0];
            role = playerinfo[i].split('|')[1];
            imgpath = playerinfo[i].split('|')[2];
            playername = playerinfo[i].split('|')[3];
            quality = playerinfo[i].split('|')[4];
            PlayerHtml += "<div style = 'left:50px;top:" + (5 + i * 120) + "px;position:absolute;'>" + CreatePlayer(playerpower, 1, imgpath, playername, quality, null, 0, 0, null) + "</div>";
            PlayerHtml += "<div style = 'left:150px;top:" + (40 + i * 120) + "px;position:absolute;width:31px;height:31px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/+.png)'></div>";
            PlayerHtml += "<div style = 'left:200px;top:" + (26 + i * 120) + "px;position:absolute;width:64px;height:64px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/card.png)'></div>";
            PlayerHtml += "<div style = 'left:286px;top:" + (44 + i * 120) + "px;position:absolute;width:34px;height:22px;background:url(" + ImgPath + "Images/MiracleGoalkeeper/=.png)'></div>";
            if (i < 4) {
                PlayerHtml += "<div style = 'left:340px;top:" + (5 + i * 120) + "px;position:absolute;'>" + CreatePlayer(powerArr[i], 1, imgpath, playername, quality, null, 0, 0, null, "110000001") + "</div>";
            } else {
                PlayerHtml += "<div style = 'left:340px;top:" + (5 + i * 120) + "px;position:absolute;'>" + CreatePlayer(powerArr[i], 1, imgpath, playername, quality, null, 0, 0, null, "112") + "</div>";
            }
            if (stateArr[i] == "1") {
                PlayerHtml += "<div class='div_btn2' onclick='GoalkeeperObj.leapplayer(" + i + "," + cardnum + ")' style = 'left:440px;top:" + (44 + i * 120) + "px;position:absolute;'>Ծ��</div>";
            } else if (stateArr[i] == "0") {
                PlayerHtml += "<div class='div_btn2grey' style = 'left:440px;top:" + (44 + i * 120) + "px;position:absolute;cursor:default;'>Ծ��</div>";
            }

        }

        var Scrollbarjeap = "";
        Scrollbarjeap += "<div class='Container' style='position:absolute;left:386px;top:64px;width:500px;height:320px;'>";
        Scrollbarjeap += "<div id='Scroller-Game-ph' style='left:0px;width:500px;height:320px;position:absolute;overflow:hidden;'>";
        Scrollbarjeap += "<div class='Scroller-Container'>";
        Scrollbarjeap += "<div style='top:-7px;left:0px;height:550px;'></div>" + PlayerHtml + "</div></div>";
        Scrollbarjeap += "<div id='Scrollbar-Container-ph' style='width:10px;height:300px;position:absolute;left:500px;top:-4px;'><div class='Scrollbar-Up'></div>";
        Scrollbarjeap += "<div class='Scrollbar-Track2' style='height:320px;'></div><div class='Scrollbar-Down'></div>";
        Scrollbarjeap += "<div class='Scrollbar-Track' style='height:320px;'><div class='Scrollbar-Handle'></div></div>";
        Scrollbarjeap += "</div></div>";
        html += Scrollbarjeap;
        AddBox(0, 0, 922, 492, "�����Ž���Ծ��", html, $('#Goalkeeper'), null, function () { GoalkeeperObj.GotoMiracleGoalkeeper(); }, 'anagramsdiv2', null, null, null);
        scroller = new jsScroller(document.getElementById("Scroller-Game-ph"), 542, 292);
        scrollbar = new jsScrollbar(document.getElementById("Scrollbar-Container-ph"), scroller, false);
    }
    this.leapplayer = function (index, cardnum) {
        $.post("MiracleGoalKeeper.aspx", { leapplayer: index }, function (result) {
            if (result == "1") {
                ShowMsg("��ϲ��Ծ���ɹ�", null, function () { $('#anagramsdiv2').remove(); $('#div_leapplayer').remove(); GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_leapplayer');
            } else if (result == "-1") {
                ShowMsg("��û�д���Ա", null, function () { $('#anagramsdiv2').remove(); $('#div_leapplayer').remove(); GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_leapplayer');
            } else {
                ShowMsg("����ʧ��", null, function () { $('#anagramsdiv2').remove(); $('#div_leapplayer').remove(); GoalkeeperObj.GotoMiracleGoalkeeper(); }, null, null, 184, 340, 180, $('#totalMainDiv'), 'div_leapplayer');
            }
        });
    }
}