<%@ Page Title="Post Property" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="PostProperty.aspx.cs" Inherits="RealEstate.PostProperty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>   
    <link  href="assets/css/postProperty.css" rel="stylesheet"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <style>
        @media only screen and (min-width : 1024px) {
            .alert {
                width: 55%;
                margin: 20px auto 0 auto;
            }
        }

        @media only screen and (min-device-width : 480px) and (max-device-width : 1024px) {
            .alert {
                width: 65%;
                margin: 20px auto 0 auto;
            }
        }

        @media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
            .alert {
                width: 90%;
                margin: 20px auto 0 auto;
            }
        }

        .fontAwesome {
            font-family: Helvetica, 'FontAwesome', sans-serif;
        }
    </style>
    <script type="text/javascript">
        //step wizard
        window.onload = function () {
            var e = document.getElementById('<%=ddlStatus.ClientID%>');

            document.getElementById("Step2").style.display = "none";
            document.getElementById("Step3").style.display = "none";

            document.getElementById("Progressli1").classList.add("active");
            document.getElementById("Progressli2").classList.remove("active");
            document.getElementById("Progressli3").classList.remove("active");

            document.getElementById("divBrokethrough").style.display = "none";
            document.getElementById("divPropertyPrice").style.display = "none";

            if (e.options[e.selectedIndex].value == "Rent") {
                document.getElementById("divProperyRent").style.display = "flex";
                document.getElementById("divDeposite").style.display = "flex";
                document.getElementById("divMaintenance").style.display = "flex";

                document.getElementById("divPropertyPrice").style.display = "none";
                document.getElementById("brokePercentage").style.display = "none";
            }
            else if (e.options[e.selectedIndex].value == "Sale") {
                document.getElementById("divPropertyPrice").style.display = "flex";
                document.getElementById("brokePercentage").style.display = "flex";

                document.getElementById("divProperyRent").style.display = "none";
                document.getElementById("divDeposite").style.display = "none";
                document.getElementById("divMaintenance").style.display = "none";
            }

            //Captcha();
        }

        function sourceOnChange(source) {
            if (source.value == "1") {
                document.getElementById("divBrokethrough").style.display = "flex";
                document.getElementById("brokeAmount").style.display = "flex";

                if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent") {
                    document.getElementById("brokerageMonth").style.display = "flex";
                }
                else {
                    document.getElementById("brokePercentage").style.display = "flex";
                }
            }
            else {
                document.getElementById("divBrokethrough").style.display = "none";
                document.getElementById("brokeAmount").style.display = "none";

                document.getElementById("brokerageMonth").style.display = "none";
                document.getElementById("brokePercentage").style.display = "none";
            }
        }

        function NextClick1() {
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
            if (document.getElementById('<%=ddlSource.ClientID%>').value == "0") {
                document.getElementById("lblSource").style.display = "block";
                document.getElementById('Source').focus();
                window.setTimeout(function () { $("#lblSource").attr("style", "display:none"); }, 3000);
                return false;
            }
            if (document.getElementById('<%=ddlSource.ClientID%>').value == "1" && document.getElementById('<%=ddlBrokethrough.ClientID%>').value == "0") {
                document.getElementById("lblBrokethrough").style.display = "block";
                document.getElementById('broker').focus();
                window.setTimeout(function () { $("#lblBrokethrough").attr("style", "display:none"); }, 3000);
                return false;
            }
            if (document.getElementById('<%=txtContactAddress.ClientID%>').value == "") {
                document.getElementById("lblContactAddress").style.display = "block";
                document.getElementById('<%=txtContactAddress.ClientID%>').focus();
                return false;
            }

            document.getElementById('scrollTop').scrollIntoView();
            document.getElementById("Step1").style.display = "none";
            document.getElementById("Step3").style.display = "none";
            document.getElementById("Step2").style.display = "block";

            document.getElementById("Progressli1").classList.add("active");
            document.getElementById("Progressli2").classList.add("active");
            document.getElementById("Progressli3").classList.remove("active");
        }

        function previousClick2() {
            document.getElementById('scrollTop').scrollIntoView();
            document.getElementById("Step1").style.display = "block";
            document.getElementById("Step3").style.display = "none";
            document.getElementById("Step2").style.display = "none";

            document.getElementById("Progressli1").classList.add("active");
            document.getElementById("Progressli2").classList.remove("active");
            document.getElementById("Progressli3").classList.remove("active");
        }

        function NextClick2() {
           if (document.getElementById('<%=ddlPropertyType.ClientID%>').value == "0") {
                document.getElementById("lblPropertyType").style.display = "block";
                document.getElementById('Type').focus();
                window.setTimeout(function () { $("#lblPropertyType").attr("style", "display:none"); }, 3000);
                return false;
            }
            if (document.getElementById('<%=txtArea.ClientID%>').value == "") {
                document.getElementById("lblArea").style.display = "block";
                document.getElementById('<%=txtArea.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlLocation.ClientID%>').value == "0") {
                document.getElementById("lblLocation").style.display = "block";
                document.getElementById('Location').focus();
                window.setTimeout(function () { $("#lblLocation").attr("style", "display:none"); }, 3000);
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
            
            if (document.getElementById('<%=txtPossessionDate.ClientID%>').value == "") {
                document.getElementById("lblPossessionDate").style.display = "block";
                document.getElementById('<%=txtPossessionDate.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlRoom.ClientID%>').value == "0" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "3" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblRoom").style.display = "block";
                document.getElementById('BedRoom').focus();
                window.setTimeout(function () { $("#lblRoom").attr("style", "display:none"); }, 3000);
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
            if (!isChecked && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "3" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblBath").style.display = "block";
                document.getElementById('BathRoom').focus();
                window.setTimeout(function () { $("#lblBath").attr("style", "display:none"); }, 3000);
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
            if (document.getElementById('<%=ddlFurnishing.ClientID%>').value == "0" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4") {
                document.getElementById("lblFurnishing").style.display = "block";
                document.getElementById('Furnish').focus();
                window.setTimeout(function () { $("#lblFurnishing").attr("style", "display:none"); }, 3000);
                return false;
            }

            if (document.getElementById('<%=ddlTenants.ClientID%>').value == "0" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "4" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "5" && document.getElementById('<%=ddlPropertyType.ClientID%>').value != "6") {
                document.getElementById("lblTenants").style.display = "block";
                document.getElementById('PTenant').focus();
                window.setTimeout(function () { $("#lblTenants").attr("style", "display:none"); }, 3000);
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
                document.getElementById('Parking').focus();
                window.setTimeout(function () { $("#lblParking").attr("style", "display:none"); }, 3000);
                return false;
            }

            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent") {
                if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent" && document.getElementById('<%=txtRent.ClientID%>').value == "") {
                    document.getElementById("lblRent").style.display = "block";
                    document.getElementById('<%=txtRent.ClientID%>').focus();
                    return false;
                }
                if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent" && document.getElementById('<%=txtDeposit.ClientID%>').value == "") {
                    document.getElementById("lblDeposit").style.display = "block";
                    document.getElementById('<%=txtDeposit.ClientID%>').focus();
                    return false;
                }
                if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent" && document.getElementById('<%=txtMaintenance.ClientID%>').value == "") {
                    document.getElementById("lblMaintenance").style.display = "block";
                    document.getElementById('<%=txtMaintenance.ClientID%>').focus();
                    return false;
                }
            }
            else {
                if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Sale" && document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                    document.getElementById("lblPrice").style.display = "block";
                    document.getElementById('<%=txtPrice.ClientID%>').focus();
                    return false;
                }
            }

            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Sale" && document.getElementById('<%=ddlSource.ClientID%>').options[document.getElementById('<%=ddlSource.ClientID%>').selectedIndex].value == "1" && document.getElementById('<%=txtPercentage.ClientID%>').value == "") {
                document.getElementById("lblBrokeragePercentage").style.display = "block";
                document.getElementById('<%=txtPercentage.ClientID%>').focus();
                return false;
            }
            if (document.getElementById('<%=ddlSource.ClientID%>').options[document.getElementById('<%=ddlSource.ClientID%>').selectedIndex].value == "1" && document.getElementById('<%=txtBrokerage.ClientID%>').value == "") {
                document.getElementById("lblBrokerage").style.display = "block";
                document.getElementById('<%=txtBrokerage.ClientID%>').focus();
                return false;
            }

            document.getElementById('scrollTop').scrollIntoView();
            document.getElementById("Step1").style.display = "none";
            document.getElementById("Step2").style.display = "none";
            document.getElementById("Step3").style.display = "block";

            document.getElementById("Progressli1").classList.add("active");
            document.getElementById("Progressli2").classList.add("active");
            document.getElementById("Progressli3").classList.add("active");
        }

        function upload() {
            var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
            var string2 = removeSpaces(document.getElementById('txtCapcha').value);
            if (string2 == "") {
                Captcha();
                document.getElementById("lblCapcha").style.display = "block";
                document.getElementById('txtCapcha').focus();
                return false;
            }
            else if (string1 != string2) {
                document.getElementById("lblCapcha2").style.display = "block";
                return false;
            }
        }

        function previousClick3() {
            document.getElementById('scrollTop').scrollIntoView();
            document.getElementById("Step1").style.display = "none";
            document.getElementById("Step3").style.display = "none";
            document.getElementById("Step2").style.display = "block";

            document.getElementById("Progressli1").classList.add("active");
            document.getElementById("Progressli2").classList.add("active");
            document.getElementById("Progressli3").classList.remove("active");
        }

        function hideContactAddresslbl() {
            document.getElementById("lblContactAddress").style.display = "none";
        }
        function hideFlatNolbl() {
            document.getElementById("lblFlatNo").style.display = "none";
        }
        function hideAddresslbl() {
            document.getElementById("lblAddress").style.display = "none";
        }
        function hideContactNamelbl() {
            document.getElementById("lblContactName").style.display = "none";
        }
        function hidePossessionDatelbl() {
            document.getElementById("lblPossessionDate").style.display = "none";
        }
        function hideFloorlbl() {
            document.getElementById("lblFloor").style.display = "none";
            document.getElementById("lblTotalFloor1").style.display = "none";
        }
        function hideTotalFloorlbl() {
            document.getElementById("lblTotalFloor").style.display = "none";
            document.getElementById("lblTotalFloor1").style.display = "none";
        }
        function hideRentlbl() {
            document.getElementById("lblRent").style.display = "none";
        }
        function hideDepositlbl() {
            document.getElementById("lblDeposit").style.display = "none";
        }
        function hideMaintenancelbl() {
            document.getElementById("lblMaintenance").style.display = "none";
        }
        function hideBrokeragePercentagelbl() {
            document.getElementById("lblBrokeragePercentage").style.display = "none";
            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Sale" && document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
        }
        function hideBrokeragelbl() {
            document.getElementById("lblBrokerage").style.display = "none";
        }
        function hidePricelbl() {
            document.getElementById("lblPrice").style.display = "none";
        }
        function hideCapchalbl() {
            document.getElementById("lblCapcha").style.display = "none";
            document.getElementById("lblCapcha2").style.display = "none";
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

            document.getElementById("lblArea").style.display = "none";
            document.getElementById("lblContactNo").style.display = "none";
            document.getElementById("lblContactNo1").style.display = "none";
            return true;
        }

        //rent or sale
        function ddlStatusChange(value) {
            if (value == "Rent") {
                document.getElementById("divProperyRent").style.display = "flex";
                document.getElementById("divDeposite").style.display = "flex";
                document.getElementById("divMaintenance").style.display = "flex";
                document.getElementById("brokerageMonth").style.display = "flex";

                document.getElementById("divPropertyPrice").style.display = "none";
                document.getElementById("brokePercentage").style.display = "none";
            }
            else if (value == "Sale") {
                document.getElementById("divPropertyPrice").style.display = "flex";
                document.getElementById("brokePercentage").style.display = "flex";

                document.getElementById("divProperyRent").style.display = "none";
                document.getElementById("divDeposite").style.display = "none";
                document.getElementById("divMaintenance").style.display = "none";
                document.getElementById("brokerageMonth").style.display = "none";
            }
        }

        function ddlTypeChange(value) {
            if (value == "4") {
                document.getElementById('<%=lblAreaUnit.ClientID%>').innerText = "Guntha";
            }
            else {
                document.getElementById('<%=lblAreaUnit.ClientID%>').innerText = "Sq Ft.";
            }
        }

        function ddlBrokerageMonth(value) {
            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Rent" && document.getElementById('<%=txtRent.ClientID%>').value == "") {
                document.getElementById("lblRent").style.display = "block";
                document.getElementById('<%=txtRent.ClientID%>').focus();
                return false;
            }
            else {
                document.getElementById('<%=txtBrokerage.ClientID%>').value = document.getElementById('<%=txtRent.ClientID%>').value * value;
            }
        }
        // capcha

        //function Captcha() {
        //    var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0');
        //    var i;
        //    for (i=0;i<6;i++){
        //        var a = alpha[Math.floor(Math.random() * alpha.length)];
        //        var b = alpha[Math.floor(Math.random() * alpha.length)];
        //        var c = alpha[Math.floor(Math.random() * alpha.length)];
        //        var d = alpha[Math.floor(Math.random() * alpha.length)];
        //        var e = alpha[Math.floor(Math.random() * alpha.length)];
        //        var f = alpha[Math.floor(Math.random() * alpha.length)];
        //        var g = alpha[Math.floor(Math.random() * alpha.length)];
        //    }
        //    var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        //    document.getElementById("mainCaptcha").value = code
        //    var colors = ["#B40404", "#beb1dd", "#b200ff", "#faff00", "#0000FF", "#FE2E9A", "#FF0080", "#2EFE2E", ];
        //    var rand = Math.floor(Math.random() * colors.length);

        //}
        //function removeSpaces(string){
        //    return string.split(' ').join('');
        //}



        //google captcha
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "PostProperty.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        };

        //calculate brokerage
        function calculateBrokerage() {
            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Sale" && document.getElementById('<%=txtPrice.ClientID%>').value == "") {
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
            if (document.getElementById('<%=ddlStatus.ClientID%>').options[document.getElementById('<%=ddlStatus.ClientID%>').selectedIndex].value == "Sale" && document.getElementById('<%=txtPrice.ClientID%>').value == "") {
                document.getElementById("lblPrice").style.display = "block";
                document.getElementById('<%=txtPrice.ClientID%>').focus();
                return false;
            }
            else {
                var price = document.getElementById('<%=txtPrice.ClientID%>').value;
                document.getElementById('<%=txtPercentage.ClientID%>').value = ((brokerage / price) * (100)).toFixed(2);
            }            
        }

        function rentOnfocusOut(rent) {
            document.getElementById('<%=txtBrokerage.ClientID%>').value = rent * document.getElementById('<%=ddlBrokerageMonth.ClientID%>').options[document.getElementById('<%=ddlBrokerageMonth.ClientID%>').selectedIndex].value;
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
            var x = window.matchMedia("(max-width: 800px)");
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
                icon: 'cpanel/img/marker.png',
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
                        
            if (document.getElementById('<%=lat.ClientID%>').value != "" && document.getElementById('<%=lng.ClientID%>').value != "") {
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
                    icon: 'cpanel/img/marker.png',
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
                icon: 'cpanel/img/marker.png',
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
        }, 15000);

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
    <!-- Sub banner start -->
    <div class="sub-banner overview-bgi">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Post Properties</h1>
                <ul class="breadcrumbs">
                    <li><a href="Index.aspx">Home</a></li>
                    <li id="scrollTop" class="active">Post Properties</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Sub banner end -->    

    <asp:Panel ID="pnlAlert" runat="server" class="" role="alert" Visible="false">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <asp:Label ID="lblalert" runat="server" Text="" Font-Bold="true"></asp:Label>
    </asp:Panel>

    <div class="recent-properties content-area-2">
        <div class="container">
            <div class="main-title">
                <h1>Post Properties</h1>
                <p>Submit your property to be viewed by more and more people.</p>
            </div>
        </div>
    </div>

    <!-- Wizard  -->       
    <section class="multi_step_form">
        <div id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li id="Progressli1">User Details</li>
                <li id="Progressli2">Property Details</li>
                <li id="Progressli3">Upload Photo</li>
            </ul>
        </div>
    </section> 
    <!--Wizard end-->

    <!-- Post Property form start -->
    <div class="search-area">
        <div class="container">
            <div class="search-area-inner" id="Step1">
                <div class="search-contents">
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Contact Person Name</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtContactName" runat="server" class="form-control" onkeypress="hideContactNamelbl()"></asp:TextBox>
                                <label id="lblContactName" class="error">Please enter name</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Contact Number</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtContactNo" runat="server" class="form-control" MaxLength="10" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                                <label id="lblContactNo" class="error">Please enter contact number</label>
                                <label id="lblContactNo1" class="error">Please enter a valid contact number</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Source of Property<input type="text" id="Source" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlSource" runat="server" CssClass="selectpicker search-fields" onclick="hideSourcelbl()" onchange="sourceOnChange(this)">
                                    <asp:ListItem Text="-- Select Source --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Broker" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Owner" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <label id="lblSource" class="error">Please select source</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="divBrokethrough">
                        <label class="col-lg-3 col-md-3 control-label">Broke-Through<input type="text" id="broker" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlBrokethrough" runat="server" CssClass="selectpicker search-fields" onclick="hideSourcelbl()">
                                    <asp:ListItem Text="-- Select Broke-Through --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Direct" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="1 - Through" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="2 - Through" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="3 - Through" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                                <label id="lblBrokethrough" class="error">Please select brokethrough</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Address</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtContactAddress" runat="server" class="form-control" onkeypress="hideContactAddresslbl()"></asp:TextBox>
                                <label id="lblContactAddress" class="error">Please enter address of contact person</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <table align="center" style="width: 70%">
                            <tr>
                                <td>
                                    <div class="send-btn text-center">
                                        <button type="submit" class="btn btn-color btn-md" onclick="NextClick1()">Next</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="search-area-inner" id="Step2">
                <div class="search-contents">
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Property Status</label>
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
                        <label class="col-lg-3 col-md-3 control-label">Property Type<input type="text" id="Type" style="border:none;width:1px;" readonly="readonly"/></label>                        
                        <div class="col-md-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="selectpicker search-fields" onchange="ddlTypeChange(this.value)">
                                    <asp:ListItem Text="-- Select Property Type --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Appartment" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Independent House/Villa" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Independent floor" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Plot" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Office" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="Shop" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="PG" Value="7"></asp:ListItem>
                                </asp:DropDownList>
                                <label id="lblPropertyType" class="error">Please select property type</label>                                
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Area in <asp:Label ID="lblAreaUnit" runat="server" Text="Sq Ft."></asp:Label></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtArea" runat="server" class="form-control" MaxLength="7" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>
                                <label id="lblArea" class="error">Please enter area of property</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Location<input type="text" id="Location" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="selectpicker search-fields"></asp:DropDownList>
                                <label id="lblLocation" class="error">Please select location</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label" style="padding-top:0">Flat No. & Building Name</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtFlatNo" runat="server" class="form-control" onkeypress="hideFlatNolbl()"></asp:TextBox>
                                <label id="lblFlatNo" class="error">Please enter flat number and name of building</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Property Address</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtAddress" runat="server" class="form-control" onkeypress="hideAddresslbl()" placeholder="Street and landmark etc."></asp:TextBox>
                                <label id="lblAddress" class="error">Please enter address</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Possession Date</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtPossessionDate" runat="server" class="form-control fontAwesome" onclick="hidePossessionDatelbl()" placeholder="&#xf073;" Width="270px" style="background-color:#fff"></asp:TextBox>
                                <label id="lblPossessionDate" class="error">Please select possession date</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Bed Rooms<input type="text" id="BedRoom" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlRoom" runat="server" CssClass="selectpicker search-fields">
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
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Number of Bathrooms<input type="text" id="BathRoom" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9 i-checks">
                            <div class="form-group">
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
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Floor</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <table style="width: 30%">
                                    <tr>
                                        <td>
                                            <input id="txtFloor" runat="server" class="form-control" type="number" min="0" max="50" style="width: 60px" title="floor of property" onclick="hideFloorlbl()" onkeypress='javascript:return isNumberKey(event,this);'/></td>
                                        <td style="font-size: 28px; font-weight: 100">/</td>
                                        <td>
                                            <input id="txtTotalFloor" runat="server" class="form-control" type="number" min="0" max="50" style="width: 60px" title="Total floor of building" onclick="hideTotalFloorlbl()" onkeypress='javascript:return isNumberKey(event,this);'/></td>
                                    </tr>
                                </table>
                                <label id="lblFloor" class="error">Please enter floor of property</label>
                                <label id="lblTotalFloor" class="error">Please enter total floor of building</label>
                                <label id="lblTotalFloor1" class="error">Number of floor should be less than total floor of building</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Furnishing<input type="text" id="Furnish" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9 i-checks">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlFurnishing" runat="server" CssClass="selectpicker search-fields">
                                    <asp:ListItem Text="-- Select Furnishing --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Un-Furnished" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Semi-Furnished" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Full-Furnished" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <label id="lblFurnishing" class="error">Please select furnishing status</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Preferred Tenants<input type="text" id="PTenant" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlTenants" runat="server" CssClass="selectpicker search-fields">
                                    <asp:ListItem Text="-- Select Tenants --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Family" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bachelor" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Bachelor Girls Only" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Company" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Does not matter" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                                <label id="lblTenants" class="error">Please select preferred tenants</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label" style="padding-top:10px">Parking<input type="text" id="Parking" style="border:none;width:1px;" readonly="readonly"/></label>
                        <div class="col-sm-9 i-checks" style="padding: 0">
                            <div class="form-group">
                                <asp:RadioButtonList ID="rdbParking" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None" Style="padding: 0">
                                    <asp:ListItem Text="2 wheel" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="4 wheel" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="2-4 wheel" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="None" Value="4"></asp:ListItem>
                                </asp:RadioButtonList>
                                <label id="lblParking" class="error">Please select parking</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Age of Building in Years</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <%--<asp:TextBox ID="txtAge" runat="server" class="form-control" MaxLength="99" onkeypress='javascript:return isNumberKey(event,this);'></asp:TextBox>--%>
                                <asp:DropDownList ID="ddlAge" runat="server" CssClass="selectpicker search-fields">
                                    <asp:ListItem Text="-- Age of Building --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1-3" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="3-7" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="7-10" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="10+" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Description</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine" Columns="3"></asp:TextBox>
                                <label id="lblDescription" class="error">Please enter description</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="divProperyRent">
                        <label class="col-lg-3 col-md-3 control-label">Rent Amount</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtRent" runat="server" class="form-control" onclick="hideRentlbl()" onkeypress='javascript:return isDecimalNumber(event,this);' onfocusout="rentOnfocusOut(this.value)"></asp:TextBox>
                                <label id="lblRent" class="error">Please enter rent amount</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="divDeposite">
                        <label class="col-lg-3 col-md-3 control-label">Deposit Amount</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtDeposit" runat="server" class="form-control" onclick="hideDepositlbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                <label id="lblDeposit" class="error">Please enter deposit amount</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="divMaintenance">
                        <label class="col-lg-3 col-md-3 control-label">Maintenance Amount</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtMaintenance" runat="server" class="form-control" onclick="hideMaintenancelbl()" onkeypress='javascript:return isDecimalNumber(event,this);'></asp:TextBox>
                                <label id="lblMaintenance" class="error">Please enter maintenance amount</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="divPropertyPrice">
                        <label class="col-lg-3 col-md-3 control-label">Property Price</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" onclick="hidePricelbl()" onkeypress='javascript:return isDecimalNumber(event,this);' onfocusout="priceOnfocusOut(this.value)"></asp:TextBox>
                                <label id="lblPrice" class="error">Please enter price amount</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label">Negotiation Status</label>
                        <div class="col-sm-9 i-checks">
                            <div class="form-group">
                                <asp:RadioButtonList ID="rdbNegotiation" runat="server" CssClass="form-control" RepeatDirection="Horizontal" BorderStyle="None" Style="padding: 0">
                                    <asp:ListItem Text="Non-Negotiable" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Negotiable" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="brokerageMonth">
                        <label class="col-lg-3 col-md-3 control-label">Brokerage</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlBrokerageMonth" runat="server" CssClass="selectpicker search-fields"  onchange="ddlBrokerageMonth(this.value);">                                    
                                    <asp:ListItem Text="1 Month" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="1.5 Month" Value="1.5"></asp:ListItem>
                                    <asp:ListItem Text="2 Month" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="brokePercentage">
                        <label class="col-lg-3 col-md-3 control-label">Brokerage percentage (%)</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtPercentage" runat="server" class="form-control" TextMode="Number" onclick="hideBrokeragePercentagelbl()" onKeyPress="if(this.value.length==2) return false;" onfocusout="calculateBrokerage()"></asp:TextBox>
                                <label id="lblBrokeragePercentage" class="error">Please enter brokerage percentage</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="brokeAmount">
                        <label class="col-lg-3 col-md-3 control-label">Brokerage Amount</label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <asp:TextBox ID="txtBrokerage" runat="server" class="form-control" onclick="hideBrokeragelbl()" onkeypress='javascript:return isDecimalNumber(event,this);' onfocusout="calculatePercentage(this.value)"></asp:TextBox>
                                <label id="lblBrokerage" class="error">Please enter brokerage amount</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <table align="center" style="width: 70%">
                            <tr>
                                <td>
                                    <div class="send-btn text-left">
                                        <button type="submit" class="btn btn-secondary  btn-md" onclick="previousClick2()">Previous</button>
                                    </div>
                                </td>
                                <td>
                                    <div class="send-btn text-right">
                                        <button type="submit" class="btn btn-color btn-md" onclick="NextClick2()">Next</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="search-area-inner" id="Step3">
                <div class="search-contents">
                    <div class="row">
                        <label class="col-lg-3 col-md-3 control-label" style="text-align: left">Property Photos</label>
                        <div class="col-sm-9"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div1" runat="server" class="panel panel-default">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collaps-btn">
                                                        <label for="FileUpload1" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 1</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" onchange="previewFile1()" />
                                                            <asp:Label ID="lblImg1" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID1" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName1" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelet1" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete1_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div2" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="collaps-btn">
                                                        <label for="FileUpload2" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 2</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" onchange="previewFile2()" />
                                                            <asp:Label ID="lblImg2" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID2" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName2" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete2" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete2_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div3" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="collaps-btn">
                                                        <label for="FileUpload3" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 3</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" onchange="previewFile3()" />
                                                            <asp:Label ID="lblImg3" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID3" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName3" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete3" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete3_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div4" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" class="collaps-btn">
                                                        <label for="FileUpload4" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 4</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload4" runat="server" class="form-control" onchange="previewFile4()" />
                                                            <asp:Label ID="lblImg4" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID4" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName4" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete4" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete4_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div5" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" class="collaps-btn">
                                                        <label for="FileUpload5" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 5</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse5" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload5" runat="server" class="form-control" onchange="previewFile5()" />
                                                            <asp:Label ID="lblImg5" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID5" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName5" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete5" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete5_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div6" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse6" class="collaps-btn">
                                                        <label for="FileUpload6" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 6</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse6" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload6" runat="server" class="form-control" onchange="previewFile6()" />
                                                            <asp:Label ID="lblImg6" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID6" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName6" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete6" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete6_Click" />
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="Div7" runat="server" class="panel panel-default">
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse7" class="collaps-btn">
                                                        <label for="FileUpload7" style="font-size: 10px; margin-left: 10px; font-weight: bold">Photo 7</label>
                                                        <i class="fa fa-angle-down" style="font-size: 16px; padding: 0 3px"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="collapse7" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <asp:FileUpload ID="FileUpload7" runat="server" class="form-control" onchange="previewFile7()" />
                                                            <asp:Label ID="lblImg7" runat="server" ForeColor="White"></asp:Label>
                                                            <asp:Label ID="lblPhotoID7" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                            <asp:Label ID="lblOldName7" runat="server" ForeColor="White" Font-Size="1px"></asp:Label>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <asp:ImageButton ID="btnDelete7" runat="server" ImageUrl="cpanel/img/delete.png" AlternateText="Delete" OnClick="btnDelete7_Click" />
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
                    </div>

                    <div class="row" style="margin-bottom: 0">
                        <label class="col-sm-4 control-label" style="text-align: left">Select Property Location on Map</label>
                        <div class="col-sm-8">
                            <input id="lat" readonly="readonly" runat="server" style="border: none; font-size: 1px; color: white" />
                            <input id="lng" readonly="readonly" runat="server" style="border: none; font-size: 1px; color: white" />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="drop" style="margin-top: 5px">
                                <i id="dropPin" class="fa fa-map-pin" aria-hidden="true" onclick="dropPin()"></i>
                                &nbsp<span style="font-size:12px"> Drop a marker on the center of the map</span><br />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12" style="padding:0">
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk25E4mNfVIEt3tNl3K1HwNZVruVoFBlA&libraries=places&callback=initGMap" async defer></script>
                            <input id="searchInput" class="controls" type="text" placeholder="Enter a location"/>
                            <div id="map"></div>
                        </div>
                    </div>                    
                    <div class="row" style="margin-top:30px">
                        <label class="col-lg-3 col-md-3 control-label">Capcha<span style="color:red">*</span></label>
                        <div class="col-sm-9">
                            <div class="form-group">
                                <%--<input type="text" id="mainCaptcha" class="form-control" oncopy="return false" >                                
                                <i class="fa fa-refresh" id="refresh" onclick="Captcha()" title="Reset"></i>
                                <label id="lblCapcha" class="error">Please enter capcha</label>
                                <label id="lblCapcha2" class="error">Invalid Captcha! Please try again.</label>
                                <input style="margin-top:10px;" type="text" class="form-control" placeholder="Enter captcha" name="captcha" id="txtCapcha" onkeypress="hideCapchalbl()">--%>

                                <div id="dvCaptcha">
                                </div>
                                <asp:TextBox ID="txtCaptcha" runat="server" Width="1px" Font-Size="1px" ForeColor="White" BorderStyle="None"/>
                                <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha" runat="server" ForeColor="Red" Display="Dynamic" Font-Size="12px"/>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="row" style="margin-top: 40px;">
                        <table align="center" style="width: 70%">
                            <tr>
                                <td>
                                    <div class="send-btn text-left">
                                        <button type="submit" class="btn btn-secondary  btn-md"  onclick="previousClick3()">Previous</button>
                                    </div>
                                </td>
                                <td>
                                    <div class="send-btn text-right">                                        
                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-color btn-md" runat="server" OnClick="btnSave_Click">Upload</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact 2 end -->
</asp:Content>

