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

public partial class SelfEstimation : System.Web.UI.Page
{
    int iTotalItems;
    public string[] sItemNames;
    public int[] iItemId;
    public string[] sItemId;
    public int[] iItemCost;
    
    ArrayList aItemId = new ArrayList();
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            iTotalItems = 0;
            iItemCost = new int[30];
            //iItemUnits = new int[50];
                       
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ////int lstIIS = chklstIIS.Items.Count;
        ////int lstJ2EE = cblJ2EE.Items.Count;
        ////int lstCitrix = cblCitrix.Items.Count;
        ////int lstOracle = cblOracle.Items.Count;
        ////int lstSQL = cblSQL.Items.Count;
        //int i;
        //int iUnits;
        //int iCost;

        ////COST FOR IIS
        //iUnits = Convert.ToInt32(txtPnlIIS.Text);
        //int iIISCost = 0;
        //for (i = 0; i < lstIIS; i++)
        //{
        //    if (chklstIIS.Items[i].Selected)
        //    {iIISCost = iIISCost + Convert.ToInt32(chklstIIS.Items[i].Value);}

        //}
        //iIISCost = iIISCost * iUnits;

        ////COST FOR Citrix
        //iUnits = Convert.ToInt32(txtCitrix.Text);
        //int iCitrixCost = 0;
        //for (i = 0; i < lstCitrix; i++)
        //{
        //    if (cblCitrix.Items[i].Selected)
        //    { iCitrixCost = iCitrixCost + Convert.ToInt32(cblCitrix.Items[i].Value); }

        //}
        //iCitrixCost = iCitrixCost * iUnits;

        ////COST FOR J2EE
        //iUnits = Convert.ToInt32(txtPnlJ2EE.Text);
        //int iJ2EECost = 0;
        //for (i = 0; i < lstJ2EE; i++)
        //{
        //    if (cblJ2EE.Items[i].Selected)
        //    { iJ2EECost = iJ2EECost + Convert.ToInt32(cblJ2EE.Items[i].Value); }

        //}
        //iJ2EECost = iJ2EECost * iUnits;

        ////COST FOR SQL
        //iUnits = Convert.ToInt32(txtSQL.Text);
        //int iSQLCost = 0;
        //for (i = 0; i < lstSQL; i++)
        //{
        //    if (cblSQL.Items[i].Selected)
        //    { iSQLCost = iSQLCost + Convert.ToInt32(cblSQL.Items[i].Value); }

        //}
        //iSQLCost = iSQLCost * iUnits;

        ////COST FOR ORACLE
        //iUnits = Convert.ToInt32(txtpnlOracle.Text);
        //int iOracleCost = 0;
        //for (i = 0; i < lstOracle; i++)
        //{
        //    if (cblOracle.Items[i].Selected)
        //    { iOracleCost = iOracleCost + Convert.ToInt32(cblOracle.Items[i].Value); }
        //}
        //iOracleCost = iOracleCost * iUnits;

        //iCost = iIISCost + iCitrixCost + iJ2EECost + iSQLCost + iOracleCost;
        //lblCost.Text = "$" + iCost.ToString();
        //lblCost.Text = sItemId[0].ToString();

        //============================//

        int[] iItemUnits = new int[40];
        //Clear Earlier Info
        aItemId.Clear();

        if (chkIIS1.Checked == true)
        { aItemId.Add("chkIIS1"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS1.Text); iTotalItems++; }
        if (chkIIS2.Checked == true)
        { aItemId.Add("chkIIS2"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS2.Text); iTotalItems++; }
        if (chkIIS3.Checked == true)
        { aItemId.Add("chkIIS3"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS3.Text); iTotalItems++; }
        if (chkIIS4.Checked == true)
        { aItemId.Add("chkIIS4"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS4.Text); iTotalItems++; }
        if (chkIIS5.Checked == true)
        { aItemId.Add("chkIIS5"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS5.Text); iTotalItems++; }
        if (chkIIS6.Checked == true)
        { aItemId.Add("chkIIS6"); iItemUnits[iTotalItems] = Convert.ToInt32(txtIIS6.Text); iTotalItems++; }

        string s = "";
        foreach (Object obj in aItemId)
        { s = String.Concat(s, ",", obj.ToString()); }
        lblCost.Text = s.ToString();
        //iItemUnits[0] = 55;
        //lblCost.Text = iItemUnits[0].ToString();

    }

    protected void chkIIS1_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS1.Checked == true)
        {
            txtIIS1.Enabled = true;
            //aItemId.Add(chkIIS1.ID.ToString());
            //sItemId[0] = chkIIS1.ID.ToString();
            //iTotalItems++;
        }
        else
        {
            //aItemId.Remove(chkIIS1.ID.ToString());
            txtIIS1.Enabled = false;
            //iTotalItems--;
        }

       
    }
    protected void chkCitrix8_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void chkIIS2_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS2.Checked == true)
        {
            txtIIS2.Enabled = true;
            //aItemId.Add(chkIIS2.ID.ToString());
            //sItemId[1] = chkIIS2.ID.ToString();
            //iTotalItems = iTotalItems + 1;
        }
        else
        {
            //aItemId.Remove(chkIIS2.ID.ToString());
            txtIIS2.Enabled = false;
            //iTotalItems--;
        }
    }
    protected void chkIIS3_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS3.Checked == true)
        {
            txtIIS3.Enabled = true;
            //aItemId.Add(chkIIS3.ID.ToString());
            //sItemId[iTotalItems] = chkIIS3.ID.ToString();
            //iTotalItems = iTotalItems + 1;
        }
        else
        {
            //aItemId.Remove(chkIIS3.ID.ToString());
            txtIIS3.Enabled = false;
            //iTotalItems--;
        }
    }
    protected void chkIIS4_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS4.Checked == true)
        {
            txtIIS4.Enabled = true;
            //aItemId.Add(chkIIS4.ID.ToString());
            //sItemId[iTotalItems] = chkIIS4.ID.ToString();
            //iTotalItems = iTotalItems + 1;
        }
        else
        {
            //aItemId.Remove(chkIIS4.ID.ToString());
            txtIIS4.Enabled = false;
            //iTotalItems--;
        }
    }
    protected void chkIIS5_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS5.Checked == true)
        {
            txtIIS5.Enabled = true;
            //aItemId.Add(chkIIS5.ID.ToString());
            //sItemId[iTotalItems] = chkIIS5.ID.ToString();
            //iTotalItems = iTotalItems + 1;
        }
        else
        {
            //aItemId.Remove(chkIIS5.ID.ToString());
            txtIIS5.Enabled = false;
            //iTotalItems--;
        }
    }
    protected void chkIIS6_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIIS6.Checked == true)
        {
            txtIIS6.Enabled = true;
            //aItemId.Add(chkIIS6.ID.ToString());
            //sItemId[iTotalItems] = chkIIS6.ID.ToString();
            //iTotalItems = iTotalItems + 1;
        }
        else
        {
            //aItemId.Remove(chkIIS6.ID.ToString());
            txtIIS6.Enabled = false;
            //iTotalItems--;
        }
    }
}
