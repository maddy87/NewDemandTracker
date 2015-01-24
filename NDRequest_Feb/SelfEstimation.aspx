<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelfEstimation.aspx.cs" Inherits="SelfEstimation" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Self Estimation</title>
    <style type="text/css">
        .style1
        {
            width: 507px;
        }
        .style2
        {
            width: 927px;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {
            width: 74px;
        }
        .style6
        {
            width: 97px;
        }
        .style7
        {
            width: 315px;
        }
        .style8
        {
            width: 325px;
        }
        .style9
        {
            width: 14px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    
    
        <table style="height: 537px; width:100px" cellspacing="3">
        <tr>
            <td class="style3" colspan="3">
                       <img alt="Header Background" src="bg1.jpg" 
                           style="width: 1300px; height: 54px" /></td>
        </tr>
            
               
        <tr>
            <td class="style3" colspan="3">
                       <asp:Label ID="Label13" runat="server" Text="Self Estimation" 
                    CssClass="style1" Font-Bold="True" Font-Names="Copperplate Gothic Bold" 
                    Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                       
                       <br />
                       <br />
                       <span class="style17"><br />
                       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                       </asp:ToolkitScriptManager>
                       <asp:Label ID="Label14" runat="server" 
                           Text="This is an Self Help Tool to provide approximate estimation for the known scope/requirement of the tasks to be carried out." 
                           ForeColor="#0033CC"></asp:Label>
                       <br />
                       </span>
                       
            </td>
        </tr>
            
               
        <tr>
            <td class="style15" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <table class="style3" cellpadding="1" cellspacing="1">
                 
                    <tr>
                        <td class="style4">
                            <asp:Panel ID="pnlIIS" runat="server" BackColor="Gray" Height="34px" 
                                Width="936px">
                                <div style="float:right; vertical-align:middle">
                                    <asp:Image ID="imgIISPanel" 
                                        runat="server" AlternateText="IIS Show Image" ImageAlign="Middle" 
                                        ImageUrl="~/Show.png" Height="27px" Width="29px" style="float" />  
                                </div>
                                <asp:Label ID="lblPnlIIS" runat="server" Font-Bold="True" 
                                    Font-Names="Microsoft Sans Serif" Font-Size="XX-Large" ForeColor="Black" 
                                    Height="29px" Text="     IIS" Width="295px"></asp:Label>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                  
                        <td>
                            <asp:Panel ID="pnlIISCollapsible" runat="server" BackColor="Silver">
                             <asp:UpdatePanel ID="SelfEstimationUpdatePanel1" runat="server">
                             <ContentTemplate>
                                <table class="style3">
                                           <tr>
                                           <td class="style11"><asp:Label ID="Label1" Text=" Catalogue Item Selection" runat=server></asp:Label> </td>
                                           <td><asp:Label ID="Label2" Text="No. Of Units" runat=server></asp:Label> </td>
                                           </tr>
                                           <tr>
                                           <td class="style11">
                                               <asp:CheckBox ID = "chkIIS1" runat="server" text="Install Windows Application Server (IIS) and related 
                                                services" AutoPostBack="True" oncheckedchanged="chkIIS1_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS1" runat="server" Width="20px" MaxLength="2" 
                                                   Enabled="False" Height="22px" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11"><asp:CheckBox ID = "chkIIS2" runat="server" text="Create, manage and configure application pools, web 
                                                sites and Virtual Directories" AutoPostBack="True" 
                                                   oncheckedchanged="chkIIS2_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS2" runat="server" Width="20px" Enabled="False" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11">
                                               <asp:CheckBox ID = "chkIIS3" runat="server" text="Install and update vendor and custom web application 
                                                components" AutoPostBack="True" oncheckedchanged="chkIIS3_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS3" runat="server" Width="20px" Enabled="False" 
                                                   MaxLength="2" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11">
                                               <asp:CheckBox ID = "chkIIS4" runat="server" text="Install, update and configure data access components 
                                                and clients" AutoPostBack="True" oncheckedchanged="chkIIS4_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS4" runat="server" Width="20px" Enabled="False" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11"><asp:CheckBox ID = "chkIIS5" runat="server" 
                                                   text="Migrate Web Sites" AutoPostBack="True" 
                                                   oncheckedchanged="chkIIS5_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS5" runat="server" Width="20px" Enabled="False" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11"><asp:CheckBox ID = "chkIIS6" runat="server" 
                                                   text="Decommission web sites" AutoPostBack="True" 
                                                   oncheckedchanged="chkIIS6_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtIIS6" runat="server" Width="20px" Enabled="False" >1</asp:TextBox>
                                               </td>
                                           </tr>
                                           <tr>
                                           <td class="style11">&nbsp</td>
                                           <td>&nbsp</td>
                                           </tr>
                                           </table>
                                 </ContentTemplate>
                    </asp:UpdatePanel>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender 
                             ID="IISCPE" 
                             runat="server"
                             CollapseControlID="pnlIIS" 
                             ExpandControlID="pnlIIS"
                             Collapsed="true"
                             ImageControlID="imgIISPanel"
                             CollapsedImage="~/Show.png"
                             ExpandedImage="~/Hide.png"
                             ExpandDirection="Vertical"
                             TargetControlID="pnlIISCollapsible"
                             ></asp:CollapsiblePanelExtender>
                          </td>
                        <td>
                            &nbsp;</td>
                      
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Panel ID="pnlJ2EE" runat="server" BackColor="Gray" Height="34px" 
                                Width="936px">
                                <div style="float:right; vertical-align:middle">
                                    <asp:Image ID="imgpnlJ2EE" 
                                        runat="server" AlternateText="IIS Show Image" ImageAlign="Middle" 
                                        ImageUrl="~/Show.png" Height="27px" Width="29px" style="float" />  
                                </div>
                                <asp:Label ID="lblpnlJ2EE" runat="server" Font-Bold="True" 
                                    Font-Names="Microsoft Sans Serif" Font-Size="XX-Large" ForeColor="Black" 
                                    Height="29px" Text="J2EE (Weblogic, WAS, Tomcat)" Width="710px"></asp:Label>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                    
                        <td>
                            <asp:Panel ID="pnlJ2EECollapsible" runat="server" BackColor="Silver">
                                <table class="style3">
                                           <tr>
                                           <td><asp:Label ID="Label3" Text=" Catalogue Item Selection" runat=server></asp:Label> </td>
                                           <td><asp:Label ID="Label4" Text="No. Of Units" runat=server></asp:Label> </td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkJ2EE1" runat="server" text="Install WebLogic\Oracle Application Server\WebSphere 
                                                on server" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtJ2EE1" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkJ2EE2" runat="server" text="Create a new Server/Domain" 
                                                   AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtJ2EE2" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkJ2EE3" runat="server" text="Uninstall WebLogic\Oracle Application Server\WebShpere 
                                                on a server" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtJ2EE3" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkJ2EE4" runat="server" text="Deploy an application according to vendor or developer 
                                                instructions" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtJ2EE4" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "CheckBox5" runat="server" text="Migrate Web Sites" 
                                                   AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "TextBox5" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "CheckBox6" runat="server" text="Decommission web sites" 
                                                   AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "TextBox6" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td class="style11">&nbsp</td>
                                           <td>&nbsp</td>
                                           </tr>
                                           </table>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender 
                             ID="cpeJ2EE" 
                             runat="server"
                             CollapseControlID="pnlJ2EE" 
                             ExpandControlID="pnlJ2EE"
                             Collapsed="true"
                             ImageControlID="imgpnlJ2EE"
                             CollapsedImage="~/Show.png"
                             ExpandedImage="~/Hide.png"
                             ExpandDirection="Vertical"
                             TargetControlID="pnlJ2EECollapsible"
                             ></asp:CollapsiblePanelExtender>
                          </td>
                        <td>
                            &nbsp;</td>
                   
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Panel ID="pnlCitrix" runat="server" BackColor="Gray" Height="34px" 
                                Width="936px">
                                <div style="float:right; vertical-align:middle">
                                    <asp:Image ID="imgpnlCitrix" 
                                        runat="server" AlternateText="IIS Show Image" ImageAlign="Middle" 
                                        ImageUrl="~/Show.png" Height="27px" Width="29px" style="float" />  
                                </div>
                                <asp:Label ID="lblpnlCitrix" runat="server" Font-Bold="True" 
                                    Font-Names="Microsoft Sans Serif" Font-Size="XX-Large" ForeColor="Black" 
                                    Height="29px" Text="Citrix" Width="710px"></asp:Label>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                    
                        <td>
                            <asp:Panel ID="pnlCitrixCollapsible" runat="server" BackColor="Silver">
                                <table class="style3">
                                           <tr>
                                           <td><asp:Label ID="Label5" Text=" Catalogue Item Selection" runat=server></asp:Label> </td>
                                           <td><asp:Label ID="Label6" Text="No. Of Units" runat=server></asp:Label> </td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix1" runat="server" 
                                                   text="Package/deploy a new application" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix1" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix2" runat="server" text="Remove an application" 
                                                   AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix2" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix3" runat="server" 
                                                   text="Install Citrix on a server" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix3" runat="server" Width="20px" Enabled="False" 
                                                   Height="22px" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix4" runat="server" 
                                                   text="Citrix - Golden Image Activity - NonCatalogue" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix4" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix5" runat="server" 
                                                   text="Citrix - Data Collector Setup" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix5" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix6" runat="server" 
                                                   text="Citrix - License Server Install" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix6" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix7" runat="server" 
                                                   text="Citrix - Bridge CDT Installation" AutoPostBack="True"/></td>
                                           <td><asp:TextBox ID = "txtCitrix7" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td><asp:CheckBox ID = "chkCitrix8" runat="server" 
                                                   text="Citrix - Bridge CDT Publishing" AutoPostBack="True" 
                                                   oncheckedchanged="chkCitrix8_CheckedChanged"/></td>
                                           <td><asp:TextBox ID = "txtCitrix8" runat="server" Width="20px" Enabled="False" /></td>
                                           </tr>
                                           <tr>
                                           <td class="style11">&nbsp</td>
                                           <td>&nbsp</td>
                                           </tr>
                                           </table>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender 
                             ID="cpeCitrix" 
                             runat="server"
                             CollapseControlID="pnlCitrix" 
                             ExpandControlID="pnlCitrix"
                             Collapsed="true"
                             ImageControlID="imgpnlCitrix"
                             CollapsedImage="~/Show.png"
                             ExpandedImage="~/Hide.png"
                             ExpandDirection="Vertical"
                             TargetControlID="pnlCitrixCollapsible"
                             ></asp:CollapsiblePanelExtender>
                          </td>
                        <td>
                            &nbsp;</td>
                
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Panel ID="pnlOracle" runat="server" BackColor="Gray" Height="34px" 
                                Width="936px">
                                <div style="float:right; vertical-align:middle">
                                    <asp:Image ID="imgpnlOracle" 
                                        runat="server" AlternateText="IIS Show Image" ImageAlign="Middle" 
                                        ImageUrl="~/Show.png" Height="27px" Width="29px" style="float" />  
                                </div>
                                <asp:Label ID="lblpnlOracle" runat="server" Font-Bold="True" 
                                    Font-Names="Microsoft Sans Serif" Font-Size="XX-Large" ForeColor="Black" 
                                    Height="29px" Text="Oracle" Width="710px"></asp:Label>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                    
                        <td>
                            <asp:Panel ID="pnlOracleCollapsible" runat="server" BackColor="Silver">
                                <table class="style3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server" Text=" Catalogue Item Selection"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Text="No. Of Units"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle1" runat="server" 
                                                        text="Creation of physical database" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle1" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle2" runat="server" 
                                                        text="Create and initialise database security roles" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle2" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle3" runat="server" 
                                                        text="Perform database imports/exports" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle3" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle4" runat="server" 
                                                        text="Move application based scripts" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle4" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle5" runat="server" 
                                                        text="Backup Database Instance/Schema" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle5" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle6" runat="server" 
                                                        text="Restore Database Instance/Schema" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle6" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle7" runat="server" text="Application rollout in development / test / Production 
                                                environments" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle7" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle8" runat="server" 
                                                        text="Execute DDL statements to create database objects" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle8" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle9" runat="server" 
                                                        text="Installation of client software on server" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle9" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle10" runat="server" text="Oracle Standalone Install" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle10" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle11" runat="server" text="Oracle Database Upgrade" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle11" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle12" runat="server" text="Oracle Datagaurd Install" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle12" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle13" runat="server" text="Oracle RAC Install" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle13" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle14" runat="server" text="Oracle RAC Upgrade" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle14" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle15" runat="server" text="DB Instance Restore" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle15" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkOracle16" runat="server" text="Oracle Patch Installation" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOracle16" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                           <td class="style11">&nbsp</td>
                                           <td>&nbsp</td>
                                           </tr>
                                        </table>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender 
                             ID="cpeOracle" 
                             runat="server"
                             CollapseControlID="pnlOracle" 
                             ExpandControlID="pnlOracle"
                             Collapsed="true"
                             ImageControlID="imgpnlOracle"
                             CollapsedImage="~/Show.png"
                             ExpandedImage="~/Hide.png"
                             ExpandDirection="Vertical"
                             TargetControlID="pnlOracleCollapsible"
                             ></asp:CollapsiblePanelExtender>
                          </td>
                        <td>
                            &nbsp;</td>
                   
                    </tr>
                    <tr>
                   
                        <td class="style4">
                            <asp:Panel ID="pnlSQL" runat="server" BackColor="Gray" Height="34px" 
                                Width="936px">
                                <div style="float:right; vertical-align:middle">
                                    <asp:Image ID="imgpnlSQL" 
                                        runat="server" AlternateText="IIS Show Image" ImageAlign="Middle" 
                                        ImageUrl="~/Show.png" Height="27px" Width="29px" style="float" />  
                                </div>
                                <asp:Label ID="lblpnlSQL" runat="server" Font-Bold="True" 
                                    Font-Names="Microsoft Sans Serif" Font-Size="XX-Large" ForeColor="Black" 
                                    Height="29px" Text="SQL Server" Width="710px"></asp:Label>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                    
                        <td>
                            <asp:Panel ID="pnlSQLCollapsible" runat="server" BackColor="Silver">
                              <table class="style3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9" runat="server" Text=" Catalogue Item Selection"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server" Text="No. Of Units"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL1" runat="server" 
                                                        text="Create a database " AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL1" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL2" runat="server" 
                                                        text="Create and initialise database security roles" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL2" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL3" runat="server" 
                                                        text="Database configuration change (for storage, security,
                                                etc.) " AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL3" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL4" runat="server" 
                                                        text="Tune a database – Standard" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL4" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL5" runat="server" 
                                                        text="Move/execute scripts" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL5" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL6" runat="server" 
                                                        text="Create Database Instance/Schema" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL6" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL7" runat="server" 
                                                        text="Backup Database Instance/Schema" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL7" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL8" runat="server" 
                                                        text="Restore Database Instance/Schema" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL8" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL9" runat="server" 
                                                        text="Application rollout in any environments (prod, 
                                                pre-prod, etc.) - 1 day" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL9" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL10" runat="server" text="Execute DDL statements" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL10" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL11" runat="server" 
                                                        text="Installation of client software on server " AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL11" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL12" runat="server" text="SQL Server Standalone Install" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL12" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL13" runat="server" text="SQL Server Cluster Install" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL13" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL14" runat="server" 
                                                        text="SQL Server Stand-Alone Upgrade" AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL14" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL15" runat="server" text="SQL Server Cluster Upgrade" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL15" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkSQL16" runat="server" text="SQL Data Store for Citrix" 
                                                        AutoPostBack="True" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSQL16" runat="server" Width="20px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                           <td class="style11">&nbsp</td>
                                           <td>&nbsp</td>
                                           </tr>
                                        </table>
                                       
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender 
                             ID="cpeSQL" 
                             runat="server"
                             CollapseControlID="pnlSQL" 
                             ExpandControlID="pnlSQL"
                             Collapsed="true"
                             ImageControlID="imgpnlSQL"
                             CollapsedImage="~/Show.png"
                             ExpandedImage="~/Hide.png"
                             ExpandDirection="Vertical"
                             TargetControlID="pnlSQLCollapsible"
                             ></asp:CollapsiblePanelExtender>
                          </td>
                        <td>
                            &nbsp;</td>
                 
                    </tr>
                     <tr>
                        <td class="style4">
                            <asp:Panel ID="pnlCalculate" runat="server" Height="34px" 
                                Width="936px">
                                <div style="float:left; vertical-align:middle">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                                Text="Calculate" Width="227px" Font-Names="Calibri" 
                                        Font-Size="Larger" Height="33px" />
                                 </div>
                                 <div style="float:left; vertical-align:middle">
                                 <asp:Label ID="lblCost" runat="server" Text="$" Font-Names="Calibri" 
                                         Font-Size="Larger" ForeColor="Black"></asp:Label>
                                 </div>
                            </asp:Panel>
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    
                </table>
                  
            </td>
            <td class="style6">
                           
                
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
