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

public partial class Confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            //Session["FirstName"] = "Rajesh";
            //Session["LastName"] = "Shetty";
            //Session["SLA"] = "10";
            //Session["Confirmation"] = "Hi "+Session["FirstName"].ToString()+" "+Session["LastName"].ToString()+" <br/><br/>" +
            //                          "     Your request details have been updated Succesfully.<br/>" +
            //                          "     You will be updated within "+Session["SLA"].ToString()+" working days with the progress of the request.<br/>" +
            //                          "     Incase of any concerns please contact <a style='color: #4C4C4C;' href='mailto:rajesh@Ikran.com' target=_blank> InFlight Team </a><br/><br/>" +
            //                          "Regards,<br/>" +
            //                          "New Demand Team<br/><br/><a style='color: #4C4C4C;' href='Home.aspx' target=_self> BACK TO HOME </a>";

            lblConfirmation.Text = Session["Confirmation"].ToString();
        }
        catch (Exception ex)
        {
            lblConfirmation.Text = "This Page seems to be broken. Please go to page <a style='color: #4C4C4C;' href='Home.aspx' target=_self>HOME</a> page and try raising a request</br> Error : '"+ex.Message+"";
        }

    }
}
