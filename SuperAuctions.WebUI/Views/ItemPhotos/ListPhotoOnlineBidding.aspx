<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ItemPhoto>>" %>
<%@ import Namespace="SuperAuctions.Domain.Entities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListPhotos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table><tr>
    <%
        foreach (var pics in Model)
        { %>
            <td><img width="100" height="100" src="http://localhost:49792/Images/<%: pics.Photo %>" alt="gallery thumbnail" /></td> 
   <% } %>
   </tr></table>
</asp:Content>
