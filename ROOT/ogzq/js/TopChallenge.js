/*
�۷���ս�  ����
*/
function TopChallenge() {
    /*
    ��ʾ���Ľ���  ����
    */
    this.GotoTopChallenge = function () {
        $.post("TopChallenge.aspx", { type: 1 }, function (result) {
            //result = "������̽01|10@����|10@����ս��|10@������̽01|10@����|10@����ս��|10@������̽01|10@����|10@����ս��|10@����ս��|10^1500";
            //var ActivityTimeStr = result.split('��')[1]; //�ʱ��
            //result = result.split('��')[0];

            //������
            if (result.indexOf('inmatch|') != -1) {// �б�����ҳ��������Ϣ�������
                var matchinfo = result.split('|');
                showMatch(matchinfo[1], matchinfo[2]);
                return;
            }

            var last_times = result.split('^')[1];
            var playerNameArr = new Array("ŵ����", "������", "��ķ", "����", "������", "����˹", "ʩκ��ʩ̩��", "�ޱ�", "����", "�ﱴ��", "�������");
            var leftArr = new Array(382, 215, 316, 458, 573, 339, 465, 277, 395, 516, 396);
            var topArr = new Array(412, 358, 358, 358, 358, 282, 282, 221, 221, 221, 148);
            var playerNames = "";
            for (var i = 0; i < 11; i++) {
                playerNames += "<div  style='left:" + leftArr[i] + "px;top:" + topArr[i] + "px;width:72px;text-align:center;position:absolute;font-size:12px;color:#C9D8ED;'>" + playerNameArr[i] + "</div>";
            }
            //�ʱ��
            var activityTime = "<div style='position:absolute;left:100px;top:110px;width:318px;text-align:center;font-size:12px;font-weight:bold;color:#C9D8ED;'>���ʱ�䡿:11��1��12:00��24:00,2��12:00��24:00</div>";
            //�����
            var activityDesc = "<div  style='left:15px;top:150px;width:200px;height:200px;position:absolute;font-size:14px;color:#C9D8ED;'>";
            activityDesc += "<div>����ݣ�<br>ÿ��սʤNPC���鶼����С������Boss������սʤ������ǰ���Ķ��鶼������Ӧ�Ľ�����</div>";
            activityDesc += "<div  style='position:absolute;left:20px;top:80px;width:36px;height:36px;background:url(Images/Item/10295s.png);'onmouseover='ShowTipBox(\"ŷ��֮��x10<br>1-8����ͬ<br>���4��x1<br>ǩ������10000��\",$(this))'></div>";
            activityDesc += "<div  style='position:absolute;left:70px;top:80px;width:36px;height:36px;background:url(Images/Item/10296s.png);'onmouseover='ShowTipBox(\"ŷ��֮��x5<br>1-7����ͬ<br>���4��x1<br>ǩ������8000��\",$(this))'></div>";
            activityDesc += "<div  style='position:absolute;left:120px;top:80px;width:36px;height:36px;background:url(Images/Item/10297s.png);'onmouseover='ShowTipBox(\"ŷ��֮��*1<br>1-7����ͬ<br>���4��x1<br>ǩ������6000��\",$(this))'></div>";
            activityDesc += "<div  style='position:absolute;top:120px;'>�����һ������NPC�������ӽ�����ռ����ܴ󽱣�</div>";
            activityDesc += "<div  style='position:absolute;left:70px;top:160px;width:36px;height:36px;background:url(Images/Item/10299s.png);'onmouseover='ShowTipBox(\"���4��x1<br>1-7����ͬ<br>ǩ������2000��\",$(this))'></div>";
            activityDesc += "</div>";
            //������Ϣ
            var rankHtml = "<div  style='left:680px;top:20px;width:215px;height:270px;position:absolute;color:#FCFF02;font-size:18px;'>";
            rankHtml += "<div style='position:absolute;left:0px;top:0px;'>����</div>";
            rankHtml += "<div style='position:absolute;left:60px;top:0px;'>�����</div>";
            rankHtml += "<div style='position:absolute;left:150px;top:0px;'>������</div>";
            if (result.split('^')[0].lastIndexOf('|') > 0) {
                var rankInfoArr = result.split('^')[0].split('@');
                var teamName = ""; var ballNum = "";
                for (var i = 0; i < (rankInfoArr.length > 10 ? 10 : rankInfoArr.length); i++) {
                    teamName = rankInfoArr[i].split('|')[0];
                    ballNum = rankInfoArr[i].split('|')[1];
                    rankHtml += "<div style='width:100%;height:24px;position:absolute;top:" + (30 + 24 * i) + "px;line-height:20px;font-size:14px;color:white;'>";
                    rankHtml += "<div style='position:absolute;left:12px;top:0px;'>" + (i + 1) + "</div>";
                    rankHtml += "<div style='position:absolute;left:60px;top:0px;width:85px;white-space:nowrap;overflow: hidden;'>" + teamName + "</div>";
                    rankHtml += "<div style='position:absolute;left:165px;top:0px;'>" + ballNum + "</div>";
                    rankHtml += "</div>";
                }
            }
            rankHtml += "</div>";
            //ʣ����ս����
            var lastTimes = "<div  style='left:700px;top:300px;position:absolute;color:#FCFF02;font-size:18px;'>ʣ����ս����:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</div>";
            lastTimes += "<div  style='left:820px;top:300px;width:60px;position:absolute;color:#FCFF02;font-size:18px;text-align:center;'>" + last_times + "</div>";
            //��ս��ť
            var challengeButton = "";
            if (last_times > 0) {
                challengeButton += "<div id='challengeButton' style='left:750px;top:360px;position:absolute;width:110px;height:37px;background:url(Images/TopChallenge/butter-1.png);color:#946000;font-weight:bold;font-size:20px;text-align:center;line-height:35px;cursor:pointer;' onclick='TopChallengeObj.ClickChallenge()'>��ս</div>";
            } else if (last_times <= 0) {
                challengeButton += "<div style='left:750px;top:360px;position:absolute;width:110px;height:37px;background:url(Images/TopChallenge/butter-1.png);color:#946000;font-weight:bold;font-size:20px;text-align:center;line-height:35px;cursor:pointer;'>��ս</div>";
            }


            //�ڵ�������������Ҫ��ʾ���������ݵ�html
            var html = "<div style='width:909px;height:457px;background:url(Images/TopChallenge/bg_jq.jpg);position:absolute;left:6px;top:0px;'>" + playerNames + activityDesc + activityTime + rankHtml + lastTimes + challengeButton + "</div>"
            //�������������  ����  ************************************************************************************************************************************************************************************
            AddBox(40, 85, 925, 494, "�۷���ս", html, $('#totalMainDiv'), "ȷ��", null, "TopChallengeUI", false, true, null)
            //����,����,��,��,topѡ�����,����������,Ҫ���������,ȷ����ť�¼�(null=ɾ����ǰ������,-1=û���κβ���,����=�Զ���ִ�еķ���),�رհ�ť�¼�(-1=û�йرհ�ť,����=�Զ���ִ�еķ���),������id(�����д���Զ�����id),�Ƿ����б�ǩ�ģ�true��������,false��������,�������Ƿ���ƶ�,�رհ�ť�¼�
            if (last_times > 0) {
                $("#challengeButton").hover(function () { $(this).css('background', 'url(Images/TopChallenge/butter.png)'); }, function () { $(this).css('background', 'url(Images/TopChallenge/butter-1.png)'); });
            }
            $("#TopChallengeUI").css('display', 'none').fadeIn("fast");
        });
    }

    //�����ս��ť
    var timeId = 0;
    this.ClickChallenge = function () {
        $.post("TopChallenge.aspx", { type: 2 }, function (result) {
            //result = "1|110";
            //��һλ��1ʱ����ʾ������ս����һλ��metaID
            //��һλ��0ʱ����ʾ��������ս����һλ����ȴ������
            if (result.split('|')[0] == 1) {//����ֱ����ս
                var matchId = result.split('|')[1];
                //�����������涯��
                showMatch(matchId, 31);
                $("#TopChallengeUI").remove();
            } else if (result.split('|')[0] == 0) {//��Ҫ��ȴ
                //����ʱ
                var secs = result.split('|')[1];
                var time = "<div style='position:absolute;left:110px;top:14px;color:black;font-size:14px;'>��ȴʱ�䣺</div>";
                time += "<div id='time' style=';position:absolute;top:14px;left:175px;color:red;font-size:14px;Text-align:center'></div>";
                ShowMsg(time, "������ս", function () {
                    $("#divMsg2").remove();
                    window.clearInterval(TopChallengeObj.timeId);
                    TopChallengeObj.stopCD(); //���ý�����ȴ�ķ���

                }, "��ܰ��ʾ", function () { window.clearInterval(TopChallengeObj.timeId); }, null, 270, 220, $('#TopChallengeUI'), 'divMsg2', false, 'ȡ��');
                //--------------------------------------����ʱ--------------------------------
                window.clearInterval(TopChallengeObj.timeId);
                TopChallengeObj.timeId = window.setInterval(function () {
                    $("#time").html(getTimeStr(secs -= 1, 2));
                    if (secs == 0) {
                        window.clearInterval(TopChallengeObj.timeId);
                    }
                }, 1000);
                //--------------------------------------����ʱ--------------------------------
            }
        });
    }

    //������ȴ
    this.stopCD = function () {
        $.post("TopChallenge.aspx", { type: 3 }, function (result3) {
            if (result3 == 0) {
                //�����������涯��
                TopChallengeObj.ClickChallenge();
                $("#TopChallengeUI").remove();
            } else if (result3 > 0) {
                ShowMsg("�Ƿ񻨷�" + result3 + "��ҽ�����ȴ��", "ȷ��", function () {
                    $.post("TopChallenge.aspx", { type: 4 }, function (result4) {
                        if (result4 == -1) {//Ǯ����
                            OpenPayMsg();
                        } else {
                            publicAddGSEL(1, -parseInt(result3));
                            var matchId = result4;
                            //�����������涯��
                            showMatch(matchId, 31);
                            $("#TopChallengeUI").remove();
                        }
                    });
                }, "��ܰ��ʾ", function () { window.clearInterval(TopChallengeObj.timeId); }, null, 270, 220, $('#TopChallengeUI'), 'divMsg2', false, 'ȡ��');
            } else if (result3 == -1) {
                ShowMsg("�ϴ���ս��δ���������Ժ���ս��", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", function () { }, null, 270, 220, $('#TopChallengeUI'), 'divMsg2');
            }

        });
    }

    //����뿪����ʱ����������ʾ��
    this.LiveGameTip = function () {
        $.post("TopChallenge.aspx", { type: 5 }, function (result) {
            if (result == 1) {
                var sliverCoin = "";
                var trainPoint = "";
                var shengWang = "";
                publicAddGSEL(2, parseInt(sliverCoin));
                TopChallengeObj.GotoTopChallenge();
                ShowMsg("��ϲ�����" + sliverCoin + "����," + trainPoint + "ѵ����," + shengWang + "������", null, function () { $("#divMsg2").remove(); }, "��ܰ��ʾ", function () { }, null, 270, 220, $('#TopChallengeUI'), 'divMsg2');
            }
        });
    }
}