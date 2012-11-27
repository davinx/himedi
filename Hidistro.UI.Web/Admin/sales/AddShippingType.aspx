<%@ Page Language="C#" AutoEventWireup="true" Inherits="Hidistro.UI.Web.Admin.AddShippingType" CodeFile="AddShippingType.aspx.cs" MasterPageFile="~/Admin/Admin.Master" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Validator" Assembly="Hidistro.UI.Common.Validator" %>
<%@ Register TagPrefix="Kindeditor" Namespace="kindeditor.Net" Assembly="kindeditor.Net" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
 <Hi:Style  runat="server" Href="/admin/css/Hishopv5.css" Media="screen" />
 <Hi:Script ID="Script1" runat="server" Src="/admin/js/Hishopv5.js"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
<div class="areacolumn clearfix">
		<div class="columnleft clearfix">
                  <ul>
                        <li><a href="ShippingTypes.aspx"><span>���ͷ�ʽ�б�</span></a></li>
                  </ul>
</div>
		<div class="columnright">
		  <div class="title"> 
            <em><img src="../images/05.gif" width="32" height="32" /></em>
		    <h1>�������ͷ�ʽ</h1>
		    <span>ÿһ�����ͷ�ʽ�������һ��������˾���ҽ��������˾�ĵ���������շѱ�׼���õģ�������Ϊ��ͬ�ĵ���������ò�ͬ���շѱ�׼</span></div>
		  <div class="formitem validator4">
		    <ul>
		      <li> <span class="formitemtitle Pw_110">���ͷ�ʽ���ƣ�<em >*</em></span>
		        <asp:TextBox ID="txtModeName" runat="server" class="forminput"></asp:TextBox>
		        <p id="ctl00_contentHolder_txtModeNameTip">���ͷ�ʽ���Ʋ���Ϊ�գ�����������60�ַ�����</p>
	          </li>
	            <li> <span class="formitemtitle Pw_110">ѡ��������˾��<em >*</em></span>
		          <span style="float:left;">
		          <Hi:ExpressCheckBoxList ID="expressCheckBoxList" RepeatDirection="Horizontal" RepeatColumns="6" runat="server" /></span>
		        <p id="P1">��ѡ������ͷ�ʽ��Ӧ��������˾</p>
	          </li>
	          <li>
	            <span class="formitemtitle Pw_110">ѡ������ģ�壺<em>*</em></span>
	            <hi:ShippingTemplatesDropDownList runat="server" ID="shippingTemplatesDropDownList" NullToDisplay="��ѡ������ģ��" />
	            <a href="AddShippingTemplate.aspx" target="_blank">��������ģ��</a>
		        <p id="P2">��ѡ������ͷ�ʽ��Ӧ������ģ��</p>
	          </li>
           <li class="clearfix"> <span class="formitemtitle Pw_110">��ע��</span>
          <span><Kindeditor:KindeditorControl ID="fck" runat="server" Width="550"  Height="200px" /></span>
          </li>
	        </ul>
    <ul class="btn Pa_110 clear">
    <asp:Button ID="btnCreate" runat="server" OnClientClick="return ValidateAll();" OnClick="btnCreate_Click"  CssClass="submit_DAqueding inbnt" Text="�� ��"/>
            </ul>
	      </div>
  </div>
</div>
<div class="databottom">
  <div class="databottom_bg"></div>
</div>
<div class="bottomarea testArea">
  <!--����logo����-->
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="validateHolder" runat="server">
<script type="text/javascript" language="javascript">
function InitValidators()
{
    initValid(new InputValidator('ctl00_contentHolder_txtModeName', 1, 60, false, null, '���ͷ�ʽ���Ʋ���Ϊ�գ�����������60�ַ�����'))
   
}
$(document).ready(function() { InitValidators(); });
function ValidateAll() {
    if (PageIsValid()) {
        if ($("#ctl00_contentHolder_shippingTemplatesDropDownList").val() != ""
        && $("#ctl00_contentHolder_shippingTemplatesDropDownList").val() != undefined) {
            return true;
        }
        else {
            alert("����Ҫѡ��һ������ģ�塣");
            return false;
        }
    }
    return false;
}

</script>
</asp:Content>
