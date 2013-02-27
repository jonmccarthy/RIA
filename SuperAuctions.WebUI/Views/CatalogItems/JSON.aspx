<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	JSON --
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="Frame2" style="position: absolute; left: 300px; top: 300px; visibility: visible;">

</div>
 <!-- This is where the content will be written to -->
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
       document.getElementById("result").innerHTML = table;
    }
    function display_catalog_items(num) {
        table = "";
        //table += "<tr><td onclick=\"detailed_display(" + num + ")\">" + global_scope[num].CatalogItemsId + "</td>"
        //table += "<td>" + global_scope[num].Category + "</td>"
        //table += "<td>" + global_scope[num].SaleID + "</td>"
        table += "<td>" + global_scope[num].LotNum + "</td>"
        table += "<td>" + global_scope[num].ItemName + "</td>"
        table += "<td>" + global_scope[num].PriceEstimate + "</td>"
        table += "<td>" + global_scope[num].LotDescription.substr(0, 30) + "...." + "</td>"
        table += "<td onclick=\"detailed_display(" + num + ")\">View</td></tr>"
        return table;
    }

    function catalog_display(test) {
        var output = ""
        output += "<h1>List All Players</h1>";
        output += "<table border=1 id=myTable1 class=tablesorter><thead><tr><th>Lot</th><th>Item Name</th><th>Price Est</th><th>Desc</th><th>View</th></tr><tr></thead><tbody>";
        for (i = 0; i < global_scope.length; i++) {
            output +=  display_catalog_items(i);
        }
        output += "</tr></tbody></table>";
        document.getElementById("result").innerHTML = output;
    }

    CatalogItems('http://localhost:49792/CatalogItems/TestJSON');

    function view_list() {
        //document.getElementById("result").innerHTML = document.getElementById("Frame2").innerHTML;
        catalog_display(global_scope);
    }
 
</script>
<a href=# onclick="view_list()">test</a>
<a href=# onclick="detailed_display()">test 2</a> 
        <div style="margin-bottom: 10px;"><img src="../../Content/images/img11.gif" alt="" height=150 width=570 /></div>
		<div class="post">
			<h1 class="title">Catalog Items </h1>
			<div class="entry">
                <div id="result"></div>
                <script type="text/javascript">
				    //view_list();
                </script>
			</div>
		</div>
</asp:Content>