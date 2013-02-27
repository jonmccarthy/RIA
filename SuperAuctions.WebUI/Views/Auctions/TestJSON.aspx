<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	TestJSON
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>JSON</h2>

    <table>
        <tr><td>Opening price:</td><td><div id="openingPrice" /></td></tr>
        <tr><td>Closing price:</td><td><div id="closingPrice" /></td></tr>
        <tr><td>Rating:</td><td><div id="stockRating" /></td></tr>
    </table>
    <p><i>This page generated at <%: DateTime.Now.ToLongTimeString() %></i></p>

<script type="text/javascript">
    // Regular JSON version
    $("form[action$='GetQuote']").submit(function () {
        $.ajax({
            url: $(this).attr("action"),
            type: "post",
            data: $(this).serialize(),
            success: function (stockData) {
                $("#openingPrice").html(stockData.PriceAchieved).hide().fadeIn();
                $("#closingPrice").html(stockData.ClosingPrice).hide().fadeIn();
                $("#stockRating").html(stockData.Rating).hide().fadeIn();
            }
        });
        return false;
    });
</script>

</asp:Content>
