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
using System.Data.OleDb;
using System.Web.SessionState;
using System.Net.Mail;

public partial class Update : System.Web.UI.Page
{
    NDRequest obj;
    string sSE;
    string sMA;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            try
            {
                lblUserName.Text = "Welcome " + Session["User"].ToString();
                txtAZID.Text = Session["AZID"].ToString();
                txtClarityId.Text = Session["ClarityID"].ToString();
                txtProjectName.Text = Session["ProjectName"].ToString();
                txtPrjDescription.Text = Session["ProjectDescription"].ToString();
                //Check which Function area was mentioned
                string sFunc = Session["FunctionalPortfolio"].ToString();
                drpFuncArea.SelectedItem.Text = Session["FunctionalPortfolio"].ToString();
                txtAZRequestor.Text = Session["AZIDMName"].ToString();
                //Session["AZIDMEmailID"] = dr[8].ToString();
                txtInfyRequestor.Text = Session["InfyRequestorName"].ToString();
                //Session["InfyRequestorEmailID"] = dr[10].ToString();
                //Session["RequestStatus"] = dr[11].ToString();
                sSE = Session["SoWEstimate"].ToString();
                sSE = sSE.Substring(0, 3);
                if (sSE == "SOW")
                { 
                    rdbSoW.Checked = true;
                    rdbEST.Checked = false;
                }
                else { rdbEST.Checked = true; }
                //sSE = "SOW"?rdbSoW.Checked = true : 
                sMA = Session["MultipleApplication"].ToString();
                if (sMA == "Yes") { rdbMulAppYes.Checked = true; }
                else { rdbMulAppNo.Checked = true; }
                //sMA = "Yes"?rdbMulAppYes.Checked = true : rdbMulAppNo.Checked = true;
                //Session["DateRequested"] = dr[14].ToString();
                string sFileName = Session["FilePath"].ToString();
                //    //Session["Remarks"] = dr[16].ToString();
                //    Session["UserPrid"] = dr[17].ToString();
                //    Session["Cost"] = dr[18].ToString();
                //    Session["DateSubmitted"] = dr[19].ToString();
                lblUploadedFiles.Text = lblUploadedFiles.Text + "<a href='"+sFileName+"'> existing files.</a>";
            }
            catch (Exception ex)
            {
                form1.Visible = false;
                lblStatus.Text = "The Page seems to be broken<br/><br/>" +
                              " Please go to <a style='color: #4C4C4C;' href='Home.aspx' target=_blank> HOME</a> and then click on CREATE NEW REQUEST<br/><br/>" +
                              "Regards,<br/>" +
                              "Inflight Team<br/><br/>";
            }
            finally
            {

            }


        }


    }
    protected void drpFuncArea_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    protected void rdbMulAppNo_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void rdbMulAppYes_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void txtInfyRequestor_TextChanged(object sender, EventArgs e)
    {

    }
    protected void rdbSoW_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void rdbEST_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        NDRequest obj = new NDRequest();
        string sFileName;
        string sFuncP;
        int iSLA;

        //Getting the SLA Value
        if (rdbEST.Checked == true)
        { iSLA = 10; }
        else {iSLA = 5; }

        //Checking File is uploaded or not
        if (FileUpload1.HasFile)
        {
            sFileName = FileUpload1.FileName;
        }
        else
        {
            sFileName = Session["FilePath"].ToString();
        }

        //Getting the Functional Area
        if (txtMultipleSetAreas.Visible == true)
        { sFuncP = txtMultipleSetAreas.Text; }
        else { sFuncP = drpFuncArea.SelectedItem.Text; }

        //Checking if it was changed to SOW or EST
        if (rdbEST.Checked == true)
        { sSE = "EST"; }
        else { sSE = "SOW"; }


        #region: UPDATING THE DATABASE


            string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
            OleDbConnection conn = new OleDbConnection(sCnstr);
            //SqlConnection conn = new SqlConnection("Data Source=USSBBAMAAS02\\MAPS;Password=ndrequest_user;User ID=ndrequest_user;Initial Catalog=NDRequest");
            OleDbCommand cmd = new OleDbCommand();
            //SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE NDRequest SET ClarityId ='" + txtClarityId.Text + "'" +
                                                  ",ProjectName='" + txtProjectName.Text + "'" +
                                                  ",ProjectDescription='" + txtPrjDescription.Text + "'" +
                                                  ",FunctionalPortfolio='" + sFuncP + "'" +
                                                  ",AZIDMName='" + txtAZRequestor.Text + "'" +
                                                  ",InfyRequestorName='" + txtInfyRequestor.Text + "'" +
                                                  ",SOWEstimate='" + sSE + "'" +
                                                  ",MultipleApplication='" + sMA + "'" +
                                                  ",DateRequested='" + DateTime.Now.ToShortDateString() + "'" +
                                                  ",FilePath='" + sFileName + "'"+
                                                  " WHERE AZID='"+ Session["AZID"].ToString()+"'" ;
            cmd.Connection = conn;
            conn.Open();
            //string s = conn.State.ToString();
            try
            {
                cmd.ExecuteNonQuery();

                conn.Close();
                #region: EMAILING THE COMPLETE STORY

                string gEmailHeader = "<html>" +
                                      "<body>" +
                                      "<table border='0'cellpadding='0' cellspacing='0' style='width:700px'>" +
                                      "<tr>" +
                                      "<td>" +
                                     "</td>" +
                                     "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 3px;background-color: #B1A5B6'><BR></td></tr>" +
                                     "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                                     "</tr><td style='font-size: 8pt; font-family: Tahoma; background-color: #92B0E2; padding: 5px;'><BR></td></tr>" +
                                     "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                                     "<tr><td align='left' style='color: #4C4C4C;background-color: #B1A5B6;padding: 8px; font-family:Verdana; font-size:15pt;color:#484888' >INFLIGHT NEW DEMANDS REQUEST - UPDATE " + Session["AZID"].ToString() + "</td></tr> ";

                string gEmailFooter = "<tr>" +
                                       "<td colspan=2  style='font-size: 8pt; font-family: Tahoma; background-color: #92B0E2; padding: 5px;'>" +
                                       "For questions regarding this information please contact" +
                                       "<a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_blank> InFlight Team </a>" +
                                       "<br /> </td>" +
                                       "</tr>" +
                                       "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 1px;'><BR></td></tr>" +
                                       "</tr><td style='font-size: 8pt; font-family: Tahoma;padding: 3px;background-color: #B1A5B6'><BR></td></tr>" +
                                       "</table></body></html>";
                try
                {

                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("172.19.98.22", 25);
                    string sText = Server.MapPath("~//UploadedFiles") + "//" + txtAZID.Text  + "//" + sFileName;
                    string sHtmlBody;
                    string sEmailBodyNoti;
                    //string sText = Server.MapPath(sFileName);
                    string sTOEmailID = txtInfyRequestor.Text; //DetailsView1.Rows[9].Cells[1].Text.ToString();
                    string sFROMEmailAddress = "NewDemandRequest@Ikran.com";    //DetailsView1.Rows[9].Cells[1].Text.ToString();//"NewDemandRequest@Ikran.com";
                    //string sBcc = "Rajesh.Shetty@Ikran.com";
                    mail.From = new MailAddress(sFROMEmailAddress);
                    mail.Subject = "STATUS UPDATE FOR REQUEST: '" + Session["AZID"].ToString() ;
                    mail.IsBodyHtml = true;
                    mail.To.Add(sTOEmailID);
                    mail.Bcc.Add("Rajesh@Ikran.com");
                    Attachment aT1 = new Attachment(sText);
                    mail.Attachments.Add(aT1);

                    //string sRemarks = txtRemarks.Text.Replace(Environment.NewLine, "<BR>");
                    sEmailBodyNoti = "" +
                                    "<tr>" +
                                    "<td colspan=2><span style='font-family: Tahoma;font-size: 10pt'><BR><br><br>" +
                                    " <table width='100%' style='font-family: Tahoma;font-size: 10pt'>" +
                        //AZID
                                  " <tr>" +
                                     "<td valign='Top'><b>AZID</b></td>" +
                                     "<td valign='Top'>" + Session["AZID"].ToString() + "<BR><BR></td>" +
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
                                     "<td valign='Top'>" + sFuncP + "<BR><BR></td>" +
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
                    //lblStatus.Text = " ERROR SENDING MAIL" + ex.Message.ToString();
                    //lblAckUpdate.Text = " ERROR SENDING MAIL" + ex.Message.ToString();
                    obj.SendErrorDetails(ex.Message);
                    //throw ex;

                }

                #endregion

               
            }
            catch (Exception ex)
            {
                //throw ex;   
                //lblAckUpdate.Text = ex.Message;
                obj.SendErrorDetails(ex.Message);

            }
            finally
            {
                Session["Confirmation"] = "Hi <br/><br/>" +
                                         "     Your request details have been updated Succesfully.<br/>" +
                                         "     Incase of any concerns please contact <a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_self> InFlight Team </a><br/><br/>" +
                                         "     Regards,<br/>" +
                                         "     Inflight Team<br/><br/><a style='color: #4C4C4C;' href='Home.aspx' target=_self> BACK TO HOME </a>";

                //Move to Confirmation Page
                Response.Redirect("Confirmation.aspx");
            }


        #endregion
    }
}
