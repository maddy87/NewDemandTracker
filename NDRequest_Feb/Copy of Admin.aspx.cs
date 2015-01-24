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
public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            #region: ADDING CODE FOR ERROR ON ADMIN



            try
            {
                
                string sUserPrid = Session["User"].ToString();
                //Update Functionality only for Admins
                switch (sUserPrid)
                {
                    case "kljb179": break;//PurushottamRao;
                    case "kbrs961": break;//SuvitSuvit;
                    case "kphk504": break;//AmareshDurve;
                    case "kshh119": break;//RajeshShetty;
                    case "kjqd656": break;//VinodMall;
                    case "knvs999": break;//AshishTongia;
                    case "krsf004": break;//SanjoySinha;
                    case "kmrr536": break;//MohitGoyal;
                    default: GridView3.Visible = false; break;
                }
            }
            catch (Exception ex)
            {
                GridView3.Visible = false;
                //DetailsView1.Visible = false;\
                lblTemplate.Visible = true;
                lblTemplate.Text = "This Page seems to be broken. Please go to page <a style='color: #4C4C4C;' href='Home.aspx' target=_self>HOME</a> page and try raising a request</br> Error : '" + ex.Message + "";
            }
                        
            #endregion

           
        }
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    SqlDataSource1.SelectCommand = "Select * from NDRequest where AZID='ID1001'";
    //    SqlDataSource1.DataBind();
    //    GridView3.DataBind();
    //}
    protected void btnPullData_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime from = Convert.ToDateTime(txtDateFrom.Text);
            DateTime to = Convert.ToDateTime(txtDateTo.Text);
            //SqlDataSource1.SelectCommand = "Select * from NDRequest where DateRequested = '"+from+"'";// AND DateRequested <= '"+to+"' '";
            SqlDataSource1.SelectCommand = "Select * from NDRequest where DateRequested BETWEEN '" + from.ToShortDateString() + "' AND '" + to.ToShortDateString() + "'";
            SqlDataSource1.DataBind();
            GridView3.DataBind();
            if (GridView3.Rows.Count == 0)
            {
                lblTemplate.Visible = true;
                lblTemplate.Text = "No Records available for the Time period From '" + from.ToShortDateString() + "' To '" + to.ToShortDateString() + "'";
            }
            else
            {
                lblTemplate.Text = "Below are the list of the Existing New Demand Request From '" + from.ToShortDateString() + "' To '" + to.ToShortDateString() + "'";
            }

        }
        catch(Exception ex)
        {            
            lblTemplate.Visible = true;
            lblTemplate.Text = "Error Occured while retrieving data from Database : "+ex.Message;
        }
        finally
        {
            //Do Nothing
        }

    }
    protected void btnResetData_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.SelectCommand = "Select * from NDRequest";
            SqlDataSource1.DataBind();
            GridView3.DataBind();
        }
        catch (Exception ex)
        {
            lblTemplate.Visible = true;
            lblTemplate.Text = "Error Occured while retrieving data from Database : " + ex.Message;
        }
        finally
        {
            lblTemplate.Visible = false;
        }
        
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //PREPARING THE DATA CONNECTION STRING
        string sCnstr = ConfigurationManager.ConnectionStrings["RemoteSQLConnectionString"].ConnectionString;
        OleDbConnection conn = new OleDbConnection(sCnstr);
        OleDbCommand cmd = new OleDbCommand();
        
        if (e.CommandName == "Delete")
        {
                        
            #region: DELETING DATA FROM THE DATABASE 

               
                cmd.CommandText = "DELETE FROM NDRequest WHERE AZID='"+e.CommandArgument.ToString()+"'";
                cmd.Connection = conn;
                conn.Open();
                //string s = conn.State.ToString();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;   
                    //lblAckUpdate.Text = ex.Message;

                }
                finally
                {
                    conn.Close();
                    GridView3.DataBind();
                }
            #endregion
            
        }

        #region: FETCHING DATA FROM THE DATABASE

        if (e.CommandName == "Select")
        {
            //try
            //{
                string s = GridView3.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
                cmd.CommandText = "SELECT * FROM NDREQUEST WHERE AZID='" + e.CommandArgument.ToString() + "'";
                cmd.CommandText = "SELECT * FROM NDREQUEST WHERE AZID='" + s + "'";
                cmd.Connection = conn;
                conn.Open();
                OleDbDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                   
                  Session["RequestNo"] = dr[0].ToString();
                  Session["AZID"]=dr[1].ToString();
                  Session["ClarityID"]=dr[2].ToString();
                  Session["EngagementReference"]=dr[3].ToString();
                  Session["ProjectName"]=dr[4].ToString();
                  Session["ProjectDescription"]=dr[5].ToString();
                  Session["FunctionalPortfolio"]=dr[6].ToString();
                  Session["AZIDMName"]=dr[7].ToString();
                  Session["AZIDMEmailID"]=dr[8].ToString();
                  Session["InfyRequestorName"]=dr[9].ToString();
                  Session["InfyRequestorEmailID"]=dr[10].ToString();
                  Session["RequestStatus"]=dr[11].ToString();
                  Session["SoWEstimate"]=dr[12].ToString();
                  Session["MultipleApplication"]=dr[13].ToString();
                  Session["DateRequested"]=dr[14].ToString();
                  Session["FilePath"]=dr[15].ToString();
                  Session["Remarks"]=dr[16].ToString();
                  Session["UserPrid"]=dr[17].ToString();
                  Session["Cost"]=dr[18].ToString();
                  Session["DateSubmitted"]=dr[19].ToString();
                }

                dr.Close();
                conn.Close();
                Response.Redirect("Update.aspx");
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //finally
            //{
            //    //Do Nothing
            //}
        }


        #endregion
    }
}
