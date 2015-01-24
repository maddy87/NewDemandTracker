using System;
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

public partial class _Default : System.Web.UI.Page 
{

    
    protected void Page_Load(object sender, EventArgs e)
    {
        #region: RETRIEVING DATA USING OLEDB FROM ACCESS DB

            //OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.mdb;");
            //OleDbCommand cmd = new OleDbCommand();
            //cmd.CommandText = "select AZID,ClarityID,ProjectName,FunctionalPortFolio,InfyRequestorName as Requestor from NDRequest";//SOWEstimate from NDRequest";
            ////cmd.CommandText = "select * from NDRequest";
            //OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.SelectCommand = cmd;
            //da.SelectCommand.Connection = oConn;
            //da.Fill(dt);
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
            
        
            //OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\NDRequest.mdb;");
            //OleDbCommand oCmd = new OleDbCommand("select AZID,ClarityID,ProjectName,FunctionalPortFolio,Requestor as InfyRequestor,SOWEstimate from NDRequest");
            //OleDbDataAdapter da = new OleDbDataAdapter(oCmd);
            //DataTable dt = new DataTable();
            //da.SelectCommand = oCmd;
            //da.SelectCommand.Connection = oConn;
            //da.Fill(dt);

       #endregion


        #region: RETRIEVING DATA USIING SQL SERVER WHICH HAS CAUSED A LOT OF PAIN 

            //OleDbConnection oConn = new OleDbConnection("Provider=SQLOLEDB;Data Source=USSBBAMAAS02\\MAPS;Initial Catalog=NDRequest;User ID=ndrequest_user;Password=ndrequest_user;Persist Security Info=True");
            //OleDbCommand cmd = new OleDbCommand();
            //cmd.CommandText = "select AZID,ProjectName from NDRequest";
            //OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.SelectCommand = cmd;
            //da.SelectCommand.Connection = oConn;
            //da.Fill(dt);
            //GridView1.DataSource = dt;
            //GridView1.DataBind();


        #endregion
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script text=javascript>alert('Hi')</script>");
    }
}
