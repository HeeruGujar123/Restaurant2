using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication4.Pages
{
    public partial class Billing : System.Web.UI.Page
    {
        common objdb = new common();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                GetDepartment();
                GetDepartment1();


            }
        }

        protected void ddls_ProductName_SelectedIndexChanged(object sender, EventArgs e)
        {

            //ddls_ProductName.Text = "";
            txt_Price.Text = "";
            txt_Quantity.Text = "";
            //ddls_Table.Text = "";


            if (ddls_ProductName.SelectedIndex > 0)
            {
                DataSet dsGetDetail = objdb.ByProcedure("[dbo].[sp_ProductDetail]"
                    , new string[] { "flag", "ProductId" }
                    , new string[] { "6", ddls_ProductName.SelectedValue }, "dataset");

                if (dsGetDetail != null && dsGetDetail.Tables[0].Rows.Count > 0)
                {
                    

                    txt_Price.Text = dsGetDetail.Tables[0].Rows[0]["ProductPrice"].ToString();
                   
                }
            }
        }

        protected void ddls_Table_SelectedIndexChanged(object sender,EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "ADD")
            {
                objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                             , new string[] { "flag", "ProductName", "Price", "Quantity", "Table_No", "Total" }
                             , new string[] { "1", ddls_ProductName.Text.Trim(), txt_Price.Text.Trim(), txt_Quantity.Text.Trim(), ddls_Table.Text.Trim(), txt_Total.Text.Trim() }, "dataset");


            }

            FillGrid();
            //ddls_ProductName.Text = "";
            txt_Price.Text = "";
            txt_Quantity.Text = "";
            //ddls_Table.Text = "";
            txt_Total.Text = "";

            btnAdd.Text = "ADD";
        }

        protected void FillGrid()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            ds = null;
            ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                 , new string[] { "flag" }
                                 , new string[] { "5" }, "dataset");//2
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ViewState["Emp_Id"] = GridView1.SelectedDataKey.Value.ToString();
            DataSet ds1 = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                 , new string[] { "flag", "TempId" }
                                 , new string[] { "4", ViewState["Emp_Id"].ToString() }, "dataset");

            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                ddls_ProductName.Text = ds1.Tables[0].Rows[0]["ProductName"].ToString();
                txt_Price.Text = ds1.Tables[0].Rows[0]["Price"].ToString();
                txt_Quantity.Text = ds1.Tables[0].Rows[0]["Quantity"].ToString();
                ddls_Table.Text = ds1.Tables[0].Rows[0]["Table"].ToString();
                txt_Total.Text = ds1.Tables[0].Rows[0]["Total"].ToString();




                // btnaddproduct.Text = "Update";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string productId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                 , new string[] { "flag", "TempId" }
                                 , new string[] { "3", productId }, "dataset");


            FillGrid();
        }

        public void GetDepartment()
        {
            DataSet ds_departt = objdb.ByProcedure("[dbo].[sp_ProductDetail]",//[dbo].[sp_ProductDetail]
                new string[] { "flag" },
                new string[] { "2" }, "dataset");//2

            if (ds_departt.Tables[0].Rows.Count > 0)
            {
                ddls_ProductName.DataSource = ds_departt.Tables[0];
                ddls_ProductName.DataTextField = "ProductName";
                ddls_ProductName.DataValueField = "ProductId";
                ddls_ProductName.DataBind();
                ddls_ProductName.Items.Insert(0, new ListItem("Select", "0"));
            }


        }

        public void Sum()
        {
            double Total = Convert.ToDouble((txt_Price.Text)) * Convert.ToDouble(txt_Quantity.Text);
            txt_Total.Text = Convert.ToString(Total);
        }
        protected void txt_Price_TextChanged(object sender, EventArgs e)
        {
            Sum();
        }
        protected void txt_Quantity_TextChanged(object sender, EventArgs e)
        {
            Sum();
        }


        public void GetDepartment1()
        {
            DataSet ds_departt = objdb.ByProcedure("[dbo].[sp_ProductBilling]",//[dbo].[sp_ProductDetail]
                new string[] { "flag" },
                new string[] { "6" }, "dataset");//2

            if (ds_departt.Tables[0].Rows.Count > 0)
            {
                ddls_Table.DataSource = ds_departt.Tables[0];
                ddls_Table.DataTextField = "TableNo";
                ddls_Table.DataValueField = "TableId";
                ddls_Table.DataBind();
                ddls_Table.Items.Insert(0, new ListItem("Select", "0"));
            }


        }


    }
}