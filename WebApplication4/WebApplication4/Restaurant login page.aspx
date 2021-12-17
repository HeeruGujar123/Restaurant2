<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restaurant login page.aspx.cs" Inherits="WebApplication4.Restaurant_login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant</title>
    
   
    <style>
        .login{
         
          width:400px;
          margin:0 auto;
          margin-top:250px;
         background-color:;
         

            
        }
        body{
            background-image:url(https://www.teahub.io/photos/full/171-1718121_high-resolution-restaurant-images-hd.jpg);
        }
        .form-group{
           
    font-size:30px;
    color:white;
    width:300px;
    margin-top:40px;
    margin-left:70px;
    font-size:25px;
        }
        #btnlogin{
            margin-top:100px;
            font-size:20px;
            background-color:green;
            margin-left:160px;
             
  
        }
        #txts_Username{
            margin-left:14px;
        }

        #txts_Password{
             margin-left:20px;
        }
        element.style{
            margin-left:70px;
            
        }
        
        

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="login"> 
        <asp:Label ID="LblMsg" class="danger" runat="server" ForeColor="Red" ></asp:Label>
        <div class="col-md-4">
                                <div class="form-group">
                                    <label >  Username </label>
                                    <asp:TextBox ID="txts_Username" CssClass="form-control" runat="server" placeholder="Enter Username." autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                                </div>
                            </div>

    <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txts_Password" CssClass="form-control" runat="server" placeholder="Enter Password." TextMode ="Password" autocomplete="off" ClientIDMode="Static" MaxLength="10" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox>
                                </div>
                            </div>
         <asp:Button ID="btnlogin" runat="server" Text="LOGIN" CssClass="btn btn-primary btn-lg" OnClick="btnlogin_Click" OnClientClick="return validateFields();" />
   </div>
    </form>
</body>
</html>

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
                if (document.getElementById('<%=btnlogin.ClientID%>').value.trim() == "Submit1") {
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

