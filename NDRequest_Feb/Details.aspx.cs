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
using System.Net.Mail;
using System.Data.OleDb;

public partial class Details : System.Web.UI.Page
{
    public string sID;
    static string sCnstr;
    public string sFileName;
    NDRequest obj;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string sUserPrid;
        try
        {
            sID = Request.QueryString["ID"];
            sUserPrid = Session["User"].ToString();
            //Update Functionality only for Admins 
            switch (sUserPrid)
            {
                case "kljb179": break;//DoNothing;
                case "kbrs961": break;//DoNothing;
                case "kphk504": break;//DoNothing;
                case "kshh119": break;//DoNothing;
                case "kjqd656": break;//DoNothing;
                case "knvs999": break;
                default: Panel1.Visible = false;
                         hyAdmin.Visible = false; break;
            }
            
        }
        catch (Exception ex)
        {
            Panel1.Visible = false;
            DetailsView1.Visible = false;
            lblErr.Text = "This Page seems to be broken. Please go to page <a style='color: #4C4C4C;' href='Home.aspx' target=_self>HOME</a> page and try raising a request</br> Error : '" + ex.Message + "";
            //obj.SendErrorDetails(ex.Message);
        }
        if (!IsPostBack)
        {
            lblAckUpdate.Visible = false;

        }
        

    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
              
        obj = new NDRequest();


        #region: FILE UPLOAD
        try
        {
            string sFolderName = Server.MapPath("~//UploadedFiles") + "//" + sID +"//Response";
            System.IO.Directory.CreateDirectory(sFolderName);
            if (fAdminFiles.HasFile == true)
            {
                fAdminFiles.SaveAs(Server.MapPath("~//UploadedFiles//" + sID + "//Response//") + fAdminFiles.FileName);
                //FileUpload1.SaveAs(Server.MapPath("~//UploadedFiles//" + txtID.Text + "//") + FileUpload1.FileName);
                sFileName = "UploadedFiles/" + sID + "/Response/" + fAdminFiles.FileName;
            }
            else
            {
                sFileName = "";
            }
        }
        catch (Exception ex)
        {   //throw ex;
            //obj.SendErrorDetails(ex.Message);
            lblAckUpdate.Text = " ERROR UPLOADING FILE "  + ex.Message.ToString();

        }


        #endregion

        sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
        if (txtSubmitdate.Text == "")
        {
            txtSubmitdate.Text = DateTime.Now.ToShortDateString();
        }

        if (txtCost.Text == "")
        {
            txtCost.Text = "0";
        }
        DateTime now = new DateTime();
        try
        {
           now = Convert.ToDateTime(txtSubmitdate.Text);
        

        #region: UPDATING THE DATABASE

        txtRemarks.Text = txtRemarks.Text.Replace("'", "''");

        OleDbConnection conn = new OleDbConnection(sCnstr);   
            //SqlConnection conn = new SqlConnection("Data Source=USSBBAMAAS02\\MAPS;Password=ndrequest_user;User ID=ndrequest_user;Initial Catalog=NDRequest");
        OleDbCommand cmd = new OleDbCommand();
            //SqlCommand cmd = new SqlCommand();
        string sUpdateSQL;
        sUpdateSQL = "UPDATE NDRequest SET RequestStatus = '"+drpRequestStatus.SelectedValue.ToString() +"',Remarks ='"+txtRemarks.Text+"',Cost ='"+txtCost.Text+"',DateSubmitted='"+now.ToShortDateString() + "'";

        if (sFileName.Trim().Length > 0)
        {
            sUpdateSQL = sUpdateSQL + ", AdminFilesPath='"+sFileName+"'";
        }
         
        sUpdateSQL = sUpdateSQL + " WHERE ID='"+sID+"'";


        cmd.CommandText = sUpdateSQL;

        cmd.Connection = conn;
        conn.Open();

            //DetailsView1.DataBind();
            //Response.Redirect(Request.RawUrl);
                      //string s = conn.State.ToString();
            try
            {
                cmd.ExecuteNonQuery();

                
                cmd.CommandText = "SELECT AdminFilesPath FROM NDRequest WHERE ID='" + sAZID + "'";

                OleDbDataReader olReader =  cmd.ExecuteReader();
                olReader.Read();
                string sAdminFile = olReader[0].ToString();

                #region: EMAILING THE COMPLETE STORY
                if(RBYes.Checked == true)
                {
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
                                      "<tr><td align='left' style='color: #4C4C4C;background-color: #B1A5B6;padding: 8px; font-family:Verdana; font-size:12pt;color:#484888' > NEW DEMANDS REQUEST - UPDATE FOR CLARITY#: " + DetailsView1.Rows[2].Cells[1].Text.ToString() + "</td></tr> ";

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
                                                         
                            string sHtmlBody;
                            string sEmailBodyNoti;
                            string sTOEmailID = DetailsView1.Rows[9].Cells[1].Text.ToString();
                            string sFROMEmailAddress = "NEW_DEMAND_TEAM@Ikran.COM";    //DetailsView1.Rows[9].Cells[1].Text.ToString();//"NewDemandRequest@Ikran.com";
                            //string sBcc = "Rajesh.Shetty@Ikran.com";
                            mail.From = new MailAddress(sFROMEmailAddress);
                            mail.Subject = "STATUS UPDATE FOR REQUEST: '" + DetailsView1.Rows[2].Cells[1].Text.ToString() + "' - " + drpRequestStatus.SelectedItem.Text.ToUpper();
                            mail.IsBodyHtml = true;
                            mail.To.Add(sTOEmailID);
                            mail.Bcc.Add("Rajesh.Shetty@Ikran.com");
                            if (txtIDM.Text.Trim().Length > 0)
                            {
                                mail.CC.Add(txtIDM.Text);
                            }

                            string sRemarks = txtRemarks.Text.Replace(Environment.NewLine, "<BR>");
                            sEmailBodyNoti = "" +
                                            "<tr>" +
                                            "<td colspan=2><span style='font-family: Tahoma;font-size: 10pt'><BR><br>" +
                                            " <table width='100%' style='font-family: Tahoma;font-size: 10pt'>" +
                                //Clarity Id
                                           " <tr>" +
                                             "<td valign='Top'><b>Clarity Id<b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[2].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +
                                //Functional Portfolio
                                           " <tr>" +
                                             "<td valign='Top'><b>Functional Portfolio<b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[6].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +
                                //Project Name
                                           " <tr>" +
                                             "<td valign='Top'><b>Project Name<b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[4].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +

                                //Remarks
                                            " <tr>" +
                                              "<td valign='Top'><b>Msg From ND team<b></td>" +
                                              "<td valign='Top'><HR>" + sRemarks + "<HR><BR></td>" +
                                            "</tr>" +           
                                // PM
                                           " <tr>" +
                                             "<td valign='Top'><b> PM</b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[7].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +
                                //Requestor
                                           " <tr>" +
                                             "<td valign='Top'><b>Requestor</b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[9].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +
                                //Project Description
                                           " <tr>" +
                                             "<td valign='Top'><b>Request Details<b></td>" +
                                             "<td valign='Top'>" + DetailsView1.Rows[5].Cells[1].Text.ToString() + "<BR><BR></td>" +
                                           "</tr>" +
                                //Current Status
                                            " <tr>" +
                                              "<td valign='Top'><b>Current Status<b></td>" +
                                              "<td valign='Top'>" + drpRequestStatus.SelectedItem.Text + "<BR><BR></td>" +
                                            "</tr>" +
                                //Cost
                                            " <tr>" +
                                              "<td valign='Top'><b>Cost Estimate<b></td>" +
                                              "<td valign='Top'>" + txtCost.Text + "<BR><BR></td>" +
                                            "</tr>" +
                                
                                //Track Your Request
                                " <tr>" +
                                  "<td valign='Top'><b>Your Request<b></td>" +
                                  
                                
                                //If admin has attached anything at anytime then give a download link in mail

                            if (sAdminFile.Trim().Length > 0)
                            {
                                if (sAdminFile.Trim() != "No_File_Uploaded.htm")
                                {
                                    sEmailBodyNoti = sEmailBodyNoti + " <tr>" +
                                     "<td valign='Top'><b>Download Your Files<b></td>" +
                                     
                                }
                            }    

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
                            lblAckUpdate.Text = " ERROR SENDING MAIL" + ex.Message.ToString();
                            //obj.SendErrorDetails(ex.Message);
                            //throw ex;

                        }

                }
                #endregion
            }
            catch (Exception ex)
            {
                //throw ex;   
                lblAckUpdate.Text = ex.Message;

            }
            finally
            {
                conn.Close();
                
            }
         

        #endregion

            DetailsView1.DataBind();
            txtIDM.Text = "";
            RBNo.Checked = true;
            RBYes.Checked = false;
            lblAckUpdate.Visible = true;
            lblAckUpdate.ForeColor = System.Drawing.Color.Green;
            lblAckUpdate.Text = "RECORDS FOR "+sID+" UPDATED SUCCESSFULLY !!!";
        }
        catch (NullReferenceException exNull)
        {
            
            lblAckUpdate.Text = "Date String is not in correct format";
            lblAckUpdate.Visible = true;
            lblAckUpdate.ForeColor = System.Drawing.Color.Red;
            obj.SendErrorDetails(exNull.Message);
        }
        catch (FormatException exF)
        {

            lblAckUpdate.Text = "Date String is not in correct format";
            lblAckUpdate.Visible = true;
            lblAckUpdate.ForeColor = System.Drawing.Color.Red;
            obj.SendErrorDetails(exF.Message);
        }
        catch (Exception exC)
        {

            lblAckUpdate.Text = "Date String is not in correct format";
            lblAckUpdate.Visible = true;
            lblAckUpdate.ForeColor = System.Drawing.Color.Red;
            obj.SendErrorDetails(exC.Message);
        }

    }

    protected void DetailsView1_DataBinding(object sender, EventArgs e)
    {
    
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        string Status = DetailsView1.Rows[11].Cells[1].Text.ToString();
        
        //string sCost 
           txtCost.Text = DetailsView1.Rows[18].Cells[1].Text.ToString();
        //string sDate
        txtSubmitdate.Text = DetailsView1.Rows[19].Cells[1].Text.ToString();
        txtRemarks.Text = DetailsView1.Rows[16].Cells[1].Text.ToString();

        switch (Status.Trim())
        {
            case "Draft": drpRequestStatus.SelectedIndex = 0; break;
            case "In Progress": drpRequestStatus.SelectedIndex = 1; break;
            case "Cancelled": drpRequestStatus.SelectedIndex = 2; break;
            case "Completed": drpRequestStatus.SelectedIndex = 3; break;
            case "Need More Info": drpRequestStatus.SelectedIndex = 4; break;
            default: break;
        }

    }
}
