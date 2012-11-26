﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="SendMessageSelectDistributor.aspx.cs" Inherits="Hidistro.UI.Web.Admin.SendMessageSelectDistributor" EnableSessionState="True"  %>

<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Validator" Assembly="Hidistro.UI.Common.Validator" %>
<%@ Register TagPrefix="Kindeditor" Namespace="kindeditor.Net" Assembly="kindeditor.Net" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="validateHolder" runat="server">

<script type="text/javascript">

         function selectRank(){
            document.getElementById("ctl00_contentHolder_rankList").disabled = false;
            document.getElementById("ctl00_contentHolder_txtDistributorNames").disabled = true;
        }


        function selectMemberName() {
            document.getElementById("ctl00_contentHolder_rankList").disabled = true;
            document.getElementById("ctl00_contentHolder_txtDistributorNames").disabled = false;
        }

        $(document).ready(function() { selectMemberName(); });
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" runat="server">
<div class="optiongroup mainwidth">
	  <ul>
	    <li class="optionstar"><a href="DistributorReceivedMessages.aspx"><span>收件箱</span></a></li>
	    <li><a href="DistributorSendedMessages.aspx" class="optionnext"><span>发件箱</span></a></li>
	    <li class="menucurrent"><a href="javascript:void(0)" class="optioncurrentend"><span class="optioncenter">发送站内信给分销商</span></a></li>
      </ul>
</div>
	<div class="dataarea mainwidth">
    <div class="toptitle"> <em><img src="../images/07.gif" width="32" height="32" /></em> <span class="title_height">发送站内消息给指定的分销商</span> </div>
    <div class="Emal">
      <ul>
        <li class="colorQ"><strong>1.填写消息内容</strong></li>
        <li class="colorE"><strong>2.发送</strong></li>
      </ul>
    </div>
    <div class="areaform">
     <ul>
    <li><span class="formitemtitle Pw_100">发送对象：</span><input type="radio" name="rdoList" value="1" onclick="selectMemberName()" checked="true"  id="rdoName" runat="server" />发送给指定的分销商<input type="radio" name="rdoList" value="2" onclick="selectRank()" id="rdoRank" runat="server"  />发送给指定的分销商等级</li>
    </ul>
		<ul>
		  <li><span class="formitemtitle Pw_100">分销商名：</span>
            <asp:TextBox ID="txtDistributorNames" runat="server" TextMode="MultiLine" Rows="8" Columns="50" ></asp:TextBox>
            <p class="Pa_100 colorR">一行一个分销商名称</p>
          </li>
        </ul>

	</div>
    <div class="areaform">
      <ul>
        <li><span class="formitemtitle Pw_100">按等级发送：</span>
           <abbr class="formselect">
                 <Hi:DistributorGradeDropDownList ID="rankList" class="formselect input100" runat="server" AllowNull="true" NullToDisplay="全部" />
          </abbr>
        </li>
      </ul>
    </div>
    <div class="btn Pa_100">     
     <asp:Button runat="server" ID="btnSendToRank" Text="发 送" class="submit_DAqueding" />
     <asp:CheckBox runat="server" ID="chkIsSendEmail" Text="附加发送邮件" /><span style="color:Red; width:440px;">(对于比较重要的信息，可以在发送站内信的同时，顺便也发送邮件给这些分销商)</span>
    </div>
    <!--搜索-->
    <!--数据列表区域-->
    
     
    <!--数据列表底部功能区域-->
</div>
	<div class="databottom"></div>

</asp:Content>
