function findTwoLevelInd() {
    var indCode = document.getElementById("oneLevelInd").value;
    if (indCode == '0') {
        initTwoLevelList();
        initThreeLevelList();
        initReference();
    } else {
        PortfolioDwr.findIndByLevel(indCode, 2, fillTwoIndList);
        initThreeLevelList(); //��������������
        PortfolioDwr.updateOneSelectReference(indCode,1,updateOneSelect); //���µ�һ��������Ĳο�ָ��
    }
}

function fillTwoIndList(twoArray) {
    DWRUtil.removeAllOptions("twoLevelInd");
    var array = new Array();
    array[0] = {value:"0",text:"������ҵ"};
    for (var i = 0; i < twoArray.length; i++) {
        array[i + 1] = {value:twoArray[i][0],text:twoArray[i][1]};
    }
    DWRUtil.addOptions("twoLevelInd", array, "value", "text");
}

function findThreeLevelInd() {
    var indCode = document.getElementById("twoLevelInd").value;
    if (indCode == '0') {
        initThreeLevelList();
        var code = document.getElementById("oneLevelInd").value;//�ο���Ϊһ����ҵ
        PortfolioDwr.updateOneSelectReference(code,1,updateOneSelect);
    } else {
        PortfolioDwr.findIndByLevel(indCode, 3, findThreeLevelList);
        PortfolioDwr.updateOneSelectReference(indCode,2,updateOneSelect);//�ο���Ϊ������ҵ
    }
}

function findThreeLevelList(threeArray) {
    DWRUtil.removeAllOptions("threeLevelInd");
    var array = new Array();
    array[0] = {value:"0",text:"������ҵ"};
    for (var i = 0; i < threeArray.length; i++) {
        array[i + 1] = {value:threeArray[i][0],text:threeArray[i][1]};
    }
    DWRUtil.addOptions("threeLevelInd", array, "value", "text");
}

function initTwoLevelList() {
    DWRUtil.removeAllOptions("twoLevelInd");
    var array = new Array();
    array[0] = {value:"0",text:"������ҵ"};
    DWRUtil.addOptions("twoLevelInd", array, "value", "text");
}

function initThreeLevelList() {
    DWRUtil.removeAllOptions("threeLevelInd");
    array = new Array();
    array[0] = {value:"0",text:"������ҵ"};
    DWRUtil.addOptions("threeLevelInd", array, "value", "text");
}

function threeLevelIndex() {
    var indCode = document.getElementById("threeLevelInd").value;
    if (indCode == '0') {
        var code = document.getElementById("twoLevelInd").value;
        //�ο���Ϊ������ҵ
        PortfolioDwr.updateOneSelectReference(code,2,updateOneSelect);
    } else {
        PortfolioDwr.updateOneSelectReference(indCode,3,updateOneSelect);
    }
}

function updateReference(obj) {
    if (obj != null) {
        document.getElementById('newStkCode0').innerText = obj[0];
        document.getElementById('newMktCode0').value = obj[1];
        document.getElementById('newStkType0').value = obj[2];
        document.getElementById('newStkName0').innerText = obj[3];
    }
}

function initReference() {
    DWRUtil.removeAllOptions("refIndexCode0");
    var ddlNodes = document.getElementById("refIndexCode1");
    var array = new Array();
    for (var i = 0; i < ddlNodes.length; i++) {
        array[i] = {value:ddlNodes.options[i].value,text:ddlNodes.options[i].text}; //����һ��Ҫ�ֿ���ֵ,����ֻ�ܵõ�object���� by Elephant
    }
    DWRUtil.addOptions("refIndexCode0", array, "value", "text");
    document.getElementById('newStkCode0').innerText = '';
    document.getElementById('newMktCode0').value = '';
    document.getElementById('newStkType0').value = '';
    document.getElementById('newStkName0').innerText = '';
}

function updateOneSelect(indexArray) {
    DWRUtil.removeAllOptions("refIndexCode0");
    var array = new Array();
    for (var i = 0; i < indexArray.length; i++) {
        array[i] = {value:indexArray[i][0],text:indexArray[i][3]};
    }
    DWRUtil.addOptions("refIndexCode0", array, "value", "text");
    if(indexArray.length>0){
       updateReference(indexArray[0]);
    }
}