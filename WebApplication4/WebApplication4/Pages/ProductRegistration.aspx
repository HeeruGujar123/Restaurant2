<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/RestaurantMasterpage.Master" AutoEventWireup="true" CodeBehind="ProductRegistration.aspx.cs" Inherits="WebApplication4.Pages.ProductRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-inner{
          
             margin:0 auto;
            border:2px solid black;
            background-color:lightcyan;

            width: 900px;
  border: 15px solid #6861ce;
  padding: 50px;
  
        }

        body{
            
            background-image:url(https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80);
        }
        
        #btnaddproduct{
             font-size:13px;
             
        }

        .form-group label{
            font-size:20px;
        }
        .btn-lg{

            margin-top:20px;
        }
      
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="page-inner">
<div class="page-header" style=" font-size:50px; margin-top: 50px; text-align:center " >
<hr />
<h2><b>Product Details</b> </h2>
<hr />
</div>
       <div class="col-md-4">
                                <div class="form-group">
                                    <label >Product Name </label>
                                    <asp:TextBox ID="txts_Productname" CssClass="form-control" runat="server" placeholder="Enter Product name." autocomplete="off" ClientIDMode="Static" MaxLength="10" ></asp:TextBox>
                                </div>
                            </div>
 <div class="col-md-4">
                                <div class="form-group">
                                    <label >Product Price </label>
                                    <asp:TextBox ID="txts_Productprice" CssClass="form-control" runat="server" placeholder="Enter Product price." autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                                </div>
                            </div>


        <div class="col-md-4">
                                <div class="form-group">
                                     <label >IsActive </label>
                                  <asp:CheckBox ID="CheckBox1" runat="server"  />  
                                </div>
                            </div>


        <div class="col-md-3">
<asp:Label Text="Upload Image" runat="server" class="prate" />
<asp:FileUpload ID="FileUpload1" runat="server" />


<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />




</div>

        <asp:Button ID="btnaddproduct" runat="server" Text="ADD PRODUCT" CssClass="btn btn-primary btn-lg" OnClick="btnaddproduct_Click" OnClientClick="return validateFields();" />

        <div class="col-md-12">
<h5 style="text-align:center; color:blue"><b>Product List</b></h5>

         <div class="table-responsive">

            <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" DataKeyNames="ProductId" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" />
                    <asp:BoundField DataField="IsActive" HeaderText="IsActive" />

                    <asp:BoundField DataField="ImageName" HeaderText="FileName" SortExpression="FileName" />

                    <asp:TemplateField HeaderText="Photo">
<ItemTemplate>
<asp:Image ID="Image1" runat="server" Height="122px"
Width="148px" ImageUrl='<%# Eval("ImageName") %>' />
<br />
</ItemTemplate>
<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="300px" />
</asp:TemplateField>
                    
                   

                   
                    <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true" />
                    <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                </Columns>


            </asp:GridView>
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

        if (document.getElementById('<%=txts_Productname.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Product Name. \n";
            }

            if (document.getElementById('<%=txts_Productprice.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Product Price. \n";
        }

       
      
           
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnaddproduct.ClientID%>').value.trim() == "ADD PRODUCT") {
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

