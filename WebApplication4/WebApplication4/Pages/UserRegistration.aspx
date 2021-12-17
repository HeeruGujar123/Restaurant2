<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/RestaurantMasterpage.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="WebApplication4.Pages.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .page-inner{
            margin:0 auto;
            border:2px solid black;
            background-color:lightcyan;
        }
        label{
            font-size:20px;
        }

        body{
           background-color:lightgray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="page-inner">
<div class="page-header" style=" font-size:50px; margin-top: 50px; text-align:center " >
<hr />
<h2><b>User Registration</b> </h2>
<hr />
</div>
       <div class="col-md-4">
                                <div class="form-group">
                                    <label >Username </label>
                                    <asp:TextBox ID="txts_Username" CssClass="form-control" runat="server" placeholder="Enter Username." autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                                </div>
                            </div>

         <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txts_Password" CssClass="form-control" runat="server" placeholder="Enter Password." TextMode ="Password" autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                                </div>
                            </div>

        <div class="col-md-4">
                                <div class="form-group">
                                     <label >IsActive </label>
                                  <asp:CheckBox ID="CheckBox1" runat="server"  />  
                                </div>
                            </div>


        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" CssClass="btn btn-primary btn-lg" OnClick="btnRegister_Click" OnClientClick="return validateFields();" />

        </div>

    <div class="col-md-12">
<h5 style="text-align:center; color:blue"><b>USER RECORD</b></h5>

     <div class="table-responsive">

            <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" DataKeyNames="UserId" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                   
                    <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true" />
                    <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                </Columns>

                
            </asp:GridView>
         </div>
        </div>

    <script>

        function validateFields() {
            var msg = "";

            if (document.getElementById('<%=txts_Username.ClientID%>').value.trim() == "") {
                 msg = msg + "Enter User Name. \n";
             }

             if (document.getElementById('<%=txts_Password.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Password. \n";
        }

       
      
           
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnRegister.ClientID%>').value.trim() == "REGISTER") {
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
