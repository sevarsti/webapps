<%@ page import="com.saille.ogzq.IDUtils" %>
<%@ page import="com.saille.ogzq.OgzqURL" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.protocol.HTTP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Ellias
  Date: 2013-9-1
  Time: 0:51:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>Simple jsp page</title></head>
<%
    List<String> ids = IDUtils.GETIDS();
//    ids.clear();
//    ids.add("orange002@sina.com");
    for(String id : ids) {
        boolean isFree = true;
        while(isFree) {
            HttpPost pm = new HttpPost(OgzqURL.URL + "/ShuaShuaLe.aspx");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("load", "1"));
            pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
            String ret = IDUtils.execute(id, pm);
/*
            6015|��Ա������000��|800|128|2*
            2803|�߼�������ͬ3��|90 |0  |0*
            1905|����           |100|0  |0*
            1704|սѥ4��        |800|128|2*
            1905|����           |100|56 |6*
            1704|սѥ4��        |800|368|5
*/
            String itemStr = ret.substring(0, ret.indexOf("@"));
            String freeRefresh = ret.substring(ret.indexOf("@") + 1); //Leen|ս��4��YI������|�߼�������ͬ3����ղķʿ|��Ա������000��U�����|�߼�������ͬ3��U�����|�߼�������ͬ3���껨�ǹھ�|��Ա������000���껨�ǹھ�|ս��4��@10@0@1|1|1|1|1|1
            freeRefresh = freeRefresh.substring(freeRefresh.indexOf("@") + 1); //10@0@1|1|1|1|1|1
            freeRefresh = freeRefresh.substring(freeRefresh.indexOf("@") + 1); //0@1|1|1|1|1|1
            isFree = freeRefresh.substring(0, 1).equals("0"); //0: ��ѣ�1�������
            String canBuyStr = freeRefresh.substring(freeRefresh.indexOf("@") + 1); //1|1|1|1|1|1
            String[] canBuy = canBuyStr.substring(0, canBuyStr.indexOf("��")).split("[|]");
            String[] items = itemStr.split("[*]");
            for(int i = 0; i < items.length; i++) {
                String item = items[i];
                if(item.split("[|]")[4].equals("0") && canBuy[i].equals("1")) {
                    System.out.println("id: " + id + ", item: " + item);
                    pm = new HttpPost(OgzqURL.URL + "/ShuaShuaLe.aspx");
                    params = new ArrayList<NameValuePair>();
                    params.add(new BasicNameValuePair("Buy", item.split("[|]")[0] + "*0*" + i));
                    pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                    IDUtils.execute(id, pm);
                }
            }
            if(isFree) {
                pm = new HttpPost(OgzqURL.URL + "/ShuaShuaLe.aspx");
                params = new ArrayList<NameValuePair>();
                params.add(new BasicNameValuePair("refresh", "1"));
                pm.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                System.out.println(id + "���ˢ�£�" + IDUtils.execute(id, pm));
            } else {
                System.out.println(id + "�������ˢ�£�����");
            }
        }
    }
%>
  <body>Place your content here</body>
</html>