$(document).ready(function(){
    //------------------ ҳ����ص�ʱ���ʼ����ǰʱ��------------------------------
    var now=new Date();
    var startDate=$("#startDate");
    var endDate=$("#endDate");

    var defaultstartDate=now.getYear()+"-"+((now.getMonth())>9?(now.getMonth()):"0"+(now.getMonth()))+"-"+(now.getDate()>9?now.getDate():"0"+now.getDate());
         startDate.attr("value",defaultstartDate);
    var defaultEndDate=now.getYear()+"-"+((now.getMonth()+1)>9?(now.getMonth()+1):"0"+(now.getMonth()+1))+"-"+(now.getDate()>9?now.getDate():"0"+now.getDate());
         endDate.attr("value",defaultEndDate);
    //------------------------------------------------------------------------------

    //------------------  ���㹱���ʰ�ť����¼� ��ʼ ------------------------------
    $("#calCombin").click(function(){
        $("#result").html("");
        $("#downLoadPath").attr("value","");
        $("#downLoadExcel").attr("style","display:none");
        $("#downLoadExcel").attr("href","");
        //��֤���ڵĺϷ���
        if(checkDate(startDate,endDate)==false){
          return
        }
        $("#loading").attr("style","display:block;text-align:center;margin-top:150px;");
        //ͨ����֤��ʼ��ȡ���ݲ���
          //1.��ȡҪ��������ID
            var pflIds=getPflIds();
            if(pflIds==null || pflIds.length==0){
                alert("��ѡ��Ҫ�����������ƣ�");
                return;
            }
          //2.��ȡ��ʼ����
            var sdValue=startDate.attr("value");
          //3����ȡ��������
            var edValue=endDate.attr("value");

        //��ʼ�첽����
        $.ajax({
            type:"GET",
            url:"pflAnalysis.do?method=calCombin&pflIds="+pflIds+"&startDate="+sdValue+"&endDate="+edValue+"&curEmpId="+$("#curEmpId").attr("value"),
            dataType:"json",
            success:callback, //�ɹ�ʱ���õĻص�����
            error: function() {
                     $("#loading").attr("style","display:none;");
                    var resultObj=$("#result");
                    resultObj.html("<font style='color:red;text-align:center'>�Բ���,��ѯ�����������,��ȷ�ϲ�ѯ������</font>");
                 }
            });
    });
    //���㹱���ʰ�ť�¼��Ļص�����
    function callback(data){
    $("#loading").attr("style","display:none;text-align:center;margin-top:150px;");
    $("#downLoadExcel").attr("style","display:inline");
    var downLoadPath=$("#downLoadPath");
    //3.���������˷��ص����ݶ�̬����ʾ��ҳ����
    var resultObj=$("#result");
    var htmlText="";

    for(var i=0;i<data.length;i++){
        var htmlText1="";
        htmlText1="<tr>"
                    +"<td width='18%' align='center' class='td1'><b>�������[ID]:</b></td>"
                    +"<td width='32%' align='center' class='td1'>"+data[i].name+"["+data[i].id+"]</td>"
                    +"<td width='18%' align='center' class='td1'><b>ʱ������:</b></td>"
                    +"<td width='32%' align='center' class='td1'>"+data[i].startDate+"-"+data[i].endDate+"</td>"
                +"</tr>"
                +"<tr>"
				    +"<td colspan='2' align='center' class='td1'><b>��Ʊ����/����</b></td>"
				    +"<td colspan='2' align='center' class='td1'><b>������</b></td>"
			    +"</tr>"
        downLoadPath.attr("value",downLoadPath.attr("value")+data[i].xlsName);
        $("#downLoadExcel").attr("href","../portfolio2/Analysis/downLoadExcel.jsp?fileName="+$("#downLoadPath").attr("value"));
        var htmlText2="";
        for(var j=0;j<data[i].itemList.length;j++){
            htmlText2=htmlText2+"<tr>"
                    +"<td colspan='2' align='center' class='td1'>"+data[i].itemList[j].itemName+"("+data[i].itemList[j].itemCode+")"+"</td>"
                    +"<td colspan='2' align='center' class='td1'>"+data[i].itemList[j].contriRate+"</td>"
                +"</tr>"

        }
        var htmlText3="";
        htmlText3="<tr>"
                    +"<td colspan='4' class='td1' align='center'><b>������ͼ:</b></td>"
                +"<tr>"
                +"<tr>"
                    +"<td colspan='4' class='td1'><img src='../images/TDChart/"+data[i].fileName+"'/></td>"
                +"</tr>"
        htmlText=htmlText+"<table width='100%' cellspacing='0' class='tbl' id='expTable'>"+htmlText1+htmlText2+htmlText3+"</table>";

    }
     resultObj.html("<div id='container'>"+htmlText+"</div>");
}
    //------------------  ���㹱���ʰ�ť����¼� ���� ------------------------------

    //------------------ ��ѯ�������ݰ�ť����¼�  ��ʼ-----------------------------
    $("#searchBaseData").click(function(){
        $("#result").html("");
        $("#downLoadPath").attr("value","");
        $("#downLoadExcel").attr("style","display:none");
        $("#downLoadExcel").attr("href","");
        //��֤���ڵĺϷ���
        if(checkDate(startDate,endDate)==false){
          return
        }
        $("#loading").attr("style","display:block;text-align:center;margin-top:150px;");
        //ͨ����֤��ʼ��ȡ���ݲ���
          //1.��ȡҪ��������ID
          var pflIds=getPflIds();
          if(pflIds==null || pflIds.length==0){
            alert("��ѡ��Ҫ�����������ƣ�");
            return;
          }
          //2.��ȡ��ʼ����
          var sdValue=startDate.attr("value");
          //3����ȡ��������
          var edValue=endDate.attr("value");

        //��ʼ�첽����
        $.ajax({
            type:"GET",
            url:"pflAnalysis.do?method=searchBaseData&pflIds="+pflIds+"&startDate="+sdValue+"&endDate="+edValue+"&curEmpId="+$("#curEmpId").attr("value"),
            dataType:"json",
            success:callBackBaseData, //�ɹ�ʱ���õĻص�����
            error: function() {
                     $("#loading").attr("style","display:none;");
                    var resultObj=$("#result");
                    resultObj.html("<font style='color:red;text-align:center'>�Բ���,��ѯ�����κ�����,�޷���ȡ����ϵĻ������ݣ�</font>");
                 }
            });
    });
    //��ѯ��ϻ������ݵĻص�����
    function callBackBaseData(data){
        $("#loading").attr("style","display:none;text-align:center;margin-top:150px;");
        var downLoadPath=$("#downLoadPath");
        //3.���������˷��ص����ݶ�̬����ʾ��ҳ����
        var resultObj=$("#result");
        //----------- ��ʼ��������� --------------
        for(var i=0;i<data.length;i++){
            var htmlText1="<tr style='background-color:#ccc'>"
                            +"<td class='td1' align='center'><b>����</b></td>";
            //ȡ����һ�������
            var firstItemName=data[i].itemList[0].itemName;
            //ȡ��ʱ������
            var dateArr=new Array();
            var htmlContent="";
            for(var j=0;j<data[i].itemList.length-1;j++){
                if(data[i].itemList[j].itemName != data[i].itemList[j+1].itemName){
                    htmlText1=htmlText1+"<td class='td1' align='center'><b>"+data[i].itemList[j].itemCode+"</b></td>";
                }
                if(data[i].itemList[j].itemName==firstItemName){
                      dateArr[j]=data[i].itemList[j].pubDate;
                }
            }
            htmlText1=htmlText1+"<td class='td1' align='center'><b>"+data[i].itemList[j].itemCode+"</b></td>";
            var colsNo=0;
            for(var k=0;k<dateArr.length;k++){
                if(k%2!=0){
                    htmlContent=htmlContent+"<tr style='background-color:#ccc'>";
                }
                for(var h=0;h<data[i].itemList.length;h++){
                    if(data[i].itemList[h].pubDate==dateArr[k]){
                        if(h==k){
                            htmlContent=htmlContent+"<td class='td1' align='center'><b>"+data[i].itemList[h].pubDate+"</b></td>"+"<td class='td1' align='center'>"+data[i].itemList[h].totalBalance+"</td>";
                        }else{
                            htmlContent=htmlContent+"<td class='td1' align='center'>"+data[i].itemList[h].totalBalance+"</td>";
                        }
                    }
                }
                htmlContent=htmlContent+"</tr>";
                colsNo++;
            }
            downLoadPath.attr("value",downLoadPath.attr("value")+data[i].xlsName);
            $("#downLoadExcel").attr("style","display:inline");
            $("#downLoadExcel").attr("href","../portfolio2/Analysis/downLoadExcel.jsp?fileName="+$("#downLoadPath").attr("value"));
            htmlText1=htmlText1+"</tr>";
            htmlText1= "<tr><td colspan='"+ (colsNo+3) +"' class='td1' align='center'><b>���[ID]:&nbsp;&nbsp;</b>"+data[0].name+"["+data[0].id+"]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�׶�����:&nbsp;&nbsp;</b>"+data[0].startDate+"-"+data[0].endDate+"</td>"+"</tr>"+htmlText1;
            //-------- ����������� -------------------
            //-------- ������ݲ��� -------------------
            htmlText1=htmlText1+htmlContent;
            //-------- ���ݲ��ִ�ӡ���� ---------------
        }
        resultObj.html("<div id='container'><table width='100%' cellspacing='0' class='tbl' id='expTable'>"+htmlText1+"</table></div>");
    }
    //------------------ ��ѯ�������ݰ�ť����¼�  ����-----------------------------

    //------------------ ��ϳɷ�������ְ�ť����¼� ��ʼ -------------------------
    $("#itemPerformance").click(function(){
        $("#result").html("");
        $("#downLoadPath").attr("value","");
        $("#downLoadExcel").attr("style","display:none").attr("href","");
        //��֤���ڵĺϷ���
        if(checkDate(startDate,endDate)==false){
          return
        }
        $("#loading").attr("style","display:block;text-align:center;margin-top:150px;");
        //ͨ����֤��ʼ��ȡ���ݲ���
          //1.��ȡҪ��������ID
          var pflIds=getPflIds();
          if(pflIds==null || pflIds.length==0){
            alert("��ѡ��Ҫ�����������ƣ�");
            return;
          }
          //2.��ȡ��ʼ����
          var sdValue=startDate.attr("value");
          //3����ȡ��������
          var edValue=endDate.attr("value");

        //��ʼ�첽����
        $.ajax({
            type:"GET",
            url:"pflAnalysis.do?method=showItemPerformance&pflIds="+pflIds+"&startDate="+sdValue+"&endDate="+edValue+"&curEmpId="+$("#curEmpId").attr("value"),
            dataType:"json",
            success:callBackItemPerformance, //�ɹ�ʱ���õĻص�����
            error: function() {
                     $("#loading").attr("style","display:none;");
                    var resultObj=$("#result");
                    resultObj.html("<font style='color:red;text-align:center'>�Բ���,��ѯ�����κ�����,�޷���������ϵĳɷ�������֣�</font>");
                 }
        });
    });
    //��ϳɷ�������ֵĻص�����
    function callBackItemPerformance(data){
        $("#loading").attr("style","display:none;text-align:center;margin-top:150px;");
        var downLoadPath=$("#downLoadPath");
        $("#downLoadExcel").attr("style","display:inline");
        //3.���������˷��ص����ݶ�̬����ʾ��ҳ����
        var resultObj=$("#result");
        var htmlText="";
        //----------- ��ʼ��������� --------------
        for(var i=0;i<data.length;i++){
              var htmlText1="";
              htmlText1="<table width='100%' cellspacing='0' class='tbl' id='expTable'><tr>"
                    +"<td width='18%' align='center' class='td1'><b>�������[ID]:</b></td>"
                    +"<td width='32%' align='center' class='td1'>"+data[i].name+"["+data[i].id+"]</td>"
                    +"<td width='18%' align='center' class='td1'><b>ʱ������:</b></td>"
                    +"<td width='32%' align='center' class='td1'>"+data[i].startDate+"-"+data[i].endDate+"</td>"
                +"</tr><table>"
                +"<table width='100%' cellspacing='0' class='tbl' id='expTable'><tr>"
                    +"<td width='18%' align='center' class='td1'><b>��ϳɷ�</b></td>"
                    +"<td width='21%' align='center' class='td1'><b>ƽ���ɱ�</b></td>"
                    +"<td width='18%' align='center' class='td1'><b>��ĩ�ֹ���</b></td>"
                    +"<td width='21%' align='center' class='td1'><b>��������������</b></td>"
                    +"<td width='22%' align='center' class='td1'><b>�����ǵ���</b></td>"
                +"</tr>"
              var htmlText2="";
              for(var j=0;j<data[i].itemList.length;j++){
                  if(data[i].itemList[j].amount !=0){
                      htmlText2=htmlText2+"<tr>"
                                   +"<td width='18%' align='center' class='td1'>"+data[i].itemList[j].itemName+"</td>"
                                   +"<td width='21%' align='center' class='td1'>"+data[i].itemList[j].holdPrice.toFixed(2)+"</td>"
                                   +"<td width='18%' align='center' class='td1'>"+data[i].itemList[j].amount.toFixed(2)+"</td>"
                                   +"<td width='21%' align='center' class='td1'>"+(data[i].itemList[j].totalProfit*100).toFixed(2)+"%</td>"
                                   +"<td width='22%' align='center' class='td1'>"+(data[i].itemList[j].profit*100).toFixed(2)+"%</td>"
                                +"</tr>"
                  }
              }
              var htmlText3=""
                    htmlText3="<tr>"
                                +"<td colspan='5' class='td1' align='center'><b>������������ʷ���ͼ</b></td>"
                            +"<tr>"
                            +"<tr>"
                                +"<td colspan='5' class='td1'><img src='../images/TDChart/"+data[i].fileName+"'/></td>"
                            +"</tr>"
                 htmlText=htmlText+htmlText1+htmlText2+htmlText3+"</table>";
            downLoadPath.attr("value",downLoadPath.attr("value")+data[i].xlsName);
        }
        $("#downLoadExcel").attr("href","../portfolio2/Analysis/downLoadExcel.jsp?fileName="+$("#downLoadPath").attr("value"));
        resultObj.html("<div id='container'>"+htmlText+"</div>");
    }
    //------------------ ��ϳɷ�������ְ�ť����¼� ��ʼ -------------------------

    //------------------ ���������ַ�����ť����¼� ��ʼ ------------------------
    $("#sellStatus").click(function(){
        $("#result").html("");
        $("#downLoadPath").attr("value","");
        $("#downLoadExcel").attr("style","display:none").attr("href","");
        //��֤���ڵĺϷ���
        if(checkDate(startDate,endDate)==false){
          return
        }
        $("#loading").attr("style","display:block;text-align:center;margin-top:150px;");
        //ͨ����֤��ʼ��ȡ���ݲ���
          //1.��ȡҪ��������ID
          var pflIds=getPflIds();
          if(pflIds==null || pflIds.length==0){
            alert("��ѡ��Ҫ�����������ƣ�");
            return;
          }
          //2.��ȡ��ʼ����
          var sdValue=startDate.attr("value");
          //3����ȡ��������
          var edValue=endDate.attr("value");

        //��ʼ�첽����
        $.ajax({
            type:"GET",
            url:"pflAnalysis.do?method=showSellStatus&pflIds="+pflIds+"&startDate="+sdValue+"&endDate="+edValue+"&curEmpId="+$("#curEmpId").attr("value"),
            dataType:"json",
            success:callBackSellStatus, //�ɹ�ʱ���õĻص�����
            error: function() {
                     $("#loading").attr("style","display:none;");
                    var resultObj=$("#result");
                    resultObj.html("<font style='color:red;text-align:center'>�Բ���,��ѯ�����κ�����,�޷����и���ϵĳɷ�������ַ�����</font>");
                 }
        });
    });
    //���������ַ����Ļص�����
    function  callBackSellStatus(data){
        $("#loading").attr("style","display:none;text-align:center;margin-top:150px;");
        var downLoadPath=$("#downLoadPath");
        //3.���������˷��ص����ݶ�̬����ʾ��ҳ����
        var resultObj=$("#result");
        var htmlText="";

        for(var i=0;i<data.length;i++){
            for(var j=0;j<data[i].itemList.length;j++){
                var htmlText1="";
                htmlText1="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>��Ʊ���</b></td>"
                        +"<td width='82%' colspan='"+ data[i].itemList[j].bargainList.length +"' align='center' class='td1'>"+data[i].itemList[j].itemName+"</td>"
                        +"</tr>";

                var htmlText2="";
                var htmlText3="";
                var htmlText4="";
                var htmlText5="";
                var htmlText6="";
                var htmlText7="";
                var htmlText8="";
                htmlText2="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>����ʱ��</b></td>";
                htmlText3="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>�о�Ա</b></td>";
                htmlText4="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>ƽ���ɱ�</b></td>";
                htmlText5="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>��������(��)</b></td>";
                htmlText6="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>���ּ۸�</b></td>";
                htmlText7="<tr>"
                        +"<td width='18%' align='center' class='td1'><b>����������</b></td>";

                htmlText8="<tr>"
                        +"<td align='center' class='td1' colspan='"+ (data[i].itemList[j].bargainList.length+1) +"'><b>�ɷּ��ַ���ͼ</b></td></tr>"
                        +"<tr>"
                        +"<td align='center' class='td1' colspan='"+ (data[i].itemList[j].bargainList.length+1) +"'><img src='../images/TDChart/"+data[i].itemList[j].picFilePath+"'/></td>";
                var wid=80/data[i].itemList[j].bargainList.length;
                for(k=0;k<data[i].itemList[j].bargainList.length;k++){
                    if(data[i].itemList[j].bargainList[k].tradeType==11 || data[i].itemList[j].bargainList[k].tradeType==12){
                        htmlText2=htmlText2+"<td align='center' class='td1' width='"+wid+"%'>"+data[i].itemList[j].bargainList[k].tradeDate+"</td>";
                        htmlText3=htmlText3+"<td align='center' class='td1' width='"+wid+"%'>"+data[i].pflOwnerName+"</td>";
                        htmlText5=htmlText5+"<td align='center' class='td1' width='"+wid+"%'>"+data[i].itemList[j].bargainList[k].bargainAmount.toFixed(2)+"</td>";
                        htmlText6=htmlText6+"<td align='center' class='td1' width='"+wid+"%'>"+data[i].itemList[j].bargainList[k].bargainPrice.toFixed(2)+"</td>";
                    }
                }
                for(k=0;k<data[i].itemList[j].bargainList.length;k++){
                    if(data[i].itemList[j].bargainList[k].tradeType==11|| data[i].itemList[j].bargainList[k].tradeType==12){
                        for(h=0;data[i].itemList[j].itemList.length;h++){
                            if(data[i].itemList[j].itemList[h].publishDate==data[i].itemList[j].bargainList[k].tradeDate){
                                htmlText4=htmlText4+"<td align='center' class='td1' width='"+wid+"%'>"+data[i].itemList[j].itemList[h].holdPrice.toFixed(2)+"</td>";
                                var temp=((data[i].itemList[j].bargainList[k].bargainPrice/data[i].itemList[j].itemList[h].holdPrice)-1)*100;
                                htmlText7=htmlText7+"<td align='center' class='td1' width='"+wid+"%'>"+temp.toFixed(2)+"%</td>";
                                break;
                            }
                         }
                     }
                }
                htmlText1=htmlText1+"</tr>";
                htmlText2=htmlText2+"</tr>";
                htmlText3=htmlText3+"</tr>";
                htmlText4=htmlText4+"</tr>";
                htmlText5=htmlText5+"</tr>";
                htmlText6=htmlText6+"</tr>";
                htmlText7=htmlText7+"</tr>";
                htmlText8=htmlText8+"</tr>";
                htmlText=htmlText+"<table width='80%' cellspacing='0' class='tbl' id='expTable'>"+htmlText1+htmlText2+htmlText3+htmlText4+htmlText5+htmlText6+htmlText7+htmlText8+"</table></br>";
            }
            if(data[i].xlsName !=''){
                $("#downLoadExcel").attr("style","display:inline");
                downLoadPath.attr("value",downLoadPath.attr("value")+data[i].xlsName);
                $("#downLoadExcel").attr("href","../portfolio2/Analysis/downLoadExcel.jsp?fileName="+$("#downLoadPath").attr("value"));
            }
        }

        resultObj.html("<div id='container'>"+htmlText+"</div>");
    }
    //------------------ ���������ַ�����ť����¼� ���� ------------------------

    //��֤��ʼ���ںͽ������ڵĺϷ���
    function  checkDate(sDate,eDate){
        var sDateValue=sDate.attr("value");
        var eDateValue=eDate.attr("value");
        //��֤���ڸ�ʽΪ:1997-01-01��������ʽ
        var reg=/^[1-2]\d{3}-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[0-1])$/;

        if(sDateValue == "" || eDateValue == ""){
            alert("��ʼ���ڻ�������ڲ���Ϊ��");
            return false;
        }
        if(!sDateValue.match(reg)){
            alert("��ʼ���ڸ�ʽ����\n��ȷ��ʽΪ:2001-01-01");
            return false;
        }
        if(!eDateValue.match(reg)){
            alert("�������ڸ�ʽ����\n��ȷ��ʽΪ:2001-01-01");
            return false;
        }
        if(sDateValue > eDateValue){
            alert("��ʼ���ڲ��ܴ��ڽ�������");
            return false;
        }
        return true;
    }

    //��ȡҪ��������ID
    function getPflIds(){
        //��ȡ��ҳ���������������
        var ddlPflIdNode=$("#pflIds");
        var pflIds="";
        if(ddlPflIdNode.val()=='0'){
            $("select[@name=portfolio] option").each(function(){
                if($(this).val() != 0){
                   pflIds+=$(this).val()+"-";
                }
            });
        }else{
            pflIds=ddlPflIdNode.val()+"-";
        }
        return pflIds;
    }
});