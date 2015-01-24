using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.DirectoryServices;
using System.Net.Mail;
using System.Data.OleDb;
using System.Configuration;


public partial class NewRequest : System.Web.UI.Page
{
    string sFuncArea;
    string sSOWEST;
    string sMultiple;
    string sFileName;
    string sNewAZID;
    NDRequest obj;
    int iAZID;
    string sCurrentUser;
    DirectoryEntry dEntry;
    DirectorySearcher dSearch;
    public string sDisplayName;
    public string sFirstName;
    public string sLastName;
    public string sEmail;
    public string sUserPrid;
    public string sCurrDomain;
    public string gEmailHeader;
    public string gEmailFooter;

    //public string EngagementReference;
    OleDbConnection oConn1;

   
    
    
    //Defining the search result function for the User Details.This should work.
    public static string GetUserDetails(SearchResult searchResult, string PropertyName)
     {
        if (searchResult.Properties.Contains(PropertyName))
        {
            //Return the value whatever you get.
            return searchResult.Properties[PropertyName][0].ToString();
        }
        else
        {
            //This case shouldnt occur
            return string.Empty;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            obj = new NDRequest();


            #region: GET DETAILS OF CURRENTLY LOGGED IN USER 

                //sCurrentUser = System.Environment.UserName.ToString();
                //sCurrDomain = System.Environment.UserDomainName.ToString();
                //sUserPrid = sCurrentUser.ToUpper();
                ////MessageBox.Show(Global.gCurrentUser);
                //lblUserName.Text = "WELCOME " + sCurrentUser;

                //string sTemp = System.Web.HttpContext.Current.User.Identity.Name.ToString();
                //string[] split = sTemp.Split('\\');
                //sCurrDomain = split[0];
                //sUserPrid = split[1];

                try
                {
                    sUserPrid = Session["User"].ToString();
                    sCurrDomain = Session["Domain"].ToString();
                    lblUserName.Text = "Welcome " + sUserPrid;
                }
                catch (Exception ex)
                {
                    form1.Visible = false;
                    lblStatus.Text = "The Page seems to be broken<br/><br/>" +
                                  " Please go to <a style='color: #4C4C4C;' href='Home.aspx' target=_blank> HOME</a> and then click on CREATE NEW REQUEST<br/><br/>" +
                                  "Regards,<br/>" +
                                  "New Demand Team<br/><br/>";
                    obj.SendErrorDetails(ex.Message);
                }
                    #region: FETCHING DETAILS FROM THE ACTIVE DIRECTORY TO BY QUERYING THE USER PRID 

                    //try
                    //{

                    //    dEntry = new DirectoryEntry("LDAP://" + sCurrDomain);
                    //    dSearch = new DirectorySearcher(dEntry);

                    //    dSearch.Filter = "(&(objectClass=user)(samAccountName=" + sCurrentUser + "))";

                    //    //Searching through the results generated from AD
                    //    foreach (SearchResult searchresult in dSearch.FindAll())
                    //    {
                    //        sFirstName = GetUserDetails(searchresult, "givenName");
                    //        sLastName = GetUserDetails(searchresult, "sn");
                    //        sEmail = GetUserDetails(searchresult, "mail");
                    //        sDisplayName = GetUserDetails(searchresult, "displayName");
                    //    }

                    //    lblUserName.Text = "Welcome " + sFirstName + " " + sLastName;
                    //    txtInfyRequestor.Text = sFirstName + " " + sLastName;
                    //}
                    //catch (Exception ex)
                    //{
                    //    lblUserName.Text = "WELCOME ";// +sCurrentUser;
                    //}
                    ////finally { //Do Nothing };
                    #endregion

                    //lblUserName.Text = sCurrDomain + "  " + sUserPrid;

                    //lblUserName.Text = System.Web.HttpContext.Current.User.Identity.Name.ToString() + " " + System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString(); 
                            
                
            #endregion

            #region: GET MAX AZID  

                #region: GET MAX AZID FROM SQL EXPRESS

                //SqlConnection conn1;
                //    conn1 = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\kshh119\\Documents\\Visual Studio 2008\\WebSites\\NDRequest\\App_Data\\NDRequest.mdf;Integrated Security=True; User Instance=True");
                //    conn1.Open();

                //    SqlCommand cmd = new SqlCommand("select MAX(AZID) from NDRequest", conn1);
                //    SqlDataReader dr = cmd.ExecuteReader();

                //    while (dr.Read())
                //    {
                //        sNewAZID = dr[0].ToString();
                //    }

                //    iAZID = Convert.ToInt32(sNewAZID.Substring(sNewAZID.Length - 4, 4));

                //    iAZID++;
                //    sNewAZID = "ID" + iAZID;
                //    txtAZID.Text = sNewAZID;
                //    conn1.Close();
                #endregion

                #region: GET MAX AZID FROM ACCESS DB 
                    
                //    oConn1 = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.mdb;");
                //    oConn1.Open();
                //    OleDbCommand oCmd = new OleDbCommand("select MAX(AZID) from NDRequest",oConn1);
                //    OleDbDataReader oDr = oCmd.ExecuteReader();

                //while(oDr.Read())
                //{ sNewAZID = oDr[0].ToString(); }

                //    iAZID = Convert.ToInt32(sNewAZID.Substring(sNewAZID.Length - 4, 4));

                //    iAZID++;
                //    sNewAZID = "ID" + iAZID;
                //    txtAZID.Text = sNewAZID;

                //    oConn1.Close();
                #endregion

                #region: GET MAX AZID FROM REMOTE SQL SERVER 2008

                try
                {
                    #region: CALLING DATA from CONNECTION STRING

                    string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;


                    #endregion


                    //SqlConnection conn1;
                    OleDbConnection conn1;
                    //conn1 = new SqlConnection("Data Source=USSBBAMAAS02\\MAPS;Password=ndrequest_user;User ID=ndrequest_user;Initial Catalog=NDRequest");
                    //conn1 = new SqlConnection(sCnstr);
                    conn1 = new OleDbConnection(sCnstr);
                    conn1.Open();

                    //SqlCommand cmd = new SqlCommand("select MAX(AZID) from NDRequest", conn1);
                    OleDbCommand cmd = new OleDbCommand("select MAX(AZID) from NDRequest", conn1);

                    //SqlDataReader dr = cmd.ExecuteReader();
                    OleDbDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        sNewAZID = dr[0].ToString();
                    }
                    if (sNewAZID == "")
                    {
                        sNewAZID = "ID1001";
                    }
                    else
                    {
                        iAZID = Convert.ToInt32(sNewAZID.Substring(sNewAZID.Length - 4, 4));
                        iAZID++;
                        sNewAZID = "ID" + iAZID;
                    }
                    txtAZID.Text = sNewAZID;

                    conn1.Close();
                }
                catch (Exception ex)
                {
                    //Response.Write("alert('Error Connectiong to Database : "+ex.Message.ToString()+"')");
                    //throw ex;
                    lblTemplate.Text = "Error Connectiong to Database : " + ex.Message.ToString() + "'";
                    //obj.SendErrorDetails(ex.Message);
                }
                #endregion

            #endregion


        }
    }

   


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        NDRequest obj = new NDRequest();
        int iSLA = 10;
        string EngagementReference = "";

        #region: VALIDATING INFORMATION 

      
            //Getting the Functional Area
            if(txtMultipleSetAreas.Visible == true)
            {sFuncArea = txtMultipleSetAreas.Text;}
            else{sFuncArea = drpFuncArea.SelectedItem.Text;}

            //If its is SOW or Estimate Request
            if(rdbEST.Checked == true)
            { sSOWEST = "EST"; iSLA = 10; }
            else { sSOWEST = "SOW"; iSLA = 5; }

            //If the request is for Multiple Applications
            if(rdbMulAppYes.Checked == true)
            { sMultiple = "Yes";}
            else{sMultiple = "No"; }

            //Defaulting Clarity ID
            if (txtClarityId.Text == "")
            { txtClarityId.Text = "TBC"; EngagementReference = txtAZID.Text + "_" + sSOWEST; }
            else { EngagementReference = txtClarityId.Text + "_INFY_EST-1"; };
            //Appending the Engagement Reference No
            

        #endregion

        #region: DECLARATION OF VARIABLES 

            string NewAZID = txtAZID.Text;
            string ClarityID = txtClarityId.Text;
            //string EngagementReference = txtAZID.Text+"_"+sSOWEST;
            string ProjectName = txtProjectName.Text;
            string ProjectDescription = txtPrjDescription.Text;
            string FuncArea = sFuncArea;
            string AZIDMName = txtAZRequestor.Text;
            //string AZIDMEmailID = "testemail@Ikran.com";
            string AZIDMEmailID = "NO DATA";
            string InfyRequestorName = txtInfyRequestor.Text;
            //string InfyRequestorEmailID = "testemailid@Ikran.com";
            string InfyRequestorEmailID = "NO DATA";
            string RequestStatus = "Draft";
            string SoWEstimate = sSOWEST;
            string Multiple = sMultiple;
            DateTime date = DateTime.Now;
            string sRemarks = "None";
            string sCost = "0";
            //string sUserPrid = Session["User"].ToString();
            sUserPrid = Session["User"].ToString();
            
        #endregion

        #region: FILE UPLOAD 
            try
            {
                string sFolderName = Server.MapPath("~//UploadedFiles") + "//" + txtAZID.Text;
                System.IO.Directory.CreateDirectory(sFolderName);
                if (FileUpload1.HasFile == true)
                {

                    FileUpload1.SaveAs(Server.MapPath("~//UploadedFiles//" + txtAZID.Text + "//") + FileUpload1.FileName);
                    sFileName = "UploadedFiles/" + txtAZID.Text + "/" + FileUpload1.FileName;
                    
                }
                else
                {
                    sFileName = "No_File_Uploaded.htm";
                    
                }
            }
            catch (Exception ex)
            {   //throw ex;
                //obj.SendErrorDetails(ex.Message);
                lblStatus.Text = " ERROR SENDING MAIL" + ex.Message.ToString();
            
            }
        

        #endregion
                
        #region: INSERTING VALUES IN THE SQL EXPRESS/REMOTE DATABASE 
            //Inserting values in the database
            //obj.InsertNewRequest(txtAZID.Text, txtProjectName.Text, txtClarityId.Text, sFuncArea, txtAZRequestor.Text, sSOWEST, sMultiple);
            try
            {

                #region: GET MAX AZID FROM REMOTE SQL SERVER 2008

                try
                {
                    #region: CALLING DATA from CONNECTION STRING
                         string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
                    #endregion

                    string sNewAZID = "";
                    int iAZID;
                    OleDbConnection conn1;
                    conn1 = new OleDbConnection(sCnstr);
                    conn1.Open();

                    OleDbCommand cmd = new OleDbCommand("select MAX(AZID) from NDRequest", conn1);
                    OleDbDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        sNewAZID = dr[0].ToString();
                    }
                    if (sNewAZID == "")
                    {
                        sNewAZID = "ID1001";
                    }
                    else
                    {
                        iAZID = Convert.ToInt32(sNewAZID.Substring(sNewAZID.Length - 4, 4));
                        iAZID++;
                        sNewAZID = "ID" + iAZID;
                    }
                    //txtAZID.Text = sNewAZID;
                    NewAZID = sNewAZID;
                    conn1.Close();
                }
                catch (Exception ex)
                {
                    //Response.Write("alert('Error Connectiong to Database : "+ex.Message.ToString()+"')");
                    //throw ex;
                    //lblTemplate.Text = "Error Connectiong to Database : " + ex.Message.ToString() + "'";
                    obj.SendErrorDetails(ex.Message);
                }
                #endregion

                //NoAdminFileUploaded during first Instance of the request
                string sAdminFilePath = "No_File_Uploaded.htm";
                obj.InsertNewRequest(NewAZID, ClarityID, EngagementReference, ProjectName, ProjectDescription, FuncArea, AZIDMName, AZIDMEmailID, InfyRequestorName, InfyRequestorEmailID, RequestStatus, SoWEstimate, Multiple, date, sFileName, sRemarks,sUserPrid,sCost,date,sAdminFilePath);

                #region: EMAILING THE COMPLETE STORY  

                gEmailHeader = "<html>" +
                               "<body>" +
                               "<table border='0'cellpadding='0' cellspacing='0' style='width:700px'>" +
                               "<tr>" +
                               "<td>" +
                    //"<table style='width:100%;' border=0 cellspacing=0 cellpadding=0 >" +
                    //  " <tr>" +
                    //    "<td valign='bottom' align='left' style='color: #4C4C4C;background-color: #B1A5B6;padding: 5px 5px 5px 5px'>" +
                    //     "<img alt='' hspace='0' src='"+Application.StartupPath.ToString() + "\\\\ukbldevmanweb01\\Your.AZ\\IFT\\images\\Ikran.bmp' align='baseline' border='0' ></td> " +
                    //    //"<td align='right' style='color: #4C4C4C;background-color: #B1A5B6;padding: 8px; font-family:Tahoma; font-size:17pt;color:#4C4C4C'><BR></td> " +
                    //  "</tr>" +
                    //"</table>" +
                              "</td>" +
                              "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 3px;background-color: #B1A5B6'><BR></td></tr>" +
                              "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                              "</tr><td style='font-size: 8pt; font-family: Tahoma; background-color: #92B0E2; padding: 5px;'><BR></td></tr>" +
                              "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                              "<tr><td align='left' style='color: #4C4C4C;background-color: #B1A5B6;padding: 8px; font-family:Verdana; font-size:15pt;color:#484888' >INFLIGHT NEW DEMANDS REQUEST - " + txtAZID.Text + "</td></tr> ";

                gEmailFooter = "<tr>" +
                                "<td colspan=2  style='font-size: 8pt; font-family: Tahoma; background-color: #92B0E2; padding: 5px;'>" +
                                "For questions regarding this information please contact" +
                                "<a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_blank> InFlight Team </a>" +
                                "<br /> </td>" +
                                "</tr>" +
                                "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                                "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 3px;background-color: #B1A5B6'><BR></td></tr>" +
                                "</table></body></html>";



                        #region :FOR THE MULTIPLE ADDRESS ISSUE

                        //int i = 0; //no  of addresses
                        //string[] EmailaddrsTo = new string[10];
                        //string[] EmailaddrsCc = new string[10];
                        //string To = txtTo.Text.Trim();
                        //string Cc = txtCc.Text.Trim();
                        ///// for the addresses in the To box 
                        //EmailaddrsTo = To.Split(';');
                        //foreach (string str in EmailaddrsTo)
                        //{
                        //    mail.To.Add(EmailaddrsTo[i]);
                        //    i++;
                        //}
                        //i = 0;
                        ///// for the addresses in the Cc box 
                        //EmailaddrsCc = Cc.Split(';');
                        //foreach (string str in EmailaddrsCc)
                        //{
                        //    mail.CC.Add(EmailaddrsCc[i]);
                        //    i++;
                        //}

                        ////mail.To.Add(txtTo.Text.Trim());
                        ////mail.CC.Add(txtCc.Text.Trim());
                        
                        #endregion

                try
                {

                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("172.19.98.22", 25);

                    string sText = Server.MapPath("~//UploadedFiles") + "//" + txtAZID.Text + "//" + FileUpload1.FileName;
                    string sHtmlBody;
                    string sEmailBodyNoti;
                    string sEmailAddress = "NewDemandRequest@Ikran.com";
                    
                    mail.From = new MailAddress(sEmailAddress);
                    mail.Subject = "INFLIGHT NEW DEMAND REQUEST : '" + sSOWEST + "'  - '" + txtAZID.Text + "'";

                    mail.IsBodyHtml = true;
                    mail.To.Add(sEmailAddress);
                    mail.To.Add("Rajesh.Shetty@Ikran.com");
                    mail.CC.Add(txtInfyRequestor.Text);
                    
                    if (sFileName == "No_File_Uploaded.htm") 
                    {
                        //Do Nothing;
                    }
                    else
                    {
                      Attachment aT1 = new Attachment(sText);
                      mail.Attachments.Add(aT1);
                    }
                    sEmailBodyNoti = "" +
                                    "<tr>" +
                                    "<td colspan=2><span style='font-family: Tahoma;font-size: 10pt'><BR><br><br>" +
                                    " <table width='100%' style='font-family: Tahoma;font-size: 10pt'>" +
                        //AZID
                                  " <tr>" +
                                     "<td valign='Top'><b>AZID</b></td>" +
                                     "<td valign='Top'>" + txtAZID.Text + "<BR><BR></td>" +
                                   "</tr>" +
                        //Project Name
                                   " <tr>" +
                                     "<td valign='Top'><b>Project Name<b></td>" +
                                     "<td valign='Top'>" + txtProjectName.Text + "<BR><BR></td>" +
                                   "</tr>" +
                        //Clarity Id
                                   " <tr>" +
                                     "<td valign='Top'><b>Clarity Id<b></td>" +
                                     "<td valign='Top'>" + txtClarityId.Text + "<BR><BR></td>" +
                                   "</tr>" +
                        //Functional Portfolio
                                   " <tr>" +
                                     "<td valign='Top'><b>Functional Portfolio<b></td>" +
                                     "<td valign='Top'>" + drpFuncArea.SelectedItem.Value + "<BR><BR></td>" +
                                   "</tr>" +
                        //AZ PM
                                   " <tr>" +
                                     "<td valign='Top'><b>AZ PM</b></td>" +
                                     "<td valign='Top'>" + txtAZRequestor.Text + "<BR><BR></td>" +
                                   "</tr>" +
                        //Requestor
                                   " <tr>" +
                                     "<td valign='Top'><b>Requestor</b></td>" +
                                     "<td valign='Top'>" + txtInfyRequestor.Text + "<BR><BR></td>" +
                                   "</tr>" +
                        //Project Description
                                   " <tr>" +
                                     "<td valign='Top'><b>Request Details<b></td>" +
                                     "<td valign='Top'>" + txtPrjDescription.Text + "<BR><BR></td>" +
                                   "</tr>";
                    //Documenation
                    //" <tr>" +
                    //  "<td valign='Top'><b>Documentation<b></td>" +
                    //  "<td valign='Top'><a style='color: #4C4C4C;' href='" + sText + "' target=_blank>Download </a>the related documents<BR><BR></td>" +
                    //"</tr>";


                    sHtmlBody = gEmailHeader + sEmailBodyNoti + gEmailFooter;

                    mail.Body = sHtmlBody;

                    // mail.Subject = "TEST MAIL";

                    //mail.Body = htmlBody;
                    //SmtpServer.Port = 587;
                    //SmtpServer.Credentials = new System.Net.NetworkCredential("username", "password");
                    //SmtpServer.EnableSsl = true;
                    SmtpServer.UseDefaultCredentials = true;
                    SmtpServer.Send(mail);
                    //MessageBox.Show("EMAIL SENT SUCCESSFULLY";
                    //MessageBox.Show("Email Sent"); 
                    //return iRet;
                }

                catch (Exception ex)
                {
                    //iRet = 1;
                    //return iRet;
                    //throw ex;
                    lblStatus.Text = " ERROR SENDING MAIL" + ex.Message.ToString();
                    //obj.SendErrorDetails(ex.Message);
                    //throw ex;

                }

                #endregion


                form1.Visible = false;
                //lblStatus.Text = "Hi " + sFirstName + " " + sLastName + "<br/><br/>" +
                //                  "     Your request details have been updated Succesfully.<br/>" +
                //                  "     You will be updated within '"+iSLA+"' working days with the progress of the request.<br/>" +
                //                  "     Incase of any concerns please contact <a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_blank> InFlight Team </a><br/><br/>" +
                //                  "Regards,<br/>" +
                //                  "Inflight Team<br/><br/><a style='color: #4C4C4C;' href='Home.aspx' target=_> BACK TO HOME </a>";
                Session["FirstName"] = sFileName;
                Session["LastName"] = sLastName;
                Session["SLA"] = iSLA;
                Session["Confirmation"] = "Hi " + sFirstName + " " + sLastName + "<br/><br/>" +
                                  "     Your request details have been updated Succesfully.<br/>" +
                                  "     You will be updated within '" + iSLA + "' working days with the progress of the request.<br/>" +
                                  "     Incase of any concerns please contact <a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_self> InFlight Team </a><br/><br/>" +
                                  "Regards,<br/>" +
                                  "New Demand Team<br/><br/><a style='color: #4C4C4C;' href='Home.aspx' target=_self> BACK TO HOME </a>";

                //Move to Confirmation Page

                Response.Redirect("Confirmation.aspx");
            }
            catch (Exception ex)
            {
              //throw ex;
              obj.SendErrorDetails(ex.Message);
              lblStatus.Text = " ERROR INSERTING DATA" + ex.Message.ToString();

            }
            finally
            {
                //Doing Nothing 
            }

        #endregion

        #region: INSERTING VALUES IN MS ACCESS DATABASE 
            //Inserting values in the access database
            
            //try
            //{
            //   obj.InsertNewRequestAccess(NewAZID, ClarityID, EngagementReference, ProjectName, ProjectDescription, FuncArea, AZIDMName, AZIDMEmailID, InfyRequestorName, InfyRequestorEmailID, RequestStatus, SoWEstimate, Multiple, date, sFileName, sRemarks);
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //finally
            //{
            //    form1.Visible = false;
            //    lblStatus.Text = "Hi " + sFirstName + " " + sLastName + "<br/><br/>" +
            //                      "     Your request details have been updated Succesfully.<br/>" +
            //                      "     You will be updated within 10 working days with the progress of the request.<br/>" +
            //                      "     Incase of any concerns please contact Purushottam Rao<br/><br/>" +
            //                      "Regards,<br/>" +
            //                      "Ikran Inflight Team";
            //}

            #endregion

        


    }
    protected void drpFuncArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        string temp = "Multiple";
        if (drpFuncArea.SelectedItem.Text == temp)
        {
            lblMulFuncArea.Visible = true;
            txtMultipleSetAreas.Visible = true;
        }
        else
        {
            lblMulFuncArea.Visible = false;
            txtMultipleSetAreas.Visible = false;
        }

        
    }
    protected void rdbMulAppYes_CheckedChanged(object sender, EventArgs e)
    {
        lblTemplate.Visible = true;
        lblTemplate.Text = "Please provide the information on the Multiple Applications in the template available <a href='Multiple_Apps_ND_Request_Template.xlsx'>here.</a>";
        //rdbMulAppYes.Attributes.Add("CheckedChanged", "javascript:rdbOnclick();");
        

    }
    protected void rdbMulAppNo_CheckedChanged(object sender, EventArgs e)
    {
        lblTemplate.Visible = false;
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //string sFolderName = Server.MapPath("~//UploadedFiles") + "//"+txtAZID.Text; 
        //System.IO.Directory.CreateDirectory(sFolderName);
        //if (FileUpload1.HasFile == true)
        //{

        //    FileUpload1.SaveAs(Server.MapPath("~//UploadedFiles//"+txtAZID.Text+"//") + FileUpload1.FileName);

        //}
        //else
        //{
        //    sFileName = "No File Uploaded";
        //}
    }
    protected void rdbEST_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void rdbSoW_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void rdbMulAppNo_CheckedChanged1(object sender, EventArgs e)
    {
        lblTemplate.Visible = false;
    }
    protected void rdbMulAppYes_CheckedChanged1(object sender, EventArgs e)
    {
        lblTemplate.Visible = true;
        lblTemplate.Text = "Please provide the information on the Multiple Applications in the template available <a href='Multiple_Apps_ND_Request_Template.xlsx'>here.</a>";
        //rdbMulAppYes.Attributes.Add("CheckedChanged", "javascript:rdbOnclick();");
        
    }
}
