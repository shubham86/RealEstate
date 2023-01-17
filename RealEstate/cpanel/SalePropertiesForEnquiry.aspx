<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="SalePropertiesForEnquiry.aspx.cs" Inherits="RealEstate.SalePropertiesForEnquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Enquiry table td {
            height:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Sale Properties for Enquiry</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a href="ManageEnquiry.aspx">Manage Enquiry</a>
                </li>
                <li class="active">
                    <strong>Properties for Enquiry</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12 main">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Sale Properties for Enquiry</h5>
                    </div>

                    <asp:Panel ID="pnlAlert" runat="server" class="mar-t20" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:Panel>

                    <div class="ibox-content">
                        <div class="form-horizontal" style="margin-top: 10px">
                            <div id="Enquiry" style="width: 95%; margin: 0 auto">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Enquiry Date</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblDate" runat="server"></asp:Label>&nbsp &nbsp
                                                <asp:Label ID="lblDays" runat="server" Text="5"></asp:Label>
                                                    days ago
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Client Name</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblName" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Mobile No.</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <a href="tel:">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label></a></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Email ID</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Property Type</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPropertyType" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Area</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblArea" runat="server"></asp:Label> &nbsp sq.ft.</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Location</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblLocation" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Source</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblSource" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Broker Through</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblBroker" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Possession</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPossessionDays" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Bed Rooms</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblBed" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Bathrooms</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblBath" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Furnishing Status</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblFurnishing" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Preferd Tenants</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblTenants" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Parking</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblParking" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Budget</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblBudget" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>

                            <input type="text" runat="server" class="form-control input-sm m-b-xs" id="filter" placeholder="Search in table" visible="false">

                            <asp:Repeater ID="rptrProperty" runat="server" OnItemCommand="rptrProperty_RowCommand">
                                <HeaderTemplate>
                                    <table class="footable table table-stripped" data-page-size="15" data-filter="#filter">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">Sr.no.</th>
                                                <th style="text-align: center">Property</th>
                                                <th style="text-align: center">Location</th>
                                                <th style="text-align: center" data-hide="phone,tablet">Price</th>
                                                <th style="text-align: center" data-hide="phone,tablet">Tenants</th>
                                                <th style="text-align: center" data-hide="phone,tablet">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="gradeX">
                                        <td style="text-align: center">
                                            <asp:Label ID="lblno" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="lblRooms" runat="server" Text='<%#Eval("bedrooms")%>'></asp:Label>
                                            &nbsp
                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("propertyType")%>'></asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <a href='<%# "http://www.google.com/maps/place/" + Eval("latitude") + "," + Eval("longitude") %>' target="_blank">
                                                <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("location")%>'></asp:Label></a>
                                        </td>
                                        <td class="center" style="text-align: center">
                                            <asp:Label ID="lblRent" runat="server" Text='<%#Eval("price")%>'></asp:Label>
                                        </td>
                                        <td class="center" style="text-align: center">
                                            <asp:Label ID="lblTenant" runat="server" Text='<%#Eval("preferredTenants").ToString() == "" ? "-" : Eval("preferredTenants").ToString()%>'></asp:Label>
                                        </td>
                                        <td class="center" style="text-align: center">
                                            <asp:ImageButton ID="imgbtnEdit" runat="server" ImageUrl="img/viewDetails.png" ToolTip="View Details" Width="18" Height="18" CommandArgument='<%#Eval("propertyID")%>' CommandName="edit" />&nbsp
                                        <asp:ImageButton ID="imgbtnRentOut" runat="server" ImageUrl="img/sold.png" ToolTip="Sold It" Width="15" Height="15" CommandArgument='<%#Eval("propertyID")%>' CommandName="sold" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                                <ul class="pagination pull-right"></ul>
                                            </td>
                                        </tr>
                                    </tfoot>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-1">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>