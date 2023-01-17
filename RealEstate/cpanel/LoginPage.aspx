<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="RealEstate.cpanel.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <link href="css/animate.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>

    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);

        function validateForm() {
            if (document.getElementById('<%=txtUserName.ClientID%>').value == "") {
                document.getElementById("lblUserName").style.display = "block";
                document.getElementById('<%=txtUserName.ClientID%>').focus();
                return false;
            }

            if (document.getElementById('<%=txtPassword.ClientID%>').value == "") {
                document.getElementById("lblPassword").style.display = "block";
                document.getElementById('<%=txtPassword.ClientID%>').focus();
                return false;
            }
        }

        function hideUserNamelbl() {
            alert();
            //document.getElementById("lblUserName").style.display = "none";
        }

        function hideUserNamelbl() {
            document.getElementById("lblPassword").style.display = "none";
        }

        window.onload = function () {                        
            var t = window.matchMedia('(min-width:767px) and (max-width: 992px)');            
            if (t.matches) { // If media query matches
                document.getElementById("middle-box").style.zoom = "230%"
            }
            else{
                document.getElementById("middle-box").style.zoom="100%"
            }
        }
    </script>
</head>
<body class="gray-bg">
    <form id="form1" runat="server" autocomplete="off">
        <div id="middle-box" class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <div>
                    <h1 class="logo-name">HH</h1>
                </div>
                <h3>Welcome to Hunt Home</h3>
                <p>
                    
                </p>
                <p>Login in To see Admin Panel.</p>

                <asp:Panel ID="pnlAlert" runat="server" class="" role="alert" Visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                </asp:Panel>

                <div class="m-t" role="form">
                    <div class="form-group">
                        <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username" onkeypress="hideUserNamelbl()"></asp:TextBox>                        
                        <label id="lblUserName" class="error">Please enter Username !</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password" onkeypress="hidePasswordlbl()"></asp:TextBox>                        
                        <label id="lblPassword"  class="error">Please enter Password !</label>
                    </div>                    
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary block full-width m-b" OnClientClick="return validateForm()" OnClick="btnLogin_Click"/>  

                    <a href="#"><small>Forgot password?</small></a>
                    <p class="text-muted text-center"><small>Do not have an account?</small></p>
                    <a class="btn btn-sm btn-white btn-block" href="#">Create an account</a>
                </div>
                <p class="m-t"><small>Hunt Home &copy; 2019</small> </p>
            </div>
        </div>
    </form>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
