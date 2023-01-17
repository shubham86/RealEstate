<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="datepicker.aspx.cs" Inherits="RealEstate.cpanel.datepicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#<%=txtPossessionDate.ClientID%>').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                format: 'dd/mm/yyyy',
                todayHighlight:true
            });
        });
    </script>
    <style>
        .datepicker-days {
            padding:10px !important;
        }
        .fontAwesome {
            font-family: 'FontAwesome', sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="form-horizontal" style="margin-top: 10px">
                           
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Possession Date</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPossessionDate" runat="server" class="form-control fontAwesome" placeholder="&#xf073;" Width="270px" style="background-color:#fff"></asp:TextBox>
                                    <label id="lblPossessionDate" class="error">Please select possession date</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
