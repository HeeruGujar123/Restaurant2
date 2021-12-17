
<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/RestaurantMasterpage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication4.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .col-md-3{
           width:500px; 
        }
       
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <div class="page-inner">
        <div class="page-header" style="margin-top: 50px;">
            <h1 style="text-align: center; font-style: inherit;"><b>Hotel Devraj</b> </h1>
            <h3 style="text-align: center;">Welcome Hotel Devraj</h3>
            <h4 style="text-align: center;">"Good Food,Good health"</h4>
            <%--<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://images.unsplash.com/photo-1513440610350-9e3afbddcecd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8aG90ZWwsZHJpbmt8fHx8fHwxNjM3MjE2Mjg5&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1000" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.unsplash.com/photo-1629438707486-1504be1b1eb7?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8bmF0dXJlLHJlc3RhdXJhbnR8fHx8fHwxNjM3MjE2MDI4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1000" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.unsplash.com/photo-1519690889869-e705e59f72e1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8bmF0dXJlLGhvdGVsfHx8fHx8MTYzNzIxNjIxOA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1000" class="d-block w-100" alt="..." />
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>--%>


           <%-- For Order list--%>
            <div class="card" style="width: 65rem;  height:25rem;">
  <div class="card-body">
<h5 class="card-title" style ="font-size:30px;">Order list</h5>

      
        <strong><h5 style ="text-align:center; font-size:30px; margin-top:-55px;"> Table No - <asp:Label runat="server" ID="lblShowTableNo"></asp:Label></h5></strong>
       <strong><h5 style ="text-align:right; font-size:30px; margin-top:-50px;"> Total Amount - <asp:Label runat="server" ID="lbltotalamount"></asp:Label></h5></strong>


      <div class ="row">
      <asp:Repeater ID="RepterDetails1" runat="server" OnItemCommand="Repeater1_ItemCommand">
          <ItemTemplate>

           
               <div class="col-md-3" style="color:blue; border-radius: 25px; border:2px solid black ;  width:500px;  text-align:center;   background-color:#FF6F61;">
              <h5 class="card-title" style="font-size: 17px; "><b>
              <asp:Label ID="lbl_productname"  runat ="server" Text='<%# (Eval("ProductName").ToString()) %>'></asp:Label></b></h5>

                                          
                            <p class="card-text" style="font-size: 12px;"><strong>          

                                        <asp:Label ID="lbl_productprice" runat="server" Text='<%# (Eval("Price").ToString()) %>'></asp:Label> <asp:Label>Rs/-</asp:Label></strong></p>
                   

                    <strong>

                                        <asp:Label ID="lbl_tempid" Visible ="false" runat="server" Text='<%# (Eval("TempId").ToString()) %>'></asp:Label></strong>

                    <strong>

                                        <asp:Label ID="lbl_productid1" Visible ="false" runat="server" Text='<%# (Eval("ProductId").ToString()) %>'></asp:Label></strong>


                  


                   <strong>
                      

                                        <asp:Label ID="lbl_quantity"  runat="server" Text='<%# (Eval("Quantity").ToString()) %>'></asp:Label></strong>

                    <div class ="Q" style="margin-bottom:0px;">
                   <asp:Label>Quantity</asp:Label>
                       </div>
                   

                   <asp:Button ID="btndelete" runat="server" Text="DELETE" CommandName="Delete"  CssClass="btn btn-primary btn-sm" OnClick="btndelete_Click"  OnClientClick="return validateFields();" />

                    <asp:Button ID="btnadd" runat="server" Text="+" CommandName="Add" CssClass="btn btn-primary btn-sm" OnClick="btnadd_Click"  OnClientClick="return validateFields();" />

                    <asp:Button ID="btnsub" runat="server" Text="-" CommandName="Sub" CssClass="btn btn-primary btn-sm" OnClick="btnsub_Click"  OnClientClick="return validateFields();" />
                   </div>

          </ItemTemplate>
      </asp:Repeater>
          </div>

         




    
  </div>
        </div>
    <br />

             <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
   </div>
   
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>




            <div class ="row" style ="margin-bottom:50px;">
            
            <div class="col-md-3">
                <div class="form-group">
                    <label>Name </label>
                    <asp:TextBox ID="txts_Name" CssClass="form-control" runat="server" placeholder="Enter your name." autocomplete="off" ClientIDMode="Static" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>EmailId </label>
                    <asp:TextBox ID="txts_EmailId" CssClass="form-control" runat="server" placeholder="Enter EmailId." autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                </div>
            </div>


            <div class="col-md-3">
                <div class="form-group">
                    <label>PhoneNo </label>
                    <asp:TextBox ID="txts_PhoneNo" CssClass="form-control" runat="server" placeholder="Enter phone no." autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                </div>
                </div>

               <div class="col-md-3">
                    <div class="form-group">
                    <label>Table <span style="color: red;">*</span></label>
                     <asp:DropDownList ID="DropDown" runat="server" Style="width:100px;" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddls_Table_SelectedIndexChanged" AutoPostBack="true">
                     </asp:DropDownList>



              </div>
                   </div>

            
                </div>

           </ContentTemplate>
   </asp:UpdatePanel>

                
           <%-- For table--%>

            <div class ="row">
                <asp:Repeater ID ="RepterDetails2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                    <ItemTemplate>
                         <div class="col-md-2">

                              

                                 <strong>

                                        <asp:Label ID="lbl_tableid" Visible ="false" runat="server" Text='<%# (Eval("TableId").ToString()) %>'></asp:Label></strong>    
                             
                             

                             <asp:Button ID="btntable" style="margin-bottom:40px;" runat="server" CommandName="Table" CssClass="btn  btn-sm "  Text='<%# (Eval("TableName").ToString()) %>' OnClick="btntable_Click" CommandArgument='<%# Eval("TableName") %>' OnClientClick="return validateFields();" />
                             </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>




          <%--  for Item list--%>

            <div class="alert alert-warning" role="alert" style="width: 1050px;">
                <b style="font-size: 25px;">Item List</b>
            </div>
            <div class="row">
                    <asp:Repeater ID="RepterDetails" runat="server" OnItemCommand="Repeater_ItemCommand">
                        <ItemTemplate>
               <div class="col-md-3">
                           
                            <div class="card" style="width: 12rem; height: 300px;">
                                <img src='<%# Eval("ImageName") %>' />
                                 <div class="card-body">
                                  <h5 class="card-title" style="font-size: 17px;"><b>

                                        
                                 <asp:Label ID="lbl_productname" runat="server" Text='<%# (Eval("ProductName").ToString()) %>'></asp:Label></b></h5>

                                          
                                    <p class="card-text" style="font-size: 12px;"><strong>

                                        <asp:Label ID="lbl_productprice" runat="server" Text='<%# (Eval("ProductPrice").ToString()) %>'></asp:Label></strong></p>
                                    <strong>

                                        <asp:Label ID="lbl_productid" Visible ="false" runat="server" Text='<%# (Eval("ProductId").ToString()) %>'></asp:Label></strong>

                                    
                                          
                                    <asp:Button ID="btnorder" runat="server" Text="ORDER" CommandName="Order" CssClass="btn btn-primary " OnClick="btnorder_Click"  OnClientClick="return validateFields();" />
                                </div>
                            </div>
                   </div>
                       </ItemTemplate>
                                
                    </asp:Repeater>

               
                </div>




              <%--  <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1590947132387-155cc02f3212?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=100&ixid=MnwxfDB8MXxyYW5kb218MHx8cGl6emF8fHx8fHwxNjM3MjM0MTEw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=100" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Pizza</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-300Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>


                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1625938398962-a5fe49775142?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8cGFzdGEscGxhdGV8fHx8fHwxNjM3MjE5MDQ2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Pasta</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-180Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1585171955432-a5c990c1169d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8bnVkZWxzfHx8fHx8MTYzNzIyMDA0OA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Nudels</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-160Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1626776879201-56be4e1f549b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8bW9tb3N8fHx8fHwxNjM3MjIwMTU1&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Momos</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-240Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1572590016064-3e6ae9c04947?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8ZHJpbmt8fHx8fHwxNjM3MjI0MTI3&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Juice</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-105Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1485965958538-edf6bc65d47c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29mZmVlLG11Z3x8fHx8fDE2MzcyMjU1Njk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Coffee</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-49Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1517244683847-7456b63c5969?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8aXRhbGlhbixkaXNofHx8fHx8MTYzNzIyNDk0MA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Gajar Halwa</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-250Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1626810392596-b02f099af7f2?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8bW9ja3RhaWx8fHx8fHwxNjM3MjI0NzEy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Mocktail</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-125Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 12rem; height: 300px;">
                        <img src="https://images.unsplash.com/photo-1516684163977-84cc7de8c7c8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8ZHJpbmssY29sZHx8fHx8fDE2MzcyMzU5MzM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 17px;"><b>Berry</b></h5>
                            <p class="card-text" style="font-size: 12px;"><strong>Price-105Rs/-</strong></p>
                            <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1509448613959-44d527dd5d86?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8bW9oaXRvfHx8fHx8MTYzNzIzNTc1Mg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Green</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-135Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1414450397866-85f90db48714?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29rdGFpbCxkcmlua3x8fHx8fDE2MzcyMzU2NjY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Lemon</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-100Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1598762888352-44d170fb67ed?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8cmlzZSxkaXNofHx8fHx8MTYzNzMyMzg2OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Cake</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-100Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1559280247-8fa41750ca29?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8bW9ja3RhaWx8fHx8fHwxNjM3MzIzNjIz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Soft drink</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-60Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8YnJlYWR8fHx8fHwxNjM3MzIzNTIy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Bread</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-30Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card" style="width: 12rem; height: 300px;">
                            <img src="https://images.unsplash.com/photo-1525480122447-64809d765ec4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29mZmVlfHx8fHx8MTYzNzMyMzQ0Mg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 17px;"><b>Coffee</b></h5>
                                <p class="card-text" style="font-size: 12px;"><strong>Price-70Rs/-</strong></p>
                                <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                            </div>
                        </div>


                        <div class="col-md-3">
                            <div class="card" style="width: 12rem; height: 300px;">
                                <img src="https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8aW5kaWFuLGRpc2h8fHx8fHwxNjM3MzIzMzYy&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 17px;"><b>Rice</b></h5>
                                    <p class="card-text" style="font-size: 12px;"><strong>Price-200Rs/-</strong></p>
                                    <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card" style="width: 12rem; height: 300px;">
                                <img src="https://images.unsplash.com/photo-1608070734587-6d37a9f258b8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29va2llfHx8fHx8MTYzNzMyMzI1Nw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 17px;"><b>Cokies</b></h5>
                                    <p class="card-text" style="font-size: 12px;"><strong>Price-105Rs/-</strong></p>
                                    <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card" style="width: 12rem; height: 300px;">
                                <img src="https://images.unsplash.com/photo-1518543656260-7fbe212ddf03?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8Y29va2llc3x8fHx8fDE2MzczMjMxODU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 17px;"><b>Tea</b></h5>
                                    <p class="card-text" style="font-size: 12px;"><strong>Price-60Rs/-</strong></p>
                                    <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card" style="width: 12rem; height: 300px;">
                                <img src="https://images.unsplash.com/photo-1622988621206-8f5f686449b9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=170&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVhfHx8fHx8MTYzNzMyMzA5OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=170" class="card-img-top" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 17px;"><b>Coke</b></h5>
                                    <p class="card-text" style="font-size: 12px;"><strong>Price-30Rs/-</strong></p>
                                    <a href="#" class="btn btn-primary" style="margin-top: -10px;">Order</a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <%--code for side bar--%>
                <section class="">
                    <!-- Footer -->
                    <footer class="text-center text-white" style="background-color: #0a4275;">
                        <!-- Grid container -->
                        <div class="container p-4 pb-0">
                            <!-- Section: CTA -->
                            <section class="" style="height: 20px;">
                                <p class="d-flex justify-content-center align-items-center">
                                    <span class="me-3">Register for free</span>
                                    <button type="button" class="btn btn-outline-light btn-rounded btn-sm">
                                        Sign up!
                                    </button>
                                </p>
                            </section>
                            <!-- Section: CTA -->
                        </div>
                        <!-- Grid container -->
                        <!-- Copyright -->
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            Please Visit:
                            <a class="text-white" href="https://mdbootstrap.com/">HotelDevraj.com
                        </div>
                        <!-- Copyright -->
                    </footer>
                    <!-- Footer -->
                </section>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
