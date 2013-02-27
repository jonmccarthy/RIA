<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ItemPhoto>>" %>
<%@ import Namespace="SuperAuctions.Domain.Entities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <table align=center><tr><td>
   <ul id="second-carousel" class="first-and-second-carousel jcarousel-skin-ie7">
    <%
        foreach (var pics in Model)
        { %>
        <!-- <td><a href="#" onclick="document.getElementById('zoomer').src='http://localhost:49792/ItemPhotos/ZoomPhoto?imgname=<%: pics.Photo %>'"><img width="100" height="100" src="http://localhost:49792/Images/<%: pics.Photo %>" alt="gallery thumbnail" /></a></td> -->
        <li><img src="http://localhost:49792/Images/<%: pics.Photo %>" onclick="document.getElementById('zoomer').src='http://localhost:49792/ItemPhotos/ZoomPhoto?imgname=<%: pics.Photo %>'" width="75" height="75" alt="" /></li>
   <% } %>
   </ul>
   </td></tr></table>
</asp:Content>
