﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="True" CodeBehind="PayAdd.aspx.cs" Inherits="SocoShop.Web.Admin.PayAdd" %><%@ Register Namespace="SkyCES.EntLib" Assembly="SkyCES.EntLib" TagPrefix="SkyCES"%><%@ Import Namespace="SocoShop.Common" %><%@ Import Namespace="System.Collections" %><%@ Import Namespace="System.Collections.Generic" %><asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>支付修改</div><div class="add">	<ul>		<li class="left">名称：</li>		<li class="right"><%=payPlugins.Name%></li>	</ul>	<ul>		<li class="left">图片：</li>		<li class="right"><img src="<%=payPlugins.Photo %>" /></li>	</ul>	<ul>		<li class="left">描述：</li>		<li class="right"><SkyCES:TextBox ID="Description" CssClass="input" runat="server" Width="400px"  TextMode="MultiLine" Height="100px"/></li>	</ul>	<ul>		<li class="left">是否货到付款：</li>		<li class="right"><%=ShopCommon.GetBoolText(payPlugins.IsCod)%></li>	</ul>	<ul>		<li class="left">是否在线支付：</li>		<li class="right"><%=ShopCommon.GetBoolText(payPlugins.IsOnline)%></li>	</ul>	<ul>		<li class="left">是否启用：</li>		<li class="right"><asp:RadioButtonList ID="IsEnabled" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="0">否</asp:ListItem><asp:ListItem Value="1" Selected="True">是</asp:ListItem></asp:RadioButtonList></li>	</ul>	<%  string nameList = "|"; 	    foreach (KeyValuePair<string, string> keyValue in nameDic){        nameList += keyValue.Key + "|";          %>    <ul>	    <li class="left"><%=keyValue.Value%>：</li>	    <li class="right">	        <%if(selectValueDic[keyValue.Key]==string.Empty){ %>	        <input name="<%=keyValue.Key %>" value="<%=valueDic[keyValue.Key] %>" style="width:400px" class="input"/>	        <%}else{ %>	        <select name="<%=keyValue.Key %>" style="width:400px">	            <%foreach(string temp in selectValueDic[keyValue.Key].Split('#')){%>	            <option value="<%=temp.Split('|')[0] %>" <%if(temp.Split('|')[0]==valueDic[keyValue.Key]){%> selected="selected" <%} %>><%=temp.Split('|')[1] %></option>	            <%} %>	        </select>	        <%} %>	    </li>    </ul>    <%} %>    <input name="ConfigNameList" value="<%=nameList %>" type="hidden" /></div><div class="action">    <asp:Button CssClass="button" ID="SubmitButton" Text=" 确 定 " runat="server"  OnClick="SubmitButton_Click" /></div></asp:Content>