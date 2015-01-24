<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Demand Request Details</title>
    <style type="text/css">
        .verywide
        {
        	width : 500px;
        }
        .wide
        {
        	width : 300px;
        }
        
        .style1
        {
            height: 176px;
        }
        .style3
        {
            height: 39px;
        }
        .style4
        {
            height: 537px;
            width: 64px;
        }
        .style5
        {
            height: 537px;
        }
        .style6
        {
            height: 537px;
            width: 701px;
        }
        .style7
        {
            height: 29px;
        }
        .style9
        {
            height: 23px;
        }
        .style10
        {
        }
        .style11
        {
            height: 42px;
            width: 154px;
        }
        .style12
        {
            height: 42px;
        }
        .style13
        {
            height: 41px;
        }
        .style14
        {
            color: #9900CC;
            font-weight: bold;
        }
        .style15
        {
            font-weight: bold;
        }
        .style16
        {
            font-weight: bold;
            color: #FF0000;
            font-size: small;
        }
    </style>
    <script type="text/javascript">
        function ToggleTextBox(CheckBox, TextBoxID) {
            var TextBox = document.getElementById(TextBoxID);
            if (CheckBox.checked) {
                TextBox.disabled = false;
                TextBox.value = "";
            }
            else {
                TextBox.disabled = true;
                TextBox.value = "";
            }
        }
        
        function test()
        {
            alert('test');
        }
        
        function ToggleForEmail(sSendEmail, CheckBoxID) 
        {
            //alert('here');
            var CheckBox = document.getElementById(CheckBoxID);
            //alert(sSendEmail);
            if(sSendEmail == 'Yes') 
            {
                //alert(sSendEmail);
            
                CheckBox.disabled = false;
                CheckBox.checked=false;
                //TextBox.disabled = false;
                TextBox.value = "";
            }
            else 
            {
                // alert(sSendEmail);
                //alert(CheckBox.value);
                CheckBox.disabled = true;
                CheckBox.checked=false;
                //TextBox.disabled = true;
                TextBox.value = "";
            }
            
        }
        /*function ToggleForEmail(SendEmail, CheckBoxID) 
        {
        
            alert(Sendmail.value);
            var CheckBox = document.getElementById(CheckBoxID);
            //var TextBox = document.getElementById(TextBoxID);
            if(SendEmail = "Yes")
            {
                CheckBox.disabled = false;
                CheckBox.checked=false;
                //TextBox.disabled = false;
                TextBox.value = "";
            }
            else {
            alert(CheckBox.value);
                CheckBox.disabled = true;
                CheckBox.checked=false;
                //TextBox.disabled = true;
                TextBox.value = "";
            }
            
        }*/
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
    <div>
       <table style="height: 537px; width: 963px">
        <tr>
            <td class="style15" colspan="4">
                <img alt="Header Background" src="bg1.jpg" 
                    style="width: 1300px; height: 69px" /></td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                       <asp:Label ID="Label13" runat="server" Text="New Demand Request" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
            </td>
        </tr>
        <tr>
          <td class="style13" colspan="4">          <a href="Home.aspx">HOME</a></td>
        </tr>
        <tr>
          <td class="style13" colspan="4">                    
              <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
            </td>
        </tr>
        <tr>
          <td class="style4">          &nbsp;</td>
          <td class="style6">          
              <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                  DataKeyNames="RequestNo" DataSourceID="ObjectDataSource1" Height="50px" 
                  Width="409px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                  onpageindexchanging="DetailsView1_PageIndexChanging" 
                  style="margin-right: 0px; font-family: Calibri; text-align: left;" ondatabinding="DetailsView1_DataBinding" 
                  ondatabound="DetailsView1_DataBound" EmptyDataText="No Records Available" >
                  <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                  <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                  <RowStyle BackColor="White" ForeColor="#003399" />
                  <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                  <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                  <Fields>
                      <asp:BoundField DataField="RequestNo" HeaderText="RequestNo" 
                          SortExpression="RequestNo" InsertVisible="False" ReadOnly="True" />
                      <asp:BoundField DataField="AZID" HeaderText="AZID" SortExpression="AZID" />
                      <asp:BoundField DataField="ClarityID" HeaderText="ClarityID" 
                          SortExpression="ClarityID" />
                      <asp:BoundField DataField="EngagementReference" 
                          HeaderText="EngagementReference" SortExpression="EngagementReference" />
                      <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" 
                          SortExpression="ProjectName" ControlStyle-CssClass="wide" >
<ControlStyle CssClass="wide"></ControlStyle>
                      </asp:BoundField>
                      <asp:BoundField DataField="ProjectDescription" HeaderText="ProjectDescription" 
                          SortExpression="ProjectDescription" ControlStyle-CssClass="verywide" >
<ControlStyle CssClass="verywide"></ControlStyle>
                      </asp:BoundField>
                      <asp:BoundField DataField="FunctionalPortfolio" 
                          HeaderText="FunctionalPortfolio" SortExpression="FunctionalPortfolio" />
                      <asp:BoundField DataField="IDMName" HeaderText="IDMName" 
                          SortExpression="IDMName" />
                      <asp:BoundField DataField="IDMEmailID" HeaderText="IDMEmailID" 
                          SortExpression="IDMEmailID" />
                      <asp:BoundField DataField="InfyRequestorName" HeaderText="InfyRequestorName" 
                          SortExpression="InfyRequestorName" />
                      <asp:BoundField DataField="InfyRequestorEmailID" 
                          HeaderText="InfyRequestorEmailID" SortExpression="InfyRequestorEmailID" />
                      <asp:BoundField DataField="RequestStatus" HeaderText="RequestStatus" 
                          SortExpression="RequestStatus" />
                      <asp:BoundField DataField="SoWEstimate" HeaderText="SoWEstimate" 
                          SortExpression="SoWEstimate" />
                      <asp:BoundField DataField="MultipleApplication" 
                          HeaderText="MultipleApplication" SortExpression="MultipleApplication" />
                      <asp:BoundField DataField="DateRequested" HeaderText="Date Requested" 
                          SortExpression="DateRequested" DataFormatString="{0:dd-MMM-yy}" />
                      <asp:BoundField DataField="FilePath" HeaderText="FilePath" 
                          SortExpression="FilePath" />
                      <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                          SortExpression="Remarks" />
                      <asp:BoundField DataField="UserPrid" HeaderText="UserPrid" 
                          SortExpression="UserPrid" />
                      <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                      <asp:BoundField DataField="DateSubmitted" DataFormatString="{0:dd-MMM-yy}" 
                          HeaderText="Admin Update On" SortExpression="DateSubmitted" />
                      <asp:BoundField DataField="AdminFilesPath" HeaderText="AdminFilesPath" 
                          SortExpression="AdminFilesPath" />
                      <asp:BoundField DataField="AdminRemarks" HeaderText="Admin Remarks" 
                          SortExpression="AdminRemarks" />
                      <asp:CommandField ShowEditButton="True" />
                  </Fields>
                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <EditRowStyle BackColor="#2461BF" />
                  <AlternatingRowStyle BackColor="White" />
              </asp:DetailsView>
              <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
              </asp:ToolkitScriptManager>
              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                  OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAZID" 
                  TypeName="AZIDTableAdapters.NDRequestTableAdapter" DeleteMethod="Delete" 
                  InsertMethod="Insert" UpdateMethod="Update">
                  <DeleteParameters>
                      <asp:Parameter Name="Original_RequestNo" Type="Int32" />
                  </DeleteParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="AZID" Type="String" />
                      <asp:Parameter Name="ClarityID" Type="String" />
                      <asp:Parameter Name="EngagementReference" Type="String" />
                      <asp:Parameter Name="ProjectName" Type="String" />
                      <asp:Parameter Name="ProjectDescription" Type="String" />
                      <asp:Parameter Name="FunctionalPortfolio" Type="String" />
                      <asp:Parameter Name="AZIDMName" Type="String" />
                      <asp:Parameter Name="AZIDMEmailID" Type="String" />
                      <asp:Parameter Name="InfyRequestorName" Type="String" />
                      <asp:Parameter Name="InfyRequestorEmailID" Type="String" />
                      <asp:Parameter Name="RequestStatus" Type="String" />
                      <asp:Parameter Name="SoWEstimate" Type="String" />
                      <asp:Parameter Name="MultipleApplication" Type="String" />
                      <asp:Parameter Name="DateRequested" Type="DateTime" />
                      <asp:Parameter Name="FilePath" Type="String" />
                      <asp:Parameter Name="Remarks" Type="String" />
                      <asp:Parameter Name="UserPrid" Type="String" />
                      <asp:Parameter Name="Cost" Type="String" />
                      <asp:Parameter Name="DateSubmitted" Type="DateTime" />
                      <asp:Parameter Name="AdminFilesPath" Type="String" />
                      <asp:Parameter Name="Original_RequestNo" Type="Int32" />
                  </UpdateParameters>
                  <SelectParameters>
                      <asp:QueryStringParameter Name="AZID" QueryStringField="AZID" Type="String" 
                          DefaultValue="ID1001" />
                  </SelectParameters>
                  <InsertParameters>
                      <asp:Parameter Name="AZID" Type="String" />
                      <asp:Parameter Name="ClarityID" Type="String" />
                      <asp:Parameter Name="EngagementReference" Type="String" />
                      <asp:Parameter Name="ProjectName" Type="String" />
                      <asp:Parameter Name="ProjectDescription" Type="String" />
                      <asp:Parameter Name="FunctionalPortfolio" Type="String" />
                      <asp:Parameter Name="AZIDMName" Type="String" />
                      <asp:Parameter Name="AZIDMEmailID" Type="String" />
                      <asp:Parameter Name="InfyRequestorName" Type="String" />
                      <asp:Parameter Name="InfyRequestorEmailID" Type="String" />
                      <asp:Parameter Name="RequestStatus" Type="String" />
                      <asp:Parameter Name="SoWEstimate" Type="String" />
                      <asp:Parameter Name="MultipleApplication" Type="String" />
                      <asp:Parameter Name="DateRequested" Type="DateTime" />
                      <asp:Parameter Name="FilePath" Type="String" />
                      <asp:Parameter Name="Remarks" Type="String" />
                      <asp:Parameter Name="UserPrid" Type="String" />
                      <asp:Parameter Name="Cost" Type="String" />
                      <asp:Parameter Name="DateSubmitted" Type="DateTime" />
                      <asp:Parameter Name="AdminFilesPath" Type="String" />
                  </InsertParameters>
              </asp:ObjectDataSource>
              <br />
              <asp:HyperLink ID="hyAdmin" runat="server" NavigateUrl="Admin.aspx">BACK TO 
              ADMIN</asp:HyperLink>
              <br />
                    </td>
          <td class="style6">     
          <asp:Panel ID="Panel1" runat="server" style="font-family: Calibri">     
              <table frame="border" style="width: 456px">
              <tr><td bgcolor="#003399" class="style9" colspan="2">
                  <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="White" 
                      Text="UPDATE REQUEST STATUS"></asp:Label>
                  </td></tr>
              <tr><td class="style11">
                  <asp:Label ID="lblUpdate" runat="server" ForeColor="#003399" 
                      Text="Modify Request Status"></asp:Label>
                  </td><td class="style12">
                      <asp:DropDownList ID="drpRequestStatus" runat="server" Height="23px" 
                          Width="127px">
                          <asp:ListItem>Draft</asp:ListItem>
                          <asp:ListItem>In Progress</asp:ListItem>
                          <asp:ListItem>Cancelled</asp:ListItem>
                          <asp:ListItem>Completed</asp:ListItem>
                          <asp:ListItem>Need More Info</asp:ListItem>
                      </asp:DropDownList>
                  </td></tr>
              <tr><td class="style10">
                  <asp:Label ID="lblCost" runat="server" Text="Cost" ForeColor="#003399" ></asp:Label>
                  </td><td>
                      <asp:TextBox ID="txtCost" runat="server" MaxLength="10"></asp:TextBox>
                  </td></tr>
              <tr><td class="style10">
                  <asp:Label ID="lblSubmissionDate" runat="server" ForeColor="#003399" Text="Submission Date"></asp:Label>
                  </td><td>
                      <asp:TextBox ID="txtSubmitdate" runat="server" Width="164px" MaxLength="10"></asp:TextBox>
                      <asp:CalendarExtender TargetControlID="txtSubmitdate" runat="server" />
                  </td></tr>
              <tr><td class="style10">
                  <asp:Label ID="lblSubmissionDate0" runat="server" ForeColor="#003399" 
                      Text="Admin Files"></asp:Label>
                  </td><td>
                      <asp:FileUpload ID="fAdminFiles" runat="server" />
                  </td></tr>
                  <tr>
                      <td class="style16">
                          Do you want to send Email on this update to Requestor?</td>
                      <td>
                          <asp:RadioButton ID="RBNo" runat="server" Checked="True" GroupName="SendEmail" Text="No" onclick="ToggleForEmail('No', 'chkidm')" />
                          <asp:RadioButton ID="RBYes" runat="server" GroupName="SendEmail" Text="Yes" onclick="ToggleForEmail('Yes', 'chkidm')"  />
                      </td>
                  </tr>
              <tr><td class="style10">
                  <input ID="chkidm" class="style14" onclick="ToggleTextBox(this,'txtIDM')" 
                      type="checkbox" disabled="disabled" /><span class="style14">CC IDM?</span></td>
                  <td>
                      <asp:TextBox ID="txtIDM" runat="server" 
                          Width="295px" Enabled="False" ToolTip="Enter IDMs email ID" 
                          AutoCompleteType="Email"></asp:TextBox>
                  </td>
                  </tr>
                  <tr>
                      <td class="style10">
                          <asp:Label ID="lblRemarks" runat="server" ForeColor="#003399" Text="Remarks"></asp:Label>
                      </td>
                      <td>
                          <asp:TextBox ID="txtRemarks" runat="server" Height="165px" TextMode="MultiLine" 
                              Width="304px"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td class="style10">
                          &nbsp;</td>
                      <td>
                          <asp:Button ID="btnUpdate" runat="server" BackColor="White" 
                              BorderColor="#003399" Font-Bold="True" ForeColor="#003399" Height="38px" 
                              onclick="btnUpdate_Click" Text="UPDATE STATUS" Width="261px" />
                      </td>
                  </tr>
                  <tr>
                      <td class="style10" colspan="2">
                          <asp:Label ID="lblAckUpdate" runat="server" Font-Bold="True" 
                              ForeColor="#009933" Text="-"></asp:Label>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                              ControlToValidate="txtIDM" ErrorMessage="Please enter Valid email ID" 
                              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
              </table>
              
              
              </asp:Panel>
              
              </td>
          <td class="style5">          &nbsp;</td>
        </tr>
        <tr>
          <td class="style1" colspan="4">          
              &nbsp;</td>
        </tr>
        <tr>
          <td class="style7" colspan="4">          </td>
        </tr>
         <tr>
            <td class="style1" colspan="4">
                <img alt="Footer Background" src="bg13.jpg" 
                    style="width: 1300px; height: 119px" /></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
