<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>New Demand Admin</title>
    
    
    <style type="text/css">
        
        .style1
        {
            height: 173px;
        }
        .style3
        {
            height: 38px;
            width: 1261px;
        }
        .style9
        {
            width: 1261px;
        }
        .style10
        {
            height: 173px;
            width: 1261px;
        }
    </style>
</head>
<body>
   
    <form id="form1" runat="server">
    <div>
       <table style="height: 537px; width: 963px">
        <tr>
            <td class="style9">
                <img alt="Header Background" src="bg1.jpg" 
                    style="width: 1300px; height: 69px" /></td>
        </tr>
        <tr>
            <td class="style3">
                       <asp:Label ID="Label13" runat="server" Text="New Demand Request" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
            </td>
        </tr>
        <tr>
          <td class="style3">          <a href="Home.aspx">HOME</a></td>
        </tr>
        <tr>
          <td class="style3">          
           <asp:Label ID="lblGetData" runat="server" Font-Names="Copperplate Gothic Light" 
                  Text="From "></asp:Label>
              <asp:TextBox ID="txtDateFrom" runat="server" Width="110px"></asp:TextBox>
              <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDateFrom" runat="server" />
&nbsp;&nbsp;&nbsp; <asp:Label ID="Label14" runat="server" Font-Names="Copperplate Gothic Light" Text="To"></asp:Label>
&nbsp;&nbsp;
              <asp:TextBox ID="txtDateTo" runat="server" Width="110px"></asp:TextBox>
              <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDateTo" runat="server" />
&nbsp;&nbsp;
              <asp:Button ID="btnPullData" runat="server" 
                  Font-Names="Copperplate Gothic Light" Text="Get Data" Width="155px" 
                  onclick="btnPullData_Click" />
&nbsp;&nbsp;
              <asp:Button ID="btnResetData" runat="server" 
                  Font-Names="Copperplate Gothic Light" Text="Reset" Width="155px" 
                  onclick="btnResetData_Click" />
           &nbsp;<iframe src="Navigation2.htm" height="50" width="120" frameborder="0" 
                    scrolling="no" id="I1" name="I1" ></iframe>
                       
           </td>
        </tr>
        <tr>
          <td class="style9">          
                       <asp:Label ID="lblTemplate" runat="server" 
                           Text="Below are the list of the Existing New Demand Request" 
                           CssClass="style1" Font-Size="Medium" Height="23px" Width="834px" 
                           Font-Names="Copperplate Gothic Light" ForeColor="#000099"></asp:Label>
                       
                       <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                           BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                           DataKeyNames="AZID" DataSourceID="SqlDataSource1" 
                           onselectedindexchanged="GridView3_SelectedIndexChanged" 
                           Width="1153px" onrowcommand="GridView3_RowCommand" 
                           style="font-family: Calibri; font-size: 9pt; margin-bottom: 0px;" ForeColor="Black" 
                           GridLines="Vertical">
                           <Columns>
                               <asp:BoundField DataField="AZID" HeaderText="Request ID" 
                                   SortExpression="AZID" />
                               <asp:BoundField DataField="ClarityID" HeaderText="ClarityID" 
                                   SortExpression="ClarityID" />
                               <asp:BoundField DataField="ProjectName" 
                                   HeaderText="Project Name" SortExpression="ProjectName" />
                               <asp:BoundField DataField="FunctionalPortfolio" HeaderText="Functional Portfolio" 
                                   SortExpression="FunctionalPortfolio" />
                               <asp:BoundField DataField="AZIDMName" HeaderText="AZ PM" 
                                   SortExpression="AZIDMName" />
                               <asp:BoundField DataField="InfyRequestorName" 
                                   HeaderText="Requestor Email" SortExpression="InfyRequestorName" />
                               <asp:BoundField DataField="SoWEstimate" HeaderText="SoW/Estimate" 
                                   SortExpression="SoWEstimate" />
                               <asp:HyperLinkField DataNavigateUrlFields="AZID" 
                                   DataNavigateUrlFormatString="Details.aspx?AZID={0}" HeaderText="Details" 
                                   Text="Details" />
                               <asp:HyperLinkField DataNavigateUrlFields="FilePath" 
                                   HeaderText="Request Files" Text="Download Request" />
                               <asp:ButtonField CommandName="Delete" 
                                   HeaderText="Delete Request" ShowHeader="True" Text="Delete" />
                               <asp:ButtonField CommandName="Select" HeaderText="View/Update Details" 
                                   ShowHeader="True" Text="View/Update" />
                               <asp:HyperLinkField DataNavigateUrlFields="AdminFilesPath" 
                                   HeaderText="ND Team Response " Text="Download Response " />
                               <asp:BoundField DataField="DateRequested" DataFormatString="{0:dd-MMM-yy}" 
                                   HeaderText="Request Date" SortExpression="DateRequested" />
                               <asp:BoundField DataField="DateSubmitted" DataFormatString="{0:dd-MMM-yy}" 
                                   HeaderText="Response Date" SortExpression="DateSubmitted" />
                               <asp:BoundField DataField="RequestStatus" HeaderText="RequestStatus" 
                                   SortExpression="RequestStatus" />
                               <asp:BoundField DataField="AdminRemarks" HeaderText="AdminRemarks" 
                                   SortExpression="AdminRemarks" />
                           </Columns>
                           <FooterStyle BackColor="#CCCCCC" />
                           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                           <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                           <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="#CCCCCC" />
                       </asp:GridView>
                       
                       <br />
                       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                       </asp:ToolkitScriptManager>
                       <br />
                       
                    <br />
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:RemoteSQLConnectionString %>" 
                  SelectCommand="SELECT * FROM [NDRequest]" 
                           
                           ProviderName="<%$ ConnectionStrings:RemoteSQLConnectionString.ProviderName %>" 
                           DeleteCommand="DELETE FROM NDRequest WHERE (AZID = ?)"></asp:SqlDataSource>
                       <br />
                       <br />
              <br />
              <br />
              &nbsp;<a href="NewRequest.aspx">New Requests</a></td>
        </tr>
        <tr>
          <td class="style10">          &nbsp;</td>
        </tr>
         <tr>
            <td class="style10">
                <img alt="Footer Background" src="bg13.jpg" 
                    style="width: 1300px; height: 119px" /></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
