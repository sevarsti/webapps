<%--
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//˵�����ڳ�������ģ���JavaScript��ʹ�õ�·������ʹ�ô˴����塣���޸ģ����ӣ�ɾ�����������޸����ر����������
//      Ŀ¼������"/"��β��
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--%>
// web���ڵ�Ŀ¼����
<%
    String contextPath = request.getContextPath() + "/";
    String impagePath = contextPath + "images/";
    String scriptPath = contextPath + "scripts/";
    String stylePath = contextPath + "styles/";
    String utilPath = contextPath + "utils/";
    String imagePathForFramework = contextPath + "frameWork/";
%>
var AppRootPath = "<%= contextPath %>";
var rootUrl = "<%=request.getRequestURL().toString().substring(0,request.getRequestURL().toString().indexOf("portfolio")) %>";
// ImagePath
var ImagePath = "<%= impagePath %>";
//var ImagePathForFramework = ImagePath + "frameWork/";
var ImagePathForCommon = "<%=impagePath + "common/" %>";
var ImagePathForPanelBar = ImagePath + "panelbar/";
var ImagePathForUtils = "<%=impagePath +""%>";
var ImagePathForOrg = "<%=impagePath + "organization/"%>";
var ImagePathForRight = "<%=impagePath + ""%>";
var ImagePathForRschDoc = ImagePath + "RschDoc/";
var ImagePathForStkRsch = ImagePath + "StkRsch/";
var ImagePathForPortfolio = ImagePath + "Portfolio/";

// ScriptPath
var ScriptPath = "<%=scriptPath%>";
// StylePath
var StylePath = "<%= stylePath %>";
// UtilPath
var UtilPath = "<%= utilPath %>";
// PanelBarPath
var PanelBarPath = "<%= contextPath + "panelBar/" %>";

// �о�����
var RschDocPath = AppRootPath + "rschDoc/";
// �����о�
var StkRschPath = AppRootPath + "StkRsch/";
// ��ҵ�о�
var IndRschPath = AppRootPath + "IndRsch/";
// ��Ϲ���
var PortfolioPath = AppRootPath + "Portfolio/";
// ��������
var InstitutionPath = AppRootPath + "Institution/";
// �ղؼ�
var FavoritePath = AppRootPath + "Favorite/";
// ��Ϣ����
var PrvMsgPath = AppRootPath + "prvMsg/";
// �������
var MeetingPath = AppRootPath + "meeting/";

// ϵͳ����
var ConfigurationPath = AppRootPath + "configurations/";
// ϵͳ����-��֯�ṹ
var ConfigurationPathForOrg = ConfigurationPath + "organization/" ;
// ϵͳ����-��ԴȨ��
var ConfigurationPathForRight = ConfigurationPath + "right/";
// ϵͳ����-�о�����
var ConfigurationPathForRschDoc = ConfigurationPath + "RschDoc/";
//ϵͳ����-�ĵ�����
var ConfigurationPathForDocType = ConfigurationPath + "doctype/";

// ��¼ҳ��URL
var LogonPage = AppRootPath + "logon.jsp";
// �ر�ҳ��URLs
var CloseWindowPage = AppRootPath + "closeWindows.htm";
// ��Ȩ����ҳ��URL
var NoRightPage = AppRootPath + "noRight.jsp";
// �޸�����URL
var ModifyPasswordPage = AppRootPath + "modifyPassword.jsp";
// �հ�ҳ��URL
var BlankPage = AppRootPath + "frameBlank.htm";
