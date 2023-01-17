<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="RentOutProperties.aspx.cs" Inherits="RealEstate.cpanel.RentOutProperties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <h2>Rent Out Properties</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li class="active">
                    <strong>Rent Out Properties</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>

    <asp:Panel ID="pnlAlert" runat="server" class="" role="alert" Visible="false" style="margin-top:20px;margin-bottom:0">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
    </asp:Panel>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12 main">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Rent Out Properties</h5>
                    </div>
                    <div class="ibox-content">
                        <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="Search in table">

                        <asp:Repeater ID="rptrRentOutProperty" runat="server">
                            <HeaderTemplate>
                                <table class="footable table table-stripped" data-page-size="15" data-filter=#filter>
                                    <thead>
                                        <tr>
                                            <th style="text-align:center">Sr.no.</th>
                                            <th style="text-align:center">Property</th>
                                            <th style="text-align:center">Location</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Client</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Mobile</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Possession Date</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Expiry Date</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Rent</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Deposite</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="gradeX">
                                    <td style="text-align:center">
                                        <asp:Label ID="lblno" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                                    </td>
                                    <td style="text-align:center">
                                        <asp:Label ID="lblRooms" runat="server" Text='<%#Eval("bedrooms")%>'></asp:Label> &nbsp
                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("propertyType")%>'></asp:Label> 
                                    </td>
                                    <td style="text-align:center">
                                        <a href='<%# "http://www.google.com/maps/place/" + Eval("latitude") + "," + Eval("longitude") %>' target="_blank">
                                            <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("location")%>'></asp:Label></a>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="lblRent" runat="server" Text='<%#Eval("clientName")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="lblTenant" runat="server" Text='<%#Eval("clientMobile")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Convert.ToDateTime(Eval("dateOfPossession")).ToString("dd/MM/yyyy")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("dateOfAgreementExpiry").ToString()=="" ? "-" : Convert.ToDateTime(Eval("dateOfAgreementExpiry")).ToString("dd/MM/yyyy")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("rentAmount").ToString() == "" ? "-" : Eval("rentAmount") %>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center">
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("depositeAmount").ToString() == "" ? "-" : Eval("depositeAmount")%>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="9">
                                                <ul class="pagination pull-right"></ul>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
