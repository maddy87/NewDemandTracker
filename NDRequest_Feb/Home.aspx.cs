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

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region: GET THE DETAILS OF THE LOGGED IN USER 

        string sTemp = System.Web.HttpContext.Current.User.Identity.Name.ToString();
        string[] split = sTemp.Split('\\');
        string sCurrDomain = split[0];
        string sUserPrid = split[1];

        Session["User"] = sUserPrid;
        Session["Domain"] = sCurrDomain;
        lblUser.Text = "Welcome " + sUserPrid;

        #endregion


        //Admin Functionality only for Admins 
      switch(sUserPrid)
        {
            case "kljb179": break;//PurushottamRao;
            case "kbrs961": break;//SuvitSuvit;
            case "kphk504": break;//AmareshDurve;
            case "kshh119": break;//RajeshShetty;
            case "kjqd656": break;//VinodMall;
            case "knvs999": break;//AshishTongia;
            case "krsf004": break;//SanjoySinha;
            case "kmrr536": break;//MohitGoyal;
            case "kznx537": break;//SheenuGupta
            case "kshh119pa": break;//RajeshShettyPA
            case "ksrn075": break; //RiteshJain
            default:
                {

                    bAdmin.Visible = false;
                    
                    break;
                }
        }

    }
    protected void bAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void bCreateNewRequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewRequest.aspx");
    }
    protected void bTrackRequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tracking.aspx");
    }
}
