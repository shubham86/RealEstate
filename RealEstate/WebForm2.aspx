<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="RealEstate.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="cpanel/css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script>
        window.onload = Captcha;
        function validateForm() {
            document.getElementById('log').innerHTML = '';
            var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
            var string2 = removeSpaces(document.getElementById('txtInput').value);
            if (string1 != string2 || string2 == "") {
                Captcha();
                document.getElementById('log').innerHTML += '<span style="font-size:16px;background-color:lightcoral; padding: 25px;">Entered Invalid Captcha</span> ';
                return false;
            }
            else {
                document.getElementById('log').innerHTML += '<span style="font-size:16px;background-color:greenyellow; padding: 25px;">Captcha is true</span> ';
            }
        }
        function Captcha() {
            var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0');
            var i;
            for (i = 0; i < 6; i++) {
                var a = alpha[Math.floor(Math.random() * alpha.length)];
                var b = alpha[Math.floor(Math.random() * alpha.length)];
                var c = alpha[Math.floor(Math.random() * alpha.length)];
                var d = alpha[Math.floor(Math.random() * alpha.length)];
                var e = alpha[Math.floor(Math.random() * alpha.length)];
                var f = alpha[Math.floor(Math.random() * alpha.length)];
                var g = alpha[Math.floor(Math.random() * alpha.length)];
            }
            var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' ' + f + ' ' + g;
            document.getElementById("mainCaptcha").value = code
            var colors = ["#B40404", "#beb1dd", "#b200ff", "#faff00", "#0000FF", "#FE2E9A", "#FF0080", "#2EFE2E",];
            var rand = Math.floor(Math.random() * colors.length);

        }
        function removeSpaces(string) {
            return string.split(' ').join('');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 50px">
        <label>Captcha <span style="color: #F00; font-size: 20px">*</span>:</label>
        <input type="text" class="form-control" style="margin-bottom: 0px; width: 180px; height: 40px; font-size: 24px; font-weight: bolder; color: #dddddd; text-decoration: underline overline line-through; display: inline-block; background-image: url(assets/img/capcha-bg.png)" id="mainCaptcha" disabled="">
        <button type="button" id="refresh" onclick="Captcha()">Reset</button>
        <label id="lblCapcha"></label>

        <input style="margin-top: 10px;" type="text" class="form-control" placeholder="Enter captcha" name="captcha" id="txtInput" required="">

        <button class="btn btn-primary btn-lg" type="submit" name="submit" onclick="return validateForm();">Submit Form</button>
    </div>

    <div style="width:500px;margin-top:50px">
            <select data-placeholder="Choose a Country..." class="chosen-select" multiple style="width: 350px;" tabindex="2">
                <option value="">Select</option>
                <option value="United States">United States</option>
                <option value="United Kingdom">United Kingdom</option>
                <option value="Afghanistan">Afghanistan</option>
                <option value="Aland Islands">Aland Islands</option>
                <option value="Albania">Albania</option>
                <option value="Algeria">Algeria</option>
                <option value="Azerbaijan">Azerbaijan</option>
                <option value="Bahamas">Bahamas</option>
                <option value="Bahrain">Bahrain</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="Barbados">Barbados</option>
                <option value="Central African Republic">Central African </option>
                <option value="Chad">Chad</option>
                <option value="Chile">Chile</option>
            </select>
        </div>
     <select data-placeholder="Choose a Country..." class="chosen-select" style="width: 350px;" tabindex="2">
                <option value="">Select</option>
                <option value="United States">United States</option>
                <option value="United Kingdom">United Kingdom</option>
                <option value="Afghanistan">Afghanistan</option>
                <option value="Aland Islands">Aland Islands</option>
                <option value="Albania">Albania</option>
                <option value="Algeria">Algeria</option>
                <option value="Azerbaijan">Azerbaijan</option>
                <option value="Bahamas">Bahamas</option>
                <option value="Bahrain">Bahrain</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="Barbados">Barbados</option>
                <option value="Central African Republic">Central African </option>
                <option value="Chad">Chad</option>
                <option value="Chile">Chile</option>
            </select>

    <script src="cpanel/js/plugins/chosen/chosen.jquery.js"></script>
    <script>
        $('.chosen-select').chosen({width: "100%"});
    </script>
</asp:Content>
