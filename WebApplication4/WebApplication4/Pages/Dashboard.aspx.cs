using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;


namespace WebApplication4.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        common objdb = new common();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTable();
                RepeterData();
                //RepeterData1();
                RepeterData2();
                getTableData();


               
                foreach (RepeaterItem item in RepterDetails2.Items)
                {
                    DataSet ds1 = null;
                    Button OccupyTable = (Button)item.FindControl("btntable");
                    Label TableNumber = (Label)item.FindControl("lbl_tableid");
                    ds1 = objdb.ByProcedure("SP_ProductBilling",
                    new String[] { "flag", "TableId" },
                    new string[] { "12", TableNumber.Text }, "DataSet");
                    if (ds1 != null)
                    {
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToInt16(ds1.Tables[0].Rows[0]["Tablecount"].ToString()) > 0)
                            {
                                OccupyTable.BackColor = Color.Green;
                            }
                            else
                            {
                                OccupyTable.BackColor = Color.Red;
                            }
                        }
                        else
                        {
                            OccupyTable.BackColor = Color.Red;
                        }
                    }
                    else
                    {
                        OccupyTable.BackColor = Color.Red;
                    }
                }






            }
        }

        public void RepeterData()
        {
           ds = objdb.ByProcedure("sp_ProductDetail"
                              , new string[] { "flag" }
                              , new string[] { "2" }, "dataset");

            RepterDetails.DataSource = ds;
            
            RepterDetails.DataBind();
        }

        protected void btnorder_Click(object sender, EventArgs e)
        {
          


           

         
        }


        protected void btndelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {

        }
        protected void btnsub_Click(object sender, EventArgs e)
        {

        }
        protected void btntable_Click(object sender, EventArgs e)
        {
           

        }

        protected void ddls_Table_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        public void GetTable()
        {
            DataSet ds_productname = objdb.ByProcedure("[dbo].[sp_ProductBilling]",
            new String[] { "flag" },
            new string[] { "6" }, "DataSet");



            if (ds_productname.Tables[0].Rows.Count > 0)
            {
                DropDown.DataSource = ds_productname.Tables[0];
                DropDown.DataTextField = "TableName";
                DropDown.DataValueField = "TableId";
                DropDown.DataBind();
                DropDown.Items.Insert(0, new ListItem("Select", "0"));
            }
        }


        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //string ProductId = ((Label)e.Item.FindControl("lbl_productid")).ToString();

            switch (e.CommandName)
            {
                case "Order":
                    Label ProducId = (Label)e.Item.FindControl("lbl_productid");
                    Label ProductName = (Label)e.Item.FindControl("lbl_productname");
                    Label ProductPrice = (Label)e.Item.FindControl("lbl_productprice");
                    Label Quantity = (Label)e.Item.FindControl("lbl_quantity");
                   // Label TableId1 = (Label)e.Item.FindControl("lbl_TableId");



                    /*do whatever processing here*/
                    double ProductRate = Convert.ToDouble(ProductPrice.Text);

                    int qty = 1;

                    objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                    , new string[] { "flag", "ProductName", "Price", "Quantity","ProductId","TableId" }
                    , new string[] { "8", ProductName.Text,ProductRate.ToString(),qty.ToString(),ProducId.Text,DropDown.SelectedValue
                    }, "dataset");


                    getTableData();


                    double total = 0;
                    double Finaltotal = 0;
                    foreach (RepeaterItem item in RepterDetails1.Items)
                    {
                        Label Price = (Label)item.FindControl("lbl_productprice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");
                       

                        total = Convert.ToDouble(Price.Text) * Convert.ToDouble(Qty.Text)  ;
                        Finaltotal = Finaltotal + total;
                        lbltotalamount.Text = Convert.ToString(Finaltotal);


                    }
                    break;



            }

        }


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "Delete":
                    Label TempId = (Label)e.Item.FindControl("lbl_tempid");


                    ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                         , new string[] { "flag", "TempId" }
                                         , new string[] { "3", TempId.Text }, "dataset");

                    //RepeterData1();
                    getTableData();


                    double total = 0;
                    double Finaltotal = 0;
                    foreach (RepeaterItem item in RepterDetails1.Items)
                    {
                        Label Price = (Label)item.FindControl("lbl_productprice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");


                        total = Convert.ToDouble(Price.Text) * Convert.ToDouble(Qty.Text);
                        Finaltotal = Finaltotal + total;
                        lbltotalamount.Text = Convert.ToString(Finaltotal);


                    }

                    break;

                case "Add":
                    //int qty1 = 1;
                    Label ProducId1 = (Label)e.Item.FindControl("lbl_productid1");
                    Label Quantity1 = (Label)e.Item.FindControl("lbl_quantity");
                    Label TempId1 = (Label)e.Item.FindControl("lbl_tempid");
                    int NewQty = Convert.ToInt32(Quantity1.Text) + 1;

                    ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                   , new string[] { "flag", "Quantity", "TempId", "ProductId" }
                                  , new string[] { "7", NewQty.ToString(), TempId1.Text, ProducId1.Text }, "dataset");



                    //RepeterData1();
                    getTableData();



                    double total2 = 0;
                    double Finaltotal2 = 0;
                    foreach (RepeaterItem item in RepterDetails1.Items)
                    {
                        Label Price = (Label)item.FindControl("lbl_productprice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");


                        total2 = Convert.ToDouble(Price.Text) * Convert.ToDouble(Qty.Text);
                        Finaltotal2 = Finaltotal2 + total2;
                        lbltotalamount.Text = Convert.ToString(Finaltotal2);


                    }



                    break;

                case "Sub":

                    
                    
                        Label ProducId2 = (Label)e.Item.FindControl("lbl_productid1");
                        Label Quantity2 = (Label)e.Item.FindControl("lbl_quantity");
                        Label TempId2 = (Label)e.Item.FindControl("lbl_tempid");
                        int NewQty1 = Convert.ToInt32(Quantity2.Text) - 1;
                    if (NewQty1 >= 0)
                    {

                        ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                                   , new string[] { "flag", "Quantity", "TempId", "ProductId" }
                                  , new string[] { "7", NewQty1.ToString(), TempId2.Text, ProducId2.Text }, "dataset");



                        //RepeterData1();
                        getTableData();

                       
                    }

                    double total1 = 0;
                    double Finaltotal1 = 0;
                    foreach (RepeaterItem item in RepterDetails1.Items)
                    {
                        Label Price = (Label)item.FindControl("lbl_productprice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");


                        total1 = Convert.ToDouble(Price.Text) * Convert.ToDouble(Qty.Text);
                        Finaltotal1 = Finaltotal1 + total1;
                        lbltotalamount.Text = Convert.ToString(Finaltotal1);


                    }


                    break;

            }


        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Table":


                  
                    
                     
                    

                 

                    Label TableId = (Label)e.Item.FindControl("lbl_tableid");

                  



                    DropDown.SelectedValue = TableId.Text;

                    getTableData();

                    DataSet dstables = null;
                    Button OccupyTable = (Button)e.Item.FindControl("btntable");
                    Label TableNumber = (Label)e.Item.FindControl("lbl_tableid");
                    dstables = objdb.ByProcedure("[dbo].[sp_ProductBilling]",
                    new String[] { "flag", "TableId" },
                    new string[] { "12", TableNumber.Text }, "DataSet");
                    if (dstables != null)
                    {
                        if (dstables.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToInt16(dstables.Tables[0].Rows[0]["Tablecount"].ToString()) > 0)
                            {
                                OccupyTable.BackColor = Color.Green;
                            }
                            else
                            {
                                OccupyTable.BackColor = Color.Red;
                            }



                        }
                        else
                        {
                            OccupyTable.BackColor = Color.Red;
                        }



                    }
                    else
                    {
                        OccupyTable.BackColor = Color.Red;
                    }


                    double total = 0;
                    double Finaltotal = 0;
                    foreach (RepeaterItem item in RepterDetails1.Items)
                    {
                        Label Price = (Label)item.FindControl("lbl_productprice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");


                        total = Convert.ToDouble(Price.Text) * Convert.ToDouble(Qty.Text);
                        Finaltotal = Finaltotal + total;
                        lbltotalamount.Text = Convert.ToString(Finaltotal);


                    }



                    break;

            }
        }


        public void RepeterData1()
        {
            ds = objdb.ByProcedure("[dbo].[sp_ProductBilling]"
                               , new string[] { "flag" }
                               , new string[] { "2" }, "dataset");

            RepterDetails1.DataSource = ds;

            RepterDetails1.DataBind();
        }




       public void RepeterData2()
        {
            ds = objdb.ByProcedure("sp_ProductBilling"
                               , new string[] { "flag" }
                               , new string[] { "9" }, "dataset");

            RepterDetails2.DataSource = ds;

            RepterDetails2.DataBind();
        }

        public void getTableData()
        {
            if (DropDown.SelectedIndex != 0)
            {
                lblShowTableNo.Text = DropDown.SelectedItem.Text;
                ds = null;
                ds = objdb.ByProcedure("sp_ProductBilling"
                                   , new string[] { "flag", "TableId" }
                                   , new string[] { "11", DropDown.SelectedValue }, "dataset");

                RepterDetails1.DataSource = ds;

                RepterDetails1.DataBind();
            }
        }



    }

}