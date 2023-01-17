<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="PropertyDetails.aspx.cs" Inherits="RealEstate.PropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);

        var directionsDisplay;
        var map;
        var endMarker;

        function initialize() {
            var lblLat = document.getElementById('<%=lat.ClientID%>').value;
            var lblLng = document.getElementById('<%=lng.ClientID%>').value;

            directionsDisplay = new google.maps.DirectionsRenderer();
            var spot = new google.maps.LatLng(lblLat, lblLng);
            var mapOptions = {
                zoom: 14,
                center: spot
            }
            map = new google.maps.Map(document.getElementById("map"), mapOptions);
            directionsDisplay.setMap(map);

            if (endMarker) {
                endMarker.setMap(null);
            }
            // create the marker
            endMarker = new google.maps.Marker({
                position: spot,
                map: map,
                icon: 'cpanel/img/marker.png',
                animation: google.maps.Animation.DROP,
            });

        }

    </script>  
    <style>
        .smail-properties .list-inline-item {
            width:13%;
        }
        .property-details ul li {
            line-height:45px;
        }
        @media only screen and (min-width : 700px) {
            .carousel-inner {
                height:500px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Sub banner start -->
    <div class="sub-banner overview-bgi">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Property Detail 3</h1>
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Property Detail 3</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Sub banner end -->
    <div class="col-md-8" style="width:70%;margin: 20px auto 0 auto">
        <asp:Panel ID="pnlAlert" runat="server" class="mar-t20" role="alert" Visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>
    </div>    
    <!-- Properties details page start -->
    <div class="properties-details-page content-area-15">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div id="propertiesDetailsSlider" class="carousel properties-details-sliders slide mb-60">
                        <div class="heading-properties">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="pull-left">
                                        <h3>
                                            <asp:Label ID="lblPropetyName" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblVerified" runat="server" Text="Verified Property" Visible="false"  style="color: #228b22; font-size: 10px; border: 1px solid #228b22; padding: 3px; border-radius: 5px;margin-bottom:5px;font-weight:bold"></asp:Label>
                                        </h3>                                        
                                        <p>
                                            <i class="fa fa-map-marker"></i>
                                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                        </p>
                                    </div>
                                    <div class="p-r">
                                        <h3>
                                            ₹ <asp:Label ID="lblRent" runat="server" Text=""></asp:Label></h3>
                                        <p><asp:Label ID="lblNegotiation" runat="server" Text="" style="border:1px solid #888888;border-radius:5px; background-color:#888888;color:#ffffff;font-size:12px;padding:3px"></asp:Label></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- main slider carousel items -->
                        <div class="carousel-inner">
                            <div id="NoPhoto" runat="server" class="active item carousel-item" data-slide-number="0" visible="false" style="text-align: center;">
                                <img src="assets/img/NoImage.png" class="img-fluid" alt="properties-photo" style="margin-top:10%">
                            </div>
                            <asp:Repeater ID="rptrPhoto" runat="server">
                                <ItemTemplate>
                                    <div class='<%# Eval("RowNumber").ToString() == "1" ? "active item carousel-item" : "item carousel-item"%>' data-slide-number='<%# Convert.ToInt32(Eval("RowNumber").ToString())-1 %>' style="text-align: center;">
                                        <img src='<%# Eval("path") %>' class="img-fluid" alt="properties-photo">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <a class="carousel-control left" href="#propertiesDetailsSlider" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                            <a class="carousel-control right" href="#propertiesDetailsSlider" data-slide="next"><i class="fa fa-angle-right"></i></a>

                        </div>
                        <!-- main slider carousel nav controls -->
                        <ul class="carousel-indicators smail-properties list-inline nav nav-justified ">
                            <li id="NoPhotoSmall" runat="server" class="list-inline-item active" visible="false">
                                <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#propertiesDetailsSlider">
                                    <img src="assets/img/NoImage.png" class="img-fluid" alt="properties-photo-smale">
                                </a>
                            </li>
                            <asp:Repeater ID="rptrPhotoSmall" runat="server">
                                <ItemTemplate>
                                    <li class='<%# Eval("RowNumber").ToString() == "1" ? "list-inline-item active" : "list-inline-item"%>'>
                                        <a id='<%# "carousel-selector-" + (Convert.ToInt32(Eval("RowNumber").ToString())-1).ToString() %>' class="selected" data-slide-to='<%# Convert.ToInt32(Eval("RowNumber").ToString())-1 %>' data-target="#propertiesDetailsSlider">
                                            <img src='<%# Eval("path") %>' class="img-fluid" alt="properties-photo-smale">
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 slider">
                    <div class="tabbing tabbing-box mb-60">
                        <ul class="nav nav-tabs" id="carTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active show" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="one" aria-selected="false">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="three" aria-selected="true">
                                    <asp:Label ID="Label1" runat="server" Text="Rent"></asp:Label> Details</a>
                            </li>
                            <%--<li class="nav-item">
                            <a class="nav-link" id="4-tab" data-toggle="tab" href="#4" role="tab" aria-controls="4" aria-selected="true">Video</a>
                        </li>--%>
                            <li class="nav-item">
                                <a class="nav-link" id="5-tab" data-toggle="tab" href="#5" role="tab" aria-controls="5" aria-selected="true">Location</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="carTabContent">
                            <div class="tab-pane fade active show" id="one" role="tabpanel" aria-labelledby="one-tab">
                                <h3 class="heading">Property Description</h3>
                                <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>

                                <div class="property-details" style="margin-top:20px;">
                                    <h3 class="heading">
                                       Property Details</h3>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <ul>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-bed"></i></td>
                                                            <td width="40%"><strong>Bedroom : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblBedroom" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-bathtub"></i></td>
                                                            <td width="40%"><strong>Bathroom : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblBath" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="flaticon-square-layouting-with-black-square-in-east-area" style="font-weight:bold"></i></td>
                                                            <td width="40%"><strong>Land area : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblArea" runat="server" Text="NA"></asp:Label>&nbsp <asp:Label ID="lblAreaUnit" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-home" style="font-size:16px"></i></td>
                                                            <td width="40%"><strong>Property Type : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblPropertyType" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-users"></i></td>
                                                            <td width="40%"><strong>Preferred Tenants : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblTenants" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><img src="assets/img/furniture.png" width="17" height="13"/></td>
                                                            <td width="40%"><strong>Furnishing Status : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblFurnishing" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <ul>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-key"></i></td>
                                                            <td width="40%"><strong>Possession : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblPossession" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-building-o"></i></td>
                                                            <td width="40%"><strong>Floor : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblFloor" runat="server" Text="NA"></asp:Label>
                                                                /
                                                                <asp:Label ID="lblTotalFloor" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-car"></i></td>
                                                            <td width="40%"><strong>Parking : </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblParking" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-hourglass-half"></i></td>
                                                            <td width="40%"><strong>Age of Building: </strong></td>
                                                            <td width="53%">
                                                                <asp:Label ID="lblAge" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="7%"><i class="fa fa-calendar"></i></td>
                                                            <td width="40%"><strong>Post Date : </strong></td>
                                                            <td width="53%"><asp:Label ID="lblPostDate" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                    
                            </div>

                            <div class="tab-pane fade " id="three" role="tabpanel" aria-labelledby="three-tab">
                                <div class="property-details">
                                    <h3 class="heading">
                                        <asp:Label ID="Label2" runat="server" Text="Rent"></asp:Label> Details</h3>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6">
                                            <ul id="RentDetails" runat="server">
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="33%"><strong>Rent: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblDescRent" runat="server" Text="NA"></asp:Label> / Month</td>
                                                        </tr>
                                                    </table>                                                    
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="33%"><strong>Deposite: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblDeposite" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="33%"><strong>Maintenance: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblMaintenance" runat="server" Text="NA"></asp:Label> / Month</td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="33%"><strong>Brokerage: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblRentBrokrage" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                            <ul id="PriceDetails" runat="server">
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="33%"><strong>Price: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblPrice" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                                <li>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="40%"><strong>Brokerage: </strong></td>
                                                            <td width="60%">₹ <asp:Label ID="lblPriceBrokerage" runat="server" Text="NA"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                        </div>
                                        <div class="col-md-4 col-sm-6"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade " id="5" role="tabpanel" aria-labelledby="5-tab">
                                <div class="section location">
                                    <h3 class="heading">Property Location</h3>                                    
                                    <input id="lat" runat="server" readonly="readonly" style="border:none;font-size:1px;color:#ffffff;width:1px"/>
                                    <input id="lng" runat="server" readonly="readonly" style="border:none;font-size:1px;color:#ffffff;width:1px"  />
                                    <div class="map">
                                        <div id="map" class="contact-map" style="height: 300px;position: relative;overflow: hidden;"></div>
                                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApv3JwcskPGcJp3AROWf6XdUVTAKaCNA8&callback=initialize"></script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="contact-3 mb-60">
                        <h3 class="heading">Contact to Agent</h3>
                        <div class="container">
                            <div class="row">
                                <div class="row">                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group email" style="padding-left:20px">
                                            Name of Agent &nbsp : &nbsp <asp:Label ID="lblName" runat="server" Text="" Font-Bold="true"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form-group name" style="font-size:22px; font-weight:bold;color:#2646a7;padding-left:20px">
                                            <i class="fa fa-phone"></i> &nbsp
                                            <asp:Label ID="lblAgentContact" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:Label ID="lblCompanyContact" runat="server" Text="7066-05-3339" Visible="false"></asp:Label>                                                      
                                        </div>
                                    </div>                                    
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"></div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        <div class="send-btn">
                                            <a id="Call" runat="server" href="javascript:void(0)" class="btn btn-color btn-md btn-message" style="color:white">Call Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Properties details page start -->
</asp:Content>
