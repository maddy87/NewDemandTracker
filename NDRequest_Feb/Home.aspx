<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Demand Request</title>
    <style type="text/css">
        .style1
        {
            width: 40px;
            text-decoration: underline;
        }
        .style2
        {
            width: 183px;
            font-size: small;
        }
        .style3
        {
        }
        .style4
        {
            font-weight: bold;
            text-align: center;
        }
        .style5
        {
            font-family: Calibri;
        }
        .style6
        {
            font-weight: bold;
            font-family: Calibri;
            width: 611px;
        }
        .style7
        {
            width: 183px;
            font-size: small;
            height: 91px;
        }
        .style8
        {
            font-weight: normal;
            text-align: center;
        }
        .style9
        {
            font-weight: bold;
            font-family: Calibri;
            text-decoration: underline;
            color: #FF0000;
        }
        .style10
        {
            font-weight: normal;
            height: 91px;
        }
        .style11
        {
            font-weight: normal;
            text-align: center;
            height: 78px;
        }
        .style12
        {
            width: 183px;
            height: 78px;
        }
        .style15
        {}
        .style16
        {
            font-weight: normal;
            text-align: center;
        }
        .style17
        {
            font-size: large;
            font-weight: bold;
            color: #FF3300;
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
                       <asp:Label ID="Label13" runat="server" Text="New Demand Request" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
                       <br />
                       <br />
                       <span class="style17">NOTE: If you are facing issues while submitting your 
                       request, then please download this <a href="Offline_NDRequest_Template.xlsx">
                       OFFLINE TEMPLATE</a> and follow the instructions provided in it.<br />
                       <br />
                       </span>
                       
            </td>
        </tr>
            
               
        <tr>
            <td class="style15" colspan="3">
                <asp:Label ID="lblUser" runat="server" Font-Bold="True" 
                    Font-Names="Copperplate Gothic Light" ForeColor="#006600" Text="Welcome"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style6">
                <table style="height: 225px; width: 654px; font-size: x-small;" border="1" 
                    align="center" >
                <tr>
                   <td class="style10" align="center">
                       <asp:Button ID="bCreateNewRequest" runat="server" BackColor="White" 
                           BorderColor="#003399" Font-Bold="True" ForeColor="#003399" Height="38px" 
                           Text="CREATE A NEW DEMAND REQUEST" Width="386px" 
                           onclick="bCreateNewRequest_Click" />
                       
                       <br />
                       
                    </td>
                   <td class="style7">
                       <span class="style9">NOTE</span><span class="style5">: <span class="style8">If 
                       this request is for multiple applications (for e.g. App Remediation), then 
                       please download this </span><a href="Multiple_Apps_ND_Request_Template.xlsx">
                       TEMPLATE</a><span class="style8">.
                       <br />
                       Fill both the sheets of this template and upload it along with your request.</span></span></td>
                </tr>
                <tr style="">
                   <td class="style16">
                       <br />
                       <asp:Button ID="bTrackRequest" runat="server" ackColor="White" 
                           BorderColor="#003399" Font-Bold="True" ForeColor="#003399" Height="38px" 
                           Width="386px" Text="TRACK MY REQUESTS" onclick="bTrackRequest_Click" />
                       <br />
                       <br />
                       <br />
                       
                    </td>
                   <td class="style2">
                       Track all the requests you have submitted for their latest status</td>
                </tr>
                <script type="text/javascript" language="javascript">
                function HideRow()
                {
                    //alert('test');
                    //alert(document.getElementById("ShowHide").style.display='none');
                    if (document.getElementById("ShowHide").style.display== 'none')
                    {
                        document.getElementById("trTest").style.display= 'none';
                    }
                 }   
                </script>
                <tr id="trAdmin">
                   <td class="style11">
                       <label id="Label1" visible="false"></label>
                       <asp:Button name="bAdmin" ID="bAdmin" runat="server" BackColor="White" 
                           BorderColor="#003399" Font-Bold="True" ForeColor="#003399" Height="38px" onclick="bAdmin_Click" 
                           Text="ADMIN HOME" Width="386px" />
                       
                    </td>
                   <td class="style12">
                       
                    </td>
                </tr>
               
                
                </table>
                
                
                </td>
            <td class="style4">
                &nbsp;</td>
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
