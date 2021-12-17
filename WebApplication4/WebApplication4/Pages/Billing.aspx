<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/RestaurantMasterpage.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="WebApplication4.Pages.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn{
            margin-left:50px;
            margin-top:20px;
        }

        .page-inner{
            border:2px solid black;
            background-color:aliceblue;

            width: 900px;
  border: 15px solid green;
  padding: 50px;
  margin-left:105px;
        }

        .page-header{
            
        }

        #ddls_Table{
            width:200px;
        }

        .grid{
             border:2px solid black;
             margin-top:50px;
        }
        div1{
       
        }
           

        }
        body{
            background-image:url(https://img.freepik.com/free-psd/flat-lay-free-food-service-arrangement-with-background-mock-up_23-2148421300.jpg?size=626&ext=jpg);
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">


  <div class="page-inner">
<div class="page-header" style=" font-size:50px; margin-top: 50px; text-align:center " >
<hr />
<h2><b>Billing</b> </h2>
<hr />
</div>
     

     
      <legend>PRODUCT DETAILS</legend>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Product Name <span style="color: red;">*</span></label>
                                    <asp:DropDownList ID="ddls_ProductName" runat="server" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_ProductName_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label> Price (In Rs.)<span style="color: red;">*</span></label>
                                    <asp:TextBox ID="txt_Price" CssClass="form-control" runat="server" placeholder="Enter  Price " MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);" OnTextChanged="txt_Price_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class =" col-md-3">
                                <div class ="form-group">
                                    <label>Quantity<span style ="color:red;">*</span></label>
                                    <asp:TextBox ID ="txt_Quantity" CssClass="form-control" runat="server" placeholder="Enter  Quantity " MaxLength="8" autocomplete="off" ClientIDMode="Static" onchange="GetNetPrice()" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);" OnTextChanged="txt_Quantity_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Table_No <span style="color: red;">*</span></label>
                                    <asp:DropDownList ID="ddls_Table" runat="server" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_Table_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                                </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Total (In Rs.)<span style="color: red;">*</span></label>
                                    <asp:TextBox ID="txt_Total" CssClass="form-control" runat="server" placeholder="Enter Total Price" MaxLength="8" autocomplete="off" onkeypress="return validateDec(this,event); return AvoidSpace(event);" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>

                             <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-sm btn-primary" Text="ADD" OnClientClick="return validateAddFields();" OnClick="btnAdd_Click" />
                                
                                
                            </div>
                        </div>
                    </div>
                            </div>

      <div class ="grid">
        <div class="col-md-12">
<h5 style="text-align:center; color:blue"><b>Bill</b></h5>

         <div class="table-responsive">

            <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" DataKeyNames="TempId" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Table_No" HeaderText="Table No." />
                     <asp:BoundField DataField="Total" HeaderText="Total" />
                   
                    
                    <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                </Columns>


            </asp:GridView>
        </div>

            </div>

        </div>

       <script>
    function OnlyNumbers(event) {
        var e = event || evt; // for trans-browser compatibility
        var charCode = e.which || e.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

    function validateFields() {
        var msg = "";

        if (document.getElementById('<%=ddls_ProductName.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Product Name. \n";
            }

            if (document.getElementById('<%=txt_Price.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Product Price. \n";
        }

       
      
           
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnAdd.ClientID%>').value.trim() == "ADD") {
                     if (confirm("Do you really want to Submit Details.?")) {
                         return true;
                     }
                     else {
                         return false;
                     }
                 }
                
        }
    }
       </script>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
