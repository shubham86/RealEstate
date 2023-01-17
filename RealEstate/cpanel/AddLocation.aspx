<%@ Page Title="Add  Location" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="AddLocation.aspx.cs" Inherits="RealEstate.cpanel.AddLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         table td {
            padding: 0 10px;
        }

        table label {
            padding-left: 7px;
        }

        @media only screen and (min-width : 770px) {
            .wrapper-content {
                width: 70%;
                margin: auto;
            }
        }

        @media only screen and (max-width : 770px) {
            table label {
                padding-left: 7px;
                font-size:10px;
            }
        }
    </style>
    <script>
        function validateForm() {
            if (document.getElementById('<%=txtLocation.ClientID%>').value == "") {
                document.getElementById("lblLocationName").style.display = "block";
                document.getElementById('<%=txtLocation.ClientID%>').focus();
                return false;
            }
        }
        
        function hideLocationlbl() {
            document.getElementById("lblClientName").style.display = "none"
        }

        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);
    </script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Add Location</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a href="ManageEnquiry.aspx">Manage Location</a>
                </li>
                <li class="active">
                    <strong>Add Location</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add Location</h5>                        
                    </div>

                    <asp:Panel ID="pnlAlert" runat="server" class="mar-t20" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:Panel>

                    <div class="ibox-content">
                        <div class="form-horizontal" style="margin-top:10px">                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Name of Location</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLocation" runat="server" class="form-control" onkeypress="hideLocationlbl()"></asp:TextBox>
                                    <label id="lblLocation" class="error">Please enter name of Location</label>
                                </div>
                            </div>      
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validateForm()" OnClick="btnSave_Click" Width="30%"/>                                    
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-white" Text="Cancel" OnClick="btnCancel_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

