<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="SalePropertyDetails.aspx.cs" Inherits="RealEstate.cpanel.SalePropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <style>
        .Enquiry table td {
            height:30px;
        }
        .i-checks table td {
            padding: 0 10px;
        }

        .i-checks table label {
            padding-left: 7px;
        }
        
        @media only screen and (max-width : 800px) {
            .photo {
                width:100%;
                height:auto;
                margin-top:20px;
            }
        }
        @media only screen and (min-width : 800px) {
            .photo {
                width:100%;
                height:270px;
                margin-top:20px;
            }
        }
    </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Rent Properties for Enquiry</h2>
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
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Rent Properties for Enquiry</h5>
                    </div>

                    <asp:Panel ID="pnlAlert" runat="server" class="mar-t20" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:Panel>

                    <div class="ibox-content">
                        <h4>Uploaders Details</h4>
                        <div class="form-horizontal" style="margin-top: 10px">
                            <div class="Enquiry" style="width: 95%; margin: 0 auto">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Name</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblName" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
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
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                           <tr>
                                                <td width="40%" style="color: #999999">Status</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblClientStatus" runat="server"></asp:Label></td>
                                            </tr> 
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                           <tr>
                                                <td width="40%" style="color: #999999">Broke Through</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblbrokethrough" runat="server"></asp:Label></td>
                                            </tr>  
                                        </table>
                                    </div>
                                </div>               
                                <div class="row">
                                    <div class="col-lg-5">
                                         <table width="100%" align="center">
                                           <tr>
                                                <td width="40%" style="color: #999999">Post Date</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPostDate" runat="server"></asp:Label>&nbsp &nbsp
                                                <asp:Label ID="lblDays" runat="server" Text="5"></asp:Label>
                                                </td>
                                            </tr> 
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">                                        
                                       
                                    </div>
                                </div>            
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <h4>Property Details</h4>
                        <div class="form-horizontal" style="margin-top: 10px">
                            <div class="Enquiry" style="width: 95%; margin: 0 auto">                                
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Property Status</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPropertyStatus" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
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
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Area</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblArea" runat="server"></asp:Label>&nbsp sq.ft.</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
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
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                           <tr>
                                                <td width="40%" style="color: #999999">Property Address</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPropertyAddress" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Possession Date</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPossessionDate" runat="server"></asp:Label></td>
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
                                                <td width="40%" style="color: #999999">Floor</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblFloor" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-lg-2"></div>
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
                                </div>
                                <div class="row">
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
                                    <div class="col-lg-2"></div>
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
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Age of Building</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblAge" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>                                        
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">price</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Negotiation Status</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblNegitiation" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>        
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Brokerage Amount</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblBrokerage" runat="server"></asp:Label></td>
                                            </tr>
                                        </table> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                            <table width="100%" align="center">
                                            <tr>
                                                <td width="40%" style="color: #999999">Description</td>
                                                <td width="10%">:</td>
                                                <td width="50%" style="text-align: left">
                                                    <asp:Label ID="lblDescription" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>                             
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5"></div>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                         <h4>Property Photos</h4>
                        <div class="form-horizontal" style="margin-top: 10px">
                            <div id="Enquiry" style="width: 95%; margin: 0 auto">
                                <div class="row">
                                    <asp:Repeater ID="rptrPhoto" runat="server">
                                        <ItemTemplate>
                                            <div class="col-sm-12 col-md-4">
                                                <img class="photo" src='<%# Eval("path") %>'/>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                
                                <div class="hr-line-dashed"></div>                                
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-1">
                                        <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Back" OnClick="btnBack_Onclick"/>
                                        <asp:Button ID="btnSoldIt" runat="server" CssClass="btn btn-primary" Text="Sold It" OnClick="btnSoldIt_Onclick" style="margin-left:5px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
