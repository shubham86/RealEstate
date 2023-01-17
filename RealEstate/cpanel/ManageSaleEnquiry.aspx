<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="ManageSaleEnquiry.aspx.cs" Inherits="RealEstate.cpanel.ManageSaleEnquiry" %>
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
        <div class="col-lg-8">
            <h2>Enquiry of Sale Property</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a>Enquiry of Sale Property</a>
                </li>
                <li class="active">
                    <strong>Manage Enquiry</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-4">
            <div style="float: right; margin-top:30px">
                <asp:ImageButton ID="imgbtnAdd" ImageUrl="img/add_record.png" runat="server" Width="25px" Height="25px" ToolTip="Add New Record" OnClick="imgbtnadd_Click"/>
            </div>
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
                        <h5>Enquiry of Sale Property</h5>
                        <div style="float: right;">
                            <asp:ImageButton ID="imgbtnAdd1" ImageUrl="img/add_record.png" runat="server" Width="20px" Height="20px" ToolTip="Add New Record" OnClick="imgbtnadd_Click"/>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="Search in table">

                        <asp:Repeater ID="rptrEnquiry" runat="server" OnItemCommand="rptrEnquiry_RowCommand">
                            <HeaderTemplate>
                                <table class="footable table table-stripped" data-page-size="15" data-filter=#filter>
                                    <thead>
                                        <tr>                                            
                                            <th style="text-align:center">Sr.no.</th>
                                            <th style="text-align:center">Property</th>
                                            <th style="text-align:center">Location</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Budget</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Tenants</th>
                                            <th style="text-align:center" data-hide="phone,tablet">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="gradeX"> 
                                    <td style="text-align:center;vertical-align:middle">
                                        <asp:Label ID="lblno" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                                    </td>
                                    <td style="text-align:center;vertical-align:middle">
                                        <asp:Label ID="lblRooms" runat="server" Text='<%#Eval("bedrooms")%>'></asp:Label> &nbsp
                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("propertyType")%>'></asp:Label> 
                                    </td>
                                    <td style="text-align:center;vertical-align:middle">                                        
                                            <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("location")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center;vertical-align:middle">
                                        <asp:Label ID="lblRent" runat="server" Text='<%#Eval("priceBudget")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center;vertical-align:middle">
                                        <asp:Label ID="lblTenant" runat="server" Text='<%#Eval("tenants")%>'></asp:Label>
                                    </td>
                                    <td class="center" style="text-align:center;vertical-align:middle">
                                        <asp:ImageButton ID="imgbtnEdit" runat="server" ImageUrl="img/edit.png" ToolTip="Edit" Width="18" Height="18" CommandArgument='<%#Eval("enquiryID")%>' CommandName="edit"/>&nbsp
                                        <asp:ImageButton ID="imgbtnRentOut" runat="server" ImageUrl="img/search.png" ToolTip="Search Property" Width="18" Height="18"  CommandArgument='<%#Eval("enquiryID")%>' CommandName="sold"/>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>