<%@ Page Title="Properties" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Properties.aspx.cs" Inherits="RealEstate.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <style>
        .property-box .footer span {
            float: none;
        }
        .img-fluid {
            height:223px;
        }

        .filter {
            padding:10px;
            border:1px solid #444444
        }
        
    </style>
    <script>
        window.onload = function () {            
            var x = window.matchMedia("(min-width: 800px)")
            if (x.matches) { // If media query matches
                //document.getElementById("tblBtn").style.display = "none";
            }
            else {
                document.getElementById("collapse1").classList.remove("show");
                document.getElementById("categories").style.display = "none";
                document.getElementById("recentPosts").style.display = "none";
                document.getElementById("filter").classList.add("filter");
               <%-- document.getElementById('<%=btnSearch1.ClientID%>').style.display = "none";--%>
            }

            var  e = document.getElementById('<%=ddlStatus.ClientID%>')
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

        function hideFilter() {
            document.getElementById("collapse1").classList.remove("show");
        }

        function ddlStatusChange(value)
        {
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
          <%--  var e = document.getElementById('<%=ddlStatus.ClientID%>')
            if (e.options[e.selectedIndex].value == "Rent") {              
                document.getElementById('<%=lblMinRent.ClientID%>').value = document.getElementById("MinRent").value;
                document.getElementById('<%=lblMaxRent.ClientID%>').value = document.getElementById("MaxRent").value;
            }
            else if (e.options[e.selectedIndex].value == "Sale") {
                document.getElementById('<%=lblMinPrice.ClientID%>').value = document.getElementById("MinPrice").value;
                document.getElementById('<%=lblMaxPrice.ClientID%>').value = document.getElementById("MaxPrice").value;
            }--%>
        }
        
        <%--function setRange() {
            alert(document.getElementById('<%=lblMaxRent.ClientID%>').value);
            document.getElementById("divRent").setAttribute("data-min", document.getElementById('<%=lblMinRent.ClientID%>').value);
            document.getElementById("divRent").setAttribute("data-max", document.getElementById('<%=lblMaxRent.ClientID%>').value);
            document.getElementById("divPrice").setAttribute("data-min", document.getElementById('<%=lblMinPrice.ClientID%>').value);
            document.getElementById("divPrice").setAttribute("data-max", document.getElementById('<%=lblMaxPrice.ClientID%>').value);
        }--%>
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
    <!-- Sub banner start -->
    <div class="sub-banner overview-bgi">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Properties Grid</h1>
                <ul class="breadcrumbs">
                    <li><a href="Index.aspx">Home</a></li>
                    <li class="active">Properties Grid</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Sub banner end -->

    <!-- Properties list rightside start -->
    <div class="properties-list-rightside content-area-2">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="sidebar mrb">
                        <!-- Search area start -->
                        <div class="widget search-area">
                            <div id="Div1" runat="server" class="panel panel-default">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collaps-btn">
                                        <h5 class="sidebar-title panel-title">
                                            <span id="search">Advanced Search</span>
                                            <span  style="float: right">
                                                <i id="filter" class="fa fa-filter" aria-hidden="true"></i>
                                            </span>
                                        </h5>
                                    </a>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse show">
                                    <div class="search-area-inner">
                                        <div class="search-contents ">
                                            <div id="SortDropdown" class="form-group">
                                                <label>Sort &nbsp<i class="fa fa-sort"></i></label>
                                                <asp:DropDownList ID="ddlSort1" runat="server" class="selectpicker search-fields">
                                                    <asp:ListItem Text="Sort" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Low to High" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="High to Low" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Property For</label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" class="selectpicker search-fields" onchange="ddlStatusChange(this.value);">
                                                    <asp:ListItem Text="Rent" Value="Rent" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Buy" Value="Sale"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Property Types</label>
                                                <asp:DropDownList ID="ddlPropertyType" runat="server" class="selectpicker search-fields">
                                                    <asp:ListItem Text="All Types" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Apartment" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Independent House/Villa" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Independent floor" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Office" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Shop" Value="6"></asp:ListItem>
                                                    <asp:ListItem Text="PG" Value="7"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Location</label>
                                                <asp:DropDownList ID="ddlLocation" runat="server" class="selectpicker search-fields"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Preferred Tenants</label>
                                                <asp:DropDownList ID="ddlTenants" runat="server" class="selectpicker search-fields">
                                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Family" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Bachelor" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Bachelor Girls Only" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Company" Value="4"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Bedrooms</label>
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
                                            <div id="Rent" class="form-group">
                                                <label>Rent</label>
                                                <%--<div class="range-slider">
                                                    <div id="divRent" data-min="0" data-max="100000" data-unit="₹" data-min-name="min_rent" data-max-name="max_rent" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                                    <div class="clearfix"></div>
                                                </div>--%>
                                                <table>
                                                    <tr>
                                                        <td Width="50%">
                                                            <asp:DropDownList ID="ddlMinRent" runat="server" class="selectpicker search-fields" Width="80px">
                                                                <asp:ListItem Text="Min" Value="0"></asp:ListItem>
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
                                                                <asp:ListItem Text="Max" Value="5000000"></asp:ListItem>
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
                                                <label>Price</label>
                                                <%--<div class="range-slider">
                                                    <div id="divPrice" data-min="0" data-max="20000000" data-unit="₹" data-min-name="min_Price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                                    <div class="clearfix"></div>
                                                </div>--%>
                                                <table>
                                                    <tr>
                                                        <td Width="50%">
                                                            <asp:DropDownList ID="ddlMinPrice" runat="server" class="selectpicker search-fields">
                                                                <asp:ListItem Text="Min" Value="0"></asp:ListItem>
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
                                                        <td Width="50%">
                                                            <asp:DropDownList ID="ddlMaxPrice" runat="server" class="selectpicker search-fields">
                                                                <asp:ListItem Text="Max" Value="500000000"></asp:ListItem>
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
                                            <div class="form-group">
                                                <label>Bathrooms</label>
                                                <asp:DropDownList ID="ddlBathroom" runat="server" class="selectpicker search-fields">
                                                    <asp:ListItem Text="Bathrooms" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="4+" Value="4+"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <br>
                                            <br />
                                            <%--<button id="btnSearch1" runat="server" class="search-button btn-md btn-color" onserverclick="btnSearch_Onclick" onclick="getSliderValues();">Search</button>                                            --%>
                                            <table id="tblBtn">
                                                <tr>
                                                    <td width="48%">
                                                        <button runat="server" class="search-button btn-md btn-secondary" onserverclick="btnClear_Onclick">Clear</button></td>
                                                    <td width="48%">
                                                        <button id="btnSearch2" runat="server" class="search-button btn-md btn-color" onserverclick="btnSearch_Onclick" onclick="getSliderValues();">Search</button></td>
                                                    <td width="4%"></td>                                                    
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Categories start -->
                        <div id="categories" class="widget categories">
                            <h5 class="sidebar-title">Categories</h5>
                            <ul>
                                <li>Apartments<span><asp:Label ID="lblApartment" runat="server"></asp:Label></span></li>
                                <li>Independent House/Villa<span><asp:Label ID="lblVilla" runat="server"></asp:Label></span></li>
                                <li>Independent floor<span><asp:Label ID="lblIndependentFloor" runat="server"></asp:Label></span></li>                                
                                <li>Office<span><asp:Label ID="lblOffice" runat="server"></asp:Label></span></li>
                                <li>Plot<span><asp:Label ID="lblPlot" runat="server"></asp:Label></span></li>
                            </ul>
                        </div>

                        <!-- Recent posts start -->
                        <div id="recentPosts" class="widget recent-posts">
                            <h5 class="sidebar-title">Recent Properties</h5>
                            <asp:Repeater ID="rptrRecentProperty" runat="server">
                                <ItemTemplate>
                                    <div class="media mb-4">
                                        <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                            <img src='<%# Eval("path").ToString() == "Null" ? "assets/img/NoImage.png" :  Eval("path") %>' alt="sub-property-2">
                                        </a>
                                        <div class="media-body align-self-center">
                                            <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;width:65%">
                                                <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                                    <asp:Label ID="lblName" runat="server" Text='<%# (Eval("bedrooms").ToString() == "Null" ? "" :Eval("bedrooms").ToString()) + " " + Eval("propertyType").ToString() + " in " + Eval("Location").ToString() %>' ToolTip='<%# Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() + " in " + Eval("Location").ToString() %>' ></asp:Label>
                                                </a>
                                            </h5>
                                            <p><asp:Label ID="lblPost1" runat="server" Text='<%# (DateTime.Now - Convert.ToDateTime(Eval("postDate"))).TotalDays <= 30 ? string.Format("{0:0}",(DateTime.Now - Convert.ToDateTime(Eval("postDate"))).TotalDays) + " days ago" :  Eval("postDate", "{0:dd-MMM-yyyy}").ToString()%>'></asp:Label></p>
                                            <p><strong>₹ &nbsp<asp:Label ID="lblRent1" runat="server" Text='<%# Eval("rent").ToString() %>'></asp:Label></strong></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <asp:TextBox ID="lblLocations" runat="server" Font-Size="1px" Height="1px" ForeColor="#fafafa" BackColor="#fafafa" BorderStyle="None"></asp:TextBox>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="option-bar d-none d-xl-block d-lg-block d-md-block d-sm-block">
                        <div class="row clearfix">
                            <div class="col-xl-4 col-lg-5 col-md-5 col-sm-5">
                                <h4>
                                    <span class="heading-icon">
                                        <i class="fa fa-caret-right icon-design"></i>
                                        <i class="fa fa-th-large"></i>
                                    </span>
                                    <span class="heading">Properties Grid</span>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="subtitle">
                        <asp:Label ID="lblCount" runat="server"></asp:Label>
                        Result Found               
                    </div>

                    <div class="row">
                        <asp:Label ID="lblAlert" runat="server" Visible="false"></asp:Label>
                        <asp:Repeater ID="rptrProperties" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="property-box">
                                        <div class="property-thumbnail">
                                            <a href="javascript:void(0)" class="property-img">
                                                <div id="divVerifiy" class="tag button alt featured">
                                                    <%--<asp:Label ID="Label1" runat="server" Text='<%# Convert.ToBoolean(Eval("isVerified")) ? "Verified" : "" %>'></asp:Label>--%>
                                                </div>
                                                <div class="price-ratings-box">
                                                    <p class="price">
                                                        ₹ &nbsp<asp:Label ID="lblRent" runat="server" Text='<%# ddlStatus.SelectedItem.Value == "Rent" ? Eval("rent").ToString() : Eval("price").ToString() %>'></asp:Label>
                                                    </p>
                                                    <%--<div class="ratings">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>--%>
                                                </div>
                                                <img src='<%# Eval("path").ToString() == "" ? "assets/img/NoImage.png" :  Eval("path") %>' alt='<%# Eval("bedrooms").ToString() == "" ? (Eval("area").ToString() + " " + (Eval("propertyType").ToString()=="Plot" ?"Guntha" : "Sq Ft.")) : Eval("bedrooms").ToString() + " " + Eval("propertyType").ToString() + " in " + Eval("location").ToString() %>' class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="detail">
                                            <h1 class="title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                <a href='<%# "PropertyDetails.aspx?ID=" + Eval("propertyID").ToString() %>' target="_blank">
                                                    <asp:Label ID="lblPropertyName" runat="server" Text='<%# (Eval("bedrooms").ToString() == "" ? (Eval("area").ToString() + " " + (Eval("propertyType").ToString()=="Plot" ?"Guntha" : "Sq Ft.")) : Eval("bedrooms"))+ " " + Eval("propertyType").ToString() + " in " + Eval("Location").ToString() %>' ToolTip='<%# (Eval("bedrooms").ToString() == "" ? (Eval("area").ToString() + " " + (Eval("propertyType").ToString()=="Plot" ?"Guntha" : "Sq Ft.")) : Eval("bedrooms") )+ " " + Eval("propertyType").ToString() + " in " + Eval("Location").ToString() %>'></asp:Label></a>
                                            </h1>
                                            <div class="location">
                                                <a href="javascript:void(0)">
                                                    <i class="fa fa-map-marker"></i>
                                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                                </a>
                                            </div>
                                            <ul class="facilities-list clearfix">
                                                <li title="Furnishing Status">
                                                    <i class="flaticon-bed"></i>
                                                    <asp:Label ID="lblFurnished" runat="server" Text='<%# Eval("furnished").ToString() %>'></asp:Label>
                                                </li>
                                                <li title="Preferred Tenants">
                                                    <i class="flaticon-user"></i>
                                                    <asp:Label ID="lblTenants" runat="server" Text='<%# Eval("preferredTenants").ToString() %>'></asp:Label>
                                                </li>
                                                <li title="Area">
                                                    <i class="flaticon-square-layouting-with-black-square-in-east-area"></i><asp:Label ID="lblarea" runat="server" Text='<%# Eval("area").ToString() + " " + (Eval("propertyType").ToString()=="Plot" ?"Guntha" : "Sq Ft.") %>'></asp:Label>
                                                </li>
                                                <li title="Age of Property">
                                                    <i class="fa fa-hourglass-half" style="font-size:12px"></i>
                                                    <asp:Label ID="lblPropertyAge" runat="server" Text='<%# Eval("age").ToString() + " years" %>'></asp:Label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="footer">
                                            <table>
                                                <tr>
                                                    <td width="50%">
                                                        <a href="#">
                                                            <i class="fa fa-key" title="Possession Date"></i>
                                                            <asp:Label ID="lblPossession" runat="server" Text='<%# Convert.ToDateTime(Eval("possessionDate")) < DateTime.Now ? "Ready to Move" : Eval("possessionDate", "{0:dd-MMM-yyyy}").ToString() %>'></asp:Label>
                                                        </a>
                                                    </td>
                                                    <td width="50%" style="text-align: right">
                                                        <span>
                                                            <i class="fa fa-calendar-o"></i>
                                                            <asp:Label ID="lblPost" runat="server" Text='<%# (DateTime.Now - Convert.ToDateTime(Eval("postDate"))).TotalDays <= 30 ? string.Format("{0:0}",(DateTime.Now - Convert.ToDateTime(Eval("postDate"))).TotalDays) + " days ago" :  Eval("postDate", "{0:dd-MMM-yyyy}").ToString()%>'></asp:Label>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="col-lg-12">
                            <div class="pagination-box text-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="javascript: void(0);"><span aria-hidden="true">«</span></a></li>
                                        <asp:Repeater ID="rptPager" runat="server">
                                            <ItemTemplate>
                                                <li class="page-item">
                                                    <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>' CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page-link page_enabled" : "page-link active page_disabled"%>' OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <li class="page-item"><a class="page-link" href="javascript: void(0);"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Properties list rightside end -->
</asp:Content>
