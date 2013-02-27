<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	JSON --
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

    function Frame2(str) {
        xmlHttp2 = GetXmlHttpObject();
        if (xmlHttp2 == null) {
            alert("Your browser does not support AJAX!");
            return;
        }
        var url = str;
        xmlHttp2.onreadystatechange = stateChangedFrame2;
        xmlHttp2.open("GET", url, true);
        xmlHttp2.send(null);
        xmlHttp2.close;
    }
    function stateChangedFrame2() {
        if (xmlHttp2.readyState == 4) {
            document.getElementById("Frame2").innerHTML = "";
            document.getElementById("Frame2").innerHTML = xmlHttp2.responseText;
        }
    }
    //---------------------------------------------------------------
    var test = "";
    function ajaxRequest() {
        var activexmodes = ["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"] //activeX versions to check for in IE
        if (window.ActiveXObject) { //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
            for (var i = 0; i < activexmodes.length; i++) {
                try {
                    return new ActiveXObject(activexmodes[i])
                }
                catch (e) {
                    //suppress error
                }
            }
        }
        else if (window.XMLHttpRequest) // if Mozilla, Safari etc
            return new XMLHttpRequest()
        else
            return false
    }

    var mygetrequest = new ajaxRequest()
    mygetrequest.onreadystatechange = function () {
        if (mygetrequest.readyState == 4) {
            if (mygetrequest.status == 200 || window.location.href.indexOf("http") == -1) {
                var jsondata = eval("(" + mygetrequest.responseText + ")") //retrieve result as an JavaScript object
                test = jsondata
                //document.write(test.length);
                //document.getElementById("result").innerHTML=output
            }
            else {
                alert("An error has occured making the request")
            }
        }
    }

   

    function click_auction() {
        alert('Hey Ted!!');
        //document.getElementById("result").innerHTML = output
    }
    function display_auction_items(num) {
        var our_td = "<td onclick='click_auction()'>"
        table = "";
        table += "<tr>" + our_td + test[num].SaleId + "</td>"
        table += our_td + test[num].SaleName + "</td>"
        table += our_td + test[num].SaleType + "</td>"
        table += our_td + test[num].SaleLocation + "</td>"
        table += our_td + test[num].SaleDate + "</td>"
        table += our_td + test[num].SaleTime + "</td>"
        table += our_td + test[num].ViewingCentre + "</td></tr>"
        //document.write(table);
        return table;
    }

    function display_auctions(test) {
        var htmltxt = "";
        htmltxt += "<table border=1 id=myTable1 class=fancy><thead><tr><th>Sale ID</th><th>Name</th><th>Type</th><th>Location</th><th>Date</th><th>Time</th><th>Viewing Centre</th></tr><tr></thead><tbody>";
        for (i = 0; i < test.length; i++) {
            htmltxt +=  display_auction_items(i);
        }
        htmltxt += "</tr></tbody></table>";
        return htmltxt;
    }

    //mygetrequest.open("GET", "http://localhost:49792/Auctions/TestJSON", true)
    //mygetrequest.send(null)
    //display_auctions(test);
</script>


    <h2>JSON ---</h2>
    http://localhost.:49792/Auctions/TestJSON
      <div id="result">Hi Johnny</div> <!-- This is where the content will be written to -->

 
  <div id="Frame4" style="position: absolute; left: 0px; top: 0px; visibility: visible;">
 Test Frame 4
</div>

 <div id="Frame2" style="position: absolute; left: 5000px; top: 300px; visibility: visible;">
<script language="javascript">
    Frame2('http://localhost:49792/Auctions/TestJSON');
</script>
</div>

 <div id="Frame3" style="position: absolute; left: 5000px; top: 400px; visibility: visible;">

</div>



<script type="text/javascript">
    function test() {
        var jsondata = eval("(" + document.getElementById("Frame2").innerHTML + ")") //retrieve result as an JavaScript object
        test = jsondata
        var auction_html = display_auctions(test);
        document.getElementById("Frame4").innerHTML = "";
        document.getElementById("Frame4").innerHTML = auction_html;
    }
</script>

<a href=# onclick="test()">Test</a>
</asp:Content>
