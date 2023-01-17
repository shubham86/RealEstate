<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="AddRentEnquiry.aspx.cs" Inherits="RealEstate.cpanel.AddRentEnquiry" %>
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
            if (document.getElementById('<%=ddlPropertyType.ClientID%>').value == "0") {
                document.getElementById("lblPropertyType").style.display = "block";
                document.getElementById('<%=ddlPropertyType.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtArea.ClientID%>').value == "" && (document.getElementById('<%=ddlPropertyType.ClientID%>').value == "4" || document.getElementById('<%=ddlPropertyType.ClientID%>').value == "5")) {
                document.getElementById("lblArea").style.display = "block";
                document.getElementById('<%=txtArea.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlLocation.ClientID%>').value == "0") {
                document.getElementById("lblLocation").style.display = "block";
                document.getElementById('<%=ddlLocation.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlSource.ClientID%>').value == "0") {
                document.getElementById("lblSource").style.display = "block";
                document.getElementById('<%=ddlSource.ClientID%>').focus();
                return false;
            }

            var rb = document.getElementById("<%=rdbBroker.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            var isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked) {
                document.getElementById("lblBroker").style.display = "block";
                document.getElementById('<%=rdbBroker.ClientID%>').focus();
                window.setTimeout(function () {$("#lblBroker").attr("style", "display:none"); }, 4000);
                return false;
            }

            if (document.getElementById('<%=ddlPossession.ClientID%>').value == "00") {
                document.getElementById("lblPossession").style.display = "block";
                document.getElementById('<%=ddlPossession.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlRoom.ClientID%>').value == "0" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblRoom").style.display = "block";
                document.getElementById('<%=ddlRoom.ClientID%>').focus();
                return false;
            }

            rb = document.getElementById("<%=rdbBath.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked  && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblBath").style.display = "block";
                document.getElementById('<%=rdbBath.ClientID%>').focus();
                window.setTimeout(function () {$("#lblBath").attr("style", "display:none"); }, 4000);
                return false;
            }
            
            rb = document.getElementById("<%=rdbFurnishing.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblFurnishing").style.display = "block";
                document.getElementById('<%=rdbFurnishing.ClientID%>').focus();
                window.setTimeout(function () {$("#lblFurnishing").attr("style", "display:none"); }, 4000);
                return false;
            }   
                        
            if (document.getElementById('<%=ddlTenants.ClientID%>').value == "0"  && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblTenants").style.display = "block";
                document.getElementById('<%=ddlTenants.ClientID%>').focus();
                return false;
            } 

            rb = document.getElementById("<%=rdbParking.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblParking").style.display = "block";
                document.getElementById('<%=rdbFurnishing.ClientID%>').focus();
                window.setTimeout(function () {$("#lblParking").attr("style", "display:none"); }, 4000);
                return false;
            } 

            if (document.getElementById('<%=txtRent.ClientID%>').value == "") {
                document.getElementById("lblRent").style.display = "block";
                document.getElementById('<%=txtRent.ClientID%>').focus();
                return false;
            }
        }

        function hidePropertyTypelbl() {
            document.getElementById("lblPropertyType").style.display = "none"
        }
        function hideLocationlbl() {
            document.getElementById("lblLocation").style.display = "none"
        }
        function hideSourcelbl() {
            document.getElementById("lblSource").style.display = "none"
        }
        function hideClientNamelbl() {
            document.getElementById("lblClientName").style.display = "none"
        }
        function hideClientMobilelbl() {
            document.getElementById("lblClientMobile").style.display = "none"
            document.getElementById("lblClientMobile1").style.display = "none"
        }
        function hideClientEmaillbl() {
            document.getElementById("lblClientEmail").style.display = "none"
        }
        function hidePossessionlbl() {
            document.getElementById("lblPossession").style.display = "none"
        }
        function hideRoomlbl() {
            document.getElementById("lblRoom").style.display = "none"
        }
        function hideTenantslbl() {
            document.getElementById("lblTenants").style.display = "none"
        }
        function hideRentlbl() {
            document.getElementById("lblRent").style.display = "none"
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
        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") != -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
                        
            document.getElementById("lblArea").style.display = "none"
            document.getElementById("lblContactNo").style.display = "none";
            document.getElementById("lblContactNo1").style.display = "none";
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
            <h2>Add Property Enquiry</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a href="ManageEnquiry.aspx">Manage Enquiry</a>
                </li>
                <li class="active">
                    <strong>Add Property Enquiry</strong>
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
                        <h5>Add Property Enquiry</h5>                        
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
                                    <asp:TextBox ID="txtClientMobile" runat="server" class="form-control" MaxLength="10" onclick="hideClientMobilelbl()" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                                    <label id="lblClientMobile" class="error">Please enter mobile number of client</label>
                                    <label id="lblClientMobile1" class="error">Please enter a valid contact number</label>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Email ID</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtClientEmail" runat="server" class="form-control" TextMode="Email" onkeypress="hideClientEmaillbl()"></asp:TextBox>
                                    <label id="lblClientEmail" class="error">Please enter email id of client</label>
                                </div>
                            </div>        
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Property Type</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-control" onclick="hidePropertyTypelbl()">
                                        <asp:ListItem Text="-- Select Property Type --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Apartment" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Independent House/Villa" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="independent floor/Builder Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Office" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Shop" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="PG" Value="7"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblPropertyType" class="error">Please select property type</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Area (sq.ft)</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtArea" runat="server" class="form-control" MaxLength="7" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                                    <label id="lblArea" class="error">Please enter area of property</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Location</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control" onclick="hideLocationlbl()"></asp:DropDownList>
                                    <label id="lblLocation" class="error">Please select location</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Source of Property</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlSource" runat="server" CssClass="form-control" onclick="hideSourcelbl()">
                                        <asp:ListItem Text="-- Select Source --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Nobroker" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Nestaway" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="99 Acers" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Magic Bricks" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Facebook" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Other Agent" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Client" Value="7"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblSource" class="error">Please select source</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Number of Brokers</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbBroker" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblBroker" class="error">Please select number of broker</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Possession</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlPossession" runat="server" CssClass="form-control" onclick="hidePossessionlbl()">
                                        <asp:ListItem Text="-- Select Possession --" Value="00"></asp:ListItem>
                                        <asp:ListItem Text="Immediate" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Within 15 days" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="Within 30 days" Value="30"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblPossession" class="error">Please select possession days</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Bed Rooms</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlRoom" runat="server" CssClass="form-control" onclick="hideRoomlbl()">
                                        <asp:ListItem Text="-- Select Rooms --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Single Room" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="1 RK" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="1 BHK" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="2 BHK" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="3 BHK" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="4 BHK" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="4+ BHK" Value="7"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblRoom" class="error">Please select numbers of bed rooms</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Number of Bathrooms</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbBath" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblBath" class="error">Please select number of bathrooms</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Furnishing</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbFurnishing" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="Full" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Semi" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Unfurnished" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblFurnishing" class="error">Please select furnishing status</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Tenants Type</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlTenants" runat="server" CssClass="form-control" onclick="hideTenantslbl()">
                                        <asp:ListItem Text="-- Select Tenants --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Family" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Bachelor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblTenants" class="error">Please select preferred tenants</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Parking</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbParking" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="2 wheel" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="4 wheel" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="None" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblParking" class="error">Please select parking</label>
                                </div>
                            </div>          
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Rent Budget</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtRent" runat="server" class="form-control" onclick="hideRentlbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                    <label id="lblRent" class="error">Please enter rent amount</label>
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
