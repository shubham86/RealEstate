<%@ Page Title="Contact Us" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RealEstate.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Initialize and add the map
        //function gMap() {
        //    // The location of Uluru
        //    var mark = { lat: 18.524886, lng: 73.829847 };
        //    var center = { lat: 18.524886, lng: 73.829847 };

        //    // The map, centered at Uluru
        //    var map = new google.maps.Map(
        //        document.getElementById('map'), {
        //            zoom: 13,
        //            center: center
        //        });
            
        //    // The marker, positioned at Uluru
        //    var marker = new google.maps.Marker({ position: mark, map: map });
        //}
        
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
                <h1>Contact Us</h1>
                <ul class="breadcrumbs">
                    <li><a href="Index.aspx">Home</a></li>
                    <li class="active">Contact Us</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Sub banner end -->

    <!-- Contact 2 start -->
    <div class="contact-2 content-area-7">
        <div class="container">
            <div class="main-title">
                <h1>Contact Us</h1>
                <p>Get in touch with us</p>
            </div>

            <div class="contact-info">
                <div class="row">
                    <div class="col-md-4 col-sm-6 contact-info">
                        <i class="fa fa-map-marker"></i>
                        <p>Office Address</p>
                        <strong>A/102 , Near Eden Court , Model Colony , Shivaji Nagar, Pune 410116</strong>
                    </div>
                    <div class="col-md-4 col-sm-6 contact-info">
                        <i class="fa fa-phone"></i>
                        <p>Phone Number</p>
                        <strong><a href="tel:7066053339">+91 7066 05 3339</a></strong><br />
                        <strong><a href="tel:8888168608">+91 8888 16 8608</a></strong>
                    </div>
                    <div class="col-md-4 col-sm-6 contact-info">
                        <i class="fa fa-envelope"></i>
                        <p>Email Address</p>
                        <strong><a href="mailto:info@hunthome.in">info@hunthome.in</a></strong>
                    </div>
                </div>
            </div>

                <%--<div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="form-group name">
                            <input type="text" name="name" class="form-control" placeholder="Name">
                        </div>

                        <div class="form-group email">
                            <input type="email" name="email" class="form-control" placeholder="Email">
                        </div>

                        <div class="form-group subject">
                            <input type="text" name="subject" class="form-control" placeholder="Subject">
                        </div>

                        <div class="form-group number">
                            <input type="text" name="phone" class="form-control" placeholder="Number">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="form-group message">
                            <textarea class="form-control" name="message" placeholder="Write message"></textarea>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <br>
                        <div class="send-btn text-center">
                            <button type="submit" class="btn btn-color btn-md">Send Message</button>
                        </div>
                    </div>
                </div>--%>
        </div>
    </div>
    <!-- Contact 2 end -->

    <!-- Google map start -->
    <div class="section">
        <%--<div id="map" style="height:400px">
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApv3JwcskPGcJp3AROWf6XdUVTAKaCNA8&callback=gMap" async="" defer=""></script>
        </div>--%>
        <div style="width: 100%"><iframe width="100%" height="400" src="https://maps.google.com/maps?width=100%&height=400&hl=en&coord=18.524886,73.829847&q=A%2F102%20%20%2C%20Model%20Colony%20%2C%20Shivaji%20Nagar%2C%20Pune%20410116+(Hunt%20Home)&ie=UTF8&t=&z=13&iwloc=B&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/journey-planner.htm">find directions</a></iframe></div><br />
    </div>
    <!-- Google map end -->
</asp:Content>
