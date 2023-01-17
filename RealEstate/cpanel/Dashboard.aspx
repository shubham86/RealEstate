<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RealEstate.cpanel.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (min-width : 770px) {
            .ibox-title {
                display:block;
            }
        }

        @media only screen and (max-width : 770px) {
            .ibox-title {
                display:block;
            }
                .ibox-title h5 {
                    font-size:16px;
                    font-weight:normal;
                }
        }        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content">
        <asp:Panel ID="pnlAlert" runat="server" class="" role="alert" Visible="false" Style="margin:20px auto;width:80%">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>

        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">Rent</span>
                        <h5>Property for Rent</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">
                            <asp:Label ID="lblRentProperty" runat="server" Text="0"></asp:Label>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">Sale</span>
                        <h5>Property for Sale</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">
                            <asp:Label ID="lblSaleProperty" runat="server" Text="0"></asp:Label>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">Brokers</span>
                        <h5>Number of Brokers</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">
                            <asp:Label ID="lblBrokers" runat="server" Text="0"></asp:Label>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-danger pull-right">Rent + Sale</span>
                        <h5>Total Properties</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">
                            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
