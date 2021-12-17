<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationTest.aspx.cs" Inherits="WebApplication4.ValidationTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/atlantis.css">
    <link rel="stylesheet" href="../assets/css/demo.css">
    <link href="../assets/css/fonts.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TxtName" runat="server" ClientIDMode="Static"></asp:TextBox>
             <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-sm btn-primary" Text="SUBMIT" OnClientClick="return validateFields();" />
        </div>
    </form>
</body>
</html>
   <script>

       function validateDec(el, evt) {
           var charCode = (evt.which) ? evt.which : event.keyCode;
           var number = el.value.split('.');
           if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
               return false;
           }
           //just one dot (thanks ddlab)
           if (number.length > 1 && charCode == 46) {
               return false;
           }
           //get the carat position
           var caratPos = getSelectionStart(el);
           var dotPos = el.value.indexOf(".");
           if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
               return false;
           }
           return true;
       }

       function OnlyNumbers(event) {
           var e = event || evt; // for trans-browser compatibility
           var charCode = e.which || e.keyCode;
           if (charCode > 31 && (charCode < 48 || charCode > 57))
               return false;

           return true;
       }

       function validateFields() {
           var msg = "";

           if (document.getElementById('<%=TxtName.ClientID%>').value.trim() == "") {
                msg = msg + "Enter Product Name. \n";
            }

         
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnSubmit.ClientID%>').value.trim() == "SUBMIT") {
                     if (confirm("Do you really want to Submit Details.?")) {
                         return true;
                     }
                     else {
                         return false;
                     }
                 }
                 else if (document.getElementById('<%=btnSubmit.ClientID%>').value.trim() == "MODIFY") {
                   if (confirm("Do you really want to Modify Details.?")) {
                       return true;
                   }
                   else {
                       return false;
                   }

               }
           }
       }
   </script>
