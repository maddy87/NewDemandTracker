<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewRequest.aspx.cs" Inherits="NewRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void txtInfyRequestor_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat=server>

    <script language="javascript" type="text/javascript">
        
        
        function test(){alert("test");}
         
</script>
    <title>New Demand Request</title>
    <style type="text/css">
        .style1
        {
            height: 166px;
            font-family: 'Calibri';
            font-size: small;
        }
        .style3
        {
            height: 24px;
        }
        .style4
        {
            height: 525px;
        }
        .style5
        {
            height: 525px;
            width: 11px;
        }
        .style6
        {
            height: 525px;
            width: 897px;
        }
        .style7
        {
            width: 809px;
        }
        .style8
        {
            width: 503px;
        }
        .style9
        {
            width: 503px;
            height: 38px;
        }
        .style10
        {
            width: 809px;
            height: 38px;
        }
        .style11
        {
            width: 503px;
            height: 50px;
        }
        .style12
        {
            width: 809px;
            height: 50px;
        }
        .style13
        {
            width: 503px;
            height: 27px;
        }
        .style14
        {
            width: 809px;
            height: 27px;
        }
        .style18
        {
            width: 503px;
            height: 28px;
        }
        .style19
        {
            width: 809px;
            height: 28px;
        }
        .style20
        {
            width: 503px;
            height: 4px;
        }
        .style21
        {
            width: 809px;
            height: 4px;
        }
        .style22
        {
            height: 9px;
        }
        .style23
        {
            width: 503px;
            height: 66px;
        }
        .style24
        {
            width: 809px;
            height: 66px;
            margin-left: 40px;
        }
        .style25
        {
            color: #FF3300;
            font-weight: bold;
        }
        .style26
        {
            height: 1px;
            width: 819px;
        }
        .style27
        {
            height: 1px;
            text-align: right;
            width: 53px;
        }
        .style28
        {
            width: 503px;
            height: 19px;
        }
        .style30
        {
            width: 503px;
            height: 37px;
        }
        .style31
        {
            width: 809px;
            height: 37px;
        }
        </style>
    
<script language="javascript">
function ShowWorkflow(sImage)
{
    //alert(imgImage.height);
    //alert(imgImage.width);
    
    //imgImage.height =500;
    imgImage.src=sImage;
}

</script>

</head>
<body>
 
    <form id="form1" runat="server">
    
 <asp:ScriptManager ID="ScriptManager1" runat="server">
                       </asp:ScriptManager>
    <table style="height: 537px; width:100px">
        <tr>
            <td class="style3" colspan="4">
                       <img alt="Header Background" src="bg1.jpg" 
                           style="width: 1300px; height: 38px" /></td>
        </tr>
            
               
        <tr>
            <td class="style3" colspan="4">
                       <asp:Label ID="Label13" runat="server" Text="New Demand Request" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
            </td>
        </tr>
            
               
        <tr>
            <td class="style26" colspan="2">
                <asp:Label ID="lblUserName" runat="server" 
                    Font-Names="Copperplate Gothic Light" Font-Size="Smaller" ForeColor="Red" 
                    Text="Welcome" style="font-size: medium; font-weight: 700"></asp:Label>
                </td>
            <td class="style27" align="char">
            
                
                &nbsp;</td>
           
            
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style6" colspan="2">
                <table style="height: 225px; width: 895px; font-size: small; font-family: Calibri;" 
                    frame="box">
                <tr>
                   <td class="style28" colspan="2" align="right">
                       
                                  
                <iframe src="Navigation1.htm" height="50" width="120" frameborder="0" 
                    scrolling="no" id="I1" name="I1" ></iframe>
                                
                    </td>
                </tr>
                <tr style="">
                   <td class="style8">
                       <asp:Label ID="Label1" runat="server" Text="AZ ID" CssClass="style1" 
                           Height="20px" Width="100px"></asp:Label>
                       
                    </td>
                   <td class="style7" top: 2px; left: 225px;">
                                            <asp:TextBox ID="txtAZID" runat="server" MaxLength="6" Enabled="False" 
                                                Font-Names="Calibri" style="font-family: Calibri" TabIndex="1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="style8">
                       <asp:Label ID="Label2" runat="server" Text="Project Name" CssClass="style1" 
                           Height="23px" Width="106px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td>
                       <asp:TextBox ID="txtProjectName" runat="server" Width="375px" 
                           Font-Names="Calibri" Height="43px" style="font-family: Calibri" TabIndex="2" 
                           TextMode="MultiLine"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                           ControlToValidate="txtProjectName" ErrorMessage="Project Name Required"></asp:RequiredFieldValidator>
                       <br />
                    </td>
                </tr>
                <tr>
                   <td class="style8">  
                       <asp:Label ID="Label3" runat="server" Text="Clarity Id" CssClass="style1" 
                           Height="23px" Width="103px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style7">
                       <asp:TextBox ID="txtClarityId" runat="server" MaxLength="30" 
                           Font-Names="Calibri" style="font-family: Calibri" TabIndex="3"></asp:TextBox>
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
                           onselectedindexchanged="drpFuncArea_SelectedIndexChanged" Font-Names="Calibri" 
                               TabIndex="4" Height="29px" Width="82px">
                           <asp:ListItem></asp:ListItem>
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
                           Visible="False" style="margin-left: 0px" Font-Names="Calibri"></asp:TextBox>
                       &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                               ControlToValidate="drpFuncArea" ErrorMessage="Functional Area Cannot be Blank">Functional 
                           Area Cannot be Blank</asp:RequiredFieldValidator>
                       </ContentTemplate>
                       </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                   <td class="style13">
                       <asp:Label ID="Label5" runat="server" Text="AZ PM" CssClass="style1" 
                           Height="23px" Width="109px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style14">
                       <asp:TextBox ID="txtAZRequestor" runat="server" Height="21px" Width="224px" 
                           MaxLength="50" Font-Names="Calibri" TabIndex="5"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                           ControlToValidate="txtAZRequestor" ErrorMessage="AZ Contact Name missing"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td class="style23">
                       <asp:Label ID="lblRequestor" runat="server" 
                           
                           
                           
                           Text="Requestor's Email ID &lt;b&gt;(Should be one who is logging the request)&lt;/b&gt;" CssClass="style1" 
                           Height="51px" Width="111px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style24">
                       <asp:TextBox ID="txtInfyRequestor" runat="server" Height="24px" Width="225px" 
                           MaxLength="50" ontextchanged="txtInfyRequestor_TextChanged" 
                           Font-Names="Calibri" TabIndex="6"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                           ControlToValidate="txtInfyRequestor" ErrorMessage="Requestor Name Missing"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                           ControlToValidate="txtInfyRequestor" 
                           ErrorMessage="Email ID not in correct format" 
                           ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email ID 
                       not in correct format</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                   <td class="style30">
                       <asp:Label ID="Label7" runat="server" Text="Request for Estimate/Sow?" CssClass="style1" 
                           Height="23px" Width="112px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style31">
                       
                       <asp:RadioButton ID="rdbEST" runat="server" Font-Names="Calibri" 
                           GroupName="rdbRequestGroup" Text="Estimate" Checked="True" 
                           oncheckedchanged="rdbEST_CheckedChanged" style="font-size: small" onclick="ShowWorkflow('Workflow_EST.jpg');"  />
                       &nbsp;&nbsp;    <asp:RadioButton ID="rdbSoW" runat="server" 
                           Font-Names="Calibri" GroupName="rdbRequestGroup" 
                           Text="SOW" oncheckedchanged="rdbSoW_CheckedChanged" 
                           style="font-size: small" TabIndex="7" onclick="ShowWorkflow('Workflow_SOW.jpg');" />
                       
                    </td>
                </tr>
                <tr>
                   <td class="style8">
                       <asp:Label ID="Label8" runat="server" Text="Please provide details of the project requirement" 
                           CssClass="style1" Height="54px" Width="112px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style7">
                       <asp:TextBox ID="txtPrjDescription" runat="server" Height="59px" 
                           TextMode="MultiLine" Width="627px" Font-Names="Calibri" TabIndex="8"></asp:TextBox>
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
                           Font-Names="Calibri" GroupName="rdbMultipleAppGrp" 
                           Text="No" Checked="True" 
                           AutoPostBack="True" style="font-size: small" TabIndex="9" 
                               oncheckedchanged="rdbMulAppNo_CheckedChanged1" /> 
                           &nbsp;&nbsp;<asp:RadioButton ID="rdbMulAppYes" runat="server" AutoPostBack="True" 
                               Font-Names="Calibri" GroupName="rdbMultipleAppGrp" style="font-size: small" 
                               Text="YES" oncheckedchanged="rdbMulAppYes_CheckedChanged1" />
&nbsp;
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
                       <asp:Label ID="Label11" runat="server" Text="Upload Documents" 
                           CssClass="style1" Height="20px" Width="110px"></asp:Label>
                       
                       <span class="style25">(Required)</span></td>
                   <td class="style19">
                       <asp:Label ID="Label12" runat="server" 
                           Text="Please Upload ONLY ZIP Format" 
                           CssClass="style1" Font-Size="Large" Height="24px" Width="247px" 
                           Font-Bold="True" ForeColor="#009933"></asp:Label>
                       
                       <asp:FileUpload ID="FileUpload1" runat="server" Font-Names="Calibri" 
                           TabIndex="10" />
                       <asp:Button ID="btnUpload" runat="server" Text="UPLOAD" Height="20px" 
                           onclick="btnUpload_Click" Width="93px" Visible="False" 
                           Font-Names="Calibri" />
                       
                       <br />
                       &nbsp;&nbsp;&nbsp;
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
                           Font-Size="Medium" onclick="btnSubmit_Click" Text="Submit Request" 
                           Width="295px" TabIndex="11" />
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
                       <a href="Home.aspx" style="font-weight: 700; font-size: small">HOME</a></td>
                </tr>
            </table>
                
                
                </td>
            <td class="style4">
                <img id="imgImage" src ="Workflow_EST.JPG" height="550" width="350" />
             </td>
        </tr>
        <tr>
            <td class="style1" colspan="4">
                <img alt="Footer Background" src="bg13.jpg" 
                    style="width: 1300px; height: 119px" /></td>
        </tr>
    </table>
    
     
     
       
     
     
    
     
     
    
    
                    
     
     
    
                        <asp:Label ID="lblStatus" runat="server" Text="-" Font-Bold="True" Font-Names="Copperplate Gothic Light" 
                    Font-Size="Large" ForeColor="#339933"></asp:Label>
                                                                  
     
     
       
     
     
    
     
     
    
    
                    
     
     
    
    </form>
      
                        </body>
</html>
