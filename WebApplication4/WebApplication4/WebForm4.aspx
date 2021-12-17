<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication4.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/atlantis.css">
    <link rel="stylesheet" href="../assets/css/demo.css">
    <link href="../assets/css/fonts.min.css" rel="stylesheet" /> 
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            ;
        }

        .auto-style2 {
            width: 276px;
        }

        .auto-style3 {
            width: 276px;
            height: 23px;
        }

        .auto-style4 {
            height: 23px;
        }

        body {
            background-color: #f0f8ff;
            font-family: Verdana (sans-serif);
            font-size: 200%;
            border: 2px solid black;
            color: black;
        }

        .div1 {
            width: 40%;
            margin: 0 auto;
        }

        #ddls_department {
            width: 20%;
            margin: 0 auto;
            margin-bottom: 70px;
            margin-left: 30px;
            margin-top: 70px;
            margin-right: 50px;
        }

        #username {
            margin-bottom: 20px;
        }

        #EmailID {
            margin-bottom: 20px;
        }

        #TextBox2 {
            margin-bottom: 20px;
        }

        #TextBox3 {
            margin-bottom: 20px;
        }

        #TextBox1 {
            margin-bottom: 20px;
        }

        #Label4 {
            margin-top: 70px;
        }

        #Button1 {
            margin-top: 70px;
        }

        #Button2 {
            margin-top: 70px;
        }

        #Button3 {
            margin-top: 70px;
        }

        .drp {
            align-items: flex-end;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="username" placeholder="Enter Username" runat="server" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>

    
                    <td>
                        <asp:TextBox ID="EmailID" placeholder="Enter EmailID" runat="server" TextMode="Email"  ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" placeholder="Enter Password" runat="server" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" placeholder="Enter Password again" runat="server" onkeypress="return OnlyNumbers(event); return AvoidSpace(event);"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" placeholder="Enter address" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Department"></asp:Label></td>
                    <td style="position: relative; text-align: left;">

                        <asp:DropDownList ID="ddls_department" runat="server" CssClass="drp" AutoPostBack="true">
                        </asp:DropDownList></td>
                </tr>




            </table>
            <asp:Label ID="message" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </div>


        <asp:Button ID="btnUpdate" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="btnUpdate_Click" OnClientClick="return validateFields();" />
        <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-primary btn-lg" OnClick="btndelete_Click"  OnClientClick="return validateFields();"/>



        <div class="table-responsive">

            <asp:GridView runat="server" ID="GridView1" CssClass="table table-hover table-bordered no-margin pagination-ys" ClientIDMode="Static" AllowPaging="false" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" DataKeyNames="UserId" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="EmailID" HeaderText="Email ID" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" />
                    <%--  <asp:BoundField DataField="Password" HeaderText="Password" />
                                 <asp:BoundField DataField="ConfirmPassword" HeaderText="Confirm Password" />--%>
                    <%-- <asp:BoundField DataField="DepartmentName " HeaderText="Department Name "/>--%>
                    <%--  <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true"  />
                                <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />--%>
                    <asp:CommandField SelectText="<i class='fas fa-edit'></i>" HeaderText="Modify" ShowSelectButton="true" />
                    <asp:CommandField DeleteText="<i class='fa fa-trash-alt' style='color:red'></i>" HeaderText="Delete" ShowDeleteButton="true" />
                </Columns>


            </asp:GridView>
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

        if (document.getElementById('<%=username.ClientID%>').value.trim() == "") {
                msg = msg + "Enter USER Name. \n";
            }

            if (document.getElementById('<%=EmailID.ClientID%>').value.trim() == "") {
                msg = msg + "Enter EmailId. \n";
        }

        if (document.getElementById('<%=TextBox2.ClientID%>').value.trim() == "") {
            msg = msg + "Enter Password. \n";
        }

        if (document.getElementById('<%=TextBox1.ClientID%>').value.trim() == "") {
            msg = msg + "Enter Address. \n";
        }
      
           
            if (msg != "") {
                alert(msg);
                return false
            }
            else {
                if (document.getElementById('<%=btnUpdate.ClientID%>').value.trim() == "SUBMIT") {
                     if (confirm("Do you really want to Submit Details.?")) {
                         return true;
                     }
                     else {
                         return false;
                     }
                 }
                 else if (document.getElementById('<%=btnUpdate.ClientID%>').value.trim() == "MODIFY") {
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

