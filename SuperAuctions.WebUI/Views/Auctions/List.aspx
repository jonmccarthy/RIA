<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SuperAuctions.Domain.Entities.Auction>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Auctions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>
    <% foreach (var auction in Model)
       { %>
    <div class="auction">
    <h3><%: auction.SaleName%></h3>
    <%: auction.SaleId %>
    <%: auction.SaleType %>
    <%: auction.SaleLocation %>
    <%: auction.SaleTime %>
    <%: auction.ViewingCentre %>
    <%: auction.PriceAchieved %>
    </div><hr />
    <% } %>
</asp:Content>
