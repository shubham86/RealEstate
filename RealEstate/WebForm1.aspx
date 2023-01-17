<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RealEstate.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #map {
            width: 100%;
            height: 400px;
        }

        .controls {
            margin-top: 10px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #searchInput {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 50%;
        }

            #searchInput:focus {
                border-color: #4d90fe;
            }
    </style>

     <script>
        function initGMap() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (success) {
                    navigator.geolocation.getCurrentPosition(function (position) {

                        var map = new google.maps.Map(document.getElementById('map'), {
                            center: { lat: 18.52073289770824, lng: 73.85648647119137 },
                            zoom: 13
                        });
                        var input = document.getElementById('searchInput');
                        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                        var autocomplete = new google.maps.places.Autocomplete(input);
                        autocomplete.bindTo('bounds', map);

                        var infowindow = new google.maps.InfoWindow();
                        var marker = new google.maps.Marker({
                            map: map,
                            anchorPoint: new google.maps.Point(0, -29)
                        });
                        
                        // ************* get geolocation ****************
                        var lblLat = document.getElementById('lat').innerHTML;
                        var lblLng = document.getElementById('lon').innerHTML;
                        if (lblLat == "" && lblLng == "") {
                            var lat = position.coords.latitude;
                            var lng = position.coords.longitude;
                        }
                        else {
                            var lat = lblLat;
                            var lng = lblLng;
                        }                        
                        input.setAttribute("style", "z-index: 0;position: absolute; left: 189px; top: 15px;");

                        directionsDisplay = new google.maps.DirectionsRenderer();
                        var spot = new google.maps.LatLng(lat, lng);
                        var mapOptions = {
                            zoom: 17,
                            center: spot
                        }
                        map = new google.maps.Map(document.getElementById("map"), mapOptions);
                        //var marker = new google.maps.Marker({ position: spot, map: map, draggable: true });
                        directionsDisplay.setMap(map);

                        // if any previous marker exists, let's first remove it from the map
                        if (marker) {
                            marker.setMap(null);
                        }
                        // create the marker
                        marker = new google.maps.Marker({
                            position: spot,
                            map: map,
                            draggable: true,
                        });

                        document.getElementById('lat').innerHTML = marker.getPosition().lat();
                        document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        // add an event "onDrag"
                        google.maps.event.addListener(marker, 'dragend', function () {
                            document.getElementById('lat').innerHTML = marker.getPosition().lat();
                            document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        });
                        //************* end get geolocation *************

                        autocomplete.addListener('place_changed', function () {
                            infowindow.close();
                            marker.setVisible(false);
                            var place = autocomplete.getPlace();
                            if (!place.geometry) {
                                window.alert("Autocomplete's returned place contains no geometry");
                                return;
                            }

                            // If the place has a geometry, then present it on a map.
                            if (place.geometry.viewport) {
                                map.fitBounds(place.geometry.viewport);
                            } else {
                                map.setCenter(place.geometry.location);
                                map.setZoom(17);
                            }
                            
                            marker.setPosition(place.geometry.location);
                            marker.setVisible(true);


                            document.getElementById('lat').innerHTML = marker.getPosition().lat();
                            document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        });

                        //get lat and lng of draged pin            
                        google.maps.event.addListener(marker, 'dragend', function () {
                            document.getElementById('lat').innerHTML = marker.getPosition().lat();
                            document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        });
                    });
                },
                    function (failure) {
                        var lblLat = document.getElementById('lat').value;
                        var lblLng = document.getElementById('lon').value;


                        var map = new google.maps.Map(document.getElementById('map'), {
                            center: { lat: 18.52073289770824, lng: 73.85648647119137 },
                            zoom: 13
                        });
                        var input = document.getElementById('searchInput');
                        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                        var autocomplete = new google.maps.places.Autocomplete(input);
                        autocomplete.bindTo('bounds', map);

                        var infowindow = new google.maps.InfoWindow();
                        var marker = new google.maps.Marker({
                            map: map,
                            anchorPoint: new google.maps.Point(0, -29)
                        });

                        autocomplete.addListener('place_changed', function () {
                            infowindow.close();
                            marker.setVisible(false);
                            var place = autocomplete.getPlace();
                            if (!place.geometry) {
                                window.alert("Autocomplete's returned place contains no geometry");
                                return;
                            }

                            // If the place has a geometry, then present it on a map.
                            if (place.geometry.viewport) {
                                map.fitBounds(place.geometry.viewport);
                            } else {
                                map.setCenter(place.geometry.location);
                                map.setZoom(17);
                            }
                            //marker.setIcon(({
                            //    url: place.icon,
                            //    size: new google.maps.Size(71, 71),
                            //    origin: new google.maps.Point(0, 0),
                            //    anchor: new google.maps.Point(17, 34),
                            //    scaledSize: new google.maps.Size(35, 35)
                            //}));
                            marker.setPosition(place.geometry.location);
                            marker.setVisible(true);


                            document.getElementById('lat').innerHTML = marker.getPosition().lat();
                            document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        });

                        //get lat and lng of draged pin            
                        google.maps.event.addListener(marker, 'dragend', function () {
                            document.getElementById('lat').innerHTML = marker.getPosition().lat();
                            document.getElementById('lon').innerHTML = marker.getPosition().lng();
                        });
                    });
            }
        }

        function dropPin() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 18.52073289770824, lng: 73.85648647119137 },
                zoom: 13
            });

            var marker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });

            // if any previous marker exists, let's first remove it from the map
            if (marker) {
                marker.setMap(null);
            }
            // create the marker
            marker = new google.maps.Marker({
                position: map.getCenter(),
                map: map, 
                draggable: true,
            });
            
            document.getElementById('lat').innerHTML = marker.getPosition().lat();
            document.getElementById('lon').innerHTML = marker.getPosition().lng();
            // add an event "onDrag"
            google.maps.event.addListener(marker, 'dragend', function () {
                document.getElementById('lat').innerHTML = marker.getPosition().lat();
                document.getElementById('lon').innerHTML = marker.getPosition().lng();
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk25E4mNfVIEt3tNl3K1HwNZVruVoFBlA&libraries=places&callback=initGMap" async defer></script>            
            <div id="map"></div>
            <input id="searchInput" class="controls" type="text" placeholder="Enter a location" />
            <div id="drop" style="margin-top: 5px">
                <input type="button" value="Drop Pin" onclick="dropPin()" />
                &nbsp Drop a marker on the center of the map<br />
            </div>
            <ul id="geoData">
                <li>Latitude: <span id="lat"></span></li>
                <li>Longitude: <span id="lon"></span></li>
            </ul>
        </div>
        <asp:DropDownList ID="ddlSource" runat="server" CssClass="form-control" onclick="hideSourcelbl()">
            <asp:ListItem Text="-- Select Source --" Value="0"></asp:ListItem>
            <asp:ListItem Text="Nobroker" Value="1"></asp:ListItem>
            <asp:ListItem Text="Nestaway" Value="2"></asp:ListItem>
            <asp:ListItem Text="99 Acers" Value="3"></asp:ListItem>
            <asp:ListItem Text="Magic Bricks" Value="4"></asp:ListItem>
            <asp:ListItem Text="Facebook" Value="5"></asp:ListItem>
            <asp:ListItem Text="Other Agent" Value="6"></asp:ListItem>
            <asp:ListItem Text="Owner" Value="7"></asp:ListItem>
        </asp:DropDownList>
    <script>
        function hideSourcelbl() {
            alert("click");
        }
    </script>
    </form>

    <%--<div class="search-area">
        <div class="container">
            <div class="search-area-inner">
                <div class="search-contents">
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Property Type</label>
                        <div class="col-lg-9 col-md-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlStatus" runat="server" class="selectpicker search-fields" onchange="ddlStatusChange(this.value);">
                                    <asp:ListItem Text="For Rent" Value="Rent" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="For Sale" Value="Sale"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Property Type</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="selectpicker search-fields" onclick="hidePropertyTypelbl()">
                                <asp:ListItem Text="-- Select Property Type --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Appartment" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Independent House/Vhilla" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Independent floor" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Office" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                            <label id="lblPropertyType" class="error">Please select property type</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Property For</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlRentOrSale" runat="server" CssClass="selectpicker search-fields">
                                <asp:ListItem Text="Rent" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Sale" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Area (sq.ft)</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtArea" runat="server" class="form-control" MaxLength="7" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                            <label id="lblArea" class="error">Please enter area of property</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Location</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlLocation" runat="server" CssClass="selectpicker search-fields" onclick="hideLocationlbl()"></asp:DropDownList>
                            <label id="lblLocation" class="error">Please select location</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Flat No. & Building Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtFlatNo" runat="server" class="form-control" onkeypress="hideFlatNolbl()"></asp:TextBox>
                            <label id="lblFlatNo" class="error">Please enter flat number and name of building</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Address</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" onkeypress="hideAddresslbl()" placeholder="without flat number and name of building"></asp:TextBox>
                            <label id="lblAddress" class="error">Please enter address</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Source of Property</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlSource" runat="server" CssClass="selectpicker search-fields" onclick="hideSourcelbl()">
                                <asp:ListItem Text="-- Select Source --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Nobroker" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Nestaway" Value="2"></asp:ListItem>
                                <asp:ListItem Text="99 Acers" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Magic Bricks" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Facebook" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Other Agent" Value="6"></asp:ListItem>
                                <asp:ListItem Text="Owner" Value="7"></asp:ListItem>
                            </asp:DropDownList>
                            <label id="lblSource" class="error">Please select source</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Contact Person Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtContactName" runat="server" class="form-control" onkeypress="hideContactNamelbl()"></asp:TextBox>
                            <label id="lblContactName" class="error">Please enter name</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Contact Number</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtContactNo" runat="server" class="form-control" MaxLength="10" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                            <label id="lblContactNo" class="error">Please enter contact number</label>
                            <label id="lblContactNo1" class="error">Please enter a valid contact number</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Number of Brokers</label>
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
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Possession Date</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtPossessionDate" runat="server" class="form-control" TextMode="Date" onclick="hidePossessionDatelbl()" Width="270px"></asp:TextBox>
                            <label id="lblPossessionDate" class="error">Please select possession date</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Bed Rooms</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlRoom" runat="server" CssClass="selectpicker search-fields" onclick="hideRoomlbl()">
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
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Number of Bathrooms</label>
                        <div class="col-sm-9 i-checks">
                            <asp:RadioButtonList ID="rdbBath" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            <label id="lblBath" class="error">Please select number of bathrooms</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Floor</label>
                        <div class="col-sm-9">
                            <table>
                                <tr>
                                    <td>
                                        <input id="txtFloor" runat="server" class="form-control" type="number" min="0" max="50" style="width: 60px" title="floor of property" onclick="hideFloorlbl()" /></td>
                                    <td style="font-size: 28px; font-weight: 100">/</td>
                                    <td>
                                        <input id="txtTotalFloor" runat="server" class="form-control" type="number" min="0" max="50" style="width: 60px" title="Total floor of building" onclick="hideTotalFloorlbl()" /></td>
                                </tr>
                            </table>
                            <label id="lblFloor" class="error">Please enter floor of property</label>
                            <label id="lblTotalFloor" class="error">Please enter total floor of building</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Furnishing</label>
                        <div class="col-sm-9 i-checks">
                            <asp:RadioButtonList ID="rdbFurnishing" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                <asp:ListItem Text="Un-Furnished" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Semi-Furnished" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Full-Furnished" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                            <label id="lblFurnishing" class="error">Please select furnishing status</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Preferred Tenants</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlTenants" runat="server" CssClass="selectpicker search-fields" onclick="hideTenantslbl()">
                                <asp:ListItem Text="-- Select Tenants --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Family" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Bachelor" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Does not matter" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                            <label id="lblTenants" class="error">Please select preferred tenants</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Parking</label>
                        <div class="col-sm-9 i-checks">
                            <asp:RadioButtonList ID="rdbParking" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                <asp:ListItem Text="2 wheel" Value="1"></asp:ListItem>
                                <asp:ListItem Text="4 wheel" Value="2"></asp:ListItem>
                                <asp:ListItem Text="None" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                            <label id="lblParking" class="error">Please select parking</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Age of Building in Years</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtAge" runat="server" class="form-control" MaxLength="99" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Description</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine" Columns="3"></asp:TextBox>
                            <label id="lblDescription" class="error">Please enter description</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Rent Amount</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtRent" runat="server" class="form-control" onclick="hideRentlbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                            <label id="lblRent" class="error">Please enter rent amount</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Deposit Amount</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtDeposit" runat="server" class="form-control" onclick="hideDepositlbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                            <label id="lblDeposit" class="error">Please enter deposit amount</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Maintenance Amount</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtMaintenance" runat="server" class="form-control" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Negotiation Status</label>
                        <div class="col-sm-9 i-checks">
                            <asp:RadioButtonList ID="rdbNegotiation" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                <asp:ListItem Text="Non-Negotiable" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Negotiable" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Brokerage Amount</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBrokerage" runat="server" class="form-control" onclick="hideBrokeragelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                            <label id="lblBrokerage" class="error">Please enter brokerage amount</label>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label" style="text-align: left">Property Photos</label>
                        <div class="col-sm-9"></div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div1" runat="server" class="panel panel-default">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collaps-btn">
                                                    <label for="FileUpload1" style="font-size: 10px; margin-left: 10px">Photo 1</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse1" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" onchange="previewFile1()" />
                                                        <asp:Label ID="lblImg1" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID1" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName1" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelet1" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete1_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image1" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div2" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="collaps-btn">
                                                    <label for="FileUpload2" style="font-size: 10px; margin-left: 10px">Photo 2</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" onchange="previewFile2()" />
                                                        <asp:Label ID="lblImg2" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID2" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName2" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete2" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete2_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image2" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div3" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="collaps-btn">
                                                    <label for="FileUpload3" style="font-size: 10px; margin-left: 10px">Photo 3</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" onchange="previewFile3()" />
                                                        <asp:Label ID="lblImg3" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID3" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName3" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete3" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete3_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image3" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div4" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" class="collaps-btn">
                                                    <label for="FileUpload4" style="font-size: 10px; margin-left: 10px">Photo 4</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse4" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload4" runat="server" class="form-control" onchange="previewFile4()" />
                                                        <asp:Label ID="lblImg4" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID4" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName4" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete4" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete4_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image4" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div5" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" class="collaps-btn">
                                                    <label for="FileUpload5" style="font-size: 10px; margin-left: 10px">Photo 5</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse5" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload5" runat="server" class="form-control" onchange="previewFile5()" />
                                                        <asp:Label ID="lblImg5" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID5" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName5" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete5" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete5_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image5" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div6" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6" class="collaps-btn">
                                                    <label for="FileUpload6" style="font-size: 10px; margin-left: 10px">Photo 6</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload6" runat="server" class="form-control" onchange="previewFile6()" />
                                                        <asp:Label ID="lblImg6" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID6" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName6" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete6" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete6_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image6" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="Div7" runat="server" class="panel panel-default">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse7" class="collaps-btn">
                                                    <label for="FileUpload7" style="font-size: 10px; margin-left: 10px">Photo 7</label>
                                                    <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapse7" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="input-field col s12">
                                                    <div class="col-md-6">
                                                        <asp:FileUpload ID="FileUpload7" runat="server" class="form-control" onchange="previewFile7()" />
                                                        <asp:Label ID="lblImg7" runat="server" ForeColor="White"></asp:Label>
                                                        <asp:Label ID="lblPhotoID7" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        <asp:Label ID="lblOldName7" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:ImageButton ID="btnDelete7" runat="server" ImageUrl="img/delete.png" OnClick="btnDelete7_Click" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Image ID="Image7" runat="server" Height="225px" Width="100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-bottom: 0">
                        <label class="col-sm-4 control-label" style="text-align: left">Select Property Location on Map</label>
                        <div class="col-sm-8">
                            <input id="Text1" readonly="readonly" runat="server" style="border: none; font-size: 1px; color: white" />
                            <input id="lng" readonly="readonly" runat="server" style="border: none; font-size: 1px; color: white" />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="drop" style="margin-top: 5px">
                                <input type="button" value="Drop Pin" onclick="dropPin()" />
                                &nbsp Drop a marker on the center of the map<br />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk25E4mNfVIEt3tNl3K1HwNZVruVoFBlA&libraries=places&callback=initGMap" async defer></script>
                            <input id="searchInput" class="controls" type="text" placeholder="Enter a location" />
                            <div id="map" style="height: 400px; margin: 20px 0;"></div>
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                </div>
            </div>
        </div>
    </div>--%>
</body>
</html>

<%--
<script>
        function initGMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 18.52073289770824, lng: 73.85648647119137 },
                zoom: 13
            });
            var input = document.getElementById('searchInput');
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);

            var infowindow = new google.maps.InfoWindow();
            var marker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });

            autocomplete.addListener('place_changed', function () {
                infowindow.close();
                marker.setVisible(false);
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    window.alert("Autocomplete's returned place contains no geometry");
                    return;
                }

                // If the place has a geometry, then present it on a map.
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }
                marker.setIcon(({
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(35, 35)
                }));
                marker.setPosition(place.geometry.location);
                marker.setVisible(true);


                document.getElementById('lat').innerHTML = marker.getPosition().lat();
                document.getElementById('lon').innerHTML = marker.getPosition().lng();
            });

            //get lat and lng of draged pin            
            google.maps.event.addListener(marker, 'dragend', function () {
                document.getElementById('lat').innerHTML = marker.getPosition().lat();
                document.getElementById('lon').innerHTML = marker.getPosition().lng();
            });
        }

        function dropPin() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 18.52073289770824, lng: 73.85648647119137 },
                zoom: 13
            });

            var marker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });

            // if any previous marker exists, let's first remove it from the map
            if (marker) {
                marker.setMap(null);
            }
            // create the marker
            marker = new google.maps.Marker({
                position: map.getCenter(),
                map: map,
                draggable: true,
            });

            marker.setIcon(({
                    url: "https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png",
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(35, 35)
                }));

            document.getElementById('lat').innerHTML = marker.getPosition().lat();
            document.getElementById('lon').innerHTML = marker.getPosition().lng();
            // add an event "onDrag"
            google.maps.event.addListener(marker, 'dragend', function () {
                document.getElementById('lat').innerHTML = marker.getPosition().lat();
                document.getElementById('lon').innerHTML = marker.getPosition().lng();
            });
        }
    </script>--%>
