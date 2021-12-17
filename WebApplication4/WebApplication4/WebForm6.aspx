<%@ Page Title="" Language="C#" MasterPageFile="~/ms.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="WebApplication4.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
      <div>
            
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="username" placeholder="Enter Username" runat="server" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <asp:Button ID="btnsubmit1" runat="server" Text="Submit1" CssClass="btn btn-primary btn-lg"  OnClientClick="return validateFields();" />
                
        </div>
  
    <script>
       
    

        function validateFields() {
            var msg = "";

            if (document.getElementById('<%=username.ClientID%>').value.trim() == "") {
                msg = msg + "Enter User Name. \n";
            }

           
           
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnsubmit1.ClientID%>').value.trim() == "Submit1") {
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

