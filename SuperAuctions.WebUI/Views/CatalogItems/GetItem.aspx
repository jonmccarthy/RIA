<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ItemDetailed.Master" Inherits="System.Web.Mvc.ViewPage<SuperAuctions.Domain.Entities.CatalogItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GetItem
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table border=0 width=900px height=500px>
    <tr valign=top>
        <td width=350px>
            <br /><br /><br /><br />
            <h1 class="items">Item Viewer</h1>
            <table>
                <tr><td>Item Name:</td><td><%: Model.ItemName %></td></tr>
                <tr><td>Lot No.</td><td><%: Model.LotNum %></td></tr>
                <tr><td>Price Estimate:</td><td><%: Model.PriceEstimate %></td></tr>
                <tr><td>Description:</td><td></td></tr>
            </table>
            <table><tr><td><%: Model.LotDescription %></td></tr></table><br />
             
             <select class="rating" id="star3">
                <option value="1">ALright</option>
                <option value="2">Ok</option>
	            <option value="3">Getting Better</option>
                <option value="4">Pretty Good</option>
	            <option value="5">Awesome</option>
            </select>
            <script type="text/javascript">

                $(document).ready(function () {
                    $('#star3').val(4).change();
                });		
	
            </script>
             <br /><br />
             <a href=# onclick="document.getElementById('zoomer').src='http://localhost:49792/ItemVideos/ListVideos?catid=<%: Model.CatalogItemsId %>'" width="75" height="75" alt="" />
            <img src="../../Images/watch_video_button.jpg" /></a>







        </td>
        <td width=550px>
            <table width=550px height=500px align=center>
                <tr>
                    <td align=center>
                        
                            <iframe id="zoomer" src="http://localhost:49792/Images/Holder.jpg" width="480px" height="475px" scrolling="no">
                                <p>Your browser does not support iframes.</p>
                            </iframe>
                        
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <div id="ZoomArea">
                        <script type="text/javascript">
                            ZoomArea('http://localhost:49792/ItemPhotos/ListPhotoChangeIframe?catid=<%: Model.CatalogItemsId %>');
                        </script>
                        <!-- <a href=# onclick="document.getElementById('zoomer').src='http://localhost:49792/ItemPhotos/ZoomPhoto?imgname=Coin2.jpg'">Test</a> -->
                        
                        </div> 
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>


