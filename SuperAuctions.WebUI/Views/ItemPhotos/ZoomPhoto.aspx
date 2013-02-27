<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Zoom.Master" Inherits="System.Web.Mvc.ViewPage<SuperAuctions.Domain.Entities.ItemPhoto>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ZoomPhoto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="wrapper">
            <span>
               <!-- <a id="update" href="#">Change Image</a> -->
            </span>
            <script type="text/javascript">
                var $ = jQuery;
                $(document).ready(function () {
                    $("#viewer").iviewer(
                       {
                           src: "/Images/<%: Model.Photo %>",
                           update_on_resize: false,
                           initCallback: function () {
                               var object = this;
                               $("#in").click(function () { object.zoom_by(1); });
                               $("#out").click(function () { object.zoom_by(-1); });
                               $("#fit").click(function () { object.fit(); });
                               $("#orig").click(function () { object.set_zoom(100); });
                               $("#update").click(function () { object.loadImage("/Images/<%: Model.Photo %>"); });
                           },
                           onMouseMove: function (object, coords) { },
                           onStartDrag: function (object, coords) { return true; }, //this image can be dragged
                           onDrag: function (object, coords) { }
                       });

                });

        </script>
            <div id="viewer" class="viewer"></div>
        </div>

</asp:Content>
