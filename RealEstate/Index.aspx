<%@ Page Title="Hunt Home" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RealEstate.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media only screen and (min-device-width : 480px) and (max-device-width : 1024px) {
            #mr-auto {
                margin: auto;
            }
        }

        @media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
            #bg {
                height: 500px;
                animation: move 10s infinite ease-in-out;
            }

            @keyframes move {
                0% {
                    transform: scale(1) rotate(0deg);
                }

                100% {
                    transform: scale(1.5) rotate(0.1deg);
                }
            }
        }
    </style>
    <script>
        window.onload = function () {
            var x = window.matchMedia("(min-width: 800px)")
            if (x.matches) { // If media query matches
                document.querySelector("aside").setAttribute("class", "search-area d-none d-xl-block d-lg-block");
                document.querySelector("aside").setAttribute("id", "search-area-4");
                document.getElementById("box").setAttribute("style", "box-shadow: 0px 8px 45px #aaaaaa;");
            }
            else {
                document.querySelector("aside").setAttribute("class", "search-area d-lg-none d-xl-none");
                document.querySelector("aside").setAttribute("id", "search-area-1");
            }

            var e = document.getElementById('<%=ddlStatus.ClientID%>')
            if (e.options[e.selectedIndex].value == "Rent") {
                document.getElementById("Price").style.display = "none";
                document.getElementById("Rent").style.display = "block";
            }
            else if (e.options[e.selectedIndex].value == "Sale") {
                document.getElementById("Rent").style.display = "none";
                document.getElementById("Price").style.display = "block";
            }

            //getSliderValues();
        }

        function ddlStatusChange(value) {
            if (value == "Rent") {
                document.getElementById("Price").style.display = "none";
                document.getElementById("Rent").style.display = "block";
            }
            else if (value == "Sale") {
                document.getElementById("Rent").style.display = "none";
                document.getElementById("Price").style.display = "block";
            }
        }

        function getSliderValues() {
            <%--var e = document.getElementById('<%=ddlStatus.ClientID%>')
            if (e.options[e.selectedIndex].value == "Rent") {
                document.getElementById('<%=lblMinRent.ClientID%>').value = document.getElementById("MinRent").value;
                document.getElementById('<%=lblMaxRent.ClientID%>').value = document.getElementById("MaxRent").value;
            }
            else if (e.options[e.selectedIndex].value == "Sale") {
                document.getElementById('<%=lblMinPrice.ClientID%>').value = document.getElementById("MinPrice").value;
                document.getElementById('<%=lblMaxPrice.ClientID%>').value = document.getElementById("MaxPrice").value;
            }--%>
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Banner start -->
    <div class="banner" id="banner">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img id="bg" class="d-block w-100" src="assets/img/banner-4.jpg" alt="banner">
                    <div class="carousel-caption banner-slider-inner d-flex h-100 text-center">
                        <div class="carousel-content container active">
                            <div class="text-center">
                                <div id="typed-strings">
                                    <p>Search for house of your choice at HUNT HOME.</p>
                                    <p>You don’t need to go hunting for house of your choice.</p>
                                    <p>Best Place For Property</p>
                                </div>
                                <h1 class="typed-text">&nbsp;
                               
                                    <span id="typed"></span>
                                </h1>
                                <p class="text-p" data-animation="animated fadeInUp delay-10s">
                                    We strive to provide you the best of the best properties of your choice.                
                                </p>
                                <a data-animation="animated fadeInUp delay-10s" href="Services.aspx" class="btn btn-white">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner end -->

    <!-- Search area start -->
    <aside>
        <div class="container">
            <div class="search-area-inner" id="box">
                <div class="search-contents">
                    <div class="row">
                        <div class="col-6 col-lg-3 col-md-3 col-sm-6">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlStatus" runat="server" class="selectpicker search-fields" onchange="ddlStatusChange(this.value);">
                                    <asp:ListItem Text="For Rent" Value="Rent" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="For Buying" Value="Sale"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-3">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlPropertyType" runat="server" class="selectpicker search-fields">
                                    <asp:ListItem Text="Property Types" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Apartment" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Independent House/Villa" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Independent floor" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Office" Value="5"></asp:ListItem>
									<asp:ListItem Text="Shop" Value="6"></asp:ListItem>
									<asp:ListItem Text="PG" Value="7"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLocation" runat="server" class="selectpicker search-fields"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 col-lg-3 col-md-3 col-sm-6">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlTenants" runat="server" class="selectpicker search-fields">
                                    <asp:ListItem Text="Preferred Tenants" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Family" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bachelor" Value="2"></asp:ListItem>
									<asp:ListItem Text="Bachelor Girls Only" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Company" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-3 col-sm-6">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlBedroom" runat="server" class="selectpicker search-fields">
                                    <asp:ListItem Text="Bedrooms" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Single Room" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="1 RK" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="1 BHK" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="2 BHK" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="3 BHK" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="4 BHK" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="4+ BHK" Value="7"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div id="Rent" class="form-group">
                                <%--<div class="range-slider">
                                    <div id="divRent" data-min="0" data-max="150000" data-unit="₹" data-min-name="min_rent" data-max-name="max_rent" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>--%>
                                <table>
                                    <tr>
                                        <td width="50%">
                                            <asp:DropDownList ID="ddlMinRent" runat="server" class="selectpicker search-fields" Width="80px">
                                                <asp:ListItem Text="Min Rent" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="5000" Value="5000"></asp:ListItem>
                                                <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                                <asp:ListItem Text="15000" Value="15000"></asp:ListItem>
                                                <asp:ListItem Text="20000" Value="20000"></asp:ListItem>
                                                <asp:ListItem Text="25000" Value="25000"></asp:ListItem>
                                                <asp:ListItem Text="30000" Value="30000"></asp:ListItem>
                                                <asp:ListItem Text="35000" Value="35000"></asp:ListItem>
                                                <asp:ListItem Text="40000" Value="40000"></asp:ListItem>
                                                <asp:ListItem Text="50000" Value="50000"></asp:ListItem>
                                                <asp:ListItem Text="60000" Value="60000"></asp:ListItem>
                                                <asp:ListItem Text="70000" Value="70000"></asp:ListItem>
                                                <asp:ListItem Text="80000" Value="80000"></asp:ListItem>
                                                <asp:ListItem Text="1 Lac" Value="100000"></asp:ListItem>
                                                <asp:ListItem Text="1.5 Lac" Value="150000"></asp:ListItem>
                                                <asp:ListItem Text="2 Lac" Value="200000"></asp:ListItem>
                                                <asp:ListItem Text="4 Lac" Value="400000"></asp:ListItem>
                                                <asp:ListItem Text="5 Lac" Value="500000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaxRent" runat="server" class="selectpicker search-fields">
                                                <asp:ListItem Text="Max Rent" Value="5000000"></asp:ListItem>
                                                <asp:ListItem Text="5000" Value="5000"></asp:ListItem>
                                                <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                                <asp:ListItem Text="15000" Value="15000"></asp:ListItem>
                                                <asp:ListItem Text="20000" Value="20000"></asp:ListItem>
                                                <asp:ListItem Text="25000" Value="25000"></asp:ListItem>
                                                <asp:ListItem Text="30000" Value="30000"></asp:ListItem>
                                                <asp:ListItem Text="35000" Value="35000"></asp:ListItem>
                                                <asp:ListItem Text="40000" Value="40000"></asp:ListItem>
                                                <asp:ListItem Text="50000" Value="50000"></asp:ListItem>
                                                <asp:ListItem Text="60000" Value="60000"></asp:ListItem>
                                                <asp:ListItem Text="70000" Value="70000"></asp:ListItem>
                                                <asp:ListItem Text="80000" Value="80000"></asp:ListItem>
                                                <asp:ListItem Text="1 Lac" Value="100000"></asp:ListItem>
                                                <asp:ListItem Text="1.5 Lac" Value="150000"></asp:ListItem>
                                                <asp:ListItem Text="2 Lac" Value="200000"></asp:ListItem>
                                                <asp:ListItem Text="4 Lac" Value="400000"></asp:ListItem>
                                                <asp:ListItem Text="5 Lac" Value="500000"></asp:ListItem>
                                                <asp:ListItem Text="5+ Lac" Value="5000000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="Price" class="form-group">
                                <%--<div class="range-slider">
                                    <div id="divPrice" data-min="0" data-max="20000000" data-unit="₹" data-min-name="min_Price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>--%>
                                <table>
                                    <tr>
                                        <td width="50%">
                                            <asp:DropDownList ID="ddlMinPrice" runat="server" class="selectpicker search-fields">
                                                <asp:ListItem Text="Min Price" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="5 Lac" Value="500000"></asp:ListItem>
                                                <asp:ListItem Text="10 Lac" Value="1000000"></asp:ListItem>
                                                <asp:ListItem Text="20 Lac" Value="2000000"></asp:ListItem>
                                                <asp:ListItem Text="30 Lac" Value="3000000"></asp:ListItem>
                                                <asp:ListItem Text="40 Lac" Value="4000000"></asp:ListItem>
                                                <asp:ListItem Text="50 Lac" Value="5000000"></asp:ListItem>
                                                <asp:ListItem Text="60 Lac" Value="6000000"></asp:ListItem>
                                                <asp:ListItem Text="70 Lac" Value="7000000"></asp:ListItem>
                                                <asp:ListItem Text="80 Lac" Value="8000000"></asp:ListItem>
                                                <asp:ListItem Text="90 Lac" Value="9000000"></asp:ListItem>
                                                <asp:ListItem Text="1 Cr" Value="10000000"></asp:ListItem>
                                                <asp:ListItem Text="1.2 Cr" Value="12000000"></asp:ListItem>
                                                <asp:ListItem Text="1.4 Cr" Value="14000000"></asp:ListItem>
                                                <asp:ListItem Text="1.6 Cr" Value="16000000"></asp:ListItem>
                                                <asp:ListItem Text="1.8 Cr" Value="18000000"></asp:ListItem>
                                                <asp:ListItem Text="2 Cr" Value="20000000"></asp:ListItem>
                                                <asp:ListItem Text="2.5 Cr" Value="25000000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td width="50%">
                                            <asp:DropDownList ID="ddlMaxPrice" runat="server" class="selectpicker search-fields">
                                                <asp:ListItem Text="Max Price" Value="500000000"></asp:ListItem>
                                                <asp:ListItem Text="5 Lac" Value="500000"></asp:ListItem>
                                                <asp:ListItem Text="10 Lac" Value="1000000"></asp:ListItem>
                                                <asp:ListItem Text="20 Lac" Value="2000000"></asp:ListItem>
                                                <asp:ListItem Text="30 Lac" Value="3000000"></asp:ListItem>
                                                <asp:ListItem Text="40 Lac" Value="4000000"></asp:ListItem>
                                                <asp:ListItem Text="50 Lac" Value="5000000"></asp:ListItem>
                                                <asp:ListItem Text="60 Lac" Value="6000000"></asp:ListItem>
                                                <asp:ListItem Text="70 Lac" Value="7000000"></asp:ListItem>
                                                <asp:ListItem Text="80 Lac" Value="8000000"></asp:ListItem>
                                                <asp:ListItem Text="90 Lac" Value="9000000"></asp:ListItem>
                                                <asp:ListItem Text="1 Cr" Value="10000000"></asp:ListItem>
                                                <asp:ListItem Text="1.2 Cr" Value="12000000"></asp:ListItem>
                                                <asp:ListItem Text="1.4 Cr" Value="14000000"></asp:ListItem>
                                                <asp:ListItem Text="1.6 Cr" Value="16000000"></asp:ListItem>
                                                <asp:ListItem Text="1.8 Cr" Value="18000000"></asp:ListItem>
                                                <asp:ListItem Text="2.3 Cr" Value="23000000"></asp:ListItem>
                                                <asp:ListItem Text="2.6 Cr" Value="26000000"></asp:ListItem>
                                                <asp:ListItem Text="3 Cr" Value="30000000"></asp:ListItem>
                                                <asp:ListItem Text="3.5 Cr" Value="35000000"></asp:ListItem>
                                                <asp:ListItem Text="4 Cr" Value="40000000"></asp:ListItem>
                                                <asp:ListItem Text="4.5 Cr" Value="45000000"></asp:ListItem>
                                                <asp:ListItem Text="5 Cr" Value="50000000"></asp:ListItem>
                                                <asp:ListItem Text="10 Cr" Value="100000000"></asp:ListItem>
                                                <asp:ListItem Text="20 Cr" Value="200000000"></asp:ListItem>
                                                <asp:ListItem Text="20+ Cr" Value="500000000"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12" style="margin:0 auto">
                            <div class="form-group">
                                <button id="btnSearch" runat="server" class="search-button btn-md btn-color" onclick="getSliderValues();" onserverclick="btnSearch_Onclick">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </aside>
    <!-- Search area start -->

    <!-- Featured properties start -->

    <asp:Label ID="lblAlert" runat="server" Visible="false"></asp:Label>
    <div class="featured-properties content-area-19">
        <div class="container">
            <asp:TextBox ID="lblMinRent" runat="server" Text="0" Font-Size="1px" ForeColor="#fafafa" BorderStyle="None"></asp:TextBox>
            <asp:TextBox ID="lblMaxRent" runat="server" Text="100000" Font-Size="1px" ForeColor="#fafafa" BorderStyle="None"></asp:TextBox>
            <asp:TextBox ID="lblMinPrice" runat="server" Text="0" Font-Size="1px" ForeColor="#fafafa" BorderStyle="None"></asp:TextBox>
            <asp:TextBox ID="lblMaxPrice" runat="server" Text="20000000" Font-Size="1px" ForeColor="#fafafa" BorderStyle="None"></asp:TextBox>
            <div class="main-title">
                <h1>Featured properties</h1>
                <p>The essence of life lies in comfort living</p>
            </div>
            <div class="row">
                <asp:Repeater ID="rptrFeaturedProperty" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6 col-md-6 wow fadeInLeft delay-04s">
                            <div class="media property-box-3">
                                <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                    <img src='<%# Eval("path").ToString() == "Null" ? "assets/img/NoImage.png" : Eval("path").ToString() == "" ? "assets/img/NoImage.png" : Eval("path") %>' alt='<%# Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() %>' class="img-fluid">
                                </a>
                                <div class="media-body align-self-center">
                                    <h3 class="mt-0">
                                        <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                            <asp:Label ID="lblName" runat="server" Text='<%# (Eval("bedrooms").ToString() == "Null" ? "" :Eval("bedrooms").ToString()) + " " + Eval("propertyType").ToString() %>' ToolTip='<%# Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() %>'></asp:Label>
                                        </a>
                                    </h3>
                                    <h5>₹ &nbsp<asp:Label ID="lblRent" runat="server" Text='<%# Eval("rentORSale").ToString()== "Rent" ? Eval("rent").ToString() : Eval("price").ToString() %>'></asp:Label>
                                    </h5>
                                    <p>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description").ToString()%>'></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- Featured properties end -->

    <!-- services start -->
    <div class="services content-area-2 bg-white">
        <div class="container">
            <div class="main-title">
                <h1>How it works</h1>
                <p>Searching for home has got easier.follow these simple steps and relax</p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services-info-2">
                        <i class="flaticon-user"></i>
                        <h5>Worried of mocking people for property </h5>
                        <p>Search from a pool of properties with the best to suit your criteria. Shortlist you favorite properties.
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services-info-2">
                        <i class="flaticon-hotel-building"></i>
                        <h5>Frustrated of contacting arrogant people</h5>
                        <p>Contact our professional agent. Get personalized service for your property of choice.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 d-none d-md-block d-lg-block">
                    <div class="services-info-2">
                        <i class="flaticon-money-bag-with-dollar-symbol"></i>
                        <h5>Make a deal</h5>
                        <p>Make a deal and get ready to move in. Get possession of the property.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- services end -->

    <!-- Recent Properties start -->
    <div class="recent-properties content-area-2">
        <div class="container">
            <div class="main-title">
                <h1>Recent Properties</h1>
                <p>Top recently posted properties</p>
            </div>
            <div class="row">
                <asp:Repeater ID="rptrRecentProperty" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6 col-sm-6 wow fadeInLeft delay-04s">
                            <div class="property-box-8">
                                <div class="property-photo">
                                    <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                        <img src='<%# Eval("path").ToString() == "Null" ? "assets/img/NoImage.png" : Eval("path").ToString() == "" ? "assets/img/NoImage.png" : Eval("path") %>' alt='<%# Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() %>' class="img-fluid recent-img">
                                    </a>                                    
                                    <div class="date-box">For <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("rentOrSale").ToString() %>'></asp:Label></div>
                                </div>
                                <div class="detail">
                                    <div class="heading">
                                        <h3 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;width:100%">
                                            <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                                <asp:Label ID="lblName" runat="server" Text='<%# (Eval("bedrooms").ToString() == "Null" ? "" :Eval("bedrooms").ToString()) + " " + Eval("propertyType").ToString() %>' ToolTip='<%# Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() %>'></asp:Label>
                                            </a>
                                        </h3>
                                        <div class="location">
                                            <a href="javascript:void(0)">
                                                <i class="flaticon-facebook-placeholder-for-locate-places-on-maps"></i> &nbsp <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("location").ToString() %>'></asp:Label>,
                                            </a>
                                        </div>
                                    </div>
                                    <div class="properties-listing">
                                        <span><asp:Label ID="lblBed" CssClass="float-none" runat="server" Text='<%# Eval("bed").ToString() == "Single " ? "0" : Eval("bed").ToString() == "" ? "0" : Eval("bed").ToString() == "Null" ? "0" : Eval("bed").ToString()%>'></asp:Label> Bed</span>
                                        <span><asp:Label ID="lblBath" CssClass="float-none" runat="server" Text='<%# Eval("bathrooms").ToString() == "" ? "0" : Eval("bathrooms").ToString() == "Null" ? "0" : Eval("bathrooms").ToString() %>'></asp:Label> Baths</span>
                                        <span><asp:Label ID="lblArea" CssClass="float-none" runat="server" Text='<%# Eval("area").ToString() + (Eval("propertyType").ToString() == "Plot" ? " Guntha" : " sqft") %>'></asp:Label></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- Recent Properties end -->


    <!-- Testimonial 2 start -->
    <div class="testimonial-2 overview-bgi" style="background-image: url(assets/img/testimonial-property.jpg)">
        <div class="container">
            <div class="row">
                <div class="offset-lg-2 col-lg-8">
                    <div class="testimonial-inner">
                        <header class="testimonia-header">
                            <h1>Testimonial</h1>
                        </header>
                        <div id="carouselExampleIndicators7" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="avatar">
                                                <img src="assets/img/avatar/prashantKumar.jpg" alt="Prashant Kumar" class="img-fluid rounded">
                                            </div>
                                        </div>
                                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                            <p class="lead">
                                                 I thought shifting in new city is a headache but, with personalised associate from Hunt Home reduced this headache for me. Thankful to Hunt Home.
                                            </p>
                                            <div class="author-name">
                                               Mr. Prashant Kumar                                       
                                            </div>
                                            <ul class="rating">
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="avatar">
                                                <img src="assets/img/avatar/tusharPandit.jpg" alt="Tushar Pandit" class="img-fluid rounded">
                                            </div>
                                        </div>
                                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                            <p class="lead">
                                               I got quick service from Hunt Home. I was looking to sell my property. Instant sale on site amazed me.                                       
                                            </p>
                                            <div class="author-name">
                                                Mr. Tushar Pandit                                       
                                            </div>
                                            <ul class="rating">
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star-o"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="avatar">
                                                <img src="assets/img/avatar/avatar.jpg" alt="Chetan Dighe" class="img-fluid rounded">
                                            </div>
                                        </div>
                                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                            <p class="lead">
                                                No hustle to sale / rent property on Hunt Home. Just post your property and relax. It's been easier for me to rent my properties since I have joined Hunt Home  .
                                            </p>
                                            <div class="author-name">
                                                Chetan Dighe                                       
                                            </div>
                                            <ul class="rating">
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star-half-full"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a class="carousel-control-prev" href="#carouselExampleIndicators7" role="button" data-slide="prev">
                                <span class="slider-mover-left" aria-hidden="true">
                                    <i class="fa fa-angle-left"></i>
                                </span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators7" role="button" data-slide="next">
                                <span class="slider-mover-right" aria-hidden="true">
                                    <i class="fa fa-angle-right"></i>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial 2 end -->

    <!-- intro section start -->
    <div class="intro-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <img src="assets/img/logos/logo.png" alt="logo">
                </div>
                <div id="mr-auto" class="col-lg-6 col-md-6 col-sm-12" style="text-align:center">
                    <div class="intro-text">
                        <h3>Looking To Sell Or Rent Your Property?</h3>
                    </div>
                </div>
                <div id="mr-auto" class="col-lg-3 col-md-3 col-sm-12">
                    <a href="PostProperty.aspx" class="btn btn-md sn">Post Now</a>
                </div>
            </div>
        </div>
    </div>
    <!-- intro section end -->
</asp:Content>