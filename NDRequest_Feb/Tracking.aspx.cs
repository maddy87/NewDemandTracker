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

public partial class Tracking : System.Web.UI.Page
{

    public string getMailTo(object AZID, object ProjectName)
    {

        return string.Format( new object[] { AZID, ProjectName });

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //string temp = Session["User"].ToString();
            //Response.Write(temp);

            #region: GET THE DETAILS OF THE LOGGED IN USER

                string sTemp = System.Web.HttpContext.Current.User.Identity.Name.ToString();
                string[] split = sTemp.Split('\\');
                string sCurrDomain = split[0];
                string sUserPrid = split[1];

                Session["User"] = sUserPrid;
                //Session["Domain"] = sCurrDomain;
                //lblUser.Text = "Welcome " + sUserPrid;

            #endregion
        }
        catch (Exception Ex)
        {
            lblErr.Text = Ex.Message.ToString();
            dgTrackingDetails.Visible = false;
        }
           
   


    }
    protected void dgTrackingDetails_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void dgTrackingDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
          //PREPARING THE DATA CONNECTION STRING
        NDRequest obj = new NDRequest();
        string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
        OleDbConnection conn = new OleDbConnection(sCnstr);
        OleDbCommand cmd = new OleDbCommand();
        
        
        #region: FETCHING DATA FROM THE DATABASE 

        if (e.CommandName == "Select")
        {
            try
            {
                string s = dgTrackingDetails.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
                cmd.CommandText = "SELECT * FROM NDREQUEST WHERE AZID='" + e.CommandArgument.ToString() + "'";
                cmd.CommandText = "SELECT * FROM NDREQUEST WHERE AZID='" + s + "'";
                cmd.Connection = conn;
                conn.Open();
                OleDbDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    Session["RequestNo"] = dr[0].ToString();
                    Session["AZID"] = dr[1].ToString();
                    Session["ClarityID"] = dr[2].ToString();
                    Session["EngagementReference"] = dr[3].ToString();
                    Session["ProjectName"] = dr[4].ToString();
                    Session["ProjectDescription"] = dr[5].ToString();
                    Session["FunctionalPortfolio"] = dr[6].ToString();
                    Session["AZIDMName"] = dr[7].ToString();
                    Session["AZIDMEmailID"] = dr[8].ToString();
                    Session["InfyRequestorName"] = dr[9].ToString();
                    Session["InfyRequestorEmailID"] = dr[10].ToString();
                    Session["RequestStatus"] = dr[11].ToString();
                    Session["SoWEstimate"] = dr[12].ToString();
                    Session["MultipleApplication"] = dr[13].ToString();
                    Session["DateRequested"] = dr[14].ToString();
                    Session["FilePath"] = dr[15].ToString();
                    Session["Remarks"] = dr[16].ToString();
                    Session["UserPrid"] = dr[17].ToString();
                    Session["Cost"] = dr[18].ToString();
                    Session["DateSubmitted"] = dr[19].ToString();
                }

                dr.Close();
                conn.Close();
                Response.Redirect("Update.aspx");
            }
            catch (Exception ex)
            {
                //throw ex;
                obj.SendErrorDetails(ex.Message);
                
            }
            finally
            {
                //Do Nothing
            }
        }
        #endregion
    }
    protected void dgTrackingDetails_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}
