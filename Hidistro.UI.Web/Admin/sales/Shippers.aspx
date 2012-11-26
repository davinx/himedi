﻿<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="Shippers.aspx.cs" Inherits="Hidistro.UI.Web.Admin.Shippers" Title="无标题页" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div class="optiongroup mainwidth">
		<ul>
            <li class="optionstar"><a href="ExpressTemplates.aspx" class="optionnext"><span>快递单模板</span></a></li>
            <li class="menucurrent"><a href="#" class="optioncurrentend"><span class="optioncenter">发货人信息管理</span></a></li>
		</ul>
	</div>
	<!--选项卡-->
	<div class="dataarea mainwidth">
		<!--搜索-->
		 <div class="Pa_15"><a href="AddShipper.aspx" class="submit_jia">添加发货人信息</a></div>		
		<!--数据列表区域-->
	  <div class="datalist">
     <UI:Grid ID="grdShippers" runat="server" ShowHeader="true" AutoGenerateColumns="false" DataKeyNames="ShipperId" HeaderStyle-CssClass="table_title" GridLines="None" Width="100%">
            <Columns>   
                <asp:TemplateField HeaderText="发货点名称"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblShipperTag" runat="server" Text='<%#Eval("ShipperTag") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>   
                <UI:YesNoImageColumn DataField="IsDefault" HeaderText="默认发货信息" HeaderStyle-Width="16%" HeaderStyle-CssClass="td_right td_left" />
                <asp:TemplateField HeaderText="发货人姓名"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblShipperName" runat="server" Text='<%#Eval("ShipperName") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="地址"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="邮编"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblZipcode" runat="server" Text='<%#Eval("Zipcode") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>     
                <asp:TemplateField HeaderText="手机"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblCellPhone" runat="server" Text='<%#Eval("CellPhone") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="电话"  HeaderStyle-CssClass="td_right td_left">
                   <ItemTemplate>
                      <asp:Literal id="lblTelPhone" runat="server" Text='<%#Eval("TelPhone") %>'></asp:Literal>
                   </ItemTemplate>
                </asp:TemplateField>                                                    
                <asp:TemplateField HeaderText="操作" ItemStyle-Width="20%" HeaderStyle-CssClass="td_left td_right_fff">
                    <ItemTemplate>
                    <span class="submit_bianji"><a href='<%# "EditShipper.aspx?ShipperId=" + Eval("ShipperId")%> '>编辑</a></span>
                    <span class="submit_shanchu"><Hi:ImageLinkButton ID="lkDelete" Text="删除" IsShow="true"  CommandName="Delete" runat="server" /></span></span>                      
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </UI:Grid>
      <div class="blank5 clearfix"></div>
	  </div>
	</div>
	<div class="databottom"></div>
<div class="bottomarea testArea">
  <!--顶部logo区域-->
</div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="validateHolder" runat="server">
</asp:Content>
