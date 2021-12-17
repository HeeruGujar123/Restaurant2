using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication4.Pages
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        common objdb = new common();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillGrid();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int IsActive = 0;
            if (CheckBox1.Checked == true)
            {
                IsActive = 1;
            }
            if (btnRegister.Text == "REGISTER")
            {
                objdb.ByProcedure("SP_UserRegistration"
                             , new string[] { "flag", "Username", "Password", "IsActive" }
                             , new string[] { "1", txts_Username.Text.Trim(), txts_Password.Text.Trim(), IsActive.ToString() }, "dataset");


            }

            if (btnRegister.Text == "Update")
            {
                objdb.ByProcedure("SP_UserRegistration"
                              , new string[] { "flag", "Username", "Password", "IsActive", "UserId" }
                              , new string[] { "3", txts_Username.Text.Trim(), txts_Password.Text.Trim(), CheckBox1.Text.Trim(), ViewState["Emp_Id"].ToString() }, "dataset");
            }

            FillGrid();
            txts_Username.Text = "";
            txts_Password.Text = "";
            CheckBox1.Text = "";

            btnRegister.Text = "REGISTER";
        }

        protected void FillGrid()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            ds = null;
            ds = objdb.ByProcedure("SP_UserRegistration"
                                 , new string[] { "flag" }
                                 , new string[] { "2" }, "dataset");
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ViewState["Emp_Id"] = GridView1.SelectedDataKey.Value.ToString();
            DataSet ds1 = objdb.ByProcedure("SP_UserRegistration"
                                 , new string[] { "flag", "UserId" }
                                 , new string[] { "5", ViewState["Emp_Id"].ToString() }, "dataset");

            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                txts_Username.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
                txts_Password.Text = ds1.Tables[0].Rows[0]["Password"].ToString();
                CheckBox1.Text = ds1.Tables[0].Rows[0]["IsActive"].ToString();




                btnRegister.Text = "Update";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string productId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            ds = objdb.ByProcedure("SP_UserRegistration"
                                 , new string[] { "flag", "UserId" }
                                 , new string[] { "4", productId }, "dataset");


            FillGrid();
        }
    }
}