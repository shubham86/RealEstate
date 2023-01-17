<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="RealEstate.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="cpanel/css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        UploadImage :<asp:FileUpload ID="fileupload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
        <br />
        <br />
        <div style="width:500px">
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
    </form>
    
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-2.2.0.min.js"></script>
<script src="cpanel/js/plugins/chosen/chosen.jquery.js"></script>
    <script>
        $('.chosen-select').chosen({width: "100%"});
    </script>

</body>

</html>
