<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ItemDetailed.Master" Inherits="System.Web.Mvc.ViewPage<SuperAuctions.Domain.Entities.CatalogItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GetItem
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    var comp_bid_count = 0;
    var current_bid = 0;
    var uname = "";
    var lotnum = <%: Model.LotNum %>;


    function online() {
        uname = "comp user";
        if (comp_bid_count < 6) {
            comp_bid_count += 1;
            make_bid("Comp", lotnum, document.getElementById('nextbid').value);
            document.getElementById('bidstatus').innerHTML = "<p color=red>Bid Status: The bid is against you<img width=40 height=40 src=\"/Images/Cross.png\"></p>";  
            setTimeout(online, 3000);
        } else {
            setTimeout(complete_sale, 9000);
        }
    }

    function complete_sale() {
        str_redir = "http://localhost:49792/CatalogItems/OnlineBidding?itemid=" + (lotnum*1+1);
        str_message = "<tr><td><h3 onclick=\"window.location.href='" + str_redir + "';\">Congratulations, you <br> purchased for: €" + current_bid + "</h3></td></tr>";
        document.getElementById('onlinebidder').innerHTML = str_message;
        //alert('Hammer Down: ' + current_bid + ' - ' + uname + ' - ' + lotnum);
        
       
    }

    function user_bid(localuser, lot_num, bid_amount) {
        document.getElementById('bidstatus').innerHTML = "<p color=red>Bid Status: The bid is with you<img width=40 height=40 src=\"/Images/Correct.png\"></p>";  
        make_bid(localuser, lot_num, bid_amount)
    }

    function make_bid(localuser, lot_num, bid_amount) {
        current_bid = bid_amount;
        uname = localuser;
        lotnum = lot_num;
        if (current_bid < 50) {
            tmp = current_bid * 1 + 5;
            document.getElementById('nextbid').value = tmp;
            document.getElementById('nextbidhtml').innerHTML = "€" + tmp;
        }

        if (current_bid > 50 && current_bid < 500) {
            tmp = current_bid * 1 + 20;
            document.getElementById('nextbid').value = tmp;
            document.getElementById('nextbidhtml').innerHTML = "€" + tmp;
        }

        if (current_bid > 500 && current_bid < 1000) {
            tmp = current_bid * 1 + 50;
            document.getElementById('nextbid').value = tmp;
            document.getElementById('nextbidhtml').innerHTML = "€" + tmp;
        }

        if (current_bid >= 1000) {
            tmp = current_bid * 1 + 100;
            document.getElementById('nextbid').value = tmp;
            document.getElementById('nextbidhtml').innerHTML = "€" + tmp;
        }
        document.getElementById('currentbid').value = current_bid;
        document.getElementById('currentbidhtml').innerHTML = "€" + current_bid;
        //setTimeout(complete_sale, 10000);
    }

    function start() {
        document.getElementById("nextbid").value = 1000;
        current_bid = 3000;
        uname = "tom";
        lotnum = 1;
        setTimeout(online, 3000);
        
    }



    </script>


<script type="text/javascript">
    //---------------------------------------------------------------
    var xmlHttp

    function GetXmlHttpObject() {
        var xmlHttp = null;
        try {
            // Firefox, Opera 8.0+, Safari
            xmlHttp = new XMLHttpRequest();
        }
        catch (e) {
            // Internet Explorer
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttp;
    }

    function GetImages(str) {
        xmlHttp3 = GetXmlHttpObject();
        if (xmlHttp3 == null) {
            alert("Your browser does not support AJAX!");
            return;
        }
        var url = str;
        xmlHttp3.onreadystatechange = stateChangedGetImages;
        xmlHttp3.open("GET", url, true);
        xmlHttp3.send(null);
        xmlHttp3.close;
    }
    function stateChangedGetImages() {
        if (xmlHttp3.readyState == 4) {
            document.getElementById("Frame2").innerHTML = "";
            document.getElementById("Frame2").innerHTML = xmlHttp3.responseText;
            
        }
    }
    </script>
            <table><tr><td><h1 class="items">Current Item</h1></td><td>
            <div id="Frame2">
            <script type="text/javascript">
                GetImages('http://localhost:49792/ItemPhotos/ListPhotoOnlineBidding?catid=<%: Model.LotNum %>');
            </script>
            </div>
            </td></tr></table>
<table border=0 width=900px height=500px>
    <tr valign=top>
        <td width=350px>
            <br />

            
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



        </td>
        <td width=550px valign=top>
            <table width=550px height=500px align=center border=0>
                <tr valign=top>
                    <td align=center valign=top>
                        
                            <iframe id="zoomer" src="http://localhost:49792/Images/VideoStreaming.jpg" width="460px" height="310px" scrolling="no">
                                <p>Your browser does not support iframes.</p>
                            </iframe>
    
                            <table border=0>
                                <tr><td>Current Bid:<h1 id="currentbidhtml"></h1></td><td id="onlinebidder">Click to bid next amount: <h1 id="nextbidhtml"></h1> </td></tr>
                                <tr><td id="bidstatus">Bid Status:</td><td><input type=button value="   Make Bid   " onclick="user_bid('Johnny', lotnum, document.getElementById('nextbid').value);" /></td></tr>
                            </table>
                            <a href=# onclick="start()">Start</a>
                            <input type="hidden" id="currentbid" />
                            <input type="hidden" id="nextbid" />
                    </td>
                        
                    </td>
                </tr>
                <tr valign=top>
                    
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>


