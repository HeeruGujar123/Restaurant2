using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace WebApplication4.Pages
{
    public partial class ProductRegistration : System.Web.UI.Page
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



        protected void btnaddproduct_Click(object sender, EventArgs e)
        {

            string pathname = "";
            if (FileUpload1.PostedFile != null)
            {
                string imgfile = Path.GetFileName(FileUpload1.PostedFile.FileName);
                pathname = "../images/" + Guid.NewGuid() + "-" + imgfile;
                FileUpload1.SaveAs(Server.MapPath(pathname));
            }

            int IsActive = 0;
            if (CheckBox1.Checked == true)
            {
                IsActive = 1;
            }
            if (btnaddproduct.Text == "ADD PRODUCT")
            {
                objdb.ByProcedure("sp_ProductDetail"
                             , new string[] { "flag", "ProductName", "ProductPrice", "IsActive", "ImageName" }
                             , new string[] { "1", txts_Productname.Text.Trim(), txts_Productprice.Text.Trim(), IsActive.ToString(), pathname }, "dataset");


            }

            if (btnaddproduct.Text == "Update")
            {
                objdb.ByProcedure("sp_ProductDetail"
                              , new string[] { "flag", "ProductName", "ProductPrice", "IsActive", "ProductId" }
                              , new string[] { "3", txts_Productname.Text.Trim(), txts_Productprice.Text.Trim(), CheckBox1.Text.Trim(), ViewState["Emp_Id"].ToString() }, "dataset");
            }

            FillGrid();
            txts_Productname.Text = "";
            txts_Productprice.Text = "";
            CheckBox1.Text = "";
            pathname = "";
           
            btnaddproduct.Text = "ADD PRODUCT";
        }

        protected void FillGrid()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            ds = null;
            ds = objdb.ByProcedure("sp_ProductDetail"
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
            DataSet ds1 = objdb.ByProcedure("sp_ProductDetail"
                                 , new string[] { "flag", "ProductId" }
                                 , new string[] { "5", ViewState["Emp_Id"].ToString() }, "dataset");

            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                txts_Productname.Text = ds1.Tables[0].Rows[0]["ProductName"].ToString();
                txts_Productprice.Text = ds1.Tables[0].Rows[0]["ProductPrice"].ToString();
                CheckBox1.Text = ds1.Tables[0].Rows[0]["IsActive"].ToString();

               // pathname = ds1.Tables[0].Rows[0]["Image"].ToString();


                btnaddproduct.Text = "Update";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //ViewState["Emp_Id"] = GridView1.DataKeys[e.RowIndex].Value.ToString();
            //ds = objdb.ByProcedure("sp_ProductDetail"
            //, new string[] { "flag", "ProductId" }
            //, new string[] { "4", ViewState["Emp_Id"].ToString() }, "dataset");


           
            string productId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            ds = objdb.ByProcedure("sp_ProductDetail"
                                 , new string[] { "flag", "ProductId" }
                                 , new string[] { "4", productId }, "dataset");


            FillGrid();

        }

        protected void Upload(object sender, EventArgs e)
        {
            
        }
    }
}