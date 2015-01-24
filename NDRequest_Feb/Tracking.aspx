<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tracking.aspx.cs" Inherits="Tracking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Track My Request</title>
    <style type="text/css">
        .style15
        {
            text-align: right;
        }
        .style16
        {
            text-align: right;
            width: 1225px;
        }
        .style17
        {
            width: 4px;
        }
        .style8
        {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="height: 537px; width:100px">
        <tr>
            <td class="style3" colspan="3">
                       <img alt="Header Background" src="bg1.jpg" 
                           style="width: 1300px; height: 54px" /></td>
        </tr>
            
               
        <tr>
            <td class="style3" colspan="3">
                       <asp:Label ID="Label13" runat="server" Text="Your Requests" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
            </td>
        </tr>
            
               
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                <table style="height: 225px; width: 400px; font-size: x-small;" >
                <tr style="">
                   <td class="style8">
                       
                <iframe src="Navigation2.htm" height="50" width="120" frameborder="0" 
                    scrolling="no" id="I1" name="I1" ></iframe>
                       
                    </td>
                </tr>
                <tr style="">
                   <td class="style8">
                       
                       <br />
                       
                    </td>
                </tr>
                <tr style="">
                   <td class="style8">
                       <asp:GridView ID="dgTrackingDetails" runat="server" AutoGenerateColumns="False" 
                           BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                           CellPadding="3" DataSourceID="SqlDataSource1" Font-Size="Small" 
                           Width="1153px" AllowPaging="True" AllowSorting="True" 
                           style="font-size: 9pt; font-family: Calibri" ForeColor="Black" 
                           GridLines="Vertical" onrowcommand="dgTrackingDetails_RowCommand">
                           <Columns>
                               <asp:BoundField DataField="AZID" HeaderText="Request ID" 
                                   SortExpression="AZID" />
                               <asp:BoundField DataField="ClarityID" HeaderText="Clarity ID" 
                                   SortExpression="ClarityID" />
                               <asp:BoundField DataField="ProjectName" HeaderText="Project Name" 
                                   SortExpression="ProjectName" />
                               <asp:BoundField DataField="FunctionalPortfolio" 
                                   HeaderText="Functional Portfolio" SortExpression="FunctionalPortfolio" />
                               <asp:BoundField DataField="SoWEstimate" HeaderText="SoWEstimate" 
                                   SortExpression="SoWEstimate" />
                               <asp:BoundField DataField="RequestStatus" HeaderText="RequestStatus" 
                                   SortExpression="RequestStatus" />
                               <asp:BoundField DataField="DateRequested" HeaderText="Date Requested" 
                                   SortExpression="DateRequested" DataFormatString="{0:dd-MMM-yy}" />
                               <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                               <asp:BoundField DataField="DateSubmitted" DataFormatString="{0:dd-MMM-yy}" 
                                   HeaderText="Response Date" SortExpression="DateSubmitted" />
                               <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                   SortExpression="Remarks" />
                               <asp:TemplateField HeaderText="Follow Up">
                               <ItemTemplate>
                                            
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                            NavigateUrl='<%# getMailTo(Eval("AZID"),Eval("ProjectName")) %>'
                                                            Text='Send FollowUp Email'>
                                           </asp:HyperLink>
                                </ItemTemplate>
                               </asp:TemplateField>
                               <asp:ButtonField CommandName="Select" HeaderText="View/Update Details" 
                                   ShowHeader="True" Text="View/Update" />
                               <asp:HyperLinkField DataNavigateUrlFields="AdminFilesPath" 
                                   HeaderText="ND Team Response" Text="Download Response Files" />
                               <asp:BoundField DataField="RequestStatus" HeaderText="Status" 
                                   SortExpression="RequestStatus" />
                           </Columns>
                           <FooterStyle BackColor="#CCCCCC" />
                           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                           <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                           <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                           <AlternatingRowStyle BackColor="#CCCCCC" />
                       </asp:GridView>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:RemoteSQLConnectionString %>" 
                           ProviderName="<%$ ConnectionStrings:RemoteSQLConnectionString.ProviderName %>" 
                           
                           
                           
                           SelectCommand="SELECT [AZID], [ClarityID], [ProjectName], [FunctionalPortfolio], [SoWEstimate], [RequestStatus], [DateRequested], [Cost], [DateSubmitted], [Remarks], [AdminFilesPath] FROM [NDRequest] WHERE ([UserPrid] = ?)">
                           <SelectParameters>
                               <asp:SessionParameter Name="UserPrid2" SessionField="User" Type="String" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                       <br />
                       
                    </td>
                </tr>
                <tr style="">
                   <td class="style8">
                       
                       <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                       
                    </td>
                </tr>
                <tr>
                   <td>
                       <br />
                       <br />
                       <br />
                       <br />
                       <br />
                       <br />
                    </td>
                </tr>
            </table>
                
                
                </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <img alt="Footer Background" src="bg13.jpg" 
                    style="width: 1300px; height: 119px" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
