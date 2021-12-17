using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication4
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        common objdb = new common();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                GetDepartment();
            }
           
        }
        protected void btnUpdate_Click(object sender, EventArgs e)

        {
            if (btnUpdate.Text == "Submit")
            {
                objdb.ByProcedure("[dbo].[sp_reg]"
                             , new string[] { "flag", "UserName", "EmailID", "Password", "ConfirmPassword", "DepartmentId " }
                             , new string[] { "1", username.Text.Trim(), EmailID.Text.Trim(), TextBox2.Text.Trim(), TextBox3.Text.Trim(),ddls_department.SelectedValue }, "dataset");

               
            }

            if (btnUpdate.Text == "Update")
            {
                objdb.ByProcedure("[dbo].[sp_reg]"
                              , new string[] { "flag", "UserName", "EmailID", "Password", "ConfirmPassword", "DepartmentId","UserId" }
                              , new string[] { "3", username.Text.Trim(), EmailID.Text.Trim(), TextBox2.Text.Trim(), TextBox3.Text.Trim(), ddls_department.SelectedValue,ViewState["Emp_Id"].ToString() }, "dataset");
            }
          

            FillGrid();
            username.Text = "";
            EmailID.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox1.Text = "";
            btnUpdate.Text = "Submit";
        }

       

        protected void Button3_Click(object sender, EventArgs e)
        {
           

        }
        
     
        protected void FillGrid()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            ds = null;
            ds = objdb.ByProcedure("sp_reg"
                                 , new string[] { "flag" }
                                 , new string[] { "4" }, "dataset");
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
        }

        public void GetDepartment()
        { 
        DataSet ds_departt = objdb.ByProcedure("sp_reg",
            new string[] { "flag" }, 
            new string[] { "5" }, "dataset");

            if (ds_departt.Tables[0].Rows.Count > 0)
            {
                ddls_department.DataSource = ds_departt.Tables[0];
                ddls_department.DataTextField = "DepartmentName";
                ddls_department.DataValueField = "DepartmentId";
                ddls_department.DataBind();
                ddls_department.Items.Insert(0, new ListItem("Select", "0"));
            }


        }
        protected void btndelete_Click(object sender, EventArgs e)
        { }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
           
            ds = objdb.ByProcedure("sp_reg"
            , new string[] { "flag" , "UserId" }
            , new string[] { "6", ViewState["Emp_Id"].ToString()}, "dataset");



            FillGrid();
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

            ViewState["Emp_Id"] = GridView1.SelectedDataKey.Value.ToString();
            DataSet ds1 = objdb.ByProcedure("[dbo].[sp_reg]"
                                 , new string[] { "flag", "UserId" }
                                 , new string[] { "7", ViewState["Emp_Id"].ToString()}, "dataset");

            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                username.Text = ds1.Tables[0].Rows[0]["UserName"].ToString();
                EmailID.Text = ds1.Tables[0].Rows[0]["EmailID"].ToString();
                TextBox2.Text = ds1.Tables[0].Rows[0]["Password"].ToString();

                TextBox3.Text = ds1.Tables[0].Rows[0]["ConfirmPassword"].ToString();
                ddls_department.SelectedValue= ds1.Tables[0].Rows[0]["DepartmentId"].ToString();


                btnUpdate.Text = "Update";
            }
        }

       
    }
}