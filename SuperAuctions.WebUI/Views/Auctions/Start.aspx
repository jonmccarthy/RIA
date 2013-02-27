<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Super Auctions</title>
<link rel="stylesheet" type="text/css" href="../../Content/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../../Content/prettyPhoto.css" />
<script type="text/javascript" src="../../Scripts/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../../Scripts/jquery.prettyPhoto.js"></script>

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

    function Auctions(str) {
        xmlHttp1 = GetXmlHttpObject();
        if (xmlHttp1 == null) {
            alert("Your browser does not support AJAX!");
            return;
        }
        var url = str;
        xmlHttp1.onreadystatechange = stateChangedAuctions;
        xmlHttp1.open("GET", url, true);
        xmlHttp1.send(null);
        xmlHttp1.close;
    }
    function stateChangedAuctions() {
        if (xmlHttp1.readyState == 4) {
            //document.getElementById("Frame2").innerHTML = "";
            //document.getElementById("Frame2").innerHTML = xmlHttp2.responseText;
            global_auctions = eval("(" + xmlHttp1.responseText + ")")
        }
    }

    function CatalogItems(str) {
        xmlHttp2 = GetXmlHttpObject();
        if (xmlHttp2 == null) {
            alert("Your browser does not support AJAX!");
            return;
        }
        var url = str;
        xmlHttp2.onreadystatechange = stateChangedCatalogItems;
        xmlHttp2.open("GET", url, true);
        xmlHttp2.send(null);
        xmlHttp2.close;
    }
    function stateChangedCatalogItems() {
        if (xmlHttp2.readyState == 4) {
            //document.getElementById("Frame2").innerHTML = "";
            //document.getElementById("Frame2").innerHTML = xmlHttp2.responseText;
            global_scope = eval("(" + xmlHttp2.responseText + ")")
        }
    }

    var pageholder = "";
    function DisplayItem(str) {
        text = "<a href=# onclick=\"closeDisplayItem()\"><img src=\"/images/Close2.gif\" /></a>"
        text += "<iframe id=\"display\" src=\"" + str + "\" width=\"900px\" height=\"700px\" scrolling=\"no\"><p>Your browser does not support iframes.</p></iframe>";
        pageholder = document.getElementById("page").innerHTML;
        document.getElementById("page").innerHTML = text;
    }

    function LiveBidding(str) {
        text = "<a href=# onclick=\"closeDisplayItem()\"><img src=\"/images/Close2.gif\" /></a>"
        text += "<iframe id=\"display\" src=\"" + str + "\" width=\"900px\" height=\"700px\" scrolling=\"no\"><p>Your browser does not support iframes.</p></iframe>";
        pageholder = document.getElementById("page").innerHTML;
        document.getElementById("page").innerHTML = text;
    }

    function closeDisplayItem() {
        document.getElementById("page").innerHTML = pageholder;
    }
    //---------------------------------------------------------------

    function detailed_display(itemid) {
        //alert(itemid + ' - Hey Ted!!');
        table = "<table border=1>";
        table += "<tr><td>" + global_scope[itemid].CatalogItemsId + "</td>"
        table += "<td>" + global_scope[itemid].Category + "</td>"
        table += "<td>" + global_scope[itemid].SaleID + "</td>"
        table += "<td>" + global_scope[itemid].LotNum + "</td>"
        table += "<td>" + global_scope[itemid].ItemName + "</td>"
        table += "<td>" + global_scope[itemid].PriceEstimate + "</td>"
        table += "<td>" + global_scope[itemid].LotDescription.substr(0, 50) + "..." + "</td></tr>"
        table += "</table>"
        //document.getElementById("result").innerHTML = table;
        tmpid = itemid * 1;
        tmpid = tmpid - 1;
        url = 'http://localhost:49792/CatalogItems/GetItem?itemid=' + global_scope[tmpid].CatalogItemsId;
        DisplayItem(url);
    }
    function display_catalog_items(num) {
        table = "";
        //table += "<tr><td onclick=\"detailed_display(" + num + ")\">" + global_scope[num].CatalogItemsId + "</td>"
        //table += "<td>" + global_scope[num].Category + "</td>"
        //table += "<td>" + global_scope[num].SaleID + "</td>"
        table += "<td onclick=\"detailed_display(" + global_scope[num].CatalogItemsId + ")\">" + global_scope[num].LotNum + "</td>"
        table += "<td onclick=\"detailed_display(" + global_scope[num].CatalogItemsId + ")\">" + global_scope[num].ItemName + "</td>"
        table += "<td onclick=\"detailed_display(" + global_scope[num].CatalogItemsId + ")\">" + global_scope[num].PriceEstimate + "</td>"
        table += "<td onclick=\"detailed_display(" + global_scope[num].CatalogItemsId + ")\">" + global_scope[num].LotDescription.substr(0, 30) + "...." + "</td>"
        table += "<td onclick=\"detailed_display(" + global_scope[num].CatalogItemsId + ")\">View</td></tr>"
        return table;
    }

    function catalog_display(test) {
        var output = ""
        output += "<table border=1 id=myTable1 class=\"fancy\"><thead><tr><th>Lot</th><th>Item Name</th><th>Price Estimate</th><th>Description</th><th>View</th></tr><tr></thead><tbody>";
        for (i = 0; i < global_scope.length; i++) {
            output += display_catalog_items(i);
        }
        output += "</tr></tbody></table>";
        //document.getElementById("result").innerHTML = output;
        return output;
    }

    function click_auction() {
        //alert('Got Click');
        view_list();
    }

    function display_auction_items(num) {
        var our_td = "<td onclick='click_auction()'>"
        table = "<tr>";
        //table += our_td + global_auctions[num].SaleId + "</td>"
        table += our_td + global_auctions[num].SaleName + "</td>"
        table += our_td + global_auctions[num].SaleType + "</td>"
        table += our_td + global_auctions[num].SaleLocation + "</td>"
        //table += our_td + global_auctions[num].SaleDate + "</td>"
        table += our_td + "13th May 2011" + "</td>"
        table += our_td + global_auctions[num].SaleTime + "</td>"
        table += our_td + global_auctions[num].ViewingCentre + "</td></tr>"
        //document.write(table);
        return table;
    }

    function display_auctions(test) {
        var htmltxt = "";
        htmltxt += "<table width=880px border=1 class=fancy><thead><tr><th>Name</th><th>Type</th><th>Location</th><th>Date</th><th>Time</th><th>Viewing Centre</th></tr><tr></thead><tbody>";
        for (i = 0; i < global_auctions.length; i++) {
            htmltxt += display_auction_items(i);
        }
        htmltxt += "</tr></tbody></table>";
        return htmltxt;
    }

    Auctions('http://localhost:49792/Auctions/TestJSON');
    CatalogItems('http://localhost:49792/CatalogItems/TestJSON');
    
    function view_list() {
        tmp_output =  "<div style=\"margin-bottom: 10px;\"><img src=\"../../Content/images/img11.gif\" height=150 width=570 /></div>";
		tmp_output += "<div class=\"post\"><h1 class=\"title\">Catalog Items </h1><div class=\"entry\"><div id=\"result\">";
        tmp_output += catalog_display(global_scope);
        tmp_output += "</div></div></div>";
        document.getElementById("events").style.visibility = 'visible';
        document.getElementById("favorites").style.visibility = 'visible';
        document.getElementById("content").innerHTML = tmp_output;
    }

    function view_auctions() {
        tmp_output = "<div style=\"margin-bottom: 10px;\"><img src=\"../../Content/images/img11.gif\" height=150 width=570 /></div>";
        tmp_output += "<div class=\"post\"><h1 class=\"title\">Upcoming Auctions </h1><div class=\"entry\"><div id=\"result\">";
        tmp_output += display_auctions(global_auctions);
        tmp_output += "</div></div></div>";
        document.getElementById("events").style.visibility = 'hidden';
        document.getElementById("favorites").style.visibility = 'hidden';
        document.getElementById("content").innerHTML = tmp_output;
    }

    function deepzoomviewer() {
        text = "<a href=# onclick=\"closeDisplayItem()\"><img src=\"/images/Close2.gif\" /></a>"
        text += "<iframe id=\"display\" src=\"" + "http://localhost/DeepZoomProjectSite/Default.html" + "\" width=\"900px\" height=\"700px\" scrolling=\"no\"><p>Your browser does not support iframes.</p></iframe>";
        pageholder = document.getElementById("page").innerHTML;
        document.getElementById("page").innerHTML = text;
    }
 
</script>

<style>
table.fancy {
  margin: 1em 1em 1em 0;
  background: whitesmoke;
  border-collapse: collapse;
}
table.fancy tr:hover {
   background: lightsteelblue !important;
}
table.fancy th, table.fancy td {
  border: 1px silver solid;
  padding: 0.2em;
}
table.fancy th {
  background: gainsboro;
  text-align: left;
}
table.fancy caption {
  margin-left: inherit;
  margin-right: inherit;
}

</style>
</head>
<body>

<div id="wrapper">

<div id="header">
	<div id="logo">
		<img src="../../Content/images/Heading1.jpg" width="450" height="90" />
	</div>
	<!-- end #logo -->
	<div id="menu">
		<ul>
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#" onclick="view_auctions()">Auctions</a></li>
			<li><a href="#" onclick="view_list()">Catalogs</a></li>
			<li><a href="#" onclick="LiveBidding('http://localhost:49792/CatalogItems/OnlineBidding?itemid=1')">Online Bidding</a></li>
			<li><a href="#" onclick="deepzoomviewer()">Register</a></li>
		</ul>
    </div>
	<!-- end #menu -->
</div>
<!-- end #header -->
<div id="page">
	<div id="content">
		<div style="margin-bottom: 10px;"><img src="../../Content/images/img11.gif" alt="" height=150 width=570 /></div>
		<div class="post">
			<h1 class="title">Welcome to Super Auctions </h1>
			<div class="entry">
				<p>Centrally located in mayor Street, within easy access from all main thoroughfares & railway station, this furniture salesroom is a must visit if you are looking for good quality furniture at a reasonable price.

                Super Auctions offers a wide variety of antiques & household furniture, from fine art & collectables to nearly new furniture & quality reproduction pieces.
                </p>
			</div>
		</div>
		<div class="post">
			<h2 class="title">More Information</h2>
			<div class="entry">
				<p>Super Auctions Antiques have been one of Irelands best-kept secrets of the antiques trade for over 30 years. During this time we have developed into the one of the leading suppliers of antique and reproduction furniture. Today we are able to offer antique and traditional furnishings to traders and the public via this web site. </p>
				</div>
			<div class="meta">
				<p class="links"><a href="#" class="comments">Comments (32)</a> &nbsp;&bull;&nbsp;&nbsp; <a href="#" class="more">Read full post &raquo;</a></p>
			</div>
		</div>
	</div>
	<!-- end #content -->
	<div id="sidebar">
		<div id="sidebar-bgtop"></div>
		<div id="sidebar-content">
			<div id="sidebar-bgbtm">
			<ul>
				<li id="search">
					<h2>Search</h2>
					<form method="get" action="">
						<fieldset>
						<input type="text" id="s" name="s" value="" />
						<input type="submit" id="x" value="Search" />
						</fieldset>
					</form>
				</li>
				<li>
					<h2>Login \ Register</h2>
                    <div>
                    <p align=center>
			            <a href="http://localhost:49792/Account/LogOn?iframe=true&amp;width=60%&amp;height=80%" rel="prettyPhoto[iframe]">Click here to Login or Register</a>
			        </p>
			            <script type="text/javascript" charset="utf-8">
			                $(document).ready(function () {
			                    $("a[rel^='prettyPhoto']").prettyPhoto({ "social_tools": false });
			                });
			            </script>
	
	                </div>

				</li>
				<li id="events">
					<h2>Upcoming Events</h2>
					<ul>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
					</ul>
				</li>
                <li id="favorites">
					<h2>Favorites</h2>
					<ul>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
	</div>
	<!-- end #sidebar -->
	<div style="clear:both; margin:0;"></div>
</div>
<!-- end #page -->

</div>

<div id="footer">
	<p>&copy; 2011. All Rights Reserved. Design by Super Auctions.</p>
</div>
<!-- end #footer -->
</body>
</html>
