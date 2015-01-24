using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Net.Mail;

/// <summary>
/// Summary description for NDRequest
/// </summary>
public class NDRequest
{

    static SqlConnection conn;
    static OleDbConnection oConn;

    public NDRequest()
    {
        #region: SQL EXPRESS CONNECTION DETAILS
        //Defining the SQL Connection
        //string connstr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\kshh119\\Documents\\Visual Studio 2008\\WebSites\\NDRequest\\App_Data\\NDRequest.mdf;Integrated Security=True; User Instance=True";
        ////string connstr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\AHS\\NDRequest\\NDRequest.mdf;Integrated Security=True; User Instance=True";
        ////string connstr = "Data Source=USSBBAMAAS02\\maps;AttachDbFilename=NDRequest.mdf;Integrated Security=True; User Instance=True";
        ////string connstr = "Data Source=USSBBAMAAS02\\MAPS;Initial Catalog=NDRequest;User ID=ndrequest_user;Password=ndrequest_user;Persist Security Info=True";
        ////string connstr= "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.accdb;Persist Security Info=True";
        ////string connstr = "Data Source=C:\\AHS\\NDRequest\\NDRequest.accdb;Persist Security Info=True";
        //conn = new SqlConnection(connstr);

        #endregion

        #region REMOTE SQL SERVER CONNECTION DETAILS

        string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
        //string connstr = "Data Source=USSBBAMAAS02\\MAPS;Password=ndrequest_user;User ID=ndrequest_user;Initial Catalog=NDRequest";

        //string connstr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\AHS\\NDRequest\\NDRequest.mdf;Integrated Security=True; User Instance=True";
        //string connstr = "Data Source=USSBBAMAAS02\\maps;AttachDbFilename=NDRequest.mdf;Integrated Security=True; User Instance=True";
        //string connstr = "Data Source=USSBBAMAAS02\\MAPS;Initial Catalog=NDRequest;User ID=ndrequest_user;Password=ndrequest_user;Persist Security Info=True";
        //string connstr= "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.accdb;Persist Security Info=True";
        //string connstr = "Data Source=C:\\AHS\\NDRequest\\NDRequest.accdb;Persist Security Info=True";
        //conn = new SqlConnection(connstr);
        oConn = new OleDbConnection(sCnstr);
        #endregion




    }

    public void InsertNewRequest(string NewID, string ClarityID, string EngagementReference, string ProjectName,
        string ProjectDescription, string FuncArea, string IDMName, string IDMEmailID,
        string InfyRequestorName, string InfyRequestorEmailID, string RequestStatus,
        string SoWEstimate, string Multiple, DateTime date, string FilePath, string Remarks, string sUserPrid, string sCost, DateTime datesubmitted,string sAdminFilesPath)
    {

      

        #region: INSERTING DATA IN THE DATABASE

                //SqlCommand cmd = new SqlCommand();
                OleDbCommand oCmd = new OleDbCommand();

                ProjectName = ProjectName.Replace("'", "''");
                ProjectDescription = ProjectDescription.Replace("'", "''");
                IDMName = IDMName.Replace("'", "''");
                InfyRequestorName = InfyRequestorName.Replace("'", "''");

                ProjectName = ProjectName.Replace("%", "%%");
                ProjectDescription = ProjectDescription.Replace("%", "%%");
                IDMName = IDMName.Replace("%", "%%");
                InfyRequestorName = InfyRequestorName.Replace("%", "%%");

                ProjectName = ProjectName.Replace("\\", "%\\");
                ProjectDescription = ProjectDescription.Replace("\\", "%\\");
                IDMName = IDMName.Replace("\\", "%\\");
                InfyRequestorName = InfyRequestorName.Replace("\\", "%\\");

                //ProjectName = ProjectName.Replace("""", "\\");
                //ProjectDescription = ProjectDescription.Replace("\\", "%\\");
                //IDMName = IDMName.Replace("\\", "%\\");
                //InfyRequestorName = InfyRequestorName.Replace("\\", "%\\");

                oCmd.CommandText = "insert into NDRequest values('" + NewID + "','" + ClarityID + "','" + EngagementReference + "','" +
                    ProjectName + "','" + ProjectDescription + "','" + FuncArea + "','" + AZIDMName + "','" + IDMEmailID + "','" +
                    InfyRequestorName + "','" + InfyRequestorEmailID + "','" + RequestStatus + "','" + SoWEstimate + "','" +
                    Multiple + "','" + date.ToShortDateString() + "','" + FilePath + "','" + Remarks + "','" + sUserPrid + "','" + sCost + "','" + datesubmitted.ToShortDateString() + "','"+sAdminFilesPath+"', '" + "')";
                oCmd.Connection = oConn;
                //conn.Open();
                oConn.Open();
                //string s = conn.State.ToString();
                try
                {
                    oCmd.ExecuteNonQuery();
                    
                }
                catch (Exception ex)
                {
                    throw ex;
                    SendErrorDetails(ex.Message);
                }
                finally
                {
                    //conn.Close();
                    oConn.Close();
                }

        #endregion

    }

    public void InsertNewRequestAccess(string NewID, string ClarityID, string EngagementReference, string ProjectName,
        string ProjectDescription, string FuncArea, string IDMName, string IDMEmailID,
        string InfyRequestorName, string InfyRequestorEmailID, string RequestStatus,
        string SoWEstimate, string Multiple, DateTime date, string FilePath, string Remarks)
    {

          

        #region: INSERTING DATA IN THE DATABASE 

            OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.mdb;");
            OleDbCommand cmd = new OleDbCommand();
            oConn.Open();
            cmd.CommandText = "insert into NDRequest values('" + NewID + "','" + ClarityID + "','" + EngagementReference + "','" +
                ProjectName + "','" + ProjectDescription + "','" + FuncArea + "','" + IDMName + "','" + IDMEmailID + "','" +
                InfyRequestorName + "','" + InfyRequestorEmailID + "','" + RequestStatus + "','" + SoWEstimate + "','" +
                Multiple + "','" + date.ToShortDateString() + "','" + FilePath + "','" + Remarks + "')";
            cmd.Connection = oConn;
            string s1 = conn.State.ToString();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //throw ex;
                SendErrorDetails(ex.Message);
            }
            finally
            {
                oConn.Close();
            }
        #endregion
    }

    public void SendErrorDetails(string ex)
    {

        #region COLLECT THE ERROR MESSAGE 

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
                              "<tr><td align='left' style='color: #4C4C4C;background-color: #B1A5B6;padding: 8px; font-family:Verdana; font-size:15pt;color:#484888' >INFLIGHT NEW DEMANDS REQUEST </td></tr> ";

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
                string sEmailAddress = "NewDemandRequest@Ikran.com";
                mail.From = new MailAddress(sEmailAddress);
                mail.Subject = "INFLIGHT NEW DEMAND REQUEST : ERROR ";

                mail.IsBodyHtml = true;
                mail.To.Add(sEmailAddress);
                mail.To.Add("Rajesh.Shetty@Ikran.com");


                sEmailBodyNoti = ex;

                
                //string sUserPrid = Session["User"].ToString();
                string sUserPrid = System.Web.HttpContext.Current.User.Identity.Name.ToString();

                sHtmlBody = gEmailHeader + "   " + sUserPrid+ "   " +  sEmailBodyNoti + "    "  + gEmailFooter;

                mail.Body = sHtmlBody;

                SmtpServer.Send(mail);

            }
            catch (Exception ex1)
            {
                //Do Nothing
            }

        #endregion

        }


    }
