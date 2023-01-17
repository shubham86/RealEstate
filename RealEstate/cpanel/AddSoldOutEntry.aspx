<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="AddSoldOutEntry.aspx.cs" Inherits="RealEstate.cpanel.AddSoldOutEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (min-width : 770px) {
            .wrapper-content {
                width: 70%;
                margin: auto;
            }
        }
        .mar-t20{
            margin-right:20px;
        }
    </style>
    <script>
        function validateForm() {
            if (document.getElementById('<%=txtClientName.ClientID%>').value == "") {
                document.getElementById("lblClientName").style.display = "block";
                document.getElementById('<%=txtClientName.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtClientMobile.ClientID%>').value == "") {
                document.getElementById("lblClientMobile").style.display = "block";
                document.getElementById('<%=txtClientMobile.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtClientMobile.ClientID%>').value.length < 10) {
                document.getElementById("lblClientMobile1").style.display = "block";
                document.getElementById('<%=txtClientMobile.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtPossessionDate.ClientID%>').value == "") {
                document.getElementById("lblPossessionDate").style.display = "block";
                document.getElementById('<%=txtPossessionDate.ClientID%>').focus();
                return false;
            }                     
            if (document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }        
            if (document.getElementById('<%=txtPersonalBrokerage.ClientID%>').value == "") {
                document.getElementById("lblPersonalBrokerage").style.display = "block";
                document.getElementById('<%=txtPersonalBrokerage.ClientID%>').focus();
                return false;
            }         
            if (document.getElementById('<%=txtCollectedBrokerage.ClientID%>').value == "") {
                document.getElementById("lblCollectedBrokerage").style.display = "block";
                document.getElementById('<%=txtCollectedBrokerage.ClientID%>').focus();
                return false;
            }
        }

        function hideClientNamelbl() {
            document.getElementById("lblClientName").style.display = "none"
        }
        function hideClientMobilelbl() {
            document.getElementById("lblClientMobile").style.display = "none"
        }
        function hidePossessionDatelbl() {
            document.getElementById("lblPossessionDate").style.display = "none"
        }
        function hideAgrimentMonthlbl() {
            document.getElementById("lblAgrimentMonth").style.display = "none"
        }
        function hidePricelbl() {
            document.getElementById("lblPrice").style.display = "none"
        }
        function hideDepositlbl() {
            document.getElementById("lblDeposit").style.display = "none"
        }
        function hidePersonalBrokeragelbl() {
            document.getElementById("lblPersonalBrokerage").style.display = "none"
        }        
        function hideCollectedBrokeragelbl() {
            document.getElementById("lblCollectedBrokerage").style.display = "none"
        }

        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") != -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
                        
            document.getElementById("lblAgrimentMonth").style.display = "none";
            return true;
        }

        function isDecimalNumber(evt, c) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            var dot1 = c.value.indexOf('.');
            var dot2 = c.value.lastIndexOf('.');

            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            else if (charCode == 46 && (dot1 == dot2) && dot1 != -1 && dot2 != -1)
                return false;

            return true;
        }
    </script>
    <%-- Alert --%>
    <script>
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
            <h2>Add Sold Property</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a href="ManageSaleProperty.aspx">Properties for Sale</a>
                </li>
                <li class="active">
                    <strong>Add Property</strong>
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
                        <h5>Add Sold Property</h5>                        
                    </div>

                    <asp:Panel ID="pnlAlert" runat="server" class="mar-t20" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:Panel>

                    <div class="ibox-content">
                        <div class="form-horizontal" style="margin-top:10px">                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Name of Client</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtClientName" runat="server" class="form-control" onkeypress="hideClientNamelbl()"></asp:TextBox>
                                    <label id="lblClientName" class="error">Please enter name of client</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Mobile Number</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtClientMobile" runat="server" class="form-control" MaxLength="10" onkeypress="hideClientMobilelbl()"></asp:TextBox>
                                    <label id="lblClientMobile" class="error">Please enter mobile number of client</label>
                                    <label id="lblClientMobile1" class="error">Please enter a valid contact number</label>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Email ID</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtClientEmail" runat="server" class="form-control" onkeypress="hideClientEmaillbl()"></asp:TextBox>
                                    <label id="lblClientEmail" class="error">Please enter emxil id of client</label>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Possession Date</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPossessionDate" runat="server" class="form-control" TextMode="Date" Width="270px" onclick="hidePossessionDatelbl()"></asp:TextBox>
                                    <label id="lblPossessionDate" class="error">Please select possession date</label>
                                </div>
                            </div>                          
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Price Amount</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPrice" runat="server" class="form-control" onclick="hidePricelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                    <label id="lblPrice" class="error">Please enter property price </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Personal Brokerage</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPersonalBrokerage" runat="server" class="form-control" onclick="hidePersonalBrokeragelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                    <label id="lblPersonalBrokerage" class="error">Please enter personal brokerage amount</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Collected Brokerage</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtCollectedBrokerage" runat="server" class="form-control" onclick="hideBrokerageBrokeragelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                    <label id="lblCollectedBrokerage" class="error">Please enter collected brokerage amount</label>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validateForm()" OnClick="btnSave_Click" Width="30%"/>
                                    <asp:Button ID="btnSkip" runat="server" CssClass="btn btn-success" Text="Skip" OnClick="btnSkip_Click"/>
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
