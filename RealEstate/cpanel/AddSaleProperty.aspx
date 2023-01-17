<%@ Page Title="" Language="C#" MasterPageFile="../cpanel/MasterCP.Master" AutoEventWireup="true" CodeBehind="AddSaleProperty.aspx.cs" Inherits="RealEstate.cpanel.AddSaleProperty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <style>
        table td {
            padding: 0 10px;
        }

        table label {
            padding-left: 7px;
        }

        .collaps-btn i {
            float: right;
            border: 1px solid #afafaf;
            border-radius: 50px;
        }

        .panel {
            margin-bottom: 0;
        }

        .panel-heading {
            padding: 5px 20px;
        }

        @media only screen and (min-width : 770px) {
            .wrapper-content {
                width: 70%;
                margin: auto;
            }
        }

        @media only screen and (max-width : 770px) {
            table label {
                padding-left: 7px;
                font-size: 10px;
            }
        }
        .fontAwesome {
            font-family: Helvetica, 'FontAwesome', sans-serif;
        }
    </style>
    <script>     
        function validateForm() {
            if (document.getElementById('<%=ddlPropertyType.ClientID%>').value == "0") {
                document.getElementById("lblPropertyType").style.display = "block";
                document.getElementById('<%=ddlPropertyType.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtArea.ClientID%>').value == "") {
                document.getElementById("lblArea").style.display = "block";
                document.getElementById('<%=txtArea.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlLocation.ClientID%>').value == "0") {
                document.getElementById("lblLocation").style.display = "block";
                document.getElementById('<%=ddlLocation.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtFlatNo.ClientID%>').value == "" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblFlatNo").style.display = "block";
                document.getElementById('<%=txtFlatNo.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtAddress.ClientID%>').value == "") {
                document.getElementById("lblAddress").style.display = "block";
                document.getElementById('<%=txtAddress.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlSource.ClientID%>').value == "0") {
                document.getElementById("lblSource").style.display = "block";
                document.getElementById('<%=ddlSource.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtContactName.ClientID%>').value == "") {
                document.getElementById("lblContactName").style.display = "block";
                document.getElementById('<%=txtContactName.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtContactNo.ClientID%>').value == "") {
                document.getElementById("lblContactNo").style.display = "block";
                document.getElementById('<%=txtContactNo.ClientID%>').focus();
                return false;
            }            
            if (document.getElementById('<%=txtContactNo.ClientID%>').value.length < 10) {
                document.getElementById("lblContactNo1").style.display = "block";
                document.getElementById('<%=txtContactNo.ClientID%>').focus();
                return false;
            }

            var rb = document.getElementById("<%=rdbBroker.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            var isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked) {
                document.getElementById("lblBroker").style.display = "block";
                document.getElementById('<%=rdbBroker.ClientID%>').focus();
                window.setTimeout(function () {$("#lblBroker").attr("style", "display:none"); }, 4000);
                return false;
            }

            if (document.getElementById('<%=txtPossessionDate.ClientID%>').value == "") {
                document.getElementById("lblPossessionDate").style.display = "block";
                document.getElementById('<%=txtPossessionDate.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlRoom.ClientID%>').value == "0" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "3"  && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblRoom").style.display = "block";
                document.getElementById('<%=ddlRoom.ClientID%>').focus();
                return false;
            }

            rb = document.getElementById("<%=rdbBath.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked  && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "3"  && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblBath").style.display = "block";
                document.getElementById('<%=rdbBath.ClientID%>').focus();
                window.setTimeout(function () {$("#lblBath").attr("style", "display:none"); }, 4000);
                return false;
            }

            if (document.getElementById('<%=txtFloor.ClientID%>').value == "" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblFloor").style.display = "block";
                document.getElementById('<%=txtFloor.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtTotalFloor.ClientID%>').value == "" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblTotalFloor").style.display = "block";
                document.getElementById('<%=txtTotalFloor.ClientID%>').focus();
                return false;
            }            
            if (document.getElementById('<%=txtTotalFloor.ClientID%>').value < document.getElementById('<%=txtFloor.ClientID%>').value && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblTotalFloor1").style.display = "block";
                document.getElementById('<%=txtTotalFloor.ClientID%>').focus();
                return false;
            }  
            
            rb = document.getElementById("<%=rdbFurnishing.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblFurnishing").style.display = "block";
                document.getElementById('<%=rdbFurnishing.ClientID%>').focus();
                window.setTimeout(function () {$("#lblFurnishing").attr("style", "display:none"); }, 4000);
                return false;
            }

            rb = document.getElementById("<%=rdbParking.ClientID%>");
            radio = rb.getElementsByTagName("input");
            isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblParking").style.display = "block";
                document.getElementById('<%=rdbParking.ClientID%>').focus();
                window.setTimeout(function () {$("#lblParking").attr("style", "display:none"); }, 4000);
                return false;
            } 

            if (document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
            
            if (document.getElementById('<%=txtPercentage.ClientID%>').value == "") {
                document.getElementById("lblBrokeragePercentage").style.display = "block";
                document.getElementById('<%=txtPercentage.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=txtBrokerage.ClientID%>').value == "") {
                document.getElementById("lblBrokerage").style.display = "block";
                document.getElementById('<%=txtBrokerage.ClientID%>').focus();
                return false;
            } 
            if (document.getElementById('<%=ddlShowContact.ClientID%>').value == "00") {
                document.getElementById("lblShowContact").style.display = "block";
                document.getElementById('<%=ddlShowContact.ClientID%>').focus();
                return false;
            }
        }

        function hidePropertyTypelbl() {
            document.getElementById("lblPropertyType").style.display = "none"
        }
        function hideLocationlbl() {
            document.getElementById("lblLocation").style.display = "none"
        }
        function hideFlatNolbl() {
            document.getElementById("lblFlatNo").style.display = "none";
        }
        function hideAddresslbl() {
            document.getElementById("lblAddress").style.display = "none"
        }
        function hideSourcelbl() {
            document.getElementById("lblSource").style.display = "none"
        }
        function hideContactNamelbl() {
            document.getElementById("lblContactName").style.display = "none"
        }
        function hidePossessionDatelbl() {
            document.getElementById("lblPossessionDate").style.display = "none"
        }
        function hideRoomlbl() {
            document.getElementById("lblRoom").style.display = "none"
        }
        function hideFloorlbl() {
            document.getElementById("lblFloor").style.display = "none"
            document.getElementById("lblTotalFloor1").style.display = "none";
        }
        function hideTotalFloorlbl() {
            document.getElementById("lblTotalFloor").style.display = "none"
            document.getElementById("lblTotalFloor1").style.display = "none";
        }
        function hidePricelbl() {
            document.getElementById("lblPrice").style.display = "none"
        }        
        function hideDepositlbl() {
            document.getElementById("lblDeposit").style.display = "none"
        }                
        function hideBrokeragelbl() {
            document.getElementById("lblBrokerage").style.display = "none"
        }
        function hideShowContactlbl() {
            document.getElementById("lblShowContact").style.display = "none";
        }
        
        function hideArealbl() {            
            document.getElementById("lblArea").style.display = "none";
        }
        function hideContactlbl() {            
            document.getElementById("lblContactNo").style.display = "none";
            document.getElementById("lblContactNo1").style.display = "none";
        }
        function hideBrokeragePercentagelbl() {
            document.getElementById("lblBrokeragePercentage").style.display = "none";
            if (document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
        }

        function isDecimalNumber(evt, c) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            var dot1 = c.value.indexOf('.');
            var dot2 = c.value.lastIndexOf('.');

            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            else if (charCode == 46 && (dot1 == dot2) && dot1 != -1 && dot2 != -1)
                return false;

            return true;
        }
        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") != -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
                        
            return true;
        }

        //ddl Change
        function ddlTypeChange(value) {
            if (value == "4") {
                document.getElementById('<%=lblAreaUnit.ClientID%>').innerText = "Guntha";
            }
            else {
                document.getElementById('<%=lblAreaUnit.ClientID%>').innerText = "Sq Ft.";
            }
        }

         function calculateBrokerage() {
            if (document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
            else {
                var price = document.getElementById('<%=txtPrice.ClientID%>').value;
                var percent = document.getElementById('<%=txtPercentage.ClientID%>').value;

                document.getElementById('<%=txtBrokerage.ClientID%>').value = (price) * (percent / 100).toFixed(2);
            }            
        }

        function calculatePercentage(brokerage) {
            if (document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
            else {
                var price = document.getElementById('<%=txtPrice.ClientID%>').value;
                document.getElementById('<%=txtPercentage.ClientID%>').value = ((brokerage / price) * (100)).toFixed(2);
            }            
        }

        function priceOnfocusOut(price) {
            var percent = document.getElementById('<%=txtPercentage.ClientID%>').value;
            document.getElementById('<%=txtBrokerage.ClientID%>').value = (price) * (percent / 100).toFixed(2);
        }
    </script>
    <%--script for img upload--%>
    <script type="text/javascript">
        function previewFile1() {
            var preview1 = document.querySelector('#<%=Image1.ClientID %>');
            var file1 = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var reader1 = new FileReader();

            reader1.onloadend = function () {
                preview1.src = reader1.result;
            }

            if (file1) {
                reader1.readAsDataURL(file1);
                document.querySelector('#<%=lblImg1.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload1.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview1.src = "";
            }
        }

        function previewFile2() {
            var preview2 = document.querySelector('#<%=Image2.ClientID %>');
            var file2 = document.querySelector('#<%=FileUpload2.ClientID %>').files[0];
            var reader2 = new FileReader();

            reader2.onloadend = function () {
                preview2.src = reader2.result;
            }

            if (file2) {
                reader2.readAsDataURL(file2);
                document.querySelector('#<%=lblImg2.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload2.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview2.src = "";
            }
        }

        function previewFile3() {
            var preview3 = document.querySelector('#<%=Image3.ClientID %>');
            var file3 = document.querySelector('#<%=FileUpload3.ClientID %>').files[0];
            var reader3 = new FileReader();

            reader3.onloadend = function () {
                preview3.src = reader3.result;
            }

            if (file3) {
                reader3.readAsDataURL(file3);
                document.querySelector('#<%=lblImg3.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload3.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview3.src = "";
            }
        }
        function previewFile4() {
            var preview4 = document.querySelector('#<%=Image4.ClientID %>');
            var file4 = document.querySelector('#<%=FileUpload4.ClientID %>').files[0];
            var reader4 = new FileReader();

            reader4.onloadend = function () {
                preview4.src = reader4.result;
            }

            if (file4) {
                reader4.readAsDataURL(file4);
                document.querySelector('#<%=lblImg4.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload4.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview4.src = "";
            }
        }        

        function previewFile5() {
            var preview5 = document.querySelector('#<%=Image5.ClientID %>');
            var file5 = document.querySelector('#<%=FileUpload5.ClientID %>').files[0];
            var reader5 = new FileReader();

            reader5.onloadend = function () {
                preview5.src = reader5.result;
            }

            if (file5) {
                reader5.readAsDataURL(file5);
                document.querySelector('#<%=lblImg5.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload5.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview5.src = "";
            }
        }

        function previewFile6() {
            var preview6 = document.querySelector('#<%=Image6.ClientID %>');
            var file6 = document.querySelector('#<%=FileUpload6.ClientID %>').files[0];
            var reader6 = new FileReader();

            reader6.onloadend = function () {
                preview6.src = reader6.result;
            }

            if (file6) {
                reader6.readAsDataURL(file6);
                document.querySelector('#<%=lblImg6.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload6.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview6.src = "";
            }
        }

        function previewFile7() {
            var preview7 = document.querySelector('#<%=Image7.ClientID %>');
            var file7 = document.querySelector('#<%=FileUpload7.ClientID %>').files[0];
            var reader7 = new FileReader();

            reader7.onloadend = function () {
                preview7.src = reader7.result;
            }

            if (file7) {
                reader7.readAsDataURL(file7);
                document.querySelector('#<%=lblImg7.ClientID %>').innerHTML = document.querySelector('#<%=FileUpload7.ClientID %>').value.split(/(\\|\/)/g).pop()
            }
            else {
                preview7.src = "";
            }
        }

        function delete1click() {
            document.getElementById('<%=lblImg1.ClientID%>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image1.ClientID %>').src = "";
        }
        function delete2click() {
            document.getElementById('<%=lblImg2.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image2.ClientID %>').src = "";
        }
        function delete3click() {
            document.getElementById('<%=lblImg3.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image3.ClientID %>').src = "";
        }
        function delete4click() {
            document.getElementById('<%=lblImg4.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image4.ClientID %>').src = "";
        }

        function delete5click() {
            document.getElementById('<%=lblImg5.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image5.ClientID %>').src = "";
        }
        function delete6click() {
            document.getElementById('<%=lblImg6.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image6.ClientID %>').src = "";
        }
        function delete7click() {
            document.getElementById('<%=lblImg7.ClientID %>').innerHTML = "empty.jpg";
            document.getElementById('<%=Image7.ClientID %>').src = "";
        }    

        //colapse auto open
        window.onload = function() {
            if (document.getElementById('<%=lblImg1.ClientID %>').innerHTML != "") {
                document.getElementById("collapse1").classList.add("in");
            }
            if (document.getElementById('<%=lblImg2.ClientID %>').innerHTML != "") {
                document.getElementById("collapse2").classList.add("in");
            }
            if (document.getElementById('<%=lblImg3.ClientID %>').innerHTML != "") {
                document.getElementById("collapse3").classList.add("in");
            }
            if (document.getElementById('<%=lblImg4.ClientID %>').innerHTML != "") {
                document.getElementById("collapse4").classList.add("in");
            }
            if (document.getElementById('<%=lblImg5.ClientID %>').innerHTML != "") {
                document.getElementById("collapse5").classList.add("in");
            }
            if (document.getElementById('<%=lblImg6.ClientID %>').innerHTML != "") {
                document.getElementById("collapse6").classList.add("in");
            }
            if (document.getElementById('<%=lblImg7.ClientID %>').innerHTML != "") {
                document.getElementById("collapse7").classList.add("in");
            }
        }

        $(function () {
            $('input[type=file]').change(function () {
                var val = $(this).val().toLowerCase(),
                    regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$");

                if (!(regex.test(val))) {
                    $(this).val('');
                    alert('Please select correct file format');
                }
            });
        });
    </script>
    <%--script for get location--%>
    <script>
        function initGMap() {
            var x = window.matchMedia("(max-width: 700px)")
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
                icon: 'img/marker.png',
                map: map,
                draggable: true,
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

                marker.setPosition(place.geometry.location);
                marker.setVisible(true);
                document.getElementById('<%=lat.ClientID%>').value = marker.getPosition().lat();
                document.getElementById('<%=lng.ClientID%>').value = marker.getPosition().lng();
            });

            //get lat and lng of draged pin            
            google.maps.event.addListener(marker, 'dragend', function () {
                document.getElementById('<%=lat.ClientID%>').value = marker.getPosition().lat();
                document.getElementById('<%=lng.ClientID%>').value = marker.getPosition().lng();
            });

            if (x.matches) { // If media query matches
                document.getElementById("searchInput").style = ("z-index: 1; position: absolute; left: 5px; top: 50px; width: 88%;");
            }
            else {
                document.getElementById("searchInput").style = ("z-index: 1; position: absolute; left: 199px; top: 25px;");
            }

            if ((document.getElementById('<%=lat.ClientID%>').value != "" && document.getElementById('<%=lng.ClientID%>').value != "") && (document.getElementById('<%=lat.ClientID%>').value != "Null" && document.getElementById('<%=lng.ClientID%>').value != "Null")) {
                var lat = document.getElementById('<%=lat.ClientID%>').value;
                var lng = document.getElementById('<%=lng.ClientID%>').value;
                var spot = new google.maps.LatLng(lat, lng);
                var mapOptions = {
                    zoom: 14,
                    center: spot
                }

                map = new google.maps.Map(document.getElementById("map"), mapOptions);
                marker = new google.maps.Marker({
                    position: spot,
                    icon: 'img/marker.png',
                    map: map,
                    animation: google.maps.Animation.DROP,
                    draggable: true,
                });


                if (x.matches) { // If media query matches
                    document.getElementById("searchInput").style = ("z-index: 1; position: absolute; left: 5px; top: 50px; width: 88%;");
                }
                else {
                    document.getElementById("searchInput").style = ("z-index: 1; position: absolute; left: 199px; top: 25px;");
                }
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
                icon: 'img/marker.png',
                map: map,
                draggable: true,
            });

            document.getElementById('<%=lat.ClientID%>').value = marker.getPosition().lat();
            document.getElementById('<%=lng.ClientID%>').value = marker.getPosition().lng();
            // add an event "onDrag"
            google.maps.event.addListener(marker, 'dragend', function () {
                document.getElementById('<%=lat.ClientID%>').value = marker.getPosition().lat();
                document.getElementById('<%=lng.ClientID%>').value = marker.getPosition().lng();
            });
        }
    </script>
    <%-- Alert --%>
    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Add Property for Sale</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="Dashboard.aspx">Home</a>
                </li>
                <li>
                    <a href="ManageSaleProperty.aspx">Properties for Sale</a>
                </li>
                <li class="active">
                    <strong>Add Property</strong>
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
                        <h5>Add Property for Sale</h5>
                    </div>

                    <asp:Panel ID="pnlAlert" runat="server" class="" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:Panel>

                    <div class="ibox-content">
                        <div class="form-horizontal" style="margin-top: 10px">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Property Type</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-control" onclick="hidePropertyTypelbl()" onchange="ddlTypeChange(this.value)">
                                        <asp:ListItem Text="-- Select Property Type --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Apartment" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Independent House/Villa" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Independent floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Office" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Shop" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblPropertyType" class="error">Please select property type</label>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label class="col-sm-3 control-label">Property For</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlRentOrSale" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Sale" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Rent" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label class="col-lg-3 col-md-3 control-label">Area in <asp:Label ID="lblAreaUnit" runat="server" Text="Sq Ft."></asp:Label></label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtArea" runat="server" class="form-control" MaxLength="7" onkeypress='javascript:return isNumberKey(event,this);' onclick="hideArealbl()"></asp:TextBox>
                                    <label id="lblArea" class="error">Please enter area of property</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Location</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control" onclick="hideLocationlbl()"></asp:DropDownList>
                                    <label id="lblLocation" class="error">Please select location</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Flat No. & Building Name</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtFlatNo" runat="server" class="form-control" onkeypress="hideFlatNolbl()"></asp:TextBox>
                                    <label id="lblFlatNo" class="error">Please enter flat number and name of building</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Address</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" onkeypress="hideAddresslbl()"></asp:TextBox>
                                    <label id="lblAddress" class="error">Please enter address</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Source of Property</label>
                                <div class="col-sm-9">
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
                                    <label id="lblSource" class="error">Please select source</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Contact Person Name</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtContactName" runat="server" class="form-control" onkeypress="hideContactNamelbl()"></asp:TextBox>
                                    <label id="lblContactName" class="error">Please enter name</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Contact Number</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" MaxLength="10" onkeypress='javascript:return isNumberKey(event,this);'  onclick="hideContactlbl()"></asp:TextBox>
                                    <label id="lblContactNo" class="error">Please enter contact number</label>
                                    <label id="lblContactNo1" class="error">Please enter a valid contact number</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Number of Brokers</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbBroker" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="Direct" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblBroker" class="error">Please select number of broker</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Possession Date</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPossessionDate" runat="server" class="form-control fontAwesome" placeholder="&#xf073;" onclick="hidePossessionDatelbl()" Width="270px" style="background-color:#fff"></asp:TextBox>
                                    <label id="lblPossessionDate" class="error">Please select possession date</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Bed Rooms</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlRoom" runat="server" CssClass="form-control" onclick="hideRoomlbl()">
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
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Number of Bathrooms</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbBath" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="4+" Value="4+"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblBath" class="error">Please select number of bathrooms</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Floor</label>
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
                                    <label id="lblTotalFloor1" class="error">Number of floor should be less than total floor of building</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Furnishing</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbFurnishing" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="Un-Furnished" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Semi-Furnished" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Full-Furnished" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblFurnishing" class="error">Please select furnishing status</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Parking</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbParking" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="2 wheel" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="4 wheel" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="2-4 wheel" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="None" Value="4"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <label id="lblParking" class="error">Please select parking</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Age of Building in Years</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlAge" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="-- Age of Building --" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="1-3" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="3-7" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="7-10" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="10+" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Description</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine" Columns="3"></asp:TextBox>
                                    <label id="lblDescription" class="error">Please enter description</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Price Amount</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPrice" runat="server" class="form-control" onclick="hidePricelbl()" onkeypress='javascript:return isDecimalNumber(event,this);' onfocusout="priceOnfocusOut(this.value)"></asp:TextBox>
                                    <label id="lblPrice" class="error">Please enter price amount</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Negotiation Status</label>
                                <div class="col-sm-9 i-checks">
                                    <asp:RadioButtonList ID="rdbNegotiation" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None">
                                        <asp:ListItem Text="Non-Negotiable" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Negotiable" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="form-group" id="brokePercentage">
                                <label class=" col-md-3 control-label">Brokerage percentage (%)</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPercentage" runat="server" class="form-control" TextMode="Number" onclick="hideBrokeragePercentagelbl()" onKeyPress="if(this.value.length==2) return false;" onfocusout="calculateBrokerage()"></asp:TextBox>
                                    <label id="lblBrokeragePercentage" class="error">Please enter brokerage percentage</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Brokerage Amount</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtBrokerage" runat="server" class="form-control" onclick="hideBrokeragelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                    <label id="lblBrokerage" class="error">Please enter brokerage amount</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Show contact</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlShowContact" runat="server" CssClass="form-control" onclick="hideShowContactlbl()">
                                        <asp:ListItem Text="-- Show contact on website --" Value="00"></asp:ListItem>
                                        <asp:ListItem Text="Show our contact" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Show broker's / owner's contact" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <label id="lblShowContact" class="error">Please select Show contact on website</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Property Photos</label>
                                <div class="col-sm-9"></div>
                            </div>

                            <div class="form-group">
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
                            <div class="form-group">
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
                            <div class="form-group">
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
                            <div class="form-group">
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
                            <div class="form-group">
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
                            <div class="form-group">
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
                            <div class="form-group">
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

                            <div class="form-group" style="margin-bottom: 0">
                                <label class="col-sm-4 control-label">Select Property Location on Map</label>
                                <div class="col-sm-8">
                                    <input id="lat" readonly="readonly" runat="server" style="border: none; width: 1px; height: 1px; font-size: 1px; color: #fff" />
                                    <input id="lng" readonly="readonly" runat="server" style="border: none; width: 1px; height: 1px; font-size: 1px; color: #fff" />
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div id="drop" style="margin-top: 5px">
                                        <input type="button" value="Drop Pin" onclick="dropPin()" />
                                        &nbsp Drop a marker on the center of the map<br />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk25E4mNfVIEt3tNl3K1HwNZVruVoFBlA&libraries=places&callback=initGMap" async defer></script>
                                    <input id="searchInput" class="controls" type="text" placeholder="Enter a location" />
                                    <div id="map" style="height: 400px; margin: 20px 0;"></div>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-white" Text="Cancel" OnClick="btnCancel_Click" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validateForm()" OnClick="btnSave_Click" Width="30%" />
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
 
