<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View-Update Details</title>
    <style type="text/css">
        .style1
        {
            width: 14px;
        }
        .style2
        {
            width: 55px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
 <asp:ScriptManager ID="ScriptManager1" runat="server">
                       </asp:ScriptManager>
    <table style="height: 537px; width:100px">
        <tr>
            <td class="style3" colspan="5">
                       <img alt="Header Background" src="bg1.jpg" 
                           style="width: 1300px; height: 38px" /></td>
        </tr>
            
               
        <tr>
            <td class="style3" colspan="5">
                       <asp:Label ID="Label13" runat="server" Text="New Demand Request" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
            </td>
        </tr>
            
               
        <tr>
            <td class="style15">
                <asp:Label ID="lblUserName" runat="server" 
                    Font-Names="Copperplate Gothic Light" Font-Size="Smaller" ForeColor="Red" 
                    Text="Welcome &amp;nbsp;" style="font-size: medium; font-weight: 700"></asp:Label>
                </td>
            <td align="right">
            
                
                &nbsp;</td>
            <td class="style2" align="right">
                &nbsp;</td>
            <td class="style15" align="right">
                &nbsp;</td>
            <td class="style15" align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="4">
                <table style="height: 225px; width: 895px; font-size: x-small;" frame="box">
                <tr style="">
                   <td class="style8">
                       &nbsp;</td>
                   <td class="style7" top: 2px; left: 225px;" align="right">
            
                
                <iframe src="Navigation3.htm" height="50" width="150" frameborder="0" 
                    scrolling="no" id="I1" name="I1" ></iframe>
                                
                    </td>
                </tr>
                <tr style="">
                   <td class="style8">
                       <asp:Label ID="Label1" runat="server" Text="AZ ID" CssClass="style1" 
                           Height="20px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style7" top: 2px; left: 225px;">
                                            <asp:TextBox ID="txtAZID" runat="server" MaxLength="6" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="style8">
                       <asp:Label ID="Label2" runat="server" Text="Project Name" CssClass="style1" 
                           Height="23px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style7">
                       <asp:TextBox ID="txtProjectName" runat="server" Width="375px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                           ControlToValidate="txtProjectName" ErrorMessage="Project Name Required"></asp:RequiredFieldValidator>
                       <br />
                    </td>
                </tr>
                <tr>
                   <td class="style8">  
                       <asp:Label ID="Label3" runat="server" Text="Clarity Id" CssClass="style1" 
                           Height="23px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style7">
                       <asp:TextBox ID="txtClarityId" runat="server" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="style9">
                       <asp:Label ID="Label4" runat="server" Text="Functional Area" CssClass="style1" 
                           Height="23px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style10">
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                       <ContentTemplate>
                       <asp:DropDownList ID="drpFuncArea" runat="server" AutoPostBack="True" 
                           onselectedindexchanged="drpFuncArea_SelectedIndexChanged">
                           <asp:ListItem>CIS</asp:ListItem>
                           <asp:ListItem>EIS</asp:ListItem>
                           <asp:ListItem>GCO</asp:ListItem>
                           <asp:ListItem>GOPS</asp:ListItem>
                           <asp:ListItem>R&amp;D</asp:ListItem>
                           <asp:ListItem>EF</asp:ListItem>
                           <asp:ListItem>TSD</asp:ListItem>
                           <asp:ListItem>CSD</asp:ListItem>
                           <asp:ListItem>Multiple</asp:ListItem>
                       </asp:DropDownList>&nbsp&nbsp&nbsp&nbsp
<asp:Label ID="lblMulFuncArea" runat="server" Text="Mention the Multiple Set Areas" CssClass="style1" 
                           Height="23px" Width="180px" Font-Size="Small" Visible="False"></asp:Label>
                       <asp:TextBox ID="txtMultipleSetAreas" runat="server" Width="224px" 
                           Visible="False" style="margin-left: 0px"></asp:TextBox>
                       &nbsp;</ContentTemplate>
                       </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                   <td class="style13">
                       <asp:Label ID="Label5" runat="server" Text="AZ PM" CssClass="style1" 
                           Height="23px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style14">
                       <asp:TextBox ID="txtAZRequestor" runat="server"  Width="224px" 
                           MaxLength="50"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                           ControlToValidate="txtAZRequestor" ErrorMessage="AZ Contact Name missing"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td class="style23">
                       <asp:Label ID="lblRequestor" runat="server" 
                           
                           Text="Requestor's Email ID <b>(Should be one who is logging the rerquest)</b>" CssClass="style1" 
                           Height="51px" Width="132px"></asp:Label>
                       
                    </td>
                   <td class="style24">
                       <asp:TextBox ID="txtInfyRequestor" runat="server"  Width="225px" 
                           MaxLength="50" ontextchanged="txtInfyRequestor_TextChanged"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                           ControlToValidate="txtInfyRequestor" ErrorMessage="Requestor Name Missing"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                           ControlToValidate="txtInfyRequestor" ErrorMessage="Invalid Email Address" 
                           ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid 
                       Email Address</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                   <td class="style8">
                       <asp:Label ID="Label7" runat="server" Text="Request for an " CssClass="style1" 
                           Height="23px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style7">
                       <asp:RadioButton ID="rdbSoW" runat="server" 
                           Font-Names="Copperplate Gothic Light" GroupName="rdbRequestGroup" 
                           Text="SOW" oncheckedchanged="rdbSoW_CheckedChanged" />
                       &nbsp;<asp:RadioButton ID="rdbEST" runat="server" Font-Names="Copperplate Gothic Light" 
                           GroupName="rdbRequestGroup" Text="Estimate" 
                           oncheckedchanged="rdbEST_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                   <td class="style8">
                       <asp:Label ID="Label8" runat="server" Text="Please provide details of the project requirement" 
                           CssClass="style1" Height="48px" Width="115px"></asp:Label>
                       
                    </td>
                   <td class="style7">
                       <asp:TextBox ID="txtPrjDescription" runat="server" Height="92px" 
                           TextMode="MultiLine" Width="628px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                           ControlToValidate="txtPrjDescription" 
                           ErrorMessage="Description Information Missing">Description Missing</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td class="style11">
                       <asp:Label ID="Label9" runat="server" 
                           Text="Is the Request for Multiple Apps ? " CssClass="style1" Height="39px" 
                           Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style12">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                       <ContentTemplate>
                       <asp:RadioButton ID="rdbMulAppNo" runat="server" 
                           Font-Names="Copperplate Gothic Light" GroupName="rdbMultipleAppGrp" 
                           Text="No" Checked="True" 
                           AutoPostBack="True" oncheckedchanged="rdbMulAppNo_CheckedChanged" /> 
                       <asp:RadioButton ID="rdbMulAppYes" runat="server" 
                           Font-Names="Copperplate Gothic Light" GroupName="rdbMultipleAppGrp" 
                           Text="YES"  
                           AutoPostBack="True" oncheckedchanged="rdbMulAppYes_CheckedChanged" />
                      
                       
                      
                           &nbsp;&nbsp;&nbsp;
                           <asp:Label ID="lblTemplate" runat="server" CssClass="style1" 
                               Font-Overline="False" Font-Size="Small" Height="23px" 
                               Text="Please input the information of the multiple applications in the template available " 
                               Visible="False" Width="461px"></asp:Label>
                           
                            </ContentTemplate>
                       </asp:UpdatePanel>
                       
                    </td>
                </tr>
                <tr>
                   <td class="style18">
                       <asp:Label ID="Label11" runat="server" Text="Upload New Documents" 
                           CssClass="style1" Height="20px" Width="122px"></asp:Label>
                       
                    </td>
                   <td class="style19">
                       <asp:Label ID="Label12" runat="server" 
                           Text="Please Upload ONLY ZIP Format" 
                           CssClass="style1" Font-Size="Medium" Height="24px" Width="247px" 
                           Font-Bold="True" ForeColor="#009933"></asp:Label>
                       
                       <asp:FileUpload ID="FileUpload1" runat="server" />
                       
                       <br />
                       
                       <br />
                       &nbsp<asp:Label ID="lblUploadedFiles" runat="server" Font-Bold="True" Font-Size="Medium" 
                           ForeColor="#003366" Text="The newly uploaded files will overwrite these"></asp:Label>
                       <br />
                       
                    </td>
                </tr>
                <tr>
                   <td class="style20"></td>
                   <td class="style21"></td>
                </tr>
                <tr>
                   <td class="style8">&nbsp;</td>
                   <td class="style7">
                       <asp:Button ID="btnSubmit" runat="server" Font-Names="Copperplate Gothic Bold" 
                           Font-Size="Medium" onclick="btnSubmit_Click" Text="Update Request" 
                           Width="295px" />
                    </td>
                </tr>
                <tr>
                   <td colspan="2" class="style22">
                       
                       </td>
                </tr>
                <tr>
                   <td colspan="2">
                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                           Font-Size="Small" />
                       
                    </td>
                </tr>
                <tr>
                   <td colspan="2">
                       <a href="Home.aspx">HOME</a></td>
                </tr>
            </table>
                
                
                </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="5">
                <img alt="Footer Background" src="bg13.jpg" 
                    style="width: 1300px; height: 119px" /></td>
        </tr>
    </table>
    
     
     
       
     
     
    
     
     
    
    
                    
     
     
    
                        <asp:Label ID="lblStatus" runat="server" Text="-" Font-Bold="True" Font-Names="Copperplate Gothic Light" 
                    Font-Size="Large" ForeColor="#339933"></asp:Label>
    
     
     
       
     
     
    
     
     
    
    
                    
     
     
    
    </form>
      
                        </body>
</html>
